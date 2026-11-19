// 文档 https://github.com/hooke007/mpv_PlayKit/wiki/4_GLSL

/*

LICENSE:
  --- RAW ver.
  https://github.com/jersobh/edge/blob/v0.15.1/shaders/edge_pass.comp.glsl

*/


//!PARAM SHARP
//!TYPE float
//!MINIMUM 0.0
//!MAXIMUM 1.0
0.6

//!PARAM BTFY
//!TYPE DEFINE
//!MINIMUM 0
//!MAXIMUM 1
0


//!HOOK OUTPUT
//!BIND HOOKED
//!DESC [Edge_native_RT] Native CAS (v0.15.1)
//!WHEN SHARP

const vec3 LUMA_COEFF = vec3(0.2126, 0.7152, 0.0722);

float luma(vec3 c) {
    return dot(c, LUMA_COEFF);
}

vec3 sampleLod(vec2 uv) {
    return HOOKED_tex(uv).rgb;
}

vec3 beautifyColor(vec3 c) {
#if BTFY
    float y = luma(c);
    float sY = y + (y - 0.5) * (1.0 - abs(y - 0.5) * 2.0) * 0.08;
    vec3 outc = c * (sY / max(y, 1e-4));

    float maxCh = max(outc.r, max(outc.g, outc.b));
    float minCh = min(outc.r, min(outc.g, outc.b));
    float sat = (maxCh - minCh) / max(maxCh, 1e-4);
    float satLift = clamp((1.0 - sat) * 0.10, 0.0, 0.12);
    return mix(vec3(sY), outc, 1.0 + satLift);
#else
    return c;
#endif
}

vec3 edgeNative(vec2 uv, vec2 renderSize, float sharp) {
    vec3 c = sampleLod(uv);
    if (sharp <= 0.01) return beautifyColor(c);

    vec2 texel = 1.0 / renderSize;
    vec3 north = sampleLod(uv + vec2(0.0, -texel.y));
    vec3 south = sampleLod(uv + vec2(0.0,  texel.y));
    vec3 west  = sampleLod(uv + vec2(-texel.x, 0.0));
    vec3 east  = sampleLod(uv + vec2( texel.x, 0.0));

    vec3 minC = min(c, min(min(north, south), min(west, east)));
    vec3 maxC = max(c, max(max(north, south), max(west, east)));

    float lMin = luma(minC);
    float lMax = luma(maxC);
    float contrast = lMax - lMin;

    if (contrast > 0.01) {
        float casAmp = clamp(min(lMin, 1.0 - lMax) / max(contrast, 1e-4), 0.0, 1.0);
        vec3 crossAvg = (north + south + west + east) * 0.25;
        vec3 highPass = c - crossAvg;
        float effectiveSharp = sharp * mix(0.40, 0.80, casAmp);
        c = clamp(c + highPass * effectiveSharp, minC, maxC);
    }
    return beautifyColor(c);
}

vec4 hook() {
    vec2 renderSize = max(HOOKED_size, vec2(1.0));
    float sharp = clamp(SHARP, 0.0, 1.0);
    vec2 uv = HOOKED_pos;

    vec3 rgb = edgeNative(uv, renderSize, sharp);
    rgb = clamp(rgb, 0.0, 1.0);
    return vec4(rgb, HOOKED_tex(uv).a);
}

