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
//!DESC [MWSR_down_luma_RT] Downscale
//!WIDTH OUTPUT.w
//!HEIGHT OUTPUT.h
//!WHEN OUTPUT.w HOOKED.w < OUTPUT.h HOOKED.h < *

const vec3 MWSR_LUMA = vec3(0.25, 0.625, 0.125);

vec4 hook() {
    vec2 texel = HOOKED_pt;
    vec2 scale = target_size / input_size;
    float smin = min(scale.x, scale.y);

    float kg, kwc, kl, zref;
#if HDR_MODE
    kg = 0.0;
    kwc = 0.0;
    kl = 0.0;
    zref = 0.0;
#else
    if (smin < 0.5) {
        kg = 0.0;
        kwc = 0.0;
        kl = 0.0;
        zref = 0.0;
    } else {
        float t = clamp((smin - 0.5) / (0.6666667 - 0.5), 0.0, 1.0);
        float f = clamp((1.0 - smin) / (1.0 - 0.93), 0.0, 1.0);
        kg = (0.25 + (0.45 - 0.25) * t) * f;
        kwc = (0.05 + (0.2 - 0.05) * t) * f;
        kl = 0.1 + (0.25 - 0.1) * t;
        zref = 0.1 * t;
    }
#endif
    float ft = 0.003;

    vec2 uv = HOOKED_pos;

    int taps;
    float rDown;
    if (smin >= 0.5) {
        taps = 4;
        rDown = 1.0;
    } else if (smin >= 0.25) {
        taps = 9;
        rDown = 1.25;
    } else {
        taps = 16;
        rDown = 1.25;
    }

    vec2 span = texel / scale * rDown;

    float acc = 0.0;

    if (taps == 1) {
        acc = HOOKED_tex(uv).x;
    } else if (taps == 4) {
        acc += HOOKED_tex(uv + vec2(-0.25, -0.25) * span).x;
        acc += HOOKED_tex(uv + vec2(0.25, -0.25) * span).x;
        acc += HOOKED_tex(uv + vec2(-0.25, 0.25) * span).x;
        acc += HOOKED_tex(uv + vec2(0.25, 0.25) * span).x;
        acc *= 0.25;
    } else if (taps == 9) {
        for (int y = -1; y <= 1; y++) {
            for (int x = -1; x <= 1; x++) {
                acc += HOOKED_tex(uv + vec2(float(x), float(y)) / 3.0 * span).x;
            }
        }
        acc /= 9.0;
    } else { // taps == 16
        for (int y = -1; y <= 2; y++) {
            for (int x = -1; x <= 2; x++) {
                acc += HOOKED_tex(uv + vec2(float(x) - 0.5, float(y) - 0.5) / 4.0 * span).x;
            }
        }
        acc /= 16.0;
    }

    float c = acc;

    if (kg > 0.0) {
        float l = c;
        vec2 g = vec2(dFdxCoarse(l), dFdyCoarse(l));

        if (abs(g.x) + abs(g.y) >= ft) {
            vec2 px = texel / scale;
            float a = HOOKED_tex(uv - vec2(px.x, 0.0)).x;
            float b = HOOKED_tex(uv + vec2(px.x, 0.0)).x;
            float d = HOOKED_tex(uv - vec2(0.0, px.y)).x;
            float e = HOOKED_tex(uv + vec2(0.0, px.y)).x;

            float mean = 0.25 * (a + b + d + e);
            float mn = min(c, min(a, min(b, min(d, e))));
            float mx = max(c, max(a, max(b, max(d, e))));

            float range = mx - mn;
            float t = smoothstep(0.2, 0.5, range);
            float R = c + mix(kg, kwc, t) * (c - mean);
            float mg = range * mix(kl, zref, t);

            c = clamp(R, max(mn - mg, 0.0), mx + mg);
        }
    }

    return vec4(c, 0.0, 0.0, 1.0);
}

