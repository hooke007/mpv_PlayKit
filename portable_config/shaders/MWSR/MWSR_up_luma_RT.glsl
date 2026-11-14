// 文档 https://github.com/hooke007/mpv_PlayKit/wiki/4_GLSL

/*

LICENSE:
  --- RAW ver.
  https://github.com/linckosz/moonlight-web/blob/main/mwsr/LICENSE

*/


//!PARAM HDR_MODE
//!TYPE DEFINE
//!MINIMUM 0
//!MAXIMUM 1
0


//!HOOK LUMA
//!BIND HOOKED
//!DESC [MWSR_up_luma_RT] Upscale
//!WIDTH OUTPUT.w
//!HEIGHT OUTPUT.h
//!WHEN OUTPUT.w HOOKED.w > OUTPUT.h HOOKED.h > *

vec4 hook() {
    vec2 texel = HOOKED_pt;
    vec2 dims = HOOKED_size;
    vec2 scale = target_size / input_size;
    float smin = min(scale.x, scale.y);
    float sl = clamp(smin, 1.07, 4.0);
    float x = log(sl);
    float force = 1.0 + 0.35 * clamp(log(sl / 1.3333333333333333) / log(1.5), 0.0, 1.0);
    float strength = clamp((smin - 1.0) / (1.07 - 1.0), 0.0, 1.0);
    float kc = 0.6353583202388096 + x * (0.021845681633595574 + x * 0.12781268100437676);
    float kg = (-0.1288413863403059 + x * (2.5844683855070816 + x * -1.260092021482419)) * force * strength;
    float kr = 1.0071546009267338 + x * (-1.0209066704914191 + x * 0.5699605831985769);
#if HDR_MODE
    float kl = 0.0;
#else
    float kl = (0.33416994543071277 + x * (-0.2962022126856069 + x * 0.08628272130287401)) * force;
#endif
    float ft = 0.005;
    vec2 across = kr * texel;

    vec2 uv = HOOKED_pos;
    vec2 sp = uv * dims;
    vec2 f0 = floor(sp - 0.5);
    vec2 t = sp - 0.5 - f0;
    vec2 s = 1.0 - t;
    vec2 ku = kc * t * s;
    vec2 w12 = 1.0 + ku;
    vec2 p12 = (f0 + 0.5 + (t * t * (3.0 - 2.0 * t) + ku * s) / w12) * texel;

    float lM = HOOKED_tex(p12).x;

    vec2 dir = sign(vec2(dFdxCoarse(uv.x), dFdyCoarse(uv.y))) * scale;
    float dlM = dFdxCoarse(lM) * dir.x;
    float dyM = dFdyCoarse(lM) * dir.y;

    bool isFlat = abs(dlM) + abs(dyM) < ft;

    if (isFlat) {
        return vec4(lM, 0.0, 0.0, 1.0);
    }

    vec2 p0 = (f0 - 0.5) * texel;
    vec2 p3 = (f0 + 2.5) * texel;
    float lT = HOOKED_tex(vec2(p12.x, p0.y)).x;
    float lL = HOOKED_tex(vec2(p0.x, p12.y)).x;
    float lR = HOOKED_tex(vec2(p3.x, p12.y)).x;
    float lB = HOOKED_tex(vec2(p12.x, p3.y)).x;

    vec2 gM = vec2(dlM, dyM);
    vec2 dn = gM * inversesqrt(dot(gM, gM)) * across;
    float la = HOOKED_tex(uv - dn).x;
    float lb = HOOKED_tex(uv + dn).x;

    float K = (w12.x * (w12.y * lM - ku.y * (s.y * lT + t.y * lB)) - w12.y * ku.x * (s.x * lL + t.x * lR)) / (1.0 - ku.x * ku.y);
    float D = K - 0.5 * (la + lb);
    float R = K + kg * D;

    float mn = min(lM, min(la, lb));
    float mx = max(lM, max(la, lb));
    float mg = (mx - mn) * kl;

    return vec4(clamp(R, max(mn - mg, 0.0), mx + mg), 0.0, 0.0, 1.0);
}

