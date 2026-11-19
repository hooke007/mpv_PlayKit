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

//!PARAM MODE
//!TYPE DEFINE
//!MINIMUM 0
//!MAXIMUM 3
0

//!PARAM BTFY
//!TYPE DEFINE
//!MINIMUM 0
//!MAXIMUM 1
0


//!HOOK MAIN
//!BIND HOOKED
//!DESC [Edge_RT] Upscale (v0.15.1)
//!WIDTH OUTPUT.w
//!HEIGHT OUTPUT.h
//!WHEN OUTPUT.w HOOKED.w 1.0 * > OUTPUT.h HOOKED.h 1.0 * > *

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

// MODE 2: Nearest Neighbor
// Crisp point sampling for 2D pixel art games.
vec3 edgeUpscaleNearest(vec2 uv, vec2 renderSize) {
    vec2 pos = uv * renderSize;
    ivec2 ipos = ivec2(floor(pos));
    ivec2 maxCoord = max(ivec2(renderSize + 0.5) - 1, ivec2(0));
    vec3 c = texelFetch(HOOKED_raw, clamp(ipos, ivec2(0), maxCoord), 0).rgb;
    return beautifyColor(c);
}

// MODE 3: Competitive
vec3 edgeUpscaleCompetitive(vec2 uv, vec2 renderSize, float sharp) {
    vec2 pos = uv * renderSize - 0.5;
    ivec2 ipos = ivec2(floor(pos));
    ivec2 maxCoord = max(ivec2(renderSize + 0.5) - 1, ivec2(0));

    vec3 c00 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(0, 0), ivec2(0), maxCoord), 0).rgb;
    vec3 c10 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(1, 0), ivec2(0), maxCoord), 0).rgb;
    vec3 c01 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(0, 1), ivec2(0), maxCoord), 0).rgb;
    vec3 c11 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(1, 1), ivec2(0), maxCoord), 0).rgb;

    vec3 centerBilinear = sampleLod(uv);
    vec3 minC = min(min(c00, c10), min(c01, c11));
    vec3 maxC = max(max(c00, c10), max(c01, c11));

    if (sharp > 0.01) {
        vec3 avg = (c00 + c10 + c01 + c11) * 0.25;
        float diff = luma(maxC) - luma(minC);
        float amp = clamp(diff * 4.0, 0.0, 1.0);
        centerBilinear = clamp(centerBilinear + (centerBilinear - avg) * (sharp * 0.50 * amp), minC, maxC);
    }
    return beautifyColor(centerBilinear);
}

// MODE 1: Perf
vec3 edgeUpscalePerf(vec2 uv, vec2 renderSize, float sharp) {
    vec2 texel = 1.0 / renderSize;
    vec2 pos = uv * renderSize - 0.5;
    ivec2 ipos = ivec2(floor(pos));
    vec2 f = pos - vec2(ipos);
    ivec2 maxCoord = max(ivec2(renderSize + 0.5) - 1, ivec2(0));

    vec3 c00 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(0, 0), ivec2(0), maxCoord), 0).rgb;
    vec3 c10 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(1, 0), ivec2(0), maxCoord), 0).rgb;
    vec3 c01 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(0, 1), ivec2(0), maxCoord), 0).rgb;
    vec3 c11 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(1, 1), ivec2(0), maxCoord), 0).rgb;

    float l00 = luma(c00);
    float l10 = luma(c10);
    float l01 = luma(c01);
    float l11 = luma(c11);

    float dMain = abs(l11 - l00);
    float dAnti = abs(l01 - l10);
    vec3 centerBilinear = sampleLod(uv);

    vec3 diag;
    if (dMain > dAnti * 1.2) {
        float w = smoothstep(-0.5, 0.5, (f.x + f.y - 1.0) * 1.4);
        diag = mix(c00, c11, w);
    } else if (dAnti > dMain * 1.2) {
        float w = smoothstep(-0.5, 0.5, (f.x - f.y) * 1.4);
        diag = mix(c01, c10, w);
    } else {
        diag = centerBilinear;
    }

    float diagWeight = clamp(abs(dMain - dAnti) * 3.5, 0.0, 0.85);
    vec3 outc = mix(centerBilinear, diag, diagWeight);

    vec3 minC = min(min(c00, c10), min(c01, c11));
    vec3 maxC = max(max(c00, c10), max(c01, c11));
    outc = clamp(outc, minC, maxC);

    if (sharp > 0.01) {
        vec3 avg = (c00 + c10 + c01 + c11) * 0.25;
        float diff = luma(maxC) - luma(minC);
        float amp = clamp(diff * 4.0, 0.0, 1.0);
        outc = clamp(outc + (outc - avg) * (sharp * 0.55 * amp), minC, maxC);
    }

    return beautifyColor(outc);
}

