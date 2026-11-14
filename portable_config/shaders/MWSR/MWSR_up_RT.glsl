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

//!PARAM EDGE_MODE
//!TYPE DEFINE
//!MINIMUM 0
//!MAXIMUM 1
1


//!HOOK MAIN
//!BIND HOOKED
//!DESC [MWSR_up_RT] Upscale
//!WIDTH OUTPUT.w
//!HEIGHT OUTPUT.h
//!WHEN OUTPUT.w HOOKED.w > OUTPUT.h HOOKED.h > *

const vec3 MWSR_LUMA = vec3(0.25, 0.625, 0.125);

vec3 mwsrS(vec2 uv) {
    return (HOOKED_mul * textureLod(HOOKED_raw, uv, 0.0)).rgb;
}

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
    float kwc = 0.1 * strength;
    vec2 across = kr * texel;

    vec2 uv = HOOKED_pos;
    vec2 sp = uv * dims;
    vec2 f0 = floor(sp - 0.5);
    vec2 t = sp - 0.5 - f0;
    vec2 s = 1.0 - t;
    vec2 ku = kc * t * s;
    vec2 w12 = 1.0 + ku;
    vec2 p12 = (f0 + 0.5 + (t * t * (3.0 - 2.0 * t) + ku * s) / w12) * texel;
    vec4 colorM = HOOKED_mul * textureLod(HOOKED_raw, p12, 0.0);
    vec3 rM = colorM.rgb;

    vec2 dir = sign(vec2(dFdx(uv.x), dFdy(uv.y))) * scale;
    vec2 gM;
    bool isFlat;

#if EDGE_MODE
    vec3 dx = dFdxCoarse(rM) * dir.x;
    vec3 dy = dFdyCoarse(rM) * dir.y;
    vec3 m = abs(dx) + abs(dy);
    bool rg = m.g > m.r;
    bool b = m.b > max(m.r, m.g);
    gM = vec2(b ? dx.b : (rg ? dx.g : dx.r), b ? dy.b : (rg ? dy.g : dy.r));
    isFlat = max(m.r, max(m.g, m.b)) < ft;
#else
    float lM = dot(rM, MWSR_LUMA);
    gM = vec2(dFdxCoarse(lM), dFdyCoarse(lM)) * dir;
    isFlat = abs(gM.x) + abs(gM.y) < ft;
#endif

    if (isFlat) {
        return colorM;
    }

    vec2 p0 = (f0 - 0.5) * texel;
    vec2 p3 = (f0 + 2.5) * texel;
    vec3 rT = mwsrS(vec2(p12.x, p0.y));
    vec3 rL = mwsrS(vec2(p0.x, p12.y));
    vec3 rR = mwsrS(vec2(p3.x, p12.y));
    vec3 rB = mwsrS(vec2(p12.x, p3.y));

    vec2 dn = gM * inversesqrt(dot(gM, gM)) * across;
    vec3 ra = mwsrS(uv - dn);
    vec3 rb = mwsrS(uv + dn);

    vec3 K = (w12.x * (w12.y * rM - ku.y * (s.y * rT + t.y * rB)) - w12.y * ku.x * (s.x * rL + t.x * rR)) / (1.0 - ku.x * ku.y);
    vec3 D = K - 0.5 * (ra + rb);
    vec3 R = K + kg * D + kwc * (D - vec3(dot(D, MWSR_LUMA)));

    vec3 mn = min(rM, min(ra, rb));
    vec3 mx = max(rM, max(ra, rb));
    vec3 mg = (mx - mn) * kl;

    return vec4(clamp(R, max(mn - mg, vec3(0.0)), mx + mg), colorM.a);
}

