// 文档 https://github.com/hooke007/mpv_PlayKit/wiki/4_GLSL

/*

LICENSE:
  --- PAPER ver.
  http://www.andreagiachetti.it/icbi/InterTIPmod2c.pdf

*/


//!PARAM ITER
//!TYPE DYNAMIC int
//!MINIMUM 0
//!MAXIMUM 8
2

//!PARAM SHARP
//!TYPE float
//!MINIMUM 0.0
//!MAXIMUM 2.0
0.3

//!PARAM EDGE_THR
//!TYPE float
//!MINIMUM 0.0
//!MAXIMUM 1.0
0.3

//!PARAM ISOP
//!TYPE float
//!MINIMUM 0.0
//!MAXIMUM 1.0
0.0


//!HOOK LUMA
//!BIND HOOKED
//!SAVE LUMA_ORI
//!DESC [ICBI_RT] upscale gate
//!WIDTH 1
//!HEIGHT 1
//!WHEN OUTPUT.w HOOKED.w 1.2 * > OUTPUT.h HOOKED.h 1.2 * > *

vec4 hook() {
    return vec4(0.0);
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] expand to 2x grid
//!OFFSET -0.5 -0.5
//!WIDTH HOOKED.w 2 *
//!HEIGHT HOOKED.h 2 *

vec4 hook() {
    ivec2 o = ivec2(gl_FragCoord.xy);
    ivec2 s = o >> 1;
    ivec2 mx = ivec2(HOOKED_size) - 1;
#define S(x,y) (texelFetch(HOOKED_raw, clamp(s + ivec2(x,y), ivec2(0), mx), 0).r * HOOKED_mul)
    bool xo = (o.x & 1) == 1;
    bool yo = (o.y & 1) == 1;
    float v;
    if (!xo && !yo)      v = S(0,0);
    else if (xo && !yo)  v = 0.5 * (S(0,0) + S(1,0));
    else if (!xo && yo)  v = 0.5 * (S(0,0) + S(0,1));
    else                 v = 0.25 * (S(0,0) + S(1,0) + S(0,1) + S(1,1));
    return vec4(v, 0.0, 0.0, 1.0);
#undef S
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] FCBI step 1 (diagonal centers)

vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if ((ipos.x & 1) == 1 && (ipos.y & 1) == 1) {
        float A = (L(1,-3) + L(-1,-1) + L(-3,1) - 3.0*L(1,-1) - 3.0*L(-1,1) + L(3,-1) + L(1,1) + L(-1,3));
        float B = (L(-3,-1) + L(-1,1) + L(1,3) - 3.0*L(-1,-1) - 3.0*L(1,1) + L(-1,-3) + L(1,-1) + L(3,1));
        float va = 0.5*(L(-1,-1) + L(1,1));
        float vb = 0.5*(L(-1,1) + L(1,-1));
        return vec4(A < B ? va : vb, 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine diagonal centers (iter 1)
//!WHEN ITER 0 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if ((ipos.x & 1) == 1 && (ipos.y & 1) == 1) {
        float c0 = L(0,0);
        float A1 = L(-2,-2) + L(2,2);
        float A2 = L(2,-2) + L(-2,2);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(-1,-1) + L(3,3) - 2.0*L(1,1);
        I2n[0] = L(3,-1) + L(-1,3) - 2.0*L(1,1);
        w[0] = abs(L(1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(-3,-1) + L(1,3) - 2.0*L(-1,1);
        I2n[1] = L(1,-1) + L(-3,3) - 2.0*L(-1,1);
        w[1] = abs(L(-1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(-1,-3) + L(3,1) - 2.0*L(1,-1);
        I2n[2] = L(3,-3) + L(-1,1) - 2.0*L(1,-1);
        w[2] = abs(L(1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-3,-3) + L(1,1) - 2.0*L(-1,-1);
        I2n[3] = L(1,-3) + L(-3,1) - 2.0*L(-1,-1);
        w[3] = abs(L(-1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(-1,-1) - L(1,1));
            g2 = 0.5*(L(1,-1) - L(-1,1));
            i12 = 0.5*(L(-2,0) + L(2,0) - L(0,-2) - L(0,2));
        }
        float d = 0.01568627;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine diagonal centers (iter 2)
//!WHEN ITER 1 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if ((ipos.x & 1) == 1 && (ipos.y & 1) == 1) {
        float c0 = L(0,0);
        float A1 = L(-2,-2) + L(2,2);
        float A2 = L(2,-2) + L(-2,2);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(-1,-1) + L(3,3) - 2.0*L(1,1);
        I2n[0] = L(3,-1) + L(-1,3) - 2.0*L(1,1);
        w[0] = abs(L(1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(-3,-1) + L(1,3) - 2.0*L(-1,1);
        I2n[1] = L(1,-1) + L(-3,3) - 2.0*L(-1,1);
        w[1] = abs(L(-1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(-1,-3) + L(3,1) - 2.0*L(1,-1);
        I2n[2] = L(3,-3) + L(-1,1) - 2.0*L(1,-1);
        w[2] = abs(L(1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-3,-3) + L(1,1) - 2.0*L(-1,-1);
        I2n[3] = L(1,-3) + L(-3,1) - 2.0*L(-1,-1);
        w[3] = abs(L(-1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(-1,-1) - L(1,1));
            g2 = 0.5*(L(1,-1) - L(-1,1));
            i12 = 0.5*(L(-2,0) + L(2,0) - L(0,-2) - L(0,2));
        }
        float d = 0.01176471;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine diagonal centers (iter 3)
//!WHEN ITER 2 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if ((ipos.x & 1) == 1 && (ipos.y & 1) == 1) {
        float c0 = L(0,0);
        float A1 = L(-2,-2) + L(2,2);
        float A2 = L(2,-2) + L(-2,2);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(-1,-1) + L(3,3) - 2.0*L(1,1);
        I2n[0] = L(3,-1) + L(-1,3) - 2.0*L(1,1);
        w[0] = abs(L(1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(-3,-1) + L(1,3) - 2.0*L(-1,1);
        I2n[1] = L(1,-1) + L(-3,3) - 2.0*L(-1,1);
        w[1] = abs(L(-1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(-1,-3) + L(3,1) - 2.0*L(1,-1);
        I2n[2] = L(3,-3) + L(-1,1) - 2.0*L(1,-1);
        w[2] = abs(L(1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-3,-3) + L(1,1) - 2.0*L(-1,-1);
        I2n[3] = L(1,-3) + L(-3,1) - 2.0*L(-1,-1);
        w[3] = abs(L(-1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(-1,-1) - L(1,1));
            g2 = 0.5*(L(1,-1) - L(-1,1));
            i12 = 0.5*(L(-2,0) + L(2,0) - L(0,-2) - L(0,2));
        }
        float d = 0.00784314;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine diagonal centers (iter 4)
//!WHEN ITER 3 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if ((ipos.x & 1) == 1 && (ipos.y & 1) == 1) {
        float c0 = L(0,0);
        float A1 = L(-2,-2) + L(2,2);
        float A2 = L(2,-2) + L(-2,2);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(-1,-1) + L(3,3) - 2.0*L(1,1);
        I2n[0] = L(3,-1) + L(-1,3) - 2.0*L(1,1);
        w[0] = abs(L(1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(-3,-1) + L(1,3) - 2.0*L(-1,1);
        I2n[1] = L(1,-1) + L(-3,3) - 2.0*L(-1,1);
        w[1] = abs(L(-1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(-1,-3) + L(3,1) - 2.0*L(1,-1);
        I2n[2] = L(3,-3) + L(-1,1) - 2.0*L(1,-1);
        w[2] = abs(L(1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-3,-3) + L(1,1) - 2.0*L(-1,-1);
        I2n[3] = L(1,-3) + L(-3,1) - 2.0*L(-1,-1);
        w[3] = abs(L(-1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(-1,-1) - L(1,1));
            g2 = 0.5*(L(1,-1) - L(-1,1));
            i12 = 0.5*(L(-2,0) + L(2,0) - L(0,-2) - L(0,2));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine diagonal centers (iter 5)
//!WHEN ITER 4 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if ((ipos.x & 1) == 1 && (ipos.y & 1) == 1) {
        float c0 = L(0,0);
        float A1 = L(-2,-2) + L(2,2);
        float A2 = L(2,-2) + L(-2,2);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(-1,-1) + L(3,3) - 2.0*L(1,1);
        I2n[0] = L(3,-1) + L(-1,3) - 2.0*L(1,1);
        w[0] = abs(L(1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(-3,-1) + L(1,3) - 2.0*L(-1,1);
        I2n[1] = L(1,-1) + L(-3,3) - 2.0*L(-1,1);
        w[1] = abs(L(-1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(-1,-3) + L(3,1) - 2.0*L(1,-1);
        I2n[2] = L(3,-3) + L(-1,1) - 2.0*L(1,-1);
        w[2] = abs(L(1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-3,-3) + L(1,1) - 2.0*L(-1,-1);
        I2n[3] = L(1,-3) + L(-3,1) - 2.0*L(-1,-1);
        w[3] = abs(L(-1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(-1,-1) - L(1,1));
            g2 = 0.5*(L(1,-1) - L(-1,1));
            i12 = 0.5*(L(-2,0) + L(2,0) - L(0,-2) - L(0,2));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine diagonal centers (iter 6)
//!WHEN ITER 5 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if ((ipos.x & 1) == 1 && (ipos.y & 1) == 1) {
        float c0 = L(0,0);
        float A1 = L(-2,-2) + L(2,2);
        float A2 = L(2,-2) + L(-2,2);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(-1,-1) + L(3,3) - 2.0*L(1,1);
        I2n[0] = L(3,-1) + L(-1,3) - 2.0*L(1,1);
        w[0] = abs(L(1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(-3,-1) + L(1,3) - 2.0*L(-1,1);
        I2n[1] = L(1,-1) + L(-3,3) - 2.0*L(-1,1);
        w[1] = abs(L(-1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(-1,-3) + L(3,1) - 2.0*L(1,-1);
        I2n[2] = L(3,-3) + L(-1,1) - 2.0*L(1,-1);
        w[2] = abs(L(1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-3,-3) + L(1,1) - 2.0*L(-1,-1);
        I2n[3] = L(1,-3) + L(-3,1) - 2.0*L(-1,-1);
        w[3] = abs(L(-1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(-1,-1) - L(1,1));
            g2 = 0.5*(L(1,-1) - L(-1,1));
            i12 = 0.5*(L(-2,0) + L(2,0) - L(0,-2) - L(0,2));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine diagonal centers (iter 7)
//!WHEN ITER 6 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if ((ipos.x & 1) == 1 && (ipos.y & 1) == 1) {
        float c0 = L(0,0);
        float A1 = L(-2,-2) + L(2,2);
        float A2 = L(2,-2) + L(-2,2);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(-1,-1) + L(3,3) - 2.0*L(1,1);
        I2n[0] = L(3,-1) + L(-1,3) - 2.0*L(1,1);
        w[0] = abs(L(1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(-3,-1) + L(1,3) - 2.0*L(-1,1);
        I2n[1] = L(1,-1) + L(-3,3) - 2.0*L(-1,1);
        w[1] = abs(L(-1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(-1,-3) + L(3,1) - 2.0*L(1,-1);
        I2n[2] = L(3,-3) + L(-1,1) - 2.0*L(1,-1);
        w[2] = abs(L(1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-3,-3) + L(1,1) - 2.0*L(-1,-1);
        I2n[3] = L(1,-3) + L(-3,1) - 2.0*L(-1,-1);
        w[3] = abs(L(-1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(-1,-1) - L(1,1));
            g2 = 0.5*(L(1,-1) - L(-1,1));
            i12 = 0.5*(L(-2,0) + L(2,0) - L(0,-2) - L(0,2));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine diagonal centers (iter 8)
//!WHEN ITER 7 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if ((ipos.x & 1) == 1 && (ipos.y & 1) == 1) {
        float c0 = L(0,0);
        float A1 = L(-2,-2) + L(2,2);
        float A2 = L(2,-2) + L(-2,2);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(-1,-1) + L(3,3) - 2.0*L(1,1);
        I2n[0] = L(3,-1) + L(-1,3) - 2.0*L(1,1);
        w[0] = abs(L(1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(-3,-1) + L(1,3) - 2.0*L(-1,1);
        I2n[1] = L(1,-1) + L(-3,3) - 2.0*L(-1,1);
        w[1] = abs(L(-1,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(-1,-3) + L(3,1) - 2.0*L(1,-1);
        I2n[2] = L(3,-3) + L(-1,1) - 2.0*L(1,-1);
        w[2] = abs(L(1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-3,-3) + L(1,1) - 2.0*L(-1,-1);
        I2n[3] = L(1,-3) + L(-3,1) - 2.0*L(-1,-1);
        w[3] = abs(L(-1,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(-1,-1) - L(1,1));
            g2 = 0.5*(L(1,-1) - L(-1,1));
            i12 = 0.5*(L(-2,0) + L(2,0) - L(0,-2) - L(0,2));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] FCBI step 2 (orthogonal holes)

vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if (((ipos.x & 1) ^ (ipos.y & 1)) == 1) {
        float A = (L(2,-1) + L(0,-1) + L(-2,-1) - 3.0*L(1,0) - 3.0*L(-1,0) + L(2,1) + L(0,1) + L(-2,1));
        float B = (L(-1,-2) + L(-1,0) + L(-1,2) - 3.0*L(0,-1) - 3.0*L(0,1) + L(1,-2) + L(1,0) + L(1,2));
        float va = 0.5*(L(0,-1) + L(0,1));
        float vb = 0.5*(L(-1,0) + L(1,0));
        return vec4(A < B ? va : vb, 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine orthogonal holes (iter 1)
//!WHEN ITER 0 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if (((ipos.x & 1) ^ (ipos.y & 1)) == 1) {
        float c0 = L(0,0);
        float A1 = L(0,-2) + L(0,2);
        float A2 = L(-2,0) + L(2,0);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(0,-1) + L(0,3) - 2.0*L(0,1);
        I2n[0] = L(-2,1) + L(2,1) - 2.0*L(0,1);
        w[0] = abs(L(0,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(0,-3) + L(0,1) - 2.0*L(0,-1);
        I2n[1] = L(-2,-1) + L(2,-1) - 2.0*L(0,-1);
        w[1] = abs(L(0,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(1,-2) + L(1,2) - 2.0*L(1,0);
        I2n[2] = L(-1,0) + L(3,0) - 2.0*L(1,0);
        w[2] = abs(L(1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-1,-2) + L(-1,2) - 2.0*L(-1,0);
        I2n[3] = L(-3,0) + L(1,0) - 2.0*L(-1,0);
        w[3] = abs(L(-1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(0,-1) - L(0,1));
            g2 = 0.5*(L(-1,0) - L(1,0));
            i12 = 0.5*(L(-1,-1) + L(1,1) - L(-1,1) - L(1,-1));
        }
        float d = 0.01568627;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine orthogonal holes (iter 2)
//!WHEN ITER 1 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if (((ipos.x & 1) ^ (ipos.y & 1)) == 1) {
        float c0 = L(0,0);
        float A1 = L(0,-2) + L(0,2);
        float A2 = L(-2,0) + L(2,0);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(0,-1) + L(0,3) - 2.0*L(0,1);
        I2n[0] = L(-2,1) + L(2,1) - 2.0*L(0,1);
        w[0] = abs(L(0,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(0,-3) + L(0,1) - 2.0*L(0,-1);
        I2n[1] = L(-2,-1) + L(2,-1) - 2.0*L(0,-1);
        w[1] = abs(L(0,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(1,-2) + L(1,2) - 2.0*L(1,0);
        I2n[2] = L(-1,0) + L(3,0) - 2.0*L(1,0);
        w[2] = abs(L(1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-1,-2) + L(-1,2) - 2.0*L(-1,0);
        I2n[3] = L(-3,0) + L(1,0) - 2.0*L(-1,0);
        w[3] = abs(L(-1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(0,-1) - L(0,1));
            g2 = 0.5*(L(-1,0) - L(1,0));
            i12 = 0.5*(L(-1,-1) + L(1,1) - L(-1,1) - L(1,-1));
        }
        float d = 0.01176471;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine orthogonal holes (iter 3)
//!WHEN ITER 2 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if (((ipos.x & 1) ^ (ipos.y & 1)) == 1) {
        float c0 = L(0,0);
        float A1 = L(0,-2) + L(0,2);
        float A2 = L(-2,0) + L(2,0);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(0,-1) + L(0,3) - 2.0*L(0,1);
        I2n[0] = L(-2,1) + L(2,1) - 2.0*L(0,1);
        w[0] = abs(L(0,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(0,-3) + L(0,1) - 2.0*L(0,-1);
        I2n[1] = L(-2,-1) + L(2,-1) - 2.0*L(0,-1);
        w[1] = abs(L(0,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(1,-2) + L(1,2) - 2.0*L(1,0);
        I2n[2] = L(-1,0) + L(3,0) - 2.0*L(1,0);
        w[2] = abs(L(1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-1,-2) + L(-1,2) - 2.0*L(-1,0);
        I2n[3] = L(-3,0) + L(1,0) - 2.0*L(-1,0);
        w[3] = abs(L(-1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(0,-1) - L(0,1));
            g2 = 0.5*(L(-1,0) - L(1,0));
            i12 = 0.5*(L(-1,-1) + L(1,1) - L(-1,1) - L(1,-1));
        }
        float d = 0.00784314;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine orthogonal holes (iter 4)
//!WHEN ITER 3 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if (((ipos.x & 1) ^ (ipos.y & 1)) == 1) {
        float c0 = L(0,0);
        float A1 = L(0,-2) + L(0,2);
        float A2 = L(-2,0) + L(2,0);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(0,-1) + L(0,3) - 2.0*L(0,1);
        I2n[0] = L(-2,1) + L(2,1) - 2.0*L(0,1);
        w[0] = abs(L(0,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(0,-3) + L(0,1) - 2.0*L(0,-1);
        I2n[1] = L(-2,-1) + L(2,-1) - 2.0*L(0,-1);
        w[1] = abs(L(0,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(1,-2) + L(1,2) - 2.0*L(1,0);
        I2n[2] = L(-1,0) + L(3,0) - 2.0*L(1,0);
        w[2] = abs(L(1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-1,-2) + L(-1,2) - 2.0*L(-1,0);
        I2n[3] = L(-3,0) + L(1,0) - 2.0*L(-1,0);
        w[3] = abs(L(-1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(0,-1) - L(0,1));
            g2 = 0.5*(L(-1,0) - L(1,0));
            i12 = 0.5*(L(-1,-1) + L(1,1) - L(-1,1) - L(1,-1));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine orthogonal holes (iter 5)
//!WHEN ITER 4 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if (((ipos.x & 1) ^ (ipos.y & 1)) == 1) {
        float c0 = L(0,0);
        float A1 = L(0,-2) + L(0,2);
        float A2 = L(-2,0) + L(2,0);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(0,-1) + L(0,3) - 2.0*L(0,1);
        I2n[0] = L(-2,1) + L(2,1) - 2.0*L(0,1);
        w[0] = abs(L(0,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(0,-3) + L(0,1) - 2.0*L(0,-1);
        I2n[1] = L(-2,-1) + L(2,-1) - 2.0*L(0,-1);
        w[1] = abs(L(0,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(1,-2) + L(1,2) - 2.0*L(1,0);
        I2n[2] = L(-1,0) + L(3,0) - 2.0*L(1,0);
        w[2] = abs(L(1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-1,-2) + L(-1,2) - 2.0*L(-1,0);
        I2n[3] = L(-3,0) + L(1,0) - 2.0*L(-1,0);
        w[3] = abs(L(-1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(0,-1) - L(0,1));
            g2 = 0.5*(L(-1,0) - L(1,0));
            i12 = 0.5*(L(-1,-1) + L(1,1) - L(-1,1) - L(1,-1));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine orthogonal holes (iter 6)
//!WHEN ITER 5 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if (((ipos.x & 1) ^ (ipos.y & 1)) == 1) {
        float c0 = L(0,0);
        float A1 = L(0,-2) + L(0,2);
        float A2 = L(-2,0) + L(2,0);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(0,-1) + L(0,3) - 2.0*L(0,1);
        I2n[0] = L(-2,1) + L(2,1) - 2.0*L(0,1);
        w[0] = abs(L(0,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(0,-3) + L(0,1) - 2.0*L(0,-1);
        I2n[1] = L(-2,-1) + L(2,-1) - 2.0*L(0,-1);
        w[1] = abs(L(0,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(1,-2) + L(1,2) - 2.0*L(1,0);
        I2n[2] = L(-1,0) + L(3,0) - 2.0*L(1,0);
        w[2] = abs(L(1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-1,-2) + L(-1,2) - 2.0*L(-1,0);
        I2n[3] = L(-3,0) + L(1,0) - 2.0*L(-1,0);
        w[3] = abs(L(-1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(0,-1) - L(0,1));
            g2 = 0.5*(L(-1,0) - L(1,0));
            i12 = 0.5*(L(-1,-1) + L(1,1) - L(-1,1) - L(1,-1));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine orthogonal holes (iter 7)
//!WHEN ITER 6 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if (((ipos.x & 1) ^ (ipos.y & 1)) == 1) {
        float c0 = L(0,0);
        float A1 = L(0,-2) + L(0,2);
        float A2 = L(-2,0) + L(2,0);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(0,-1) + L(0,3) - 2.0*L(0,1);
        I2n[0] = L(-2,1) + L(2,1) - 2.0*L(0,1);
        w[0] = abs(L(0,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(0,-3) + L(0,1) - 2.0*L(0,-1);
        I2n[1] = L(-2,-1) + L(2,-1) - 2.0*L(0,-1);
        w[1] = abs(L(0,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(1,-2) + L(1,2) - 2.0*L(1,0);
        I2n[2] = L(-1,0) + L(3,0) - 2.0*L(1,0);
        w[2] = abs(L(1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-1,-2) + L(-1,2) - 2.0*L(-1,0);
        I2n[3] = L(-3,0) + L(1,0) - 2.0*L(-1,0);
        w[3] = abs(L(-1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(0,-1) - L(0,1));
            g2 = 0.5*(L(-1,0) - L(1,0));
            i12 = 0.5*(L(-1,-1) + L(1,1) - L(-1,1) - L(1,-1));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND LUMA_ORI
//!DESC [ICBI_RT] refine orthogonal holes (iter 8)
//!WHEN ITER 7 >

float en(float x, float A1, float A2, float I1n[4], float I2n[4],
            float w[4], float g1, float g2, float i12) {
    float I1c = A1 - 2.0 * x;
    float I2c = A2 - 2.0 * x;
    float Uc = 0.0;
    for (int k = 0; k < 4; k++)
        Uc += w[k] * (abs(I1c - I1n[k]) + abs(I2c - I2n[k]));
    float Ue = -(abs(I1c) + abs(I2c));
    float U = Uc + SHARP * Ue;                  // a = 1 (normalization), b = SHARP
    if (ISOP > 0.0) {
        float den = g1 * g1 + g2 * g2 + 1e-6;
        float f = -(g1 * g1 * I2c - 2.0 * g1 * g2 * i12 + g2 * g2 * I1c) / den;
        U += ISOP * (f * x);
    }
    return U;
}
vec4 hook() {
    ivec2 ipos = ivec2(gl_FragCoord.xy);
    ivec2 imax = ivec2(HOOKED_size) - 1;
#define L(x,y) (texelFetch(HOOKED_raw, clamp(ipos + ivec2(x,y), ivec2(0), imax), 0).r * HOOKED_mul)
    if (((ipos.x & 1) ^ (ipos.y & 1)) == 1) {
        float c0 = L(0,0);
        float A1 = L(0,-2) + L(0,2);
        float A2 = L(-2,0) + L(2,0);
        float I1n[4], I2n[4], w[4];
        I1n[0] = L(0,-1) + L(0,3) - 2.0*L(0,1);
        I2n[0] = L(-2,1) + L(2,1) - 2.0*L(0,1);
        w[0] = abs(L(0,1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[1] = L(0,-3) + L(0,1) - 2.0*L(0,-1);
        I2n[1] = L(-2,-1) + L(2,-1) - 2.0*L(0,-1);
        w[1] = abs(L(0,-1) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[2] = L(1,-2) + L(1,2) - 2.0*L(1,0);
        I2n[2] = L(-1,0) + L(3,0) - 2.0*L(1,0);
        w[2] = abs(L(1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        I1n[3] = L(-1,-2) + L(-1,2) - 2.0*L(-1,0);
        I2n[3] = L(-3,0) + L(1,0) - 2.0*L(-1,0);
        w[3] = abs(L(-1,0) - c0) <= EDGE_THR ? 1.0 : 0.0;
        float g1 = 0.0, g2 = 0.0, i12 = 0.0;
        if (ISOP > 0.0) {
            g1 = 0.5*(L(0,-1) - L(0,1));
            g2 = 0.5*(L(-1,0) - L(1,0));
            i12 = 0.5*(L(-1,-1) + L(1,1) - L(-1,1) - L(1,-1));
        }
        float d = 0.00392157;
        float u0 = en(c0,     A1, A2, I1n, I2n, w, g1, g2, i12);
        float up = en(c0 + d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float um = en(c0 - d, A1, A2, I1n, I2n, w, g1, g2, i12);
        float best = c0;
        if (up < u0 && up <= um) best = c0 + d;
        else if (um < u0 && um < up) best = c0 - d;
        return vec4(clamp(best, 0.0, 1.0), 0.0, 0.0, 1.0);
    }
    return vec4(L(0,0), 0.0, 0.0, 1.0);
#undef L
}