// MODE 0: Quality
vec3 edgeUpscaleQuality(vec2 uv, vec2 renderSize, float scale, float sharp) {
    vec2 texel = 1.0 / renderSize;
    vec2 pos = uv * renderSize - 0.5;
    ivec2 ipos = ivec2(floor(pos));
    vec2 f = pos - vec2(ipos);
    ivec2 maxCoord = max(ivec2(renderSize + 0.5) - 1, ivec2(0));

    vec3 c00 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(0, 0), ivec2(0), maxCoord), 0).rgb;
    vec3 c10 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(1, 0), ivec2(0), maxCoord), 0).rgb;
    vec3 c01 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(0, 1), ivec2(0), maxCoord), 0).rgb;
    vec3 c11 = texelFetch(HOOKED_raw, clamp(ipos + ivec2(1, 1), ivec2(0), maxCoord), 0).rgb;

    vec3 cT = sampleLod((vec2(ipos) + vec2(0.5, -0.5)) * texel);
    vec3 cB = sampleLod((vec2(ipos) + vec2(0.5,  2.5)) * texel);
    vec3 cL = sampleLod((vec2(ipos) + vec2(-0.5, 0.5)) * texel);
    vec3 cR = sampleLod((vec2(ipos) + vec2( 2.5, 0.5)) * texel);

    float l00 = luma(c00), l10 = luma(c10);
    float l01 = luma(c01), l11 = luma(c11);
    float lT = luma(cT), lB = luma(cB);
    float lL = luma(cL), lR = luma(cR);

    float gx = ((l10 + l11) - (l00 + l01)) + (lR - lL) * 0.75;
    float gy = ((l01 + l11) - (l00 + l10)) + (lB - lT) * 0.75;
    float gradLen = sqrt(gx * gx + gy * gy);

    float dMain = abs(l11 - l00);
    float dAnti = abs(l01 - l10);

    vec3 bilinear = mix(mix(c00, c10, f.x), mix(c01, c11, f.x), f.y);
    vec3 horizSharp = (c00 + c10) * 0.5 - (cL + cR) * 0.25;
    vec3 vertSharp  = (c00 + c01) * 0.5 - (cT + cB) * 0.25;
    vec3 cubic = bilinear + (horizSharp * (0.5 - abs(f.x - 0.5)) +
                             vertSharp  * (0.5 - abs(f.y - 0.5))) * 0.45;

    vec3 minC = min(min(c00, c10), min(c01, c11));
    vec3 maxC = max(max(c00, c10), max(c01, c11));
    cubic = clamp(cubic, minC, maxC);

    vec3 diag = cubic;
    if (dMain > dAnti * 1.15) {
        float w = smoothstep(-0.5, 0.5, (f.x + f.y - 1.0) * 1.4);
        diag = mix(c00, c11, w);
    } else if (dAnti > dMain * 1.15) {
        float w = smoothstep(-0.5, 0.5, (f.x - f.y) * 1.4);
        diag = mix(c01, c10, w);
    }
    float diagConf = clamp(abs(dMain - dAnti) * 4.0, 0.0, 1.0);
    vec3 baseReconstructed = mix(cubic, diag, diagConf * 0.65);

    vec3 finalEdge = baseReconstructed;
    if (gradLen > 1e-4) {
        vec2 norm = vec2(gx, gy) / gradLen;
        vec2 tangent = vec2(-norm.y, norm.x);

        float stepDist = clamp(scale * 0.45, 0.70, 1.60);
        vec2 offset = tangent * texel * stepDist;

        vec3 tapPos = sampleLod(uv + offset);
        vec3 tapNeg = sampleLod(uv - offset);
        vec3 alongEdge = 0.5 * (tapPos + tapNeg);

        float edgeConf = clamp(gradLen * 3.5, 0.0, 1.0);
        finalEdge = mix(baseReconstructed, alongEdge, edgeConf * 0.78);
        finalEdge = clamp(finalEdge, minC, maxC);
    }

    float lMin = luma(minC);
    float lMax = luma(maxC);
    float contrast = lMax - lMin;

    if (sharp > 0.01 && contrast > 0.01) {
        float casAmp = clamp(min(lMin, 1.0 - lMax) / max(contrast, 1e-4), 0.0, 1.0);
        vec3 crossAvg = (c00 + c10 + c01 + c11) * 0.25;
        vec3 highPass = finalEdge - crossAvg;
        float effectiveSharp = sharp * mix(0.35, 0.75, casAmp);
        finalEdge = clamp(finalEdge + highPass * effectiveSharp, minC, maxC);
    }

    return beautifyColor(finalEdge);
}

vec4 hook() {
    vec2 displaySize = max(target_size, vec2(1.0));
    vec2 renderSize = max(HOOKED_size, vec2(1.0));
    float sharp = clamp(SHARP, 0.0, 1.0);
    vec2 uv = HOOKED_pos;

    float scale = max(displaySize.x / renderSize.x, displaySize.y / renderSize.y);

    vec3 rgb;
#if MODE == 3
    rgb = edgeUpscaleCompetitive(uv, renderSize, sharp);
#elif MODE == 2
    rgb = edgeUpscaleNearest(uv, renderSize);
#elif MODE == 1
    rgb = edgeUpscalePerf(uv, renderSize, sharp);
#else
    rgb = edgeUpscaleQuality(uv, renderSize, scale, sharp);
#endif

    rgb = clamp(rgb, 0.0, 1.0);
    return vec4(rgb, HOOKED_tex(uv).a);
}

