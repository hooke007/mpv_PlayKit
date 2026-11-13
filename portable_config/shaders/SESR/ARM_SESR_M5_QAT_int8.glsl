// 文档 https://github.com/hooke007/mpv_PlayKit/wiki/4_GLSL

/*
Apache-2.0

The main logic is based on SESR
  https://github.com/ARM-software/sesr

The embedded model weights are derived from ARM

Converted by: hooke007
License inherited from upstream
*/


//!HOOK LUMA
//!BIND HOOKED
//!BIND W0
//!SAVE F0_0
//!DESC [ARM_SESR_M5_QAT_int8] conv 0 output 0
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 2 && p.y >= 2 && p.x < sz.x - 2 && p.y < sz.y - 2) {
        float v0_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -2)).r * HOOKED_mul;
        v0_0 = quantize(v0_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_0) * texelFetch(W0, ivec2(0, 0), 0);
        float v0_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -2)).r * HOOKED_mul;
        v0_1 = quantize(v0_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_1) * texelFetch(W0, ivec2(1, 0), 0);
        float v0_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -2)).r * HOOKED_mul;
        v0_2 = quantize(v0_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_2) * texelFetch(W0, ivec2(2, 0), 0);
        float v0_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -2)).r * HOOKED_mul;
        v0_3 = quantize(v0_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_3) * texelFetch(W0, ivec2(3, 0), 0);
        float v0_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -2)).r * HOOKED_mul;
        v0_4 = quantize(v0_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_4) * texelFetch(W0, ivec2(4, 0), 0);
        float v1_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -1)).r * HOOKED_mul;
        v1_0 = quantize(v1_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_0) * texelFetch(W0, ivec2(5, 0), 0);
        float v1_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -1)).r * HOOKED_mul;
        v1_1 = quantize(v1_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_1) * texelFetch(W0, ivec2(6, 0), 0);
        float v1_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -1)).r * HOOKED_mul;
        v1_2 = quantize(v1_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_2) * texelFetch(W0, ivec2(7, 0), 0);
        float v1_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -1)).r * HOOKED_mul;
        v1_3 = quantize(v1_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_3) * texelFetch(W0, ivec2(8, 0), 0);
        float v1_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -1)).r * HOOKED_mul;
        v1_4 = quantize(v1_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_4) * texelFetch(W0, ivec2(9, 0), 0);
        float v2_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 0)).r * HOOKED_mul;
        v2_0 = quantize(v2_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_0) * texelFetch(W0, ivec2(10, 0), 0);
        float v2_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 0)).r * HOOKED_mul;
        v2_1 = quantize(v2_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_1) * texelFetch(W0, ivec2(11, 0), 0);
        float v2_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 0)).r * HOOKED_mul;
        v2_2 = quantize(v2_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_2) * texelFetch(W0, ivec2(12, 0), 0);
        float v2_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 0)).r * HOOKED_mul;
        v2_3 = quantize(v2_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_3) * texelFetch(W0, ivec2(13, 0), 0);
        float v2_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 0)).r * HOOKED_mul;
        v2_4 = quantize(v2_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_4) * texelFetch(W0, ivec2(14, 0), 0);
        float v3_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 1)).r * HOOKED_mul;
        v3_0 = quantize(v3_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_0) * texelFetch(W0, ivec2(15, 0), 0);
        float v3_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 1)).r * HOOKED_mul;
        v3_1 = quantize(v3_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_1) * texelFetch(W0, ivec2(16, 0), 0);
        float v3_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 1)).r * HOOKED_mul;
        v3_2 = quantize(v3_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_2) * texelFetch(W0, ivec2(17, 0), 0);
        float v3_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 1)).r * HOOKED_mul;
        v3_3 = quantize(v3_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_3) * texelFetch(W0, ivec2(18, 0), 0);
        float v3_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 1)).r * HOOKED_mul;
        v3_4 = quantize(v3_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_4) * texelFetch(W0, ivec2(19, 0), 0);
        float v4_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 2)).r * HOOKED_mul;
        v4_0 = quantize(v4_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_0) * texelFetch(W0, ivec2(20, 0), 0);
        float v4_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 2)).r * HOOKED_mul;
        v4_1 = quantize(v4_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_1) * texelFetch(W0, ivec2(21, 0), 0);
        float v4_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 2)).r * HOOKED_mul;
        v4_2 = quantize(v4_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_2) * texelFetch(W0, ivec2(22, 0), 0);
        float v4_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 2)).r * HOOKED_mul;
        v4_3 = quantize(v4_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_3) * texelFetch(W0, ivec2(23, 0), 0);
        float v4_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 2)).r * HOOKED_mul;
        v4_4 = quantize(v4_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_4) * texelFetch(W0, ivec2(24, 0), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-2, -2);
        float s0_0 = 0.0;
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -2)).r * HOOKED_mul;
            s0_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_0) * texelFetch(W0, ivec2(0, 0), 0);
        ivec2 t0_1 = p + ivec2(-1, -2);
        float s0_1 = 0.0;
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -2)).r * HOOKED_mul;
            s0_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_1) * texelFetch(W0, ivec2(1, 0), 0);
        ivec2 t0_2 = p + ivec2(0, -2);
        float s0_2 = 0.0;
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -2)).r * HOOKED_mul;
            s0_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_2) * texelFetch(W0, ivec2(2, 0), 0);
        ivec2 t0_3 = p + ivec2(1, -2);
        float s0_3 = 0.0;
        if (uint(t0_3.x) < uint(sz.x) && uint(t0_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -2)).r * HOOKED_mul;
            s0_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_3) * texelFetch(W0, ivec2(3, 0), 0);
        ivec2 t0_4 = p + ivec2(2, -2);
        float s0_4 = 0.0;
        if (uint(t0_4.x) < uint(sz.x) && uint(t0_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -2)).r * HOOKED_mul;
            s0_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_4) * texelFetch(W0, ivec2(4, 0), 0);
        ivec2 t1_0 = p + ivec2(-2, -1);
        float s1_0 = 0.0;
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -1)).r * HOOKED_mul;
            s1_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_0) * texelFetch(W0, ivec2(5, 0), 0);
        ivec2 t1_1 = p + ivec2(-1, -1);
        float s1_1 = 0.0;
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -1)).r * HOOKED_mul;
            s1_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_1) * texelFetch(W0, ivec2(6, 0), 0);
        ivec2 t1_2 = p + ivec2(0, -1);
        float s1_2 = 0.0;
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -1)).r * HOOKED_mul;
            s1_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_2) * texelFetch(W0, ivec2(7, 0), 0);
        ivec2 t1_3 = p + ivec2(1, -1);
        float s1_3 = 0.0;
        if (uint(t1_3.x) < uint(sz.x) && uint(t1_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -1)).r * HOOKED_mul;
            s1_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_3) * texelFetch(W0, ivec2(8, 0), 0);
        ivec2 t1_4 = p + ivec2(2, -1);
        float s1_4 = 0.0;
        if (uint(t1_4.x) < uint(sz.x) && uint(t1_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -1)).r * HOOKED_mul;
            s1_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_4) * texelFetch(W0, ivec2(9, 0), 0);
        ivec2 t2_0 = p + ivec2(-2, 0);
        float s2_0 = 0.0;
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 0)).r * HOOKED_mul;
            s2_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_0) * texelFetch(W0, ivec2(10, 0), 0);
        ivec2 t2_1 = p + ivec2(-1, 0);
        float s2_1 = 0.0;
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 0)).r * HOOKED_mul;
            s2_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_1) * texelFetch(W0, ivec2(11, 0), 0);
        ivec2 t2_2 = p + ivec2(0, 0);
        float s2_2 = 0.0;
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 0)).r * HOOKED_mul;
            s2_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_2) * texelFetch(W0, ivec2(12, 0), 0);
        ivec2 t2_3 = p + ivec2(1, 0);
        float s2_3 = 0.0;
        if (uint(t2_3.x) < uint(sz.x) && uint(t2_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 0)).r * HOOKED_mul;
            s2_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_3) * texelFetch(W0, ivec2(13, 0), 0);
        ivec2 t2_4 = p + ivec2(2, 0);
        float s2_4 = 0.0;
        if (uint(t2_4.x) < uint(sz.x) && uint(t2_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 0)).r * HOOKED_mul;
            s2_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_4) * texelFetch(W0, ivec2(14, 0), 0);
        ivec2 t3_0 = p + ivec2(-2, 1);
        float s3_0 = 0.0;
        if (uint(t3_0.x) < uint(sz.x) && uint(t3_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 1)).r * HOOKED_mul;
            s3_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_0) * texelFetch(W0, ivec2(15, 0), 0);
        ivec2 t3_1 = p + ivec2(-1, 1);
        float s3_1 = 0.0;
        if (uint(t3_1.x) < uint(sz.x) && uint(t3_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 1)).r * HOOKED_mul;
            s3_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_1) * texelFetch(W0, ivec2(16, 0), 0);
        ivec2 t3_2 = p + ivec2(0, 1);
        float s3_2 = 0.0;
        if (uint(t3_2.x) < uint(sz.x) && uint(t3_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 1)).r * HOOKED_mul;
            s3_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_2) * texelFetch(W0, ivec2(17, 0), 0);
        ivec2 t3_3 = p + ivec2(1, 1);
        float s3_3 = 0.0;
        if (uint(t3_3.x) < uint(sz.x) && uint(t3_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 1)).r * HOOKED_mul;
            s3_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_3) * texelFetch(W0, ivec2(18, 0), 0);
        ivec2 t3_4 = p + ivec2(2, 1);
        float s3_4 = 0.0;
        if (uint(t3_4.x) < uint(sz.x) && uint(t3_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 1)).r * HOOKED_mul;
            s3_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_4) * texelFetch(W0, ivec2(19, 0), 0);
        ivec2 t4_0 = p + ivec2(-2, 2);
        float s4_0 = 0.0;
        if (uint(t4_0.x) < uint(sz.x) && uint(t4_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 2)).r * HOOKED_mul;
            s4_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_0) * texelFetch(W0, ivec2(20, 0), 0);
        ivec2 t4_1 = p + ivec2(-1, 2);
        float s4_1 = 0.0;
        if (uint(t4_1.x) < uint(sz.x) && uint(t4_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 2)).r * HOOKED_mul;
            s4_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_1) * texelFetch(W0, ivec2(21, 0), 0);
        ivec2 t4_2 = p + ivec2(0, 2);
        float s4_2 = 0.0;
        if (uint(t4_2.x) < uint(sz.x) && uint(t4_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 2)).r * HOOKED_mul;
            s4_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_2) * texelFetch(W0, ivec2(22, 0), 0);
        ivec2 t4_3 = p + ivec2(1, 2);
        float s4_3 = 0.0;
        if (uint(t4_3.x) < uint(sz.x) && uint(t4_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 2)).r * HOOKED_mul;
            s4_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_3) * texelFetch(W0, ivec2(23, 0), 0);
        ivec2 t4_4 = p + ivec2(2, 2);
        float s4_4 = 0.0;
        if (uint(t4_4.x) < uint(sz.x) && uint(t4_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 2)).r * HOOKED_mul;
            s4_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_4) * texelFetch(W0, ivec2(24, 0), 0);
    }
    sum += vec4(-0.008247691872,-0.004173538695,0.001156290797,0.003204399138);
    return vec4(quantize(sum.x, 0.002667733934, 1), quantize(sum.y, 0.002667733934, 1), quantize(sum.z, 0.002667733934, 1), quantize(sum.w, 0.002667733934, 1));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W0
//!SAVE F0_1
//!DESC [ARM_SESR_M5_QAT_int8] conv 0 output 1
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 2 && p.y >= 2 && p.x < sz.x - 2 && p.y < sz.y - 2) {
        float v0_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -2)).r * HOOKED_mul;
        v0_0 = quantize(v0_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_0) * texelFetch(W0, ivec2(0, 1), 0);
        float v0_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -2)).r * HOOKED_mul;
        v0_1 = quantize(v0_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_1) * texelFetch(W0, ivec2(1, 1), 0);
        float v0_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -2)).r * HOOKED_mul;
        v0_2 = quantize(v0_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_2) * texelFetch(W0, ivec2(2, 1), 0);
        float v0_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -2)).r * HOOKED_mul;
        v0_3 = quantize(v0_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_3) * texelFetch(W0, ivec2(3, 1), 0);
        float v0_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -2)).r * HOOKED_mul;
        v0_4 = quantize(v0_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_4) * texelFetch(W0, ivec2(4, 1), 0);
        float v1_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -1)).r * HOOKED_mul;
        v1_0 = quantize(v1_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_0) * texelFetch(W0, ivec2(5, 1), 0);
        float v1_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -1)).r * HOOKED_mul;
        v1_1 = quantize(v1_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_1) * texelFetch(W0, ivec2(6, 1), 0);
        float v1_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -1)).r * HOOKED_mul;
        v1_2 = quantize(v1_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_2) * texelFetch(W0, ivec2(7, 1), 0);
        float v1_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -1)).r * HOOKED_mul;
        v1_3 = quantize(v1_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_3) * texelFetch(W0, ivec2(8, 1), 0);
        float v1_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -1)).r * HOOKED_mul;
        v1_4 = quantize(v1_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_4) * texelFetch(W0, ivec2(9, 1), 0);
        float v2_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 0)).r * HOOKED_mul;
        v2_0 = quantize(v2_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_0) * texelFetch(W0, ivec2(10, 1), 0);
        float v2_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 0)).r * HOOKED_mul;
        v2_1 = quantize(v2_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_1) * texelFetch(W0, ivec2(11, 1), 0);
        float v2_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 0)).r * HOOKED_mul;
        v2_2 = quantize(v2_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_2) * texelFetch(W0, ivec2(12, 1), 0);
        float v2_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 0)).r * HOOKED_mul;
        v2_3 = quantize(v2_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_3) * texelFetch(W0, ivec2(13, 1), 0);
        float v2_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 0)).r * HOOKED_mul;
        v2_4 = quantize(v2_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_4) * texelFetch(W0, ivec2(14, 1), 0);
        float v3_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 1)).r * HOOKED_mul;
        v3_0 = quantize(v3_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_0) * texelFetch(W0, ivec2(15, 1), 0);
        float v3_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 1)).r * HOOKED_mul;
        v3_1 = quantize(v3_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_1) * texelFetch(W0, ivec2(16, 1), 0);
        float v3_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 1)).r * HOOKED_mul;
        v3_2 = quantize(v3_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_2) * texelFetch(W0, ivec2(17, 1), 0);
        float v3_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 1)).r * HOOKED_mul;
        v3_3 = quantize(v3_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_3) * texelFetch(W0, ivec2(18, 1), 0);
        float v3_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 1)).r * HOOKED_mul;
        v3_4 = quantize(v3_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_4) * texelFetch(W0, ivec2(19, 1), 0);
        float v4_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 2)).r * HOOKED_mul;
        v4_0 = quantize(v4_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_0) * texelFetch(W0, ivec2(20, 1), 0);
        float v4_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 2)).r * HOOKED_mul;
        v4_1 = quantize(v4_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_1) * texelFetch(W0, ivec2(21, 1), 0);
        float v4_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 2)).r * HOOKED_mul;
        v4_2 = quantize(v4_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_2) * texelFetch(W0, ivec2(22, 1), 0);
        float v4_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 2)).r * HOOKED_mul;
        v4_3 = quantize(v4_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_3) * texelFetch(W0, ivec2(23, 1), 0);
        float v4_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 2)).r * HOOKED_mul;
        v4_4 = quantize(v4_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_4) * texelFetch(W0, ivec2(24, 1), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-2, -2);
        float s0_0 = 0.0;
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -2)).r * HOOKED_mul;
            s0_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_0) * texelFetch(W0, ivec2(0, 1), 0);
        ivec2 t0_1 = p + ivec2(-1, -2);
        float s0_1 = 0.0;
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -2)).r * HOOKED_mul;
            s0_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_1) * texelFetch(W0, ivec2(1, 1), 0);
        ivec2 t0_2 = p + ivec2(0, -2);
        float s0_2 = 0.0;
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -2)).r * HOOKED_mul;
            s0_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_2) * texelFetch(W0, ivec2(2, 1), 0);
        ivec2 t0_3 = p + ivec2(1, -2);
        float s0_3 = 0.0;
        if (uint(t0_3.x) < uint(sz.x) && uint(t0_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -2)).r * HOOKED_mul;
            s0_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_3) * texelFetch(W0, ivec2(3, 1), 0);
        ivec2 t0_4 = p + ivec2(2, -2);
        float s0_4 = 0.0;
        if (uint(t0_4.x) < uint(sz.x) && uint(t0_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -2)).r * HOOKED_mul;
            s0_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_4) * texelFetch(W0, ivec2(4, 1), 0);
        ivec2 t1_0 = p + ivec2(-2, -1);
        float s1_0 = 0.0;
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -1)).r * HOOKED_mul;
            s1_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_0) * texelFetch(W0, ivec2(5, 1), 0);
        ivec2 t1_1 = p + ivec2(-1, -1);
        float s1_1 = 0.0;
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -1)).r * HOOKED_mul;
            s1_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_1) * texelFetch(W0, ivec2(6, 1), 0);
        ivec2 t1_2 = p + ivec2(0, -1);
        float s1_2 = 0.0;
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -1)).r * HOOKED_mul;
            s1_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_2) * texelFetch(W0, ivec2(7, 1), 0);
        ivec2 t1_3 = p + ivec2(1, -1);
        float s1_3 = 0.0;
        if (uint(t1_3.x) < uint(sz.x) && uint(t1_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -1)).r * HOOKED_mul;
            s1_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_3) * texelFetch(W0, ivec2(8, 1), 0);
        ivec2 t1_4 = p + ivec2(2, -1);
        float s1_4 = 0.0;
        if (uint(t1_4.x) < uint(sz.x) && uint(t1_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -1)).r * HOOKED_mul;
            s1_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_4) * texelFetch(W0, ivec2(9, 1), 0);
        ivec2 t2_0 = p + ivec2(-2, 0);
        float s2_0 = 0.0;
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 0)).r * HOOKED_mul;
            s2_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_0) * texelFetch(W0, ivec2(10, 1), 0);
        ivec2 t2_1 = p + ivec2(-1, 0);
        float s2_1 = 0.0;
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 0)).r * HOOKED_mul;
            s2_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_1) * texelFetch(W0, ivec2(11, 1), 0);
        ivec2 t2_2 = p + ivec2(0, 0);
        float s2_2 = 0.0;
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 0)).r * HOOKED_mul;
            s2_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_2) * texelFetch(W0, ivec2(12, 1), 0);
        ivec2 t2_3 = p + ivec2(1, 0);
        float s2_3 = 0.0;
        if (uint(t2_3.x) < uint(sz.x) && uint(t2_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 0)).r * HOOKED_mul;
            s2_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_3) * texelFetch(W0, ivec2(13, 1), 0);
        ivec2 t2_4 = p + ivec2(2, 0);
        float s2_4 = 0.0;
        if (uint(t2_4.x) < uint(sz.x) && uint(t2_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 0)).r * HOOKED_mul;
            s2_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_4) * texelFetch(W0, ivec2(14, 1), 0);
        ivec2 t3_0 = p + ivec2(-2, 1);
        float s3_0 = 0.0;
        if (uint(t3_0.x) < uint(sz.x) && uint(t3_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 1)).r * HOOKED_mul;
            s3_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_0) * texelFetch(W0, ivec2(15, 1), 0);
        ivec2 t3_1 = p + ivec2(-1, 1);
        float s3_1 = 0.0;
        if (uint(t3_1.x) < uint(sz.x) && uint(t3_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 1)).r * HOOKED_mul;
            s3_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_1) * texelFetch(W0, ivec2(16, 1), 0);
        ivec2 t3_2 = p + ivec2(0, 1);
        float s3_2 = 0.0;
        if (uint(t3_2.x) < uint(sz.x) && uint(t3_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 1)).r * HOOKED_mul;
            s3_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_2) * texelFetch(W0, ivec2(17, 1), 0);
        ivec2 t3_3 = p + ivec2(1, 1);
        float s3_3 = 0.0;
        if (uint(t3_3.x) < uint(sz.x) && uint(t3_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 1)).r * HOOKED_mul;
            s3_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_3) * texelFetch(W0, ivec2(18, 1), 0);
        ivec2 t3_4 = p + ivec2(2, 1);
        float s3_4 = 0.0;
        if (uint(t3_4.x) < uint(sz.x) && uint(t3_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 1)).r * HOOKED_mul;
            s3_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_4) * texelFetch(W0, ivec2(19, 1), 0);
        ivec2 t4_0 = p + ivec2(-2, 2);
        float s4_0 = 0.0;
        if (uint(t4_0.x) < uint(sz.x) && uint(t4_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 2)).r * HOOKED_mul;
            s4_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_0) * texelFetch(W0, ivec2(20, 1), 0);
        ivec2 t4_1 = p + ivec2(-1, 2);
        float s4_1 = 0.0;
        if (uint(t4_1.x) < uint(sz.x) && uint(t4_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 2)).r * HOOKED_mul;
            s4_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_1) * texelFetch(W0, ivec2(21, 1), 0);
        ivec2 t4_2 = p + ivec2(0, 2);
        float s4_2 = 0.0;
        if (uint(t4_2.x) < uint(sz.x) && uint(t4_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 2)).r * HOOKED_mul;
            s4_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_2) * texelFetch(W0, ivec2(22, 1), 0);
        ivec2 t4_3 = p + ivec2(1, 2);
        float s4_3 = 0.0;
        if (uint(t4_3.x) < uint(sz.x) && uint(t4_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 2)).r * HOOKED_mul;
            s4_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_3) * texelFetch(W0, ivec2(23, 1), 0);
        ivec2 t4_4 = p + ivec2(2, 2);
        float s4_4 = 0.0;
        if (uint(t4_4.x) < uint(sz.x) && uint(t4_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 2)).r * HOOKED_mul;
            s4_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_4) * texelFetch(W0, ivec2(24, 1), 0);
    }
    sum += vec4(0.008016119232,0.002819562475,0.004066711634,-0.04763984858);
    return vec4(quantize(sum.x, 0.002667733934, 1), quantize(sum.y, 0.002667733934, 1), quantize(sum.z, 0.002667733934, 1), quantize(sum.w, 0.002667733934, 1));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W0
//!SAVE F0_2
//!DESC [ARM_SESR_M5_QAT_int8] conv 0 output 2
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 2 && p.y >= 2 && p.x < sz.x - 2 && p.y < sz.y - 2) {
        float v0_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -2)).r * HOOKED_mul;
        v0_0 = quantize(v0_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_0) * texelFetch(W0, ivec2(0, 2), 0);
        float v0_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -2)).r * HOOKED_mul;
        v0_1 = quantize(v0_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_1) * texelFetch(W0, ivec2(1, 2), 0);
        float v0_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -2)).r * HOOKED_mul;
        v0_2 = quantize(v0_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_2) * texelFetch(W0, ivec2(2, 2), 0);
        float v0_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -2)).r * HOOKED_mul;
        v0_3 = quantize(v0_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_3) * texelFetch(W0, ivec2(3, 2), 0);
        float v0_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -2)).r * HOOKED_mul;
        v0_4 = quantize(v0_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_4) * texelFetch(W0, ivec2(4, 2), 0);
        float v1_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -1)).r * HOOKED_mul;
        v1_0 = quantize(v1_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_0) * texelFetch(W0, ivec2(5, 2), 0);
        float v1_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -1)).r * HOOKED_mul;
        v1_1 = quantize(v1_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_1) * texelFetch(W0, ivec2(6, 2), 0);
        float v1_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -1)).r * HOOKED_mul;
        v1_2 = quantize(v1_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_2) * texelFetch(W0, ivec2(7, 2), 0);
        float v1_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -1)).r * HOOKED_mul;
        v1_3 = quantize(v1_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_3) * texelFetch(W0, ivec2(8, 2), 0);
        float v1_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -1)).r * HOOKED_mul;
        v1_4 = quantize(v1_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_4) * texelFetch(W0, ivec2(9, 2), 0);
        float v2_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 0)).r * HOOKED_mul;
        v2_0 = quantize(v2_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_0) * texelFetch(W0, ivec2(10, 2), 0);
        float v2_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 0)).r * HOOKED_mul;
        v2_1 = quantize(v2_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_1) * texelFetch(W0, ivec2(11, 2), 0);
        float v2_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 0)).r * HOOKED_mul;
        v2_2 = quantize(v2_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_2) * texelFetch(W0, ivec2(12, 2), 0);
        float v2_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 0)).r * HOOKED_mul;
        v2_3 = quantize(v2_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_3) * texelFetch(W0, ivec2(13, 2), 0);
        float v2_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 0)).r * HOOKED_mul;
        v2_4 = quantize(v2_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_4) * texelFetch(W0, ivec2(14, 2), 0);
        float v3_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 1)).r * HOOKED_mul;
        v3_0 = quantize(v3_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_0) * texelFetch(W0, ivec2(15, 2), 0);
        float v3_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 1)).r * HOOKED_mul;
        v3_1 = quantize(v3_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_1) * texelFetch(W0, ivec2(16, 2), 0);
        float v3_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 1)).r * HOOKED_mul;
        v3_2 = quantize(v3_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_2) * texelFetch(W0, ivec2(17, 2), 0);
        float v3_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 1)).r * HOOKED_mul;
        v3_3 = quantize(v3_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_3) * texelFetch(W0, ivec2(18, 2), 0);
        float v3_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 1)).r * HOOKED_mul;
        v3_4 = quantize(v3_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_4) * texelFetch(W0, ivec2(19, 2), 0);
        float v4_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 2)).r * HOOKED_mul;
        v4_0 = quantize(v4_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_0) * texelFetch(W0, ivec2(20, 2), 0);
        float v4_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 2)).r * HOOKED_mul;
        v4_1 = quantize(v4_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_1) * texelFetch(W0, ivec2(21, 2), 0);
        float v4_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 2)).r * HOOKED_mul;
        v4_2 = quantize(v4_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_2) * texelFetch(W0, ivec2(22, 2), 0);
        float v4_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 2)).r * HOOKED_mul;
        v4_3 = quantize(v4_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_3) * texelFetch(W0, ivec2(23, 2), 0);
        float v4_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 2)).r * HOOKED_mul;
        v4_4 = quantize(v4_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_4) * texelFetch(W0, ivec2(24, 2), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-2, -2);
        float s0_0 = 0.0;
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -2)).r * HOOKED_mul;
            s0_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_0) * texelFetch(W0, ivec2(0, 2), 0);
        ivec2 t0_1 = p + ivec2(-1, -2);
        float s0_1 = 0.0;
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -2)).r * HOOKED_mul;
            s0_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_1) * texelFetch(W0, ivec2(1, 2), 0);
        ivec2 t0_2 = p + ivec2(0, -2);
        float s0_2 = 0.0;
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -2)).r * HOOKED_mul;
            s0_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_2) * texelFetch(W0, ivec2(2, 2), 0);
        ivec2 t0_3 = p + ivec2(1, -2);
        float s0_3 = 0.0;
        if (uint(t0_3.x) < uint(sz.x) && uint(t0_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -2)).r * HOOKED_mul;
            s0_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_3) * texelFetch(W0, ivec2(3, 2), 0);
        ivec2 t0_4 = p + ivec2(2, -2);
        float s0_4 = 0.0;
        if (uint(t0_4.x) < uint(sz.x) && uint(t0_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -2)).r * HOOKED_mul;
            s0_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_4) * texelFetch(W0, ivec2(4, 2), 0);
        ivec2 t1_0 = p + ivec2(-2, -1);
        float s1_0 = 0.0;
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -1)).r * HOOKED_mul;
            s1_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_0) * texelFetch(W0, ivec2(5, 2), 0);
        ivec2 t1_1 = p + ivec2(-1, -1);
        float s1_1 = 0.0;
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -1)).r * HOOKED_mul;
            s1_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_1) * texelFetch(W0, ivec2(6, 2), 0);
        ivec2 t1_2 = p + ivec2(0, -1);
        float s1_2 = 0.0;
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -1)).r * HOOKED_mul;
            s1_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_2) * texelFetch(W0, ivec2(7, 2), 0);
        ivec2 t1_3 = p + ivec2(1, -1);
        float s1_3 = 0.0;
        if (uint(t1_3.x) < uint(sz.x) && uint(t1_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -1)).r * HOOKED_mul;
            s1_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_3) * texelFetch(W0, ivec2(8, 2), 0);
        ivec2 t1_4 = p + ivec2(2, -1);
        float s1_4 = 0.0;
        if (uint(t1_4.x) < uint(sz.x) && uint(t1_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -1)).r * HOOKED_mul;
            s1_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_4) * texelFetch(W0, ivec2(9, 2), 0);
        ivec2 t2_0 = p + ivec2(-2, 0);
        float s2_0 = 0.0;
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 0)).r * HOOKED_mul;
            s2_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_0) * texelFetch(W0, ivec2(10, 2), 0);
        ivec2 t2_1 = p + ivec2(-1, 0);
        float s2_1 = 0.0;
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 0)).r * HOOKED_mul;
            s2_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_1) * texelFetch(W0, ivec2(11, 2), 0);
        ivec2 t2_2 = p + ivec2(0, 0);
        float s2_2 = 0.0;
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 0)).r * HOOKED_mul;
            s2_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_2) * texelFetch(W0, ivec2(12, 2), 0);
        ivec2 t2_3 = p + ivec2(1, 0);
        float s2_3 = 0.0;
        if (uint(t2_3.x) < uint(sz.x) && uint(t2_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 0)).r * HOOKED_mul;
            s2_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_3) * texelFetch(W0, ivec2(13, 2), 0);
        ivec2 t2_4 = p + ivec2(2, 0);
        float s2_4 = 0.0;
        if (uint(t2_4.x) < uint(sz.x) && uint(t2_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 0)).r * HOOKED_mul;
            s2_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_4) * texelFetch(W0, ivec2(14, 2), 0);
        ivec2 t3_0 = p + ivec2(-2, 1);
        float s3_0 = 0.0;
        if (uint(t3_0.x) < uint(sz.x) && uint(t3_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 1)).r * HOOKED_mul;
            s3_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_0) * texelFetch(W0, ivec2(15, 2), 0);
        ivec2 t3_1 = p + ivec2(-1, 1);
        float s3_1 = 0.0;
        if (uint(t3_1.x) < uint(sz.x) && uint(t3_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 1)).r * HOOKED_mul;
            s3_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_1) * texelFetch(W0, ivec2(16, 2), 0);
        ivec2 t3_2 = p + ivec2(0, 1);
        float s3_2 = 0.0;
        if (uint(t3_2.x) < uint(sz.x) && uint(t3_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 1)).r * HOOKED_mul;
            s3_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_2) * texelFetch(W0, ivec2(17, 2), 0);
        ivec2 t3_3 = p + ivec2(1, 1);
        float s3_3 = 0.0;
        if (uint(t3_3.x) < uint(sz.x) && uint(t3_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 1)).r * HOOKED_mul;
            s3_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_3) * texelFetch(W0, ivec2(18, 2), 0);
        ivec2 t3_4 = p + ivec2(2, 1);
        float s3_4 = 0.0;
        if (uint(t3_4.x) < uint(sz.x) && uint(t3_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 1)).r * HOOKED_mul;
            s3_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_4) * texelFetch(W0, ivec2(19, 2), 0);
        ivec2 t4_0 = p + ivec2(-2, 2);
        float s4_0 = 0.0;
        if (uint(t4_0.x) < uint(sz.x) && uint(t4_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 2)).r * HOOKED_mul;
            s4_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_0) * texelFetch(W0, ivec2(20, 2), 0);
        ivec2 t4_1 = p + ivec2(-1, 2);
        float s4_1 = 0.0;
        if (uint(t4_1.x) < uint(sz.x) && uint(t4_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 2)).r * HOOKED_mul;
            s4_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_1) * texelFetch(W0, ivec2(21, 2), 0);
        ivec2 t4_2 = p + ivec2(0, 2);
        float s4_2 = 0.0;
        if (uint(t4_2.x) < uint(sz.x) && uint(t4_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 2)).r * HOOKED_mul;
            s4_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_2) * texelFetch(W0, ivec2(22, 2), 0);
        ivec2 t4_3 = p + ivec2(1, 2);
        float s4_3 = 0.0;
        if (uint(t4_3.x) < uint(sz.x) && uint(t4_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 2)).r * HOOKED_mul;
            s4_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_3) * texelFetch(W0, ivec2(23, 2), 0);
        ivec2 t4_4 = p + ivec2(2, 2);
        float s4_4 = 0.0;
        if (uint(t4_4.x) < uint(sz.x) && uint(t4_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 2)).r * HOOKED_mul;
            s4_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_4) * texelFetch(W0, ivec2(24, 2), 0);
    }
    sum += vec4(0.001256010702,0.002069002454,0.000877442917,0.01326101691);
    return vec4(quantize(sum.x, 0.002667733934, 1), quantize(sum.y, 0.002667733934, 1), quantize(sum.z, 0.002667733934, 1), quantize(sum.w, 0.002667733934, 1));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W0
//!SAVE F0_3
//!DESC [ARM_SESR_M5_QAT_int8] conv 0 output 3
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 2 && p.y >= 2 && p.x < sz.x - 2 && p.y < sz.y - 2) {
        float v0_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -2)).r * HOOKED_mul;
        v0_0 = quantize(v0_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_0) * texelFetch(W0, ivec2(0, 3), 0);
        float v0_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -2)).r * HOOKED_mul;
        v0_1 = quantize(v0_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_1) * texelFetch(W0, ivec2(1, 3), 0);
        float v0_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -2)).r * HOOKED_mul;
        v0_2 = quantize(v0_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_2) * texelFetch(W0, ivec2(2, 3), 0);
        float v0_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -2)).r * HOOKED_mul;
        v0_3 = quantize(v0_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_3) * texelFetch(W0, ivec2(3, 3), 0);
        float v0_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -2)).r * HOOKED_mul;
        v0_4 = quantize(v0_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v0_4) * texelFetch(W0, ivec2(4, 3), 0);
        float v1_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -1)).r * HOOKED_mul;
        v1_0 = quantize(v1_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_0) * texelFetch(W0, ivec2(5, 3), 0);
        float v1_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -1)).r * HOOKED_mul;
        v1_1 = quantize(v1_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_1) * texelFetch(W0, ivec2(6, 3), 0);
        float v1_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -1)).r * HOOKED_mul;
        v1_2 = quantize(v1_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_2) * texelFetch(W0, ivec2(7, 3), 0);
        float v1_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -1)).r * HOOKED_mul;
        v1_3 = quantize(v1_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_3) * texelFetch(W0, ivec2(8, 3), 0);
        float v1_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -1)).r * HOOKED_mul;
        v1_4 = quantize(v1_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v1_4) * texelFetch(W0, ivec2(9, 3), 0);
        float v2_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 0)).r * HOOKED_mul;
        v2_0 = quantize(v2_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_0) * texelFetch(W0, ivec2(10, 3), 0);
        float v2_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 0)).r * HOOKED_mul;
        v2_1 = quantize(v2_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_1) * texelFetch(W0, ivec2(11, 3), 0);
        float v2_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 0)).r * HOOKED_mul;
        v2_2 = quantize(v2_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_2) * texelFetch(W0, ivec2(12, 3), 0);
        float v2_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 0)).r * HOOKED_mul;
        v2_3 = quantize(v2_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_3) * texelFetch(W0, ivec2(13, 3), 0);
        float v2_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 0)).r * HOOKED_mul;
        v2_4 = quantize(v2_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v2_4) * texelFetch(W0, ivec2(14, 3), 0);
        float v3_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 1)).r * HOOKED_mul;
        v3_0 = quantize(v3_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_0) * texelFetch(W0, ivec2(15, 3), 0);
        float v3_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 1)).r * HOOKED_mul;
        v3_1 = quantize(v3_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_1) * texelFetch(W0, ivec2(16, 3), 0);
        float v3_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 1)).r * HOOKED_mul;
        v3_2 = quantize(v3_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_2) * texelFetch(W0, ivec2(17, 3), 0);
        float v3_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 1)).r * HOOKED_mul;
        v3_3 = quantize(v3_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_3) * texelFetch(W0, ivec2(18, 3), 0);
        float v3_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 1)).r * HOOKED_mul;
        v3_4 = quantize(v3_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v3_4) * texelFetch(W0, ivec2(19, 3), 0);
        float v4_0 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 2)).r * HOOKED_mul;
        v4_0 = quantize(v4_0 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_0) * texelFetch(W0, ivec2(20, 3), 0);
        float v4_1 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 2)).r * HOOKED_mul;
        v4_1 = quantize(v4_1 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_1) * texelFetch(W0, ivec2(21, 3), 0);
        float v4_2 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 2)).r * HOOKED_mul;
        v4_2 = quantize(v4_2 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_2) * texelFetch(W0, ivec2(22, 3), 0);
        float v4_3 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 2)).r * HOOKED_mul;
        v4_3 = quantize(v4_3 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_3) * texelFetch(W0, ivec2(23, 3), 0);
        float v4_4 = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 2)).r * HOOKED_mul;
        v4_4 = quantize(v4_4 - 0.5, 0.003367935773, 2);
        sum += vec4(v4_4) * texelFetch(W0, ivec2(24, 3), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-2, -2);
        float s0_0 = 0.0;
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -2)).r * HOOKED_mul;
            s0_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_0) * texelFetch(W0, ivec2(0, 3), 0);
        ivec2 t0_1 = p + ivec2(-1, -2);
        float s0_1 = 0.0;
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -2)).r * HOOKED_mul;
            s0_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_1) * texelFetch(W0, ivec2(1, 3), 0);
        ivec2 t0_2 = p + ivec2(0, -2);
        float s0_2 = 0.0;
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -2)).r * HOOKED_mul;
            s0_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_2) * texelFetch(W0, ivec2(2, 3), 0);
        ivec2 t0_3 = p + ivec2(1, -2);
        float s0_3 = 0.0;
        if (uint(t0_3.x) < uint(sz.x) && uint(t0_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -2)).r * HOOKED_mul;
            s0_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_3) * texelFetch(W0, ivec2(3, 3), 0);
        ivec2 t0_4 = p + ivec2(2, -2);
        float s0_4 = 0.0;
        if (uint(t0_4.x) < uint(sz.x) && uint(t0_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -2)).r * HOOKED_mul;
            s0_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s0_4) * texelFetch(W0, ivec2(4, 3), 0);
        ivec2 t1_0 = p + ivec2(-2, -1);
        float s1_0 = 0.0;
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, -1)).r * HOOKED_mul;
            s1_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_0) * texelFetch(W0, ivec2(5, 3), 0);
        ivec2 t1_1 = p + ivec2(-1, -1);
        float s1_1 = 0.0;
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, -1)).r * HOOKED_mul;
            s1_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_1) * texelFetch(W0, ivec2(6, 3), 0);
        ivec2 t1_2 = p + ivec2(0, -1);
        float s1_2 = 0.0;
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, -1)).r * HOOKED_mul;
            s1_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_2) * texelFetch(W0, ivec2(7, 3), 0);
        ivec2 t1_3 = p + ivec2(1, -1);
        float s1_3 = 0.0;
        if (uint(t1_3.x) < uint(sz.x) && uint(t1_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, -1)).r * HOOKED_mul;
            s1_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_3) * texelFetch(W0, ivec2(8, 3), 0);
        ivec2 t1_4 = p + ivec2(2, -1);
        float s1_4 = 0.0;
        if (uint(t1_4.x) < uint(sz.x) && uint(t1_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, -1)).r * HOOKED_mul;
            s1_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s1_4) * texelFetch(W0, ivec2(9, 3), 0);
        ivec2 t2_0 = p + ivec2(-2, 0);
        float s2_0 = 0.0;
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 0)).r * HOOKED_mul;
            s2_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_0) * texelFetch(W0, ivec2(10, 3), 0);
        ivec2 t2_1 = p + ivec2(-1, 0);
        float s2_1 = 0.0;
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 0)).r * HOOKED_mul;
            s2_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_1) * texelFetch(W0, ivec2(11, 3), 0);
        ivec2 t2_2 = p + ivec2(0, 0);
        float s2_2 = 0.0;
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 0)).r * HOOKED_mul;
            s2_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_2) * texelFetch(W0, ivec2(12, 3), 0);
        ivec2 t2_3 = p + ivec2(1, 0);
        float s2_3 = 0.0;
        if (uint(t2_3.x) < uint(sz.x) && uint(t2_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 0)).r * HOOKED_mul;
            s2_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_3) * texelFetch(W0, ivec2(13, 3), 0);
        ivec2 t2_4 = p + ivec2(2, 0);
        float s2_4 = 0.0;
        if (uint(t2_4.x) < uint(sz.x) && uint(t2_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 0)).r * HOOKED_mul;
            s2_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s2_4) * texelFetch(W0, ivec2(14, 3), 0);
        ivec2 t3_0 = p + ivec2(-2, 1);
        float s3_0 = 0.0;
        if (uint(t3_0.x) < uint(sz.x) && uint(t3_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 1)).r * HOOKED_mul;
            s3_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_0) * texelFetch(W0, ivec2(15, 3), 0);
        ivec2 t3_1 = p + ivec2(-1, 1);
        float s3_1 = 0.0;
        if (uint(t3_1.x) < uint(sz.x) && uint(t3_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 1)).r * HOOKED_mul;
            s3_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_1) * texelFetch(W0, ivec2(16, 3), 0);
        ivec2 t3_2 = p + ivec2(0, 1);
        float s3_2 = 0.0;
        if (uint(t3_2.x) < uint(sz.x) && uint(t3_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 1)).r * HOOKED_mul;
            s3_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_2) * texelFetch(W0, ivec2(17, 3), 0);
        ivec2 t3_3 = p + ivec2(1, 1);
        float s3_3 = 0.0;
        if (uint(t3_3.x) < uint(sz.x) && uint(t3_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 1)).r * HOOKED_mul;
            s3_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_3) * texelFetch(W0, ivec2(18, 3), 0);
        ivec2 t3_4 = p + ivec2(2, 1);
        float s3_4 = 0.0;
        if (uint(t3_4.x) < uint(sz.x) && uint(t3_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 1)).r * HOOKED_mul;
            s3_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s3_4) * texelFetch(W0, ivec2(19, 3), 0);
        ivec2 t4_0 = p + ivec2(-2, 2);
        float s4_0 = 0.0;
        if (uint(t4_0.x) < uint(sz.x) && uint(t4_0.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-2, 2)).r * HOOKED_mul;
            s4_0 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_0) * texelFetch(W0, ivec2(20, 3), 0);
        ivec2 t4_1 = p + ivec2(-1, 2);
        float s4_1 = 0.0;
        if (uint(t4_1.x) < uint(sz.x) && uint(t4_1.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(-1, 2)).r * HOOKED_mul;
            s4_1 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_1) * texelFetch(W0, ivec2(21, 3), 0);
        ivec2 t4_2 = p + ivec2(0, 2);
        float s4_2 = 0.0;
        if (uint(t4_2.x) < uint(sz.x) && uint(t4_2.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(0, 2)).r * HOOKED_mul;
            s4_2 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_2) * texelFetch(W0, ivec2(22, 3), 0);
        ivec2 t4_3 = p + ivec2(1, 2);
        float s4_3 = 0.0;
        if (uint(t4_3.x) < uint(sz.x) && uint(t4_3.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(1, 2)).r * HOOKED_mul;
            s4_3 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_3) * texelFetch(W0, ivec2(23, 3), 0);
        ivec2 t4_4 = p + ivec2(2, 2);
        float s4_4 = 0.0;
        if (uint(t4_4.x) < uint(sz.x) && uint(t4_4.y) < uint(sz.y)) {
            float y = texelFetchOffset(HOOKED_raw, p, 0, ivec2(2, 2)).r * HOOKED_mul;
            s4_4 = quantize(y - 0.5, 0.003367935773, 2);
        }
        sum += vec4(s4_4) * texelFetch(W0, ivec2(24, 3), 0);
    }
    sum += vec4(-0.0002411060841,-0.0001391718106,0.0009922243225,-0.0006536519249);
    return vec4(quantize(sum.x, 0.002667733934, 1), quantize(sum.y, 0.002667733934, 1), quantize(sum.z, 0.002667733934, 1), quantize(sum.w, 0.002667733934, 1));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W1
//!BIND F0_0
//!BIND F0_1
//!BIND F0_2
//!BIND F0_3
//!SAVE F1_0
//!DESC [ARM_SESR_M5_QAT_int8] conv 1 output 0
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W1, ivec2(0, 0), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W1, ivec2(1, 0), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W1, ivec2(2, 0), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W1, ivec2(3, 0), 0);
        vec4 v0_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W1, ivec2(4, 0), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W1, ivec2(5, 0), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W1, ivec2(6, 0), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W1, ivec2(7, 0), 0);
        vec4 v0_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W1, ivec2(8, 0), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W1, ivec2(9, 0), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W1, ivec2(10, 0), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W1, ivec2(11, 0), 0);
        vec4 v0_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W1, ivec2(12, 0), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W1, ivec2(13, 0), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W1, ivec2(14, 0), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W1, ivec2(15, 0), 0);
        vec4 v0_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W1, ivec2(16, 0), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W1, ivec2(17, 0), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W1, ivec2(18, 0), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W1, ivec2(19, 0), 0);
        vec4 v0_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W1, ivec2(20, 0), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W1, ivec2(21, 0), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W1, ivec2(22, 0), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W1, ivec2(23, 0), 0);
        vec4 v0_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W1, ivec2(24, 0), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W1, ivec2(25, 0), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W1, ivec2(26, 0), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W1, ivec2(27, 0), 0);
        vec4 v0_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W1, ivec2(28, 0), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W1, ivec2(29, 0), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W1, ivec2(30, 0), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W1, ivec2(31, 0), 0);
        vec4 v0_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W1, ivec2(32, 0), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W1, ivec2(33, 0), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W1, ivec2(34, 0), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W1, ivec2(35, 0), 0);
        vec4 v0_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W1, ivec2(36, 0), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W1, ivec2(37, 0), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W1, ivec2(38, 0), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W1, ivec2(39, 0), 0);
        vec4 v0_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W1, ivec2(40, 0), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W1, ivec2(41, 0), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W1, ivec2(42, 0), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W1, ivec2(43, 0), 0);
        vec4 v0_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W1, ivec2(44, 0), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W1, ivec2(45, 0), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W1, ivec2(46, 0), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W1, ivec2(47, 0), 0);
        vec4 v1_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W1, ivec2(48, 0), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W1, ivec2(49, 0), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W1, ivec2(50, 0), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W1, ivec2(51, 0), 0);
        vec4 v1_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W1, ivec2(52, 0), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W1, ivec2(53, 0), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W1, ivec2(54, 0), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W1, ivec2(55, 0), 0);
        vec4 v1_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W1, ivec2(56, 0), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W1, ivec2(57, 0), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W1, ivec2(58, 0), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W1, ivec2(59, 0), 0);
        vec4 v1_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W1, ivec2(60, 0), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W1, ivec2(61, 0), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W1, ivec2(62, 0), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W1, ivec2(63, 0), 0);
        vec4 v1_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W1, ivec2(64, 0), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W1, ivec2(65, 0), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W1, ivec2(66, 0), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W1, ivec2(67, 0), 0);
        vec4 v1_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W1, ivec2(68, 0), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W1, ivec2(69, 0), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W1, ivec2(70, 0), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W1, ivec2(71, 0), 0);
        vec4 v1_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W1, ivec2(72, 0), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W1, ivec2(73, 0), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W1, ivec2(74, 0), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W1, ivec2(75, 0), 0);
        vec4 v1_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W1, ivec2(76, 0), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W1, ivec2(77, 0), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W1, ivec2(78, 0), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W1, ivec2(79, 0), 0);
        vec4 v1_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W1, ivec2(80, 0), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W1, ivec2(81, 0), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W1, ivec2(82, 0), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W1, ivec2(83, 0), 0);
        vec4 v1_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W1, ivec2(84, 0), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W1, ivec2(85, 0), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W1, ivec2(86, 0), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W1, ivec2(87, 0), 0);
        vec4 v1_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W1, ivec2(88, 0), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W1, ivec2(89, 0), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W1, ivec2(90, 0), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W1, ivec2(91, 0), 0);
        vec4 v1_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W1, ivec2(92, 0), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W1, ivec2(93, 0), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W1, ivec2(94, 0), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W1, ivec2(95, 0), 0);
        vec4 v2_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W1, ivec2(96, 0), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W1, ivec2(97, 0), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W1, ivec2(98, 0), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W1, ivec2(99, 0), 0);
        vec4 v2_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W1, ivec2(100, 0), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W1, ivec2(101, 0), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W1, ivec2(102, 0), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W1, ivec2(103, 0), 0);
        vec4 v2_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W1, ivec2(104, 0), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W1, ivec2(105, 0), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W1, ivec2(106, 0), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W1, ivec2(107, 0), 0);
        vec4 v2_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W1, ivec2(108, 0), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W1, ivec2(109, 0), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W1, ivec2(110, 0), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W1, ivec2(111, 0), 0);
        vec4 v2_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W1, ivec2(112, 0), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W1, ivec2(113, 0), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W1, ivec2(114, 0), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W1, ivec2(115, 0), 0);
        vec4 v2_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W1, ivec2(116, 0), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W1, ivec2(117, 0), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W1, ivec2(118, 0), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W1, ivec2(119, 0), 0);
        vec4 v2_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W1, ivec2(120, 0), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W1, ivec2(121, 0), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W1, ivec2(122, 0), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W1, ivec2(123, 0), 0);
        vec4 v2_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W1, ivec2(124, 0), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W1, ivec2(125, 0), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W1, ivec2(126, 0), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W1, ivec2(127, 0), 0);
        vec4 v2_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W1, ivec2(128, 0), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W1, ivec2(129, 0), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W1, ivec2(130, 0), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W1, ivec2(131, 0), 0);
        vec4 v2_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W1, ivec2(132, 0), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W1, ivec2(133, 0), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W1, ivec2(134, 0), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W1, ivec2(135, 0), 0);
        vec4 v2_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W1, ivec2(136, 0), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W1, ivec2(137, 0), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W1, ivec2(138, 0), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W1, ivec2(139, 0), 0);
        vec4 v2_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W1, ivec2(140, 0), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W1, ivec2(141, 0), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W1, ivec2(142, 0), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W1, ivec2(143, 0), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W1, ivec2(0, 0), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W1, ivec2(1, 0), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W1, ivec2(2, 0), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W1, ivec2(3, 0), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W1, ivec2(4, 0), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W1, ivec2(5, 0), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W1, ivec2(6, 0), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W1, ivec2(7, 0), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W1, ivec2(8, 0), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W1, ivec2(9, 0), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W1, ivec2(10, 0), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W1, ivec2(11, 0), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W1, ivec2(12, 0), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W1, ivec2(13, 0), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W1, ivec2(14, 0), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W1, ivec2(15, 0), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W1, ivec2(16, 0), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W1, ivec2(17, 0), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W1, ivec2(18, 0), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W1, ivec2(19, 0), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W1, ivec2(20, 0), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W1, ivec2(21, 0), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W1, ivec2(22, 0), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W1, ivec2(23, 0), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W1, ivec2(24, 0), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W1, ivec2(25, 0), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W1, ivec2(26, 0), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W1, ivec2(27, 0), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W1, ivec2(28, 0), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W1, ivec2(29, 0), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W1, ivec2(30, 0), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W1, ivec2(31, 0), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W1, ivec2(32, 0), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W1, ivec2(33, 0), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W1, ivec2(34, 0), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W1, ivec2(35, 0), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W1, ivec2(36, 0), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W1, ivec2(37, 0), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W1, ivec2(38, 0), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W1, ivec2(39, 0), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W1, ivec2(40, 0), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W1, ivec2(41, 0), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W1, ivec2(42, 0), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W1, ivec2(43, 0), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W1, ivec2(44, 0), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W1, ivec2(45, 0), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W1, ivec2(46, 0), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W1, ivec2(47, 0), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W1, ivec2(48, 0), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W1, ivec2(49, 0), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W1, ivec2(50, 0), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W1, ivec2(51, 0), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W1, ivec2(52, 0), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W1, ivec2(53, 0), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W1, ivec2(54, 0), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W1, ivec2(55, 0), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W1, ivec2(56, 0), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W1, ivec2(57, 0), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W1, ivec2(58, 0), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W1, ivec2(59, 0), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W1, ivec2(60, 0), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W1, ivec2(61, 0), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W1, ivec2(62, 0), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W1, ivec2(63, 0), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W1, ivec2(64, 0), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W1, ivec2(65, 0), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W1, ivec2(66, 0), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W1, ivec2(67, 0), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W1, ivec2(68, 0), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W1, ivec2(69, 0), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W1, ivec2(70, 0), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W1, ivec2(71, 0), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W1, ivec2(72, 0), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W1, ivec2(73, 0), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W1, ivec2(74, 0), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W1, ivec2(75, 0), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W1, ivec2(76, 0), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W1, ivec2(77, 0), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W1, ivec2(78, 0), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W1, ivec2(79, 0), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W1, ivec2(80, 0), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W1, ivec2(81, 0), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W1, ivec2(82, 0), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W1, ivec2(83, 0), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W1, ivec2(84, 0), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W1, ivec2(85, 0), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W1, ivec2(86, 0), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W1, ivec2(87, 0), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W1, ivec2(88, 0), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W1, ivec2(89, 0), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W1, ivec2(90, 0), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W1, ivec2(91, 0), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W1, ivec2(92, 0), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W1, ivec2(93, 0), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W1, ivec2(94, 0), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W1, ivec2(95, 0), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W1, ivec2(96, 0), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W1, ivec2(97, 0), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W1, ivec2(98, 0), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W1, ivec2(99, 0), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W1, ivec2(100, 0), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W1, ivec2(101, 0), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W1, ivec2(102, 0), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W1, ivec2(103, 0), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W1, ivec2(104, 0), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W1, ivec2(105, 0), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W1, ivec2(106, 0), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W1, ivec2(107, 0), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W1, ivec2(108, 0), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W1, ivec2(109, 0), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W1, ivec2(110, 0), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W1, ivec2(111, 0), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W1, ivec2(112, 0), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W1, ivec2(113, 0), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W1, ivec2(114, 0), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W1, ivec2(115, 0), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W1, ivec2(116, 0), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W1, ivec2(117, 0), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W1, ivec2(118, 0), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W1, ivec2(119, 0), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W1, ivec2(120, 0), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W1, ivec2(121, 0), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W1, ivec2(122, 0), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W1, ivec2(123, 0), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W1, ivec2(124, 0), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W1, ivec2(125, 0), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W1, ivec2(126, 0), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W1, ivec2(127, 0), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W1, ivec2(128, 0), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W1, ivec2(129, 0), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W1, ivec2(130, 0), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W1, ivec2(131, 0), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W1, ivec2(132, 0), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W1, ivec2(133, 0), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W1, ivec2(134, 0), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W1, ivec2(135, 0), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W1, ivec2(136, 0), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W1, ivec2(137, 0), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W1, ivec2(138, 0), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W1, ivec2(139, 0), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W1, ivec2(140, 0), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W1, ivec2(141, 0), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W1, ivec2(142, 0), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W1, ivec2(143, 0), 0);
    }
    sum += vec4(0.01070831612,0.08401953877,-0.03646554841,-0.2679521697);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.004164916929, -128), quantize(sum.y, 0.004164916929, -128), quantize(sum.z, 0.004164916929, -128), quantize(sum.w, 0.004164916929, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W1
//!BIND F0_0
//!BIND F0_1
//!BIND F0_2
//!BIND F0_3
//!SAVE F1_1
//!DESC [ARM_SESR_M5_QAT_int8] conv 1 output 1
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W1, ivec2(0, 1), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W1, ivec2(1, 1), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W1, ivec2(2, 1), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W1, ivec2(3, 1), 0);
        vec4 v0_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W1, ivec2(4, 1), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W1, ivec2(5, 1), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W1, ivec2(6, 1), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W1, ivec2(7, 1), 0);
        vec4 v0_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W1, ivec2(8, 1), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W1, ivec2(9, 1), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W1, ivec2(10, 1), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W1, ivec2(11, 1), 0);
        vec4 v0_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W1, ivec2(12, 1), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W1, ivec2(13, 1), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W1, ivec2(14, 1), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W1, ivec2(15, 1), 0);
        vec4 v0_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W1, ivec2(16, 1), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W1, ivec2(17, 1), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W1, ivec2(18, 1), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W1, ivec2(19, 1), 0);
        vec4 v0_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W1, ivec2(20, 1), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W1, ivec2(21, 1), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W1, ivec2(22, 1), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W1, ivec2(23, 1), 0);
        vec4 v0_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W1, ivec2(24, 1), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W1, ivec2(25, 1), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W1, ivec2(26, 1), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W1, ivec2(27, 1), 0);
        vec4 v0_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W1, ivec2(28, 1), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W1, ivec2(29, 1), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W1, ivec2(30, 1), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W1, ivec2(31, 1), 0);
        vec4 v0_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W1, ivec2(32, 1), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W1, ivec2(33, 1), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W1, ivec2(34, 1), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W1, ivec2(35, 1), 0);
        vec4 v0_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W1, ivec2(36, 1), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W1, ivec2(37, 1), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W1, ivec2(38, 1), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W1, ivec2(39, 1), 0);
        vec4 v0_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W1, ivec2(40, 1), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W1, ivec2(41, 1), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W1, ivec2(42, 1), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W1, ivec2(43, 1), 0);
        vec4 v0_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W1, ivec2(44, 1), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W1, ivec2(45, 1), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W1, ivec2(46, 1), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W1, ivec2(47, 1), 0);
        vec4 v1_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W1, ivec2(48, 1), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W1, ivec2(49, 1), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W1, ivec2(50, 1), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W1, ivec2(51, 1), 0);
        vec4 v1_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W1, ivec2(52, 1), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W1, ivec2(53, 1), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W1, ivec2(54, 1), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W1, ivec2(55, 1), 0);
        vec4 v1_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W1, ivec2(56, 1), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W1, ivec2(57, 1), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W1, ivec2(58, 1), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W1, ivec2(59, 1), 0);
        vec4 v1_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W1, ivec2(60, 1), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W1, ivec2(61, 1), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W1, ivec2(62, 1), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W1, ivec2(63, 1), 0);
        vec4 v1_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W1, ivec2(64, 1), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W1, ivec2(65, 1), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W1, ivec2(66, 1), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W1, ivec2(67, 1), 0);
        vec4 v1_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W1, ivec2(68, 1), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W1, ivec2(69, 1), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W1, ivec2(70, 1), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W1, ivec2(71, 1), 0);
        vec4 v1_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W1, ivec2(72, 1), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W1, ivec2(73, 1), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W1, ivec2(74, 1), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W1, ivec2(75, 1), 0);
        vec4 v1_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W1, ivec2(76, 1), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W1, ivec2(77, 1), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W1, ivec2(78, 1), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W1, ivec2(79, 1), 0);
        vec4 v1_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W1, ivec2(80, 1), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W1, ivec2(81, 1), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W1, ivec2(82, 1), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W1, ivec2(83, 1), 0);
        vec4 v1_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W1, ivec2(84, 1), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W1, ivec2(85, 1), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W1, ivec2(86, 1), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W1, ivec2(87, 1), 0);
        vec4 v1_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W1, ivec2(88, 1), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W1, ivec2(89, 1), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W1, ivec2(90, 1), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W1, ivec2(91, 1), 0);
        vec4 v1_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W1, ivec2(92, 1), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W1, ivec2(93, 1), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W1, ivec2(94, 1), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W1, ivec2(95, 1), 0);
        vec4 v2_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W1, ivec2(96, 1), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W1, ivec2(97, 1), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W1, ivec2(98, 1), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W1, ivec2(99, 1), 0);
        vec4 v2_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W1, ivec2(100, 1), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W1, ivec2(101, 1), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W1, ivec2(102, 1), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W1, ivec2(103, 1), 0);
        vec4 v2_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W1, ivec2(104, 1), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W1, ivec2(105, 1), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W1, ivec2(106, 1), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W1, ivec2(107, 1), 0);
        vec4 v2_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W1, ivec2(108, 1), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W1, ivec2(109, 1), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W1, ivec2(110, 1), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W1, ivec2(111, 1), 0);
        vec4 v2_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W1, ivec2(112, 1), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W1, ivec2(113, 1), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W1, ivec2(114, 1), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W1, ivec2(115, 1), 0);
        vec4 v2_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W1, ivec2(116, 1), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W1, ivec2(117, 1), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W1, ivec2(118, 1), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W1, ivec2(119, 1), 0);
        vec4 v2_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W1, ivec2(120, 1), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W1, ivec2(121, 1), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W1, ivec2(122, 1), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W1, ivec2(123, 1), 0);
        vec4 v2_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W1, ivec2(124, 1), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W1, ivec2(125, 1), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W1, ivec2(126, 1), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W1, ivec2(127, 1), 0);
        vec4 v2_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W1, ivec2(128, 1), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W1, ivec2(129, 1), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W1, ivec2(130, 1), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W1, ivec2(131, 1), 0);
        vec4 v2_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W1, ivec2(132, 1), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W1, ivec2(133, 1), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W1, ivec2(134, 1), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W1, ivec2(135, 1), 0);
        vec4 v2_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W1, ivec2(136, 1), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W1, ivec2(137, 1), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W1, ivec2(138, 1), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W1, ivec2(139, 1), 0);
        vec4 v2_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W1, ivec2(140, 1), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W1, ivec2(141, 1), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W1, ivec2(142, 1), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W1, ivec2(143, 1), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W1, ivec2(0, 1), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W1, ivec2(1, 1), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W1, ivec2(2, 1), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W1, ivec2(3, 1), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W1, ivec2(4, 1), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W1, ivec2(5, 1), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W1, ivec2(6, 1), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W1, ivec2(7, 1), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W1, ivec2(8, 1), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W1, ivec2(9, 1), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W1, ivec2(10, 1), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W1, ivec2(11, 1), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W1, ivec2(12, 1), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W1, ivec2(13, 1), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W1, ivec2(14, 1), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W1, ivec2(15, 1), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W1, ivec2(16, 1), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W1, ivec2(17, 1), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W1, ivec2(18, 1), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W1, ivec2(19, 1), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W1, ivec2(20, 1), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W1, ivec2(21, 1), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W1, ivec2(22, 1), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W1, ivec2(23, 1), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W1, ivec2(24, 1), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W1, ivec2(25, 1), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W1, ivec2(26, 1), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W1, ivec2(27, 1), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W1, ivec2(28, 1), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W1, ivec2(29, 1), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W1, ivec2(30, 1), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W1, ivec2(31, 1), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W1, ivec2(32, 1), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W1, ivec2(33, 1), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W1, ivec2(34, 1), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W1, ivec2(35, 1), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W1, ivec2(36, 1), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W1, ivec2(37, 1), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W1, ivec2(38, 1), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W1, ivec2(39, 1), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W1, ivec2(40, 1), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W1, ivec2(41, 1), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W1, ivec2(42, 1), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W1, ivec2(43, 1), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W1, ivec2(44, 1), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W1, ivec2(45, 1), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W1, ivec2(46, 1), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W1, ivec2(47, 1), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W1, ivec2(48, 1), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W1, ivec2(49, 1), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W1, ivec2(50, 1), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W1, ivec2(51, 1), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W1, ivec2(52, 1), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W1, ivec2(53, 1), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W1, ivec2(54, 1), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W1, ivec2(55, 1), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W1, ivec2(56, 1), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W1, ivec2(57, 1), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W1, ivec2(58, 1), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W1, ivec2(59, 1), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W1, ivec2(60, 1), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W1, ivec2(61, 1), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W1, ivec2(62, 1), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W1, ivec2(63, 1), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W1, ivec2(64, 1), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W1, ivec2(65, 1), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W1, ivec2(66, 1), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W1, ivec2(67, 1), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W1, ivec2(68, 1), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W1, ivec2(69, 1), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W1, ivec2(70, 1), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W1, ivec2(71, 1), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W1, ivec2(72, 1), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W1, ivec2(73, 1), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W1, ivec2(74, 1), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W1, ivec2(75, 1), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W1, ivec2(76, 1), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W1, ivec2(77, 1), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W1, ivec2(78, 1), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W1, ivec2(79, 1), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W1, ivec2(80, 1), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W1, ivec2(81, 1), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W1, ivec2(82, 1), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W1, ivec2(83, 1), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W1, ivec2(84, 1), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W1, ivec2(85, 1), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W1, ivec2(86, 1), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W1, ivec2(87, 1), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W1, ivec2(88, 1), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W1, ivec2(89, 1), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W1, ivec2(90, 1), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W1, ivec2(91, 1), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W1, ivec2(92, 1), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W1, ivec2(93, 1), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W1, ivec2(94, 1), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W1, ivec2(95, 1), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W1, ivec2(96, 1), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W1, ivec2(97, 1), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W1, ivec2(98, 1), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W1, ivec2(99, 1), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W1, ivec2(100, 1), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W1, ivec2(101, 1), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W1, ivec2(102, 1), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W1, ivec2(103, 1), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W1, ivec2(104, 1), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W1, ivec2(105, 1), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W1, ivec2(106, 1), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W1, ivec2(107, 1), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W1, ivec2(108, 1), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W1, ivec2(109, 1), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W1, ivec2(110, 1), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W1, ivec2(111, 1), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W1, ivec2(112, 1), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W1, ivec2(113, 1), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W1, ivec2(114, 1), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W1, ivec2(115, 1), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W1, ivec2(116, 1), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W1, ivec2(117, 1), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W1, ivec2(118, 1), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W1, ivec2(119, 1), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W1, ivec2(120, 1), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W1, ivec2(121, 1), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W1, ivec2(122, 1), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W1, ivec2(123, 1), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W1, ivec2(124, 1), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W1, ivec2(125, 1), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W1, ivec2(126, 1), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W1, ivec2(127, 1), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W1, ivec2(128, 1), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W1, ivec2(129, 1), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W1, ivec2(130, 1), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W1, ivec2(131, 1), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W1, ivec2(132, 1), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W1, ivec2(133, 1), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W1, ivec2(134, 1), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W1, ivec2(135, 1), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W1, ivec2(136, 1), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W1, ivec2(137, 1), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W1, ivec2(138, 1), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W1, ivec2(139, 1), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W1, ivec2(140, 1), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W1, ivec2(141, 1), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W1, ivec2(142, 1), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W1, ivec2(143, 1), 0);
    }
    sum += vec4(0.003160530876,-0.322652151,0.01074266419,0.03948301513);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.004164916929, -128), quantize(sum.y, 0.004164916929, -128), quantize(sum.z, 0.004164916929, -128), quantize(sum.w, 0.004164916929, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W1
//!BIND F0_0
//!BIND F0_1
//!BIND F0_2
//!BIND F0_3
//!SAVE F1_2
//!DESC [ARM_SESR_M5_QAT_int8] conv 1 output 2
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W1, ivec2(0, 2), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W1, ivec2(1, 2), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W1, ivec2(2, 2), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W1, ivec2(3, 2), 0);
        vec4 v0_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W1, ivec2(4, 2), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W1, ivec2(5, 2), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W1, ivec2(6, 2), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W1, ivec2(7, 2), 0);
        vec4 v0_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W1, ivec2(8, 2), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W1, ivec2(9, 2), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W1, ivec2(10, 2), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W1, ivec2(11, 2), 0);
        vec4 v0_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W1, ivec2(12, 2), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W1, ivec2(13, 2), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W1, ivec2(14, 2), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W1, ivec2(15, 2), 0);
        vec4 v0_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W1, ivec2(16, 2), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W1, ivec2(17, 2), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W1, ivec2(18, 2), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W1, ivec2(19, 2), 0);
        vec4 v0_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W1, ivec2(20, 2), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W1, ivec2(21, 2), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W1, ivec2(22, 2), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W1, ivec2(23, 2), 0);
        vec4 v0_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W1, ivec2(24, 2), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W1, ivec2(25, 2), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W1, ivec2(26, 2), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W1, ivec2(27, 2), 0);
        vec4 v0_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W1, ivec2(28, 2), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W1, ivec2(29, 2), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W1, ivec2(30, 2), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W1, ivec2(31, 2), 0);
        vec4 v0_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W1, ivec2(32, 2), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W1, ivec2(33, 2), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W1, ivec2(34, 2), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W1, ivec2(35, 2), 0);
        vec4 v0_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W1, ivec2(36, 2), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W1, ivec2(37, 2), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W1, ivec2(38, 2), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W1, ivec2(39, 2), 0);
        vec4 v0_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W1, ivec2(40, 2), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W1, ivec2(41, 2), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W1, ivec2(42, 2), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W1, ivec2(43, 2), 0);
        vec4 v0_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W1, ivec2(44, 2), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W1, ivec2(45, 2), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W1, ivec2(46, 2), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W1, ivec2(47, 2), 0);
        vec4 v1_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W1, ivec2(48, 2), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W1, ivec2(49, 2), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W1, ivec2(50, 2), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W1, ivec2(51, 2), 0);
        vec4 v1_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W1, ivec2(52, 2), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W1, ivec2(53, 2), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W1, ivec2(54, 2), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W1, ivec2(55, 2), 0);
        vec4 v1_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W1, ivec2(56, 2), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W1, ivec2(57, 2), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W1, ivec2(58, 2), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W1, ivec2(59, 2), 0);
        vec4 v1_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W1, ivec2(60, 2), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W1, ivec2(61, 2), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W1, ivec2(62, 2), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W1, ivec2(63, 2), 0);
        vec4 v1_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W1, ivec2(64, 2), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W1, ivec2(65, 2), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W1, ivec2(66, 2), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W1, ivec2(67, 2), 0);
        vec4 v1_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W1, ivec2(68, 2), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W1, ivec2(69, 2), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W1, ivec2(70, 2), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W1, ivec2(71, 2), 0);
        vec4 v1_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W1, ivec2(72, 2), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W1, ivec2(73, 2), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W1, ivec2(74, 2), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W1, ivec2(75, 2), 0);
        vec4 v1_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W1, ivec2(76, 2), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W1, ivec2(77, 2), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W1, ivec2(78, 2), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W1, ivec2(79, 2), 0);
        vec4 v1_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W1, ivec2(80, 2), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W1, ivec2(81, 2), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W1, ivec2(82, 2), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W1, ivec2(83, 2), 0);
        vec4 v1_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W1, ivec2(84, 2), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W1, ivec2(85, 2), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W1, ivec2(86, 2), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W1, ivec2(87, 2), 0);
        vec4 v1_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W1, ivec2(88, 2), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W1, ivec2(89, 2), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W1, ivec2(90, 2), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W1, ivec2(91, 2), 0);
        vec4 v1_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W1, ivec2(92, 2), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W1, ivec2(93, 2), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W1, ivec2(94, 2), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W1, ivec2(95, 2), 0);
        vec4 v2_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W1, ivec2(96, 2), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W1, ivec2(97, 2), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W1, ivec2(98, 2), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W1, ivec2(99, 2), 0);
        vec4 v2_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W1, ivec2(100, 2), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W1, ivec2(101, 2), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W1, ivec2(102, 2), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W1, ivec2(103, 2), 0);
        vec4 v2_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W1, ivec2(104, 2), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W1, ivec2(105, 2), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W1, ivec2(106, 2), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W1, ivec2(107, 2), 0);
        vec4 v2_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W1, ivec2(108, 2), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W1, ivec2(109, 2), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W1, ivec2(110, 2), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W1, ivec2(111, 2), 0);
        vec4 v2_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W1, ivec2(112, 2), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W1, ivec2(113, 2), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W1, ivec2(114, 2), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W1, ivec2(115, 2), 0);
        vec4 v2_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W1, ivec2(116, 2), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W1, ivec2(117, 2), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W1, ivec2(118, 2), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W1, ivec2(119, 2), 0);
        vec4 v2_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W1, ivec2(120, 2), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W1, ivec2(121, 2), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W1, ivec2(122, 2), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W1, ivec2(123, 2), 0);
        vec4 v2_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W1, ivec2(124, 2), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W1, ivec2(125, 2), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W1, ivec2(126, 2), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W1, ivec2(127, 2), 0);
        vec4 v2_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W1, ivec2(128, 2), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W1, ivec2(129, 2), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W1, ivec2(130, 2), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W1, ivec2(131, 2), 0);
        vec4 v2_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W1, ivec2(132, 2), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W1, ivec2(133, 2), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W1, ivec2(134, 2), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W1, ivec2(135, 2), 0);
        vec4 v2_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W1, ivec2(136, 2), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W1, ivec2(137, 2), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W1, ivec2(138, 2), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W1, ivec2(139, 2), 0);
        vec4 v2_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W1, ivec2(140, 2), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W1, ivec2(141, 2), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W1, ivec2(142, 2), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W1, ivec2(143, 2), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W1, ivec2(0, 2), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W1, ivec2(1, 2), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W1, ivec2(2, 2), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W1, ivec2(3, 2), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W1, ivec2(4, 2), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W1, ivec2(5, 2), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W1, ivec2(6, 2), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W1, ivec2(7, 2), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W1, ivec2(8, 2), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W1, ivec2(9, 2), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W1, ivec2(10, 2), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W1, ivec2(11, 2), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W1, ivec2(12, 2), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W1, ivec2(13, 2), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W1, ivec2(14, 2), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W1, ivec2(15, 2), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W1, ivec2(16, 2), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W1, ivec2(17, 2), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W1, ivec2(18, 2), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W1, ivec2(19, 2), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W1, ivec2(20, 2), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W1, ivec2(21, 2), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W1, ivec2(22, 2), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W1, ivec2(23, 2), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W1, ivec2(24, 2), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W1, ivec2(25, 2), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W1, ivec2(26, 2), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W1, ivec2(27, 2), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W1, ivec2(28, 2), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W1, ivec2(29, 2), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W1, ivec2(30, 2), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W1, ivec2(31, 2), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W1, ivec2(32, 2), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W1, ivec2(33, 2), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W1, ivec2(34, 2), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W1, ivec2(35, 2), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W1, ivec2(36, 2), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W1, ivec2(37, 2), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W1, ivec2(38, 2), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W1, ivec2(39, 2), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W1, ivec2(40, 2), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W1, ivec2(41, 2), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W1, ivec2(42, 2), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W1, ivec2(43, 2), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W1, ivec2(44, 2), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W1, ivec2(45, 2), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W1, ivec2(46, 2), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W1, ivec2(47, 2), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W1, ivec2(48, 2), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W1, ivec2(49, 2), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W1, ivec2(50, 2), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W1, ivec2(51, 2), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W1, ivec2(52, 2), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W1, ivec2(53, 2), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W1, ivec2(54, 2), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W1, ivec2(55, 2), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W1, ivec2(56, 2), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W1, ivec2(57, 2), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W1, ivec2(58, 2), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W1, ivec2(59, 2), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W1, ivec2(60, 2), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W1, ivec2(61, 2), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W1, ivec2(62, 2), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W1, ivec2(63, 2), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W1, ivec2(64, 2), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W1, ivec2(65, 2), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W1, ivec2(66, 2), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W1, ivec2(67, 2), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W1, ivec2(68, 2), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W1, ivec2(69, 2), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W1, ivec2(70, 2), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W1, ivec2(71, 2), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W1, ivec2(72, 2), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W1, ivec2(73, 2), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W1, ivec2(74, 2), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W1, ivec2(75, 2), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W1, ivec2(76, 2), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W1, ivec2(77, 2), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W1, ivec2(78, 2), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W1, ivec2(79, 2), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W1, ivec2(80, 2), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W1, ivec2(81, 2), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W1, ivec2(82, 2), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W1, ivec2(83, 2), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W1, ivec2(84, 2), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W1, ivec2(85, 2), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W1, ivec2(86, 2), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W1, ivec2(87, 2), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W1, ivec2(88, 2), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W1, ivec2(89, 2), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W1, ivec2(90, 2), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W1, ivec2(91, 2), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W1, ivec2(92, 2), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W1, ivec2(93, 2), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W1, ivec2(94, 2), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W1, ivec2(95, 2), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W1, ivec2(96, 2), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W1, ivec2(97, 2), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W1, ivec2(98, 2), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W1, ivec2(99, 2), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W1, ivec2(100, 2), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W1, ivec2(101, 2), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W1, ivec2(102, 2), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W1, ivec2(103, 2), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W1, ivec2(104, 2), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W1, ivec2(105, 2), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W1, ivec2(106, 2), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W1, ivec2(107, 2), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W1, ivec2(108, 2), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W1, ivec2(109, 2), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W1, ivec2(110, 2), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W1, ivec2(111, 2), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W1, ivec2(112, 2), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W1, ivec2(113, 2), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W1, ivec2(114, 2), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W1, ivec2(115, 2), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W1, ivec2(116, 2), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W1, ivec2(117, 2), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W1, ivec2(118, 2), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W1, ivec2(119, 2), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W1, ivec2(120, 2), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W1, ivec2(121, 2), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W1, ivec2(122, 2), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W1, ivec2(123, 2), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W1, ivec2(124, 2), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W1, ivec2(125, 2), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W1, ivec2(126, 2), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W1, ivec2(127, 2), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W1, ivec2(128, 2), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W1, ivec2(129, 2), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W1, ivec2(130, 2), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W1, ivec2(131, 2), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W1, ivec2(132, 2), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W1, ivec2(133, 2), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W1, ivec2(134, 2), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W1, ivec2(135, 2), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W1, ivec2(136, 2), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W1, ivec2(137, 2), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W1, ivec2(138, 2), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W1, ivec2(139, 2), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W1, ivec2(140, 2), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W1, ivec2(141, 2), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W1, ivec2(142, 2), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W1, ivec2(143, 2), 0);
    }
    sum += vec4(0.00813005624,-0.001883751997,6.185160782e-05,0.0008302225979);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.004164916929, -128), quantize(sum.y, 0.004164916929, -128), quantize(sum.z, 0.004164916929, -128), quantize(sum.w, 0.004164916929, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W1
//!BIND F0_0
//!BIND F0_1
//!BIND F0_2
//!BIND F0_3
//!SAVE F1_3
//!DESC [ARM_SESR_M5_QAT_int8] conv 1 output 3
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W1, ivec2(0, 3), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W1, ivec2(1, 3), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W1, ivec2(2, 3), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W1, ivec2(3, 3), 0);
        vec4 v0_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W1, ivec2(4, 3), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W1, ivec2(5, 3), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W1, ivec2(6, 3), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W1, ivec2(7, 3), 0);
        vec4 v0_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W1, ivec2(8, 3), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W1, ivec2(9, 3), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W1, ivec2(10, 3), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W1, ivec2(11, 3), 0);
        vec4 v0_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W1, ivec2(12, 3), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W1, ivec2(13, 3), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W1, ivec2(14, 3), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W1, ivec2(15, 3), 0);
        vec4 v0_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W1, ivec2(16, 3), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W1, ivec2(17, 3), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W1, ivec2(18, 3), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W1, ivec2(19, 3), 0);
        vec4 v0_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W1, ivec2(20, 3), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W1, ivec2(21, 3), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W1, ivec2(22, 3), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W1, ivec2(23, 3), 0);
        vec4 v0_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W1, ivec2(24, 3), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W1, ivec2(25, 3), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W1, ivec2(26, 3), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W1, ivec2(27, 3), 0);
        vec4 v0_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W1, ivec2(28, 3), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W1, ivec2(29, 3), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W1, ivec2(30, 3), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W1, ivec2(31, 3), 0);
        vec4 v0_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W1, ivec2(32, 3), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W1, ivec2(33, 3), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W1, ivec2(34, 3), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W1, ivec2(35, 3), 0);
        vec4 v0_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W1, ivec2(36, 3), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W1, ivec2(37, 3), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W1, ivec2(38, 3), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W1, ivec2(39, 3), 0);
        vec4 v0_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W1, ivec2(40, 3), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W1, ivec2(41, 3), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W1, ivec2(42, 3), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W1, ivec2(43, 3), 0);
        vec4 v0_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W1, ivec2(44, 3), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W1, ivec2(45, 3), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W1, ivec2(46, 3), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W1, ivec2(47, 3), 0);
        vec4 v1_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W1, ivec2(48, 3), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W1, ivec2(49, 3), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W1, ivec2(50, 3), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W1, ivec2(51, 3), 0);
        vec4 v1_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W1, ivec2(52, 3), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W1, ivec2(53, 3), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W1, ivec2(54, 3), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W1, ivec2(55, 3), 0);
        vec4 v1_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W1, ivec2(56, 3), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W1, ivec2(57, 3), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W1, ivec2(58, 3), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W1, ivec2(59, 3), 0);
        vec4 v1_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W1, ivec2(60, 3), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W1, ivec2(61, 3), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W1, ivec2(62, 3), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W1, ivec2(63, 3), 0);
        vec4 v1_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W1, ivec2(64, 3), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W1, ivec2(65, 3), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W1, ivec2(66, 3), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W1, ivec2(67, 3), 0);
        vec4 v1_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W1, ivec2(68, 3), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W1, ivec2(69, 3), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W1, ivec2(70, 3), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W1, ivec2(71, 3), 0);
        vec4 v1_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W1, ivec2(72, 3), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W1, ivec2(73, 3), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W1, ivec2(74, 3), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W1, ivec2(75, 3), 0);
        vec4 v1_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W1, ivec2(76, 3), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W1, ivec2(77, 3), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W1, ivec2(78, 3), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W1, ivec2(79, 3), 0);
        vec4 v1_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W1, ivec2(80, 3), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W1, ivec2(81, 3), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W1, ivec2(82, 3), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W1, ivec2(83, 3), 0);
        vec4 v1_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W1, ivec2(84, 3), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W1, ivec2(85, 3), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W1, ivec2(86, 3), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W1, ivec2(87, 3), 0);
        vec4 v1_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W1, ivec2(88, 3), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W1, ivec2(89, 3), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W1, ivec2(90, 3), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W1, ivec2(91, 3), 0);
        vec4 v1_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W1, ivec2(92, 3), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W1, ivec2(93, 3), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W1, ivec2(94, 3), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W1, ivec2(95, 3), 0);
        vec4 v2_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W1, ivec2(96, 3), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W1, ivec2(97, 3), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W1, ivec2(98, 3), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W1, ivec2(99, 3), 0);
        vec4 v2_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W1, ivec2(100, 3), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W1, ivec2(101, 3), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W1, ivec2(102, 3), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W1, ivec2(103, 3), 0);
        vec4 v2_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W1, ivec2(104, 3), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W1, ivec2(105, 3), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W1, ivec2(106, 3), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W1, ivec2(107, 3), 0);
        vec4 v2_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W1, ivec2(108, 3), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W1, ivec2(109, 3), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W1, ivec2(110, 3), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W1, ivec2(111, 3), 0);
        vec4 v2_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W1, ivec2(112, 3), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W1, ivec2(113, 3), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W1, ivec2(114, 3), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W1, ivec2(115, 3), 0);
        vec4 v2_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W1, ivec2(116, 3), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W1, ivec2(117, 3), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W1, ivec2(118, 3), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W1, ivec2(119, 3), 0);
        vec4 v2_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W1, ivec2(120, 3), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W1, ivec2(121, 3), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W1, ivec2(122, 3), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W1, ivec2(123, 3), 0);
        vec4 v2_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W1, ivec2(124, 3), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W1, ivec2(125, 3), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W1, ivec2(126, 3), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W1, ivec2(127, 3), 0);
        vec4 v2_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W1, ivec2(128, 3), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W1, ivec2(129, 3), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W1, ivec2(130, 3), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W1, ivec2(131, 3), 0);
        vec4 v2_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W1, ivec2(132, 3), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W1, ivec2(133, 3), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W1, ivec2(134, 3), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W1, ivec2(135, 3), 0);
        vec4 v2_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W1, ivec2(136, 3), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W1, ivec2(137, 3), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W1, ivec2(138, 3), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W1, ivec2(139, 3), 0);
        vec4 v2_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W1, ivec2(140, 3), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W1, ivec2(141, 3), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W1, ivec2(142, 3), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W1, ivec2(143, 3), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W1, ivec2(0, 3), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W1, ivec2(1, 3), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W1, ivec2(2, 3), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W1, ivec2(3, 3), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W1, ivec2(4, 3), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W1, ivec2(5, 3), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W1, ivec2(6, 3), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W1, ivec2(7, 3), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W1, ivec2(8, 3), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W1, ivec2(9, 3), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W1, ivec2(10, 3), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W1, ivec2(11, 3), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W1, ivec2(12, 3), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W1, ivec2(13, 3), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W1, ivec2(14, 3), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W1, ivec2(15, 3), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W1, ivec2(16, 3), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W1, ivec2(17, 3), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W1, ivec2(18, 3), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W1, ivec2(19, 3), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W1, ivec2(20, 3), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W1, ivec2(21, 3), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W1, ivec2(22, 3), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W1, ivec2(23, 3), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W1, ivec2(24, 3), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W1, ivec2(25, 3), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W1, ivec2(26, 3), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W1, ivec2(27, 3), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W1, ivec2(28, 3), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W1, ivec2(29, 3), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W1, ivec2(30, 3), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W1, ivec2(31, 3), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W1, ivec2(32, 3), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W1, ivec2(33, 3), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W1, ivec2(34, 3), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W1, ivec2(35, 3), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W1, ivec2(36, 3), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W1, ivec2(37, 3), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W1, ivec2(38, 3), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W1, ivec2(39, 3), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W1, ivec2(40, 3), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W1, ivec2(41, 3), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W1, ivec2(42, 3), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W1, ivec2(43, 3), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W1, ivec2(44, 3), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W1, ivec2(45, 3), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W1, ivec2(46, 3), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W1, ivec2(47, 3), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W1, ivec2(48, 3), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W1, ivec2(49, 3), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W1, ivec2(50, 3), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W1, ivec2(51, 3), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W1, ivec2(52, 3), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W1, ivec2(53, 3), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W1, ivec2(54, 3), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W1, ivec2(55, 3), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W1, ivec2(56, 3), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W1, ivec2(57, 3), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W1, ivec2(58, 3), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W1, ivec2(59, 3), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W1, ivec2(60, 3), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W1, ivec2(61, 3), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W1, ivec2(62, 3), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W1, ivec2(63, 3), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W1, ivec2(64, 3), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W1, ivec2(65, 3), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W1, ivec2(66, 3), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W1, ivec2(67, 3), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W1, ivec2(68, 3), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W1, ivec2(69, 3), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W1, ivec2(70, 3), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W1, ivec2(71, 3), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W1, ivec2(72, 3), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W1, ivec2(73, 3), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W1, ivec2(74, 3), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W1, ivec2(75, 3), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W1, ivec2(76, 3), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W1, ivec2(77, 3), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W1, ivec2(78, 3), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W1, ivec2(79, 3), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W1, ivec2(80, 3), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W1, ivec2(81, 3), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W1, ivec2(82, 3), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W1, ivec2(83, 3), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W1, ivec2(84, 3), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W1, ivec2(85, 3), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W1, ivec2(86, 3), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W1, ivec2(87, 3), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W1, ivec2(88, 3), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W1, ivec2(89, 3), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W1, ivec2(90, 3), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W1, ivec2(91, 3), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W1, ivec2(92, 3), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W1, ivec2(93, 3), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W1, ivec2(94, 3), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W1, ivec2(95, 3), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W1, ivec2(96, 3), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W1, ivec2(97, 3), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W1, ivec2(98, 3), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W1, ivec2(99, 3), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W1, ivec2(100, 3), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W1, ivec2(101, 3), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W1, ivec2(102, 3), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W1, ivec2(103, 3), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W1, ivec2(104, 3), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W1, ivec2(105, 3), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W1, ivec2(106, 3), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W1, ivec2(107, 3), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W1, ivec2(108, 3), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W1, ivec2(109, 3), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W1, ivec2(110, 3), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W1, ivec2(111, 3), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W1, ivec2(112, 3), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W1, ivec2(113, 3), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W1, ivec2(114, 3), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W1, ivec2(115, 3), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W1, ivec2(116, 3), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W1, ivec2(117, 3), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W1, ivec2(118, 3), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W1, ivec2(119, 3), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W1, ivec2(120, 3), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W1, ivec2(121, 3), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W1, ivec2(122, 3), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W1, ivec2(123, 3), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W1, ivec2(124, 3), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W1, ivec2(125, 3), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W1, ivec2(126, 3), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W1, ivec2(127, 3), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F0_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F0_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F0_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F0_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W1, ivec2(128, 3), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W1, ivec2(129, 3), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W1, ivec2(130, 3), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W1, ivec2(131, 3), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W1, ivec2(132, 3), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W1, ivec2(133, 3), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W1, ivec2(134, 3), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W1, ivec2(135, 3), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W1, ivec2(136, 3), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W1, ivec2(137, 3), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W1, ivec2(138, 3), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W1, ivec2(139, 3), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W1, ivec2(140, 3), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W1, ivec2(141, 3), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W1, ivec2(142, 3), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W1, ivec2(143, 3), 0);
    }
    sum += vec4(0.005125511874,0.07714803786,-0.005780781921,-0.1740927471);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.004164916929, -128), quantize(sum.y, 0.004164916929, -128), quantize(sum.z, 0.004164916929, -128), quantize(sum.w, 0.004164916929, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W2
//!BIND F1_0
//!BIND F1_1
//!BIND F1_2
//!BIND F1_3
//!SAVE F2_0
//!DESC [ARM_SESR_M5_QAT_int8] conv 2 output 0
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W2, ivec2(0, 0), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W2, ivec2(1, 0), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W2, ivec2(2, 0), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W2, ivec2(3, 0), 0);
        vec4 v0_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W2, ivec2(4, 0), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W2, ivec2(5, 0), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W2, ivec2(6, 0), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W2, ivec2(7, 0), 0);
        vec4 v0_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W2, ivec2(8, 0), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W2, ivec2(9, 0), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W2, ivec2(10, 0), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W2, ivec2(11, 0), 0);
        vec4 v0_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W2, ivec2(12, 0), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W2, ivec2(13, 0), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W2, ivec2(14, 0), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W2, ivec2(15, 0), 0);
        vec4 v0_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W2, ivec2(16, 0), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W2, ivec2(17, 0), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W2, ivec2(18, 0), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W2, ivec2(19, 0), 0);
        vec4 v0_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W2, ivec2(20, 0), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W2, ivec2(21, 0), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W2, ivec2(22, 0), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W2, ivec2(23, 0), 0);
        vec4 v0_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W2, ivec2(24, 0), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W2, ivec2(25, 0), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W2, ivec2(26, 0), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W2, ivec2(27, 0), 0);
        vec4 v0_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W2, ivec2(28, 0), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W2, ivec2(29, 0), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W2, ivec2(30, 0), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W2, ivec2(31, 0), 0);
        vec4 v0_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W2, ivec2(32, 0), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W2, ivec2(33, 0), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W2, ivec2(34, 0), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W2, ivec2(35, 0), 0);
        vec4 v0_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W2, ivec2(36, 0), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W2, ivec2(37, 0), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W2, ivec2(38, 0), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W2, ivec2(39, 0), 0);
        vec4 v0_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W2, ivec2(40, 0), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W2, ivec2(41, 0), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W2, ivec2(42, 0), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W2, ivec2(43, 0), 0);
        vec4 v0_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W2, ivec2(44, 0), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W2, ivec2(45, 0), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W2, ivec2(46, 0), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W2, ivec2(47, 0), 0);
        vec4 v1_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W2, ivec2(48, 0), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W2, ivec2(49, 0), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W2, ivec2(50, 0), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W2, ivec2(51, 0), 0);
        vec4 v1_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W2, ivec2(52, 0), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W2, ivec2(53, 0), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W2, ivec2(54, 0), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W2, ivec2(55, 0), 0);
        vec4 v1_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W2, ivec2(56, 0), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W2, ivec2(57, 0), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W2, ivec2(58, 0), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W2, ivec2(59, 0), 0);
        vec4 v1_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W2, ivec2(60, 0), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W2, ivec2(61, 0), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W2, ivec2(62, 0), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W2, ivec2(63, 0), 0);
        vec4 v1_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W2, ivec2(64, 0), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W2, ivec2(65, 0), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W2, ivec2(66, 0), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W2, ivec2(67, 0), 0);
        vec4 v1_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W2, ivec2(68, 0), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W2, ivec2(69, 0), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W2, ivec2(70, 0), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W2, ivec2(71, 0), 0);
        vec4 v1_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W2, ivec2(72, 0), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W2, ivec2(73, 0), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W2, ivec2(74, 0), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W2, ivec2(75, 0), 0);
        vec4 v1_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W2, ivec2(76, 0), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W2, ivec2(77, 0), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W2, ivec2(78, 0), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W2, ivec2(79, 0), 0);
        vec4 v1_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W2, ivec2(80, 0), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W2, ivec2(81, 0), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W2, ivec2(82, 0), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W2, ivec2(83, 0), 0);
        vec4 v1_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W2, ivec2(84, 0), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W2, ivec2(85, 0), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W2, ivec2(86, 0), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W2, ivec2(87, 0), 0);
        vec4 v1_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W2, ivec2(88, 0), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W2, ivec2(89, 0), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W2, ivec2(90, 0), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W2, ivec2(91, 0), 0);
        vec4 v1_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W2, ivec2(92, 0), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W2, ivec2(93, 0), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W2, ivec2(94, 0), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W2, ivec2(95, 0), 0);
        vec4 v2_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W2, ivec2(96, 0), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W2, ivec2(97, 0), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W2, ivec2(98, 0), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W2, ivec2(99, 0), 0);
        vec4 v2_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W2, ivec2(100, 0), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W2, ivec2(101, 0), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W2, ivec2(102, 0), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W2, ivec2(103, 0), 0);
        vec4 v2_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W2, ivec2(104, 0), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W2, ivec2(105, 0), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W2, ivec2(106, 0), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W2, ivec2(107, 0), 0);
        vec4 v2_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W2, ivec2(108, 0), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W2, ivec2(109, 0), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W2, ivec2(110, 0), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W2, ivec2(111, 0), 0);
        vec4 v2_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W2, ivec2(112, 0), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W2, ivec2(113, 0), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W2, ivec2(114, 0), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W2, ivec2(115, 0), 0);
        vec4 v2_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W2, ivec2(116, 0), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W2, ivec2(117, 0), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W2, ivec2(118, 0), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W2, ivec2(119, 0), 0);
        vec4 v2_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W2, ivec2(120, 0), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W2, ivec2(121, 0), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W2, ivec2(122, 0), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W2, ivec2(123, 0), 0);
        vec4 v2_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W2, ivec2(124, 0), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W2, ivec2(125, 0), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W2, ivec2(126, 0), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W2, ivec2(127, 0), 0);
        vec4 v2_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W2, ivec2(128, 0), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W2, ivec2(129, 0), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W2, ivec2(130, 0), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W2, ivec2(131, 0), 0);
        vec4 v2_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W2, ivec2(132, 0), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W2, ivec2(133, 0), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W2, ivec2(134, 0), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W2, ivec2(135, 0), 0);
        vec4 v2_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W2, ivec2(136, 0), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W2, ivec2(137, 0), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W2, ivec2(138, 0), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W2, ivec2(139, 0), 0);
        vec4 v2_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W2, ivec2(140, 0), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W2, ivec2(141, 0), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W2, ivec2(142, 0), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W2, ivec2(143, 0), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W2, ivec2(0, 0), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W2, ivec2(1, 0), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W2, ivec2(2, 0), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W2, ivec2(3, 0), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W2, ivec2(4, 0), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W2, ivec2(5, 0), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W2, ivec2(6, 0), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W2, ivec2(7, 0), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W2, ivec2(8, 0), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W2, ivec2(9, 0), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W2, ivec2(10, 0), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W2, ivec2(11, 0), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W2, ivec2(12, 0), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W2, ivec2(13, 0), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W2, ivec2(14, 0), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W2, ivec2(15, 0), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W2, ivec2(16, 0), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W2, ivec2(17, 0), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W2, ivec2(18, 0), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W2, ivec2(19, 0), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W2, ivec2(20, 0), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W2, ivec2(21, 0), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W2, ivec2(22, 0), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W2, ivec2(23, 0), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W2, ivec2(24, 0), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W2, ivec2(25, 0), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W2, ivec2(26, 0), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W2, ivec2(27, 0), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W2, ivec2(28, 0), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W2, ivec2(29, 0), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W2, ivec2(30, 0), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W2, ivec2(31, 0), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W2, ivec2(32, 0), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W2, ivec2(33, 0), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W2, ivec2(34, 0), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W2, ivec2(35, 0), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W2, ivec2(36, 0), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W2, ivec2(37, 0), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W2, ivec2(38, 0), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W2, ivec2(39, 0), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W2, ivec2(40, 0), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W2, ivec2(41, 0), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W2, ivec2(42, 0), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W2, ivec2(43, 0), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W2, ivec2(44, 0), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W2, ivec2(45, 0), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W2, ivec2(46, 0), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W2, ivec2(47, 0), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W2, ivec2(48, 0), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W2, ivec2(49, 0), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W2, ivec2(50, 0), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W2, ivec2(51, 0), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W2, ivec2(52, 0), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W2, ivec2(53, 0), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W2, ivec2(54, 0), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W2, ivec2(55, 0), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W2, ivec2(56, 0), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W2, ivec2(57, 0), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W2, ivec2(58, 0), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W2, ivec2(59, 0), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W2, ivec2(60, 0), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W2, ivec2(61, 0), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W2, ivec2(62, 0), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W2, ivec2(63, 0), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W2, ivec2(64, 0), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W2, ivec2(65, 0), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W2, ivec2(66, 0), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W2, ivec2(67, 0), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W2, ivec2(68, 0), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W2, ivec2(69, 0), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W2, ivec2(70, 0), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W2, ivec2(71, 0), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W2, ivec2(72, 0), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W2, ivec2(73, 0), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W2, ivec2(74, 0), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W2, ivec2(75, 0), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W2, ivec2(76, 0), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W2, ivec2(77, 0), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W2, ivec2(78, 0), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W2, ivec2(79, 0), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W2, ivec2(80, 0), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W2, ivec2(81, 0), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W2, ivec2(82, 0), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W2, ivec2(83, 0), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W2, ivec2(84, 0), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W2, ivec2(85, 0), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W2, ivec2(86, 0), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W2, ivec2(87, 0), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W2, ivec2(88, 0), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W2, ivec2(89, 0), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W2, ivec2(90, 0), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W2, ivec2(91, 0), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W2, ivec2(92, 0), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W2, ivec2(93, 0), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W2, ivec2(94, 0), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W2, ivec2(95, 0), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W2, ivec2(96, 0), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W2, ivec2(97, 0), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W2, ivec2(98, 0), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W2, ivec2(99, 0), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W2, ivec2(100, 0), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W2, ivec2(101, 0), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W2, ivec2(102, 0), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W2, ivec2(103, 0), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W2, ivec2(104, 0), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W2, ivec2(105, 0), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W2, ivec2(106, 0), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W2, ivec2(107, 0), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W2, ivec2(108, 0), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W2, ivec2(109, 0), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W2, ivec2(110, 0), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W2, ivec2(111, 0), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W2, ivec2(112, 0), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W2, ivec2(113, 0), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W2, ivec2(114, 0), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W2, ivec2(115, 0), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W2, ivec2(116, 0), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W2, ivec2(117, 0), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W2, ivec2(118, 0), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W2, ivec2(119, 0), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W2, ivec2(120, 0), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W2, ivec2(121, 0), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W2, ivec2(122, 0), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W2, ivec2(123, 0), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W2, ivec2(124, 0), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W2, ivec2(125, 0), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W2, ivec2(126, 0), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W2, ivec2(127, 0), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W2, ivec2(128, 0), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W2, ivec2(129, 0), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W2, ivec2(130, 0), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W2, ivec2(131, 0), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W2, ivec2(132, 0), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W2, ivec2(133, 0), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W2, ivec2(134, 0), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W2, ivec2(135, 0), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W2, ivec2(136, 0), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W2, ivec2(137, 0), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W2, ivec2(138, 0), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W2, ivec2(139, 0), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W2, ivec2(140, 0), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W2, ivec2(141, 0), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W2, ivec2(142, 0), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W2, ivec2(143, 0), 0);
    }
    sum += vec4(0.02591734689,0.03044842801,-0.05668249295,-0.006432862436);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.00569698168, -128), quantize(sum.y, 0.00569698168, -128), quantize(sum.z, 0.00569698168, -128), quantize(sum.w, 0.00569698168, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W2
//!BIND F1_0
//!BIND F1_1
//!BIND F1_2
//!BIND F1_3
//!SAVE F2_1
//!DESC [ARM_SESR_M5_QAT_int8] conv 2 output 1
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W2, ivec2(0, 1), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W2, ivec2(1, 1), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W2, ivec2(2, 1), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W2, ivec2(3, 1), 0);
        vec4 v0_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W2, ivec2(4, 1), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W2, ivec2(5, 1), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W2, ivec2(6, 1), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W2, ivec2(7, 1), 0);
        vec4 v0_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W2, ivec2(8, 1), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W2, ivec2(9, 1), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W2, ivec2(10, 1), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W2, ivec2(11, 1), 0);
        vec4 v0_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W2, ivec2(12, 1), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W2, ivec2(13, 1), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W2, ivec2(14, 1), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W2, ivec2(15, 1), 0);
        vec4 v0_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W2, ivec2(16, 1), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W2, ivec2(17, 1), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W2, ivec2(18, 1), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W2, ivec2(19, 1), 0);
        vec4 v0_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W2, ivec2(20, 1), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W2, ivec2(21, 1), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W2, ivec2(22, 1), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W2, ivec2(23, 1), 0);
        vec4 v0_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W2, ivec2(24, 1), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W2, ivec2(25, 1), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W2, ivec2(26, 1), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W2, ivec2(27, 1), 0);
        vec4 v0_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W2, ivec2(28, 1), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W2, ivec2(29, 1), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W2, ivec2(30, 1), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W2, ivec2(31, 1), 0);
        vec4 v0_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W2, ivec2(32, 1), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W2, ivec2(33, 1), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W2, ivec2(34, 1), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W2, ivec2(35, 1), 0);
        vec4 v0_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W2, ivec2(36, 1), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W2, ivec2(37, 1), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W2, ivec2(38, 1), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W2, ivec2(39, 1), 0);
        vec4 v0_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W2, ivec2(40, 1), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W2, ivec2(41, 1), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W2, ivec2(42, 1), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W2, ivec2(43, 1), 0);
        vec4 v0_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W2, ivec2(44, 1), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W2, ivec2(45, 1), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W2, ivec2(46, 1), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W2, ivec2(47, 1), 0);
        vec4 v1_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W2, ivec2(48, 1), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W2, ivec2(49, 1), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W2, ivec2(50, 1), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W2, ivec2(51, 1), 0);
        vec4 v1_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W2, ivec2(52, 1), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W2, ivec2(53, 1), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W2, ivec2(54, 1), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W2, ivec2(55, 1), 0);
        vec4 v1_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W2, ivec2(56, 1), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W2, ivec2(57, 1), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W2, ivec2(58, 1), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W2, ivec2(59, 1), 0);
        vec4 v1_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W2, ivec2(60, 1), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W2, ivec2(61, 1), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W2, ivec2(62, 1), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W2, ivec2(63, 1), 0);
        vec4 v1_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W2, ivec2(64, 1), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W2, ivec2(65, 1), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W2, ivec2(66, 1), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W2, ivec2(67, 1), 0);
        vec4 v1_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W2, ivec2(68, 1), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W2, ivec2(69, 1), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W2, ivec2(70, 1), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W2, ivec2(71, 1), 0);
        vec4 v1_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W2, ivec2(72, 1), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W2, ivec2(73, 1), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W2, ivec2(74, 1), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W2, ivec2(75, 1), 0);
        vec4 v1_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W2, ivec2(76, 1), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W2, ivec2(77, 1), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W2, ivec2(78, 1), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W2, ivec2(79, 1), 0);
        vec4 v1_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W2, ivec2(80, 1), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W2, ivec2(81, 1), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W2, ivec2(82, 1), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W2, ivec2(83, 1), 0);
        vec4 v1_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W2, ivec2(84, 1), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W2, ivec2(85, 1), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W2, ivec2(86, 1), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W2, ivec2(87, 1), 0);
        vec4 v1_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W2, ivec2(88, 1), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W2, ivec2(89, 1), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W2, ivec2(90, 1), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W2, ivec2(91, 1), 0);
        vec4 v1_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W2, ivec2(92, 1), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W2, ivec2(93, 1), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W2, ivec2(94, 1), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W2, ivec2(95, 1), 0);
        vec4 v2_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W2, ivec2(96, 1), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W2, ivec2(97, 1), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W2, ivec2(98, 1), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W2, ivec2(99, 1), 0);
        vec4 v2_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W2, ivec2(100, 1), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W2, ivec2(101, 1), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W2, ivec2(102, 1), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W2, ivec2(103, 1), 0);
        vec4 v2_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W2, ivec2(104, 1), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W2, ivec2(105, 1), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W2, ivec2(106, 1), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W2, ivec2(107, 1), 0);
        vec4 v2_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W2, ivec2(108, 1), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W2, ivec2(109, 1), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W2, ivec2(110, 1), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W2, ivec2(111, 1), 0);
        vec4 v2_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W2, ivec2(112, 1), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W2, ivec2(113, 1), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W2, ivec2(114, 1), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W2, ivec2(115, 1), 0);
        vec4 v2_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W2, ivec2(116, 1), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W2, ivec2(117, 1), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W2, ivec2(118, 1), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W2, ivec2(119, 1), 0);
        vec4 v2_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W2, ivec2(120, 1), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W2, ivec2(121, 1), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W2, ivec2(122, 1), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W2, ivec2(123, 1), 0);
        vec4 v2_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W2, ivec2(124, 1), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W2, ivec2(125, 1), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W2, ivec2(126, 1), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W2, ivec2(127, 1), 0);
        vec4 v2_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W2, ivec2(128, 1), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W2, ivec2(129, 1), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W2, ivec2(130, 1), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W2, ivec2(131, 1), 0);
        vec4 v2_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W2, ivec2(132, 1), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W2, ivec2(133, 1), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W2, ivec2(134, 1), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W2, ivec2(135, 1), 0);
        vec4 v2_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W2, ivec2(136, 1), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W2, ivec2(137, 1), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W2, ivec2(138, 1), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W2, ivec2(139, 1), 0);
        vec4 v2_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W2, ivec2(140, 1), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W2, ivec2(141, 1), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W2, ivec2(142, 1), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W2, ivec2(143, 1), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W2, ivec2(0, 1), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W2, ivec2(1, 1), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W2, ivec2(2, 1), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W2, ivec2(3, 1), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W2, ivec2(4, 1), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W2, ivec2(5, 1), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W2, ivec2(6, 1), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W2, ivec2(7, 1), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W2, ivec2(8, 1), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W2, ivec2(9, 1), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W2, ivec2(10, 1), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W2, ivec2(11, 1), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W2, ivec2(12, 1), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W2, ivec2(13, 1), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W2, ivec2(14, 1), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W2, ivec2(15, 1), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W2, ivec2(16, 1), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W2, ivec2(17, 1), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W2, ivec2(18, 1), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W2, ivec2(19, 1), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W2, ivec2(20, 1), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W2, ivec2(21, 1), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W2, ivec2(22, 1), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W2, ivec2(23, 1), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W2, ivec2(24, 1), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W2, ivec2(25, 1), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W2, ivec2(26, 1), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W2, ivec2(27, 1), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W2, ivec2(28, 1), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W2, ivec2(29, 1), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W2, ivec2(30, 1), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W2, ivec2(31, 1), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W2, ivec2(32, 1), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W2, ivec2(33, 1), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W2, ivec2(34, 1), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W2, ivec2(35, 1), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W2, ivec2(36, 1), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W2, ivec2(37, 1), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W2, ivec2(38, 1), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W2, ivec2(39, 1), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W2, ivec2(40, 1), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W2, ivec2(41, 1), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W2, ivec2(42, 1), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W2, ivec2(43, 1), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W2, ivec2(44, 1), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W2, ivec2(45, 1), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W2, ivec2(46, 1), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W2, ivec2(47, 1), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W2, ivec2(48, 1), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W2, ivec2(49, 1), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W2, ivec2(50, 1), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W2, ivec2(51, 1), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W2, ivec2(52, 1), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W2, ivec2(53, 1), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W2, ivec2(54, 1), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W2, ivec2(55, 1), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W2, ivec2(56, 1), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W2, ivec2(57, 1), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W2, ivec2(58, 1), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W2, ivec2(59, 1), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W2, ivec2(60, 1), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W2, ivec2(61, 1), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W2, ivec2(62, 1), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W2, ivec2(63, 1), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W2, ivec2(64, 1), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W2, ivec2(65, 1), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W2, ivec2(66, 1), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W2, ivec2(67, 1), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W2, ivec2(68, 1), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W2, ivec2(69, 1), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W2, ivec2(70, 1), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W2, ivec2(71, 1), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W2, ivec2(72, 1), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W2, ivec2(73, 1), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W2, ivec2(74, 1), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W2, ivec2(75, 1), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W2, ivec2(76, 1), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W2, ivec2(77, 1), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W2, ivec2(78, 1), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W2, ivec2(79, 1), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W2, ivec2(80, 1), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W2, ivec2(81, 1), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W2, ivec2(82, 1), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W2, ivec2(83, 1), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W2, ivec2(84, 1), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W2, ivec2(85, 1), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W2, ivec2(86, 1), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W2, ivec2(87, 1), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W2, ivec2(88, 1), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W2, ivec2(89, 1), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W2, ivec2(90, 1), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W2, ivec2(91, 1), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W2, ivec2(92, 1), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W2, ivec2(93, 1), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W2, ivec2(94, 1), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W2, ivec2(95, 1), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W2, ivec2(96, 1), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W2, ivec2(97, 1), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W2, ivec2(98, 1), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W2, ivec2(99, 1), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W2, ivec2(100, 1), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W2, ivec2(101, 1), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W2, ivec2(102, 1), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W2, ivec2(103, 1), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W2, ivec2(104, 1), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W2, ivec2(105, 1), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W2, ivec2(106, 1), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W2, ivec2(107, 1), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W2, ivec2(108, 1), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W2, ivec2(109, 1), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W2, ivec2(110, 1), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W2, ivec2(111, 1), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W2, ivec2(112, 1), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W2, ivec2(113, 1), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W2, ivec2(114, 1), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W2, ivec2(115, 1), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W2, ivec2(116, 1), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W2, ivec2(117, 1), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W2, ivec2(118, 1), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W2, ivec2(119, 1), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W2, ivec2(120, 1), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W2, ivec2(121, 1), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W2, ivec2(122, 1), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W2, ivec2(123, 1), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W2, ivec2(124, 1), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W2, ivec2(125, 1), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W2, ivec2(126, 1), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W2, ivec2(127, 1), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W2, ivec2(128, 1), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W2, ivec2(129, 1), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W2, ivec2(130, 1), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W2, ivec2(131, 1), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W2, ivec2(132, 1), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W2, ivec2(133, 1), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W2, ivec2(134, 1), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W2, ivec2(135, 1), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W2, ivec2(136, 1), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W2, ivec2(137, 1), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W2, ivec2(138, 1), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W2, ivec2(139, 1), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W2, ivec2(140, 1), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W2, ivec2(141, 1), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W2, ivec2(142, 1), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W2, ivec2(143, 1), 0);
    }
    sum += vec4(0.04896714494,0.08216338477,0.02047585776,-0.1609255304);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.00569698168, -128), quantize(sum.y, 0.00569698168, -128), quantize(sum.z, 0.00569698168, -128), quantize(sum.w, 0.00569698168, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W2
//!BIND F1_0
//!BIND F1_1
//!BIND F1_2
//!BIND F1_3
//!SAVE F2_2
//!DESC [ARM_SESR_M5_QAT_int8] conv 2 output 2
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W2, ivec2(0, 2), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W2, ivec2(1, 2), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W2, ivec2(2, 2), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W2, ivec2(3, 2), 0);
        vec4 v0_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W2, ivec2(4, 2), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W2, ivec2(5, 2), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W2, ivec2(6, 2), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W2, ivec2(7, 2), 0);
        vec4 v0_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W2, ivec2(8, 2), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W2, ivec2(9, 2), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W2, ivec2(10, 2), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W2, ivec2(11, 2), 0);
        vec4 v0_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W2, ivec2(12, 2), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W2, ivec2(13, 2), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W2, ivec2(14, 2), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W2, ivec2(15, 2), 0);
        vec4 v0_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W2, ivec2(16, 2), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W2, ivec2(17, 2), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W2, ivec2(18, 2), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W2, ivec2(19, 2), 0);
        vec4 v0_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W2, ivec2(20, 2), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W2, ivec2(21, 2), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W2, ivec2(22, 2), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W2, ivec2(23, 2), 0);
        vec4 v0_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W2, ivec2(24, 2), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W2, ivec2(25, 2), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W2, ivec2(26, 2), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W2, ivec2(27, 2), 0);
        vec4 v0_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W2, ivec2(28, 2), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W2, ivec2(29, 2), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W2, ivec2(30, 2), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W2, ivec2(31, 2), 0);
        vec4 v0_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W2, ivec2(32, 2), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W2, ivec2(33, 2), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W2, ivec2(34, 2), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W2, ivec2(35, 2), 0);
        vec4 v0_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W2, ivec2(36, 2), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W2, ivec2(37, 2), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W2, ivec2(38, 2), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W2, ivec2(39, 2), 0);
        vec4 v0_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W2, ivec2(40, 2), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W2, ivec2(41, 2), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W2, ivec2(42, 2), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W2, ivec2(43, 2), 0);
        vec4 v0_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W2, ivec2(44, 2), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W2, ivec2(45, 2), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W2, ivec2(46, 2), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W2, ivec2(47, 2), 0);
        vec4 v1_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W2, ivec2(48, 2), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W2, ivec2(49, 2), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W2, ivec2(50, 2), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W2, ivec2(51, 2), 0);
        vec4 v1_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W2, ivec2(52, 2), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W2, ivec2(53, 2), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W2, ivec2(54, 2), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W2, ivec2(55, 2), 0);
        vec4 v1_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W2, ivec2(56, 2), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W2, ivec2(57, 2), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W2, ivec2(58, 2), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W2, ivec2(59, 2), 0);
        vec4 v1_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W2, ivec2(60, 2), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W2, ivec2(61, 2), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W2, ivec2(62, 2), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W2, ivec2(63, 2), 0);
        vec4 v1_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W2, ivec2(64, 2), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W2, ivec2(65, 2), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W2, ivec2(66, 2), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W2, ivec2(67, 2), 0);
        vec4 v1_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W2, ivec2(68, 2), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W2, ivec2(69, 2), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W2, ivec2(70, 2), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W2, ivec2(71, 2), 0);
        vec4 v1_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W2, ivec2(72, 2), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W2, ivec2(73, 2), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W2, ivec2(74, 2), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W2, ivec2(75, 2), 0);
        vec4 v1_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W2, ivec2(76, 2), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W2, ivec2(77, 2), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W2, ivec2(78, 2), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W2, ivec2(79, 2), 0);
        vec4 v1_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W2, ivec2(80, 2), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W2, ivec2(81, 2), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W2, ivec2(82, 2), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W2, ivec2(83, 2), 0);
        vec4 v1_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W2, ivec2(84, 2), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W2, ivec2(85, 2), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W2, ivec2(86, 2), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W2, ivec2(87, 2), 0);
        vec4 v1_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W2, ivec2(88, 2), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W2, ivec2(89, 2), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W2, ivec2(90, 2), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W2, ivec2(91, 2), 0);
        vec4 v1_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W2, ivec2(92, 2), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W2, ivec2(93, 2), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W2, ivec2(94, 2), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W2, ivec2(95, 2), 0);
        vec4 v2_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W2, ivec2(96, 2), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W2, ivec2(97, 2), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W2, ivec2(98, 2), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W2, ivec2(99, 2), 0);
        vec4 v2_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W2, ivec2(100, 2), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W2, ivec2(101, 2), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W2, ivec2(102, 2), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W2, ivec2(103, 2), 0);
        vec4 v2_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W2, ivec2(104, 2), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W2, ivec2(105, 2), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W2, ivec2(106, 2), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W2, ivec2(107, 2), 0);
        vec4 v2_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W2, ivec2(108, 2), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W2, ivec2(109, 2), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W2, ivec2(110, 2), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W2, ivec2(111, 2), 0);
        vec4 v2_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W2, ivec2(112, 2), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W2, ivec2(113, 2), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W2, ivec2(114, 2), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W2, ivec2(115, 2), 0);
        vec4 v2_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W2, ivec2(116, 2), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W2, ivec2(117, 2), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W2, ivec2(118, 2), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W2, ivec2(119, 2), 0);
        vec4 v2_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W2, ivec2(120, 2), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W2, ivec2(121, 2), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W2, ivec2(122, 2), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W2, ivec2(123, 2), 0);
        vec4 v2_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W2, ivec2(124, 2), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W2, ivec2(125, 2), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W2, ivec2(126, 2), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W2, ivec2(127, 2), 0);
        vec4 v2_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W2, ivec2(128, 2), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W2, ivec2(129, 2), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W2, ivec2(130, 2), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W2, ivec2(131, 2), 0);
        vec4 v2_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W2, ivec2(132, 2), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W2, ivec2(133, 2), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W2, ivec2(134, 2), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W2, ivec2(135, 2), 0);
        vec4 v2_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W2, ivec2(136, 2), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W2, ivec2(137, 2), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W2, ivec2(138, 2), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W2, ivec2(139, 2), 0);
        vec4 v2_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W2, ivec2(140, 2), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W2, ivec2(141, 2), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W2, ivec2(142, 2), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W2, ivec2(143, 2), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W2, ivec2(0, 2), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W2, ivec2(1, 2), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W2, ivec2(2, 2), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W2, ivec2(3, 2), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W2, ivec2(4, 2), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W2, ivec2(5, 2), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W2, ivec2(6, 2), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W2, ivec2(7, 2), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W2, ivec2(8, 2), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W2, ivec2(9, 2), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W2, ivec2(10, 2), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W2, ivec2(11, 2), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W2, ivec2(12, 2), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W2, ivec2(13, 2), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W2, ivec2(14, 2), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W2, ivec2(15, 2), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W2, ivec2(16, 2), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W2, ivec2(17, 2), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W2, ivec2(18, 2), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W2, ivec2(19, 2), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W2, ivec2(20, 2), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W2, ivec2(21, 2), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W2, ivec2(22, 2), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W2, ivec2(23, 2), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W2, ivec2(24, 2), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W2, ivec2(25, 2), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W2, ivec2(26, 2), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W2, ivec2(27, 2), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W2, ivec2(28, 2), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W2, ivec2(29, 2), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W2, ivec2(30, 2), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W2, ivec2(31, 2), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W2, ivec2(32, 2), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W2, ivec2(33, 2), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W2, ivec2(34, 2), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W2, ivec2(35, 2), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W2, ivec2(36, 2), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W2, ivec2(37, 2), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W2, ivec2(38, 2), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W2, ivec2(39, 2), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W2, ivec2(40, 2), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W2, ivec2(41, 2), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W2, ivec2(42, 2), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W2, ivec2(43, 2), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W2, ivec2(44, 2), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W2, ivec2(45, 2), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W2, ivec2(46, 2), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W2, ivec2(47, 2), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W2, ivec2(48, 2), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W2, ivec2(49, 2), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W2, ivec2(50, 2), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W2, ivec2(51, 2), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W2, ivec2(52, 2), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W2, ivec2(53, 2), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W2, ivec2(54, 2), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W2, ivec2(55, 2), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W2, ivec2(56, 2), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W2, ivec2(57, 2), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W2, ivec2(58, 2), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W2, ivec2(59, 2), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W2, ivec2(60, 2), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W2, ivec2(61, 2), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W2, ivec2(62, 2), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W2, ivec2(63, 2), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W2, ivec2(64, 2), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W2, ivec2(65, 2), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W2, ivec2(66, 2), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W2, ivec2(67, 2), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W2, ivec2(68, 2), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W2, ivec2(69, 2), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W2, ivec2(70, 2), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W2, ivec2(71, 2), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W2, ivec2(72, 2), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W2, ivec2(73, 2), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W2, ivec2(74, 2), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W2, ivec2(75, 2), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W2, ivec2(76, 2), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W2, ivec2(77, 2), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W2, ivec2(78, 2), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W2, ivec2(79, 2), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W2, ivec2(80, 2), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W2, ivec2(81, 2), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W2, ivec2(82, 2), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W2, ivec2(83, 2), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W2, ivec2(84, 2), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W2, ivec2(85, 2), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W2, ivec2(86, 2), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W2, ivec2(87, 2), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W2, ivec2(88, 2), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W2, ivec2(89, 2), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W2, ivec2(90, 2), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W2, ivec2(91, 2), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W2, ivec2(92, 2), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W2, ivec2(93, 2), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W2, ivec2(94, 2), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W2, ivec2(95, 2), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W2, ivec2(96, 2), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W2, ivec2(97, 2), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W2, ivec2(98, 2), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W2, ivec2(99, 2), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W2, ivec2(100, 2), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W2, ivec2(101, 2), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W2, ivec2(102, 2), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W2, ivec2(103, 2), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W2, ivec2(104, 2), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W2, ivec2(105, 2), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W2, ivec2(106, 2), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W2, ivec2(107, 2), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W2, ivec2(108, 2), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W2, ivec2(109, 2), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W2, ivec2(110, 2), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W2, ivec2(111, 2), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W2, ivec2(112, 2), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W2, ivec2(113, 2), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W2, ivec2(114, 2), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W2, ivec2(115, 2), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W2, ivec2(116, 2), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W2, ivec2(117, 2), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W2, ivec2(118, 2), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W2, ivec2(119, 2), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W2, ivec2(120, 2), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W2, ivec2(121, 2), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W2, ivec2(122, 2), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W2, ivec2(123, 2), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W2, ivec2(124, 2), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W2, ivec2(125, 2), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W2, ivec2(126, 2), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W2, ivec2(127, 2), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W2, ivec2(128, 2), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W2, ivec2(129, 2), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W2, ivec2(130, 2), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W2, ivec2(131, 2), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W2, ivec2(132, 2), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W2, ivec2(133, 2), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W2, ivec2(134, 2), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W2, ivec2(135, 2), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W2, ivec2(136, 2), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W2, ivec2(137, 2), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W2, ivec2(138, 2), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W2, ivec2(139, 2), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W2, ivec2(140, 2), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W2, ivec2(141, 2), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W2, ivec2(142, 2), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W2, ivec2(143, 2), 0);
    }
    sum += vec4(0.1244853516,0.001277076524,0.1033808899,0.01276004322);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.00569698168, -128), quantize(sum.y, 0.00569698168, -128), quantize(sum.z, 0.00569698168, -128), quantize(sum.w, 0.00569698168, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W2
//!BIND F1_0
//!BIND F1_1
//!BIND F1_2
//!BIND F1_3
//!SAVE F2_3
//!DESC [ARM_SESR_M5_QAT_int8] conv 2 output 3
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W2, ivec2(0, 3), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W2, ivec2(1, 3), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W2, ivec2(2, 3), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W2, ivec2(3, 3), 0);
        vec4 v0_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W2, ivec2(4, 3), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W2, ivec2(5, 3), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W2, ivec2(6, 3), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W2, ivec2(7, 3), 0);
        vec4 v0_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W2, ivec2(8, 3), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W2, ivec2(9, 3), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W2, ivec2(10, 3), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W2, ivec2(11, 3), 0);
        vec4 v0_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W2, ivec2(12, 3), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W2, ivec2(13, 3), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W2, ivec2(14, 3), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W2, ivec2(15, 3), 0);
        vec4 v0_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W2, ivec2(16, 3), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W2, ivec2(17, 3), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W2, ivec2(18, 3), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W2, ivec2(19, 3), 0);
        vec4 v0_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W2, ivec2(20, 3), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W2, ivec2(21, 3), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W2, ivec2(22, 3), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W2, ivec2(23, 3), 0);
        vec4 v0_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W2, ivec2(24, 3), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W2, ivec2(25, 3), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W2, ivec2(26, 3), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W2, ivec2(27, 3), 0);
        vec4 v0_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W2, ivec2(28, 3), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W2, ivec2(29, 3), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W2, ivec2(30, 3), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W2, ivec2(31, 3), 0);
        vec4 v0_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W2, ivec2(32, 3), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W2, ivec2(33, 3), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W2, ivec2(34, 3), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W2, ivec2(35, 3), 0);
        vec4 v0_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W2, ivec2(36, 3), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W2, ivec2(37, 3), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W2, ivec2(38, 3), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W2, ivec2(39, 3), 0);
        vec4 v0_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W2, ivec2(40, 3), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W2, ivec2(41, 3), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W2, ivec2(42, 3), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W2, ivec2(43, 3), 0);
        vec4 v0_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W2, ivec2(44, 3), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W2, ivec2(45, 3), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W2, ivec2(46, 3), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W2, ivec2(47, 3), 0);
        vec4 v1_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W2, ivec2(48, 3), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W2, ivec2(49, 3), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W2, ivec2(50, 3), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W2, ivec2(51, 3), 0);
        vec4 v1_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W2, ivec2(52, 3), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W2, ivec2(53, 3), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W2, ivec2(54, 3), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W2, ivec2(55, 3), 0);
        vec4 v1_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W2, ivec2(56, 3), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W2, ivec2(57, 3), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W2, ivec2(58, 3), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W2, ivec2(59, 3), 0);
        vec4 v1_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W2, ivec2(60, 3), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W2, ivec2(61, 3), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W2, ivec2(62, 3), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W2, ivec2(63, 3), 0);
        vec4 v1_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W2, ivec2(64, 3), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W2, ivec2(65, 3), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W2, ivec2(66, 3), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W2, ivec2(67, 3), 0);
        vec4 v1_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W2, ivec2(68, 3), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W2, ivec2(69, 3), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W2, ivec2(70, 3), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W2, ivec2(71, 3), 0);
        vec4 v1_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W2, ivec2(72, 3), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W2, ivec2(73, 3), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W2, ivec2(74, 3), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W2, ivec2(75, 3), 0);
        vec4 v1_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W2, ivec2(76, 3), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W2, ivec2(77, 3), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W2, ivec2(78, 3), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W2, ivec2(79, 3), 0);
        vec4 v1_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W2, ivec2(80, 3), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W2, ivec2(81, 3), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W2, ivec2(82, 3), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W2, ivec2(83, 3), 0);
        vec4 v1_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W2, ivec2(84, 3), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W2, ivec2(85, 3), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W2, ivec2(86, 3), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W2, ivec2(87, 3), 0);
        vec4 v1_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W2, ivec2(88, 3), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W2, ivec2(89, 3), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W2, ivec2(90, 3), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W2, ivec2(91, 3), 0);
        vec4 v1_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W2, ivec2(92, 3), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W2, ivec2(93, 3), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W2, ivec2(94, 3), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W2, ivec2(95, 3), 0);
        vec4 v2_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W2, ivec2(96, 3), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W2, ivec2(97, 3), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W2, ivec2(98, 3), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W2, ivec2(99, 3), 0);
        vec4 v2_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W2, ivec2(100, 3), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W2, ivec2(101, 3), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W2, ivec2(102, 3), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W2, ivec2(103, 3), 0);
        vec4 v2_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W2, ivec2(104, 3), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W2, ivec2(105, 3), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W2, ivec2(106, 3), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W2, ivec2(107, 3), 0);
        vec4 v2_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W2, ivec2(108, 3), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W2, ivec2(109, 3), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W2, ivec2(110, 3), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W2, ivec2(111, 3), 0);
        vec4 v2_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W2, ivec2(112, 3), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W2, ivec2(113, 3), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W2, ivec2(114, 3), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W2, ivec2(115, 3), 0);
        vec4 v2_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W2, ivec2(116, 3), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W2, ivec2(117, 3), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W2, ivec2(118, 3), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W2, ivec2(119, 3), 0);
        vec4 v2_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W2, ivec2(120, 3), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W2, ivec2(121, 3), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W2, ivec2(122, 3), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W2, ivec2(123, 3), 0);
        vec4 v2_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W2, ivec2(124, 3), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W2, ivec2(125, 3), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W2, ivec2(126, 3), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W2, ivec2(127, 3), 0);
        vec4 v2_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W2, ivec2(128, 3), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W2, ivec2(129, 3), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W2, ivec2(130, 3), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W2, ivec2(131, 3), 0);
        vec4 v2_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W2, ivec2(132, 3), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W2, ivec2(133, 3), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W2, ivec2(134, 3), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W2, ivec2(135, 3), 0);
        vec4 v2_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W2, ivec2(136, 3), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W2, ivec2(137, 3), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W2, ivec2(138, 3), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W2, ivec2(139, 3), 0);
        vec4 v2_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W2, ivec2(140, 3), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W2, ivec2(141, 3), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W2, ivec2(142, 3), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W2, ivec2(143, 3), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W2, ivec2(0, 3), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W2, ivec2(1, 3), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W2, ivec2(2, 3), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W2, ivec2(3, 3), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W2, ivec2(4, 3), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W2, ivec2(5, 3), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W2, ivec2(6, 3), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W2, ivec2(7, 3), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W2, ivec2(8, 3), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W2, ivec2(9, 3), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W2, ivec2(10, 3), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W2, ivec2(11, 3), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W2, ivec2(12, 3), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W2, ivec2(13, 3), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W2, ivec2(14, 3), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W2, ivec2(15, 3), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W2, ivec2(16, 3), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W2, ivec2(17, 3), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W2, ivec2(18, 3), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W2, ivec2(19, 3), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W2, ivec2(20, 3), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W2, ivec2(21, 3), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W2, ivec2(22, 3), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W2, ivec2(23, 3), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W2, ivec2(24, 3), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W2, ivec2(25, 3), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W2, ivec2(26, 3), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W2, ivec2(27, 3), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W2, ivec2(28, 3), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W2, ivec2(29, 3), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W2, ivec2(30, 3), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W2, ivec2(31, 3), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W2, ivec2(32, 3), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W2, ivec2(33, 3), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W2, ivec2(34, 3), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W2, ivec2(35, 3), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W2, ivec2(36, 3), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W2, ivec2(37, 3), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W2, ivec2(38, 3), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W2, ivec2(39, 3), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W2, ivec2(40, 3), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W2, ivec2(41, 3), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W2, ivec2(42, 3), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W2, ivec2(43, 3), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W2, ivec2(44, 3), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W2, ivec2(45, 3), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W2, ivec2(46, 3), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W2, ivec2(47, 3), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W2, ivec2(48, 3), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W2, ivec2(49, 3), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W2, ivec2(50, 3), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W2, ivec2(51, 3), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W2, ivec2(52, 3), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W2, ivec2(53, 3), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W2, ivec2(54, 3), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W2, ivec2(55, 3), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W2, ivec2(56, 3), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W2, ivec2(57, 3), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W2, ivec2(58, 3), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W2, ivec2(59, 3), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W2, ivec2(60, 3), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W2, ivec2(61, 3), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W2, ivec2(62, 3), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W2, ivec2(63, 3), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W2, ivec2(64, 3), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W2, ivec2(65, 3), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W2, ivec2(66, 3), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W2, ivec2(67, 3), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W2, ivec2(68, 3), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W2, ivec2(69, 3), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W2, ivec2(70, 3), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W2, ivec2(71, 3), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W2, ivec2(72, 3), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W2, ivec2(73, 3), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W2, ivec2(74, 3), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W2, ivec2(75, 3), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W2, ivec2(76, 3), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W2, ivec2(77, 3), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W2, ivec2(78, 3), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W2, ivec2(79, 3), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W2, ivec2(80, 3), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W2, ivec2(81, 3), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W2, ivec2(82, 3), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W2, ivec2(83, 3), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W2, ivec2(84, 3), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W2, ivec2(85, 3), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W2, ivec2(86, 3), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W2, ivec2(87, 3), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W2, ivec2(88, 3), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W2, ivec2(89, 3), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W2, ivec2(90, 3), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W2, ivec2(91, 3), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W2, ivec2(92, 3), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W2, ivec2(93, 3), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W2, ivec2(94, 3), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W2, ivec2(95, 3), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W2, ivec2(96, 3), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W2, ivec2(97, 3), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W2, ivec2(98, 3), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W2, ivec2(99, 3), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W2, ivec2(100, 3), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W2, ivec2(101, 3), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W2, ivec2(102, 3), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W2, ivec2(103, 3), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W2, ivec2(104, 3), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W2, ivec2(105, 3), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W2, ivec2(106, 3), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W2, ivec2(107, 3), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W2, ivec2(108, 3), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W2, ivec2(109, 3), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W2, ivec2(110, 3), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W2, ivec2(111, 3), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W2, ivec2(112, 3), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W2, ivec2(113, 3), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W2, ivec2(114, 3), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W2, ivec2(115, 3), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W2, ivec2(116, 3), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W2, ivec2(117, 3), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W2, ivec2(118, 3), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W2, ivec2(119, 3), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W2, ivec2(120, 3), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W2, ivec2(121, 3), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W2, ivec2(122, 3), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W2, ivec2(123, 3), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W2, ivec2(124, 3), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W2, ivec2(125, 3), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W2, ivec2(126, 3), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W2, ivec2(127, 3), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F1_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F1_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F1_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F1_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W2, ivec2(128, 3), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W2, ivec2(129, 3), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W2, ivec2(130, 3), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W2, ivec2(131, 3), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W2, ivec2(132, 3), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W2, ivec2(133, 3), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W2, ivec2(134, 3), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W2, ivec2(135, 3), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W2, ivec2(136, 3), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W2, ivec2(137, 3), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W2, ivec2(138, 3), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W2, ivec2(139, 3), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W2, ivec2(140, 3), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W2, ivec2(141, 3), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W2, ivec2(142, 3), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W2, ivec2(143, 3), 0);
    }
    sum += vec4(-0.02056672752,-0.06852366426,-0.001473087583,-0.001676042382);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.00569698168, -128), quantize(sum.y, 0.00569698168, -128), quantize(sum.z, 0.00569698168, -128), quantize(sum.w, 0.00569698168, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W3
//!BIND F2_0
//!BIND F2_1
//!BIND F2_2
//!BIND F2_3
//!SAVE F3_0
//!DESC [ARM_SESR_M5_QAT_int8] conv 3 output 0
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W3, ivec2(0, 0), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W3, ivec2(1, 0), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W3, ivec2(2, 0), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W3, ivec2(3, 0), 0);
        vec4 v0_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W3, ivec2(4, 0), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W3, ivec2(5, 0), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W3, ivec2(6, 0), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W3, ivec2(7, 0), 0);
        vec4 v0_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W3, ivec2(8, 0), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W3, ivec2(9, 0), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W3, ivec2(10, 0), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W3, ivec2(11, 0), 0);
        vec4 v0_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W3, ivec2(12, 0), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W3, ivec2(13, 0), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W3, ivec2(14, 0), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W3, ivec2(15, 0), 0);
        vec4 v0_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W3, ivec2(16, 0), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W3, ivec2(17, 0), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W3, ivec2(18, 0), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W3, ivec2(19, 0), 0);
        vec4 v0_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W3, ivec2(20, 0), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W3, ivec2(21, 0), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W3, ivec2(22, 0), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W3, ivec2(23, 0), 0);
        vec4 v0_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W3, ivec2(24, 0), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W3, ivec2(25, 0), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W3, ivec2(26, 0), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W3, ivec2(27, 0), 0);
        vec4 v0_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W3, ivec2(28, 0), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W3, ivec2(29, 0), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W3, ivec2(30, 0), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W3, ivec2(31, 0), 0);
        vec4 v0_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W3, ivec2(32, 0), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W3, ivec2(33, 0), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W3, ivec2(34, 0), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W3, ivec2(35, 0), 0);
        vec4 v0_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W3, ivec2(36, 0), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W3, ivec2(37, 0), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W3, ivec2(38, 0), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W3, ivec2(39, 0), 0);
        vec4 v0_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W3, ivec2(40, 0), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W3, ivec2(41, 0), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W3, ivec2(42, 0), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W3, ivec2(43, 0), 0);
        vec4 v0_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W3, ivec2(44, 0), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W3, ivec2(45, 0), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W3, ivec2(46, 0), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W3, ivec2(47, 0), 0);
        vec4 v1_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W3, ivec2(48, 0), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W3, ivec2(49, 0), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W3, ivec2(50, 0), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W3, ivec2(51, 0), 0);
        vec4 v1_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W3, ivec2(52, 0), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W3, ivec2(53, 0), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W3, ivec2(54, 0), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W3, ivec2(55, 0), 0);
        vec4 v1_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W3, ivec2(56, 0), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W3, ivec2(57, 0), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W3, ivec2(58, 0), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W3, ivec2(59, 0), 0);
        vec4 v1_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W3, ivec2(60, 0), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W3, ivec2(61, 0), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W3, ivec2(62, 0), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W3, ivec2(63, 0), 0);
        vec4 v1_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W3, ivec2(64, 0), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W3, ivec2(65, 0), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W3, ivec2(66, 0), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W3, ivec2(67, 0), 0);
        vec4 v1_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W3, ivec2(68, 0), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W3, ivec2(69, 0), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W3, ivec2(70, 0), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W3, ivec2(71, 0), 0);
        vec4 v1_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W3, ivec2(72, 0), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W3, ivec2(73, 0), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W3, ivec2(74, 0), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W3, ivec2(75, 0), 0);
        vec4 v1_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W3, ivec2(76, 0), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W3, ivec2(77, 0), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W3, ivec2(78, 0), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W3, ivec2(79, 0), 0);
        vec4 v1_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W3, ivec2(80, 0), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W3, ivec2(81, 0), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W3, ivec2(82, 0), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W3, ivec2(83, 0), 0);
        vec4 v1_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W3, ivec2(84, 0), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W3, ivec2(85, 0), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W3, ivec2(86, 0), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W3, ivec2(87, 0), 0);
        vec4 v1_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W3, ivec2(88, 0), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W3, ivec2(89, 0), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W3, ivec2(90, 0), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W3, ivec2(91, 0), 0);
        vec4 v1_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W3, ivec2(92, 0), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W3, ivec2(93, 0), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W3, ivec2(94, 0), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W3, ivec2(95, 0), 0);
        vec4 v2_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W3, ivec2(96, 0), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W3, ivec2(97, 0), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W3, ivec2(98, 0), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W3, ivec2(99, 0), 0);
        vec4 v2_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W3, ivec2(100, 0), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W3, ivec2(101, 0), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W3, ivec2(102, 0), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W3, ivec2(103, 0), 0);
        vec4 v2_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W3, ivec2(104, 0), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W3, ivec2(105, 0), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W3, ivec2(106, 0), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W3, ivec2(107, 0), 0);
        vec4 v2_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W3, ivec2(108, 0), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W3, ivec2(109, 0), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W3, ivec2(110, 0), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W3, ivec2(111, 0), 0);
        vec4 v2_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W3, ivec2(112, 0), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W3, ivec2(113, 0), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W3, ivec2(114, 0), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W3, ivec2(115, 0), 0);
        vec4 v2_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W3, ivec2(116, 0), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W3, ivec2(117, 0), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W3, ivec2(118, 0), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W3, ivec2(119, 0), 0);
        vec4 v2_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W3, ivec2(120, 0), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W3, ivec2(121, 0), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W3, ivec2(122, 0), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W3, ivec2(123, 0), 0);
        vec4 v2_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W3, ivec2(124, 0), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W3, ivec2(125, 0), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W3, ivec2(126, 0), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W3, ivec2(127, 0), 0);
        vec4 v2_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W3, ivec2(128, 0), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W3, ivec2(129, 0), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W3, ivec2(130, 0), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W3, ivec2(131, 0), 0);
        vec4 v2_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W3, ivec2(132, 0), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W3, ivec2(133, 0), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W3, ivec2(134, 0), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W3, ivec2(135, 0), 0);
        vec4 v2_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W3, ivec2(136, 0), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W3, ivec2(137, 0), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W3, ivec2(138, 0), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W3, ivec2(139, 0), 0);
        vec4 v2_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W3, ivec2(140, 0), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W3, ivec2(141, 0), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W3, ivec2(142, 0), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W3, ivec2(143, 0), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W3, ivec2(0, 0), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W3, ivec2(1, 0), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W3, ivec2(2, 0), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W3, ivec2(3, 0), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W3, ivec2(4, 0), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W3, ivec2(5, 0), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W3, ivec2(6, 0), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W3, ivec2(7, 0), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W3, ivec2(8, 0), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W3, ivec2(9, 0), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W3, ivec2(10, 0), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W3, ivec2(11, 0), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W3, ivec2(12, 0), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W3, ivec2(13, 0), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W3, ivec2(14, 0), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W3, ivec2(15, 0), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W3, ivec2(16, 0), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W3, ivec2(17, 0), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W3, ivec2(18, 0), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W3, ivec2(19, 0), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W3, ivec2(20, 0), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W3, ivec2(21, 0), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W3, ivec2(22, 0), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W3, ivec2(23, 0), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W3, ivec2(24, 0), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W3, ivec2(25, 0), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W3, ivec2(26, 0), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W3, ivec2(27, 0), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W3, ivec2(28, 0), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W3, ivec2(29, 0), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W3, ivec2(30, 0), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W3, ivec2(31, 0), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W3, ivec2(32, 0), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W3, ivec2(33, 0), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W3, ivec2(34, 0), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W3, ivec2(35, 0), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W3, ivec2(36, 0), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W3, ivec2(37, 0), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W3, ivec2(38, 0), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W3, ivec2(39, 0), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W3, ivec2(40, 0), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W3, ivec2(41, 0), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W3, ivec2(42, 0), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W3, ivec2(43, 0), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W3, ivec2(44, 0), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W3, ivec2(45, 0), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W3, ivec2(46, 0), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W3, ivec2(47, 0), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W3, ivec2(48, 0), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W3, ivec2(49, 0), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W3, ivec2(50, 0), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W3, ivec2(51, 0), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W3, ivec2(52, 0), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W3, ivec2(53, 0), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W3, ivec2(54, 0), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W3, ivec2(55, 0), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W3, ivec2(56, 0), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W3, ivec2(57, 0), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W3, ivec2(58, 0), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W3, ivec2(59, 0), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W3, ivec2(60, 0), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W3, ivec2(61, 0), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W3, ivec2(62, 0), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W3, ivec2(63, 0), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W3, ivec2(64, 0), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W3, ivec2(65, 0), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W3, ivec2(66, 0), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W3, ivec2(67, 0), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W3, ivec2(68, 0), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W3, ivec2(69, 0), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W3, ivec2(70, 0), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W3, ivec2(71, 0), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W3, ivec2(72, 0), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W3, ivec2(73, 0), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W3, ivec2(74, 0), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W3, ivec2(75, 0), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W3, ivec2(76, 0), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W3, ivec2(77, 0), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W3, ivec2(78, 0), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W3, ivec2(79, 0), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W3, ivec2(80, 0), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W3, ivec2(81, 0), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W3, ivec2(82, 0), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W3, ivec2(83, 0), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W3, ivec2(84, 0), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W3, ivec2(85, 0), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W3, ivec2(86, 0), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W3, ivec2(87, 0), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W3, ivec2(88, 0), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W3, ivec2(89, 0), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W3, ivec2(90, 0), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W3, ivec2(91, 0), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W3, ivec2(92, 0), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W3, ivec2(93, 0), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W3, ivec2(94, 0), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W3, ivec2(95, 0), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W3, ivec2(96, 0), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W3, ivec2(97, 0), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W3, ivec2(98, 0), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W3, ivec2(99, 0), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W3, ivec2(100, 0), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W3, ivec2(101, 0), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W3, ivec2(102, 0), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W3, ivec2(103, 0), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W3, ivec2(104, 0), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W3, ivec2(105, 0), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W3, ivec2(106, 0), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W3, ivec2(107, 0), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W3, ivec2(108, 0), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W3, ivec2(109, 0), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W3, ivec2(110, 0), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W3, ivec2(111, 0), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W3, ivec2(112, 0), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W3, ivec2(113, 0), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W3, ivec2(114, 0), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W3, ivec2(115, 0), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W3, ivec2(116, 0), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W3, ivec2(117, 0), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W3, ivec2(118, 0), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W3, ivec2(119, 0), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W3, ivec2(120, 0), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W3, ivec2(121, 0), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W3, ivec2(122, 0), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W3, ivec2(123, 0), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W3, ivec2(124, 0), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W3, ivec2(125, 0), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W3, ivec2(126, 0), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W3, ivec2(127, 0), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W3, ivec2(128, 0), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W3, ivec2(129, 0), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W3, ivec2(130, 0), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W3, ivec2(131, 0), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W3, ivec2(132, 0), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W3, ivec2(133, 0), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W3, ivec2(134, 0), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W3, ivec2(135, 0), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W3, ivec2(136, 0), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W3, ivec2(137, 0), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W3, ivec2(138, 0), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W3, ivec2(139, 0), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W3, ivec2(140, 0), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W3, ivec2(141, 0), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W3, ivec2(142, 0), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W3, ivec2(143, 0), 0);
    }
    sum += vec4(0.05919265759,0.07960343617,-0.04185729416,-0.06928183755);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.008162499405, -128), quantize(sum.y, 0.008162499405, -128), quantize(sum.z, 0.008162499405, -128), quantize(sum.w, 0.008162499405, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W3
//!BIND F2_0
//!BIND F2_1
//!BIND F2_2
//!BIND F2_3
//!SAVE F3_1
//!DESC [ARM_SESR_M5_QAT_int8] conv 3 output 1
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W3, ivec2(0, 1), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W3, ivec2(1, 1), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W3, ivec2(2, 1), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W3, ivec2(3, 1), 0);
        vec4 v0_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W3, ivec2(4, 1), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W3, ivec2(5, 1), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W3, ivec2(6, 1), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W3, ivec2(7, 1), 0);
        vec4 v0_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W3, ivec2(8, 1), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W3, ivec2(9, 1), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W3, ivec2(10, 1), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W3, ivec2(11, 1), 0);
        vec4 v0_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W3, ivec2(12, 1), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W3, ivec2(13, 1), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W3, ivec2(14, 1), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W3, ivec2(15, 1), 0);
        vec4 v0_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W3, ivec2(16, 1), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W3, ivec2(17, 1), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W3, ivec2(18, 1), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W3, ivec2(19, 1), 0);
        vec4 v0_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W3, ivec2(20, 1), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W3, ivec2(21, 1), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W3, ivec2(22, 1), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W3, ivec2(23, 1), 0);
        vec4 v0_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W3, ivec2(24, 1), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W3, ivec2(25, 1), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W3, ivec2(26, 1), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W3, ivec2(27, 1), 0);
        vec4 v0_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W3, ivec2(28, 1), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W3, ivec2(29, 1), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W3, ivec2(30, 1), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W3, ivec2(31, 1), 0);
        vec4 v0_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W3, ivec2(32, 1), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W3, ivec2(33, 1), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W3, ivec2(34, 1), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W3, ivec2(35, 1), 0);
        vec4 v0_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W3, ivec2(36, 1), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W3, ivec2(37, 1), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W3, ivec2(38, 1), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W3, ivec2(39, 1), 0);
        vec4 v0_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W3, ivec2(40, 1), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W3, ivec2(41, 1), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W3, ivec2(42, 1), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W3, ivec2(43, 1), 0);
        vec4 v0_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W3, ivec2(44, 1), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W3, ivec2(45, 1), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W3, ivec2(46, 1), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W3, ivec2(47, 1), 0);
        vec4 v1_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W3, ivec2(48, 1), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W3, ivec2(49, 1), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W3, ivec2(50, 1), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W3, ivec2(51, 1), 0);
        vec4 v1_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W3, ivec2(52, 1), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W3, ivec2(53, 1), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W3, ivec2(54, 1), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W3, ivec2(55, 1), 0);
        vec4 v1_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W3, ivec2(56, 1), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W3, ivec2(57, 1), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W3, ivec2(58, 1), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W3, ivec2(59, 1), 0);
        vec4 v1_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W3, ivec2(60, 1), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W3, ivec2(61, 1), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W3, ivec2(62, 1), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W3, ivec2(63, 1), 0);
        vec4 v1_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W3, ivec2(64, 1), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W3, ivec2(65, 1), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W3, ivec2(66, 1), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W3, ivec2(67, 1), 0);
        vec4 v1_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W3, ivec2(68, 1), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W3, ivec2(69, 1), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W3, ivec2(70, 1), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W3, ivec2(71, 1), 0);
        vec4 v1_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W3, ivec2(72, 1), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W3, ivec2(73, 1), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W3, ivec2(74, 1), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W3, ivec2(75, 1), 0);
        vec4 v1_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W3, ivec2(76, 1), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W3, ivec2(77, 1), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W3, ivec2(78, 1), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W3, ivec2(79, 1), 0);
        vec4 v1_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W3, ivec2(80, 1), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W3, ivec2(81, 1), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W3, ivec2(82, 1), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W3, ivec2(83, 1), 0);
        vec4 v1_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W3, ivec2(84, 1), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W3, ivec2(85, 1), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W3, ivec2(86, 1), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W3, ivec2(87, 1), 0);
        vec4 v1_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W3, ivec2(88, 1), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W3, ivec2(89, 1), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W3, ivec2(90, 1), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W3, ivec2(91, 1), 0);
        vec4 v1_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W3, ivec2(92, 1), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W3, ivec2(93, 1), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W3, ivec2(94, 1), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W3, ivec2(95, 1), 0);
        vec4 v2_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W3, ivec2(96, 1), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W3, ivec2(97, 1), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W3, ivec2(98, 1), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W3, ivec2(99, 1), 0);
        vec4 v2_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W3, ivec2(100, 1), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W3, ivec2(101, 1), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W3, ivec2(102, 1), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W3, ivec2(103, 1), 0);
        vec4 v2_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W3, ivec2(104, 1), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W3, ivec2(105, 1), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W3, ivec2(106, 1), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W3, ivec2(107, 1), 0);
        vec4 v2_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W3, ivec2(108, 1), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W3, ivec2(109, 1), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W3, ivec2(110, 1), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W3, ivec2(111, 1), 0);
        vec4 v2_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W3, ivec2(112, 1), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W3, ivec2(113, 1), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W3, ivec2(114, 1), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W3, ivec2(115, 1), 0);
        vec4 v2_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W3, ivec2(116, 1), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W3, ivec2(117, 1), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W3, ivec2(118, 1), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W3, ivec2(119, 1), 0);
        vec4 v2_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W3, ivec2(120, 1), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W3, ivec2(121, 1), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W3, ivec2(122, 1), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W3, ivec2(123, 1), 0);
        vec4 v2_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W3, ivec2(124, 1), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W3, ivec2(125, 1), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W3, ivec2(126, 1), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W3, ivec2(127, 1), 0);
        vec4 v2_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W3, ivec2(128, 1), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W3, ivec2(129, 1), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W3, ivec2(130, 1), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W3, ivec2(131, 1), 0);
        vec4 v2_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W3, ivec2(132, 1), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W3, ivec2(133, 1), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W3, ivec2(134, 1), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W3, ivec2(135, 1), 0);
        vec4 v2_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W3, ivec2(136, 1), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W3, ivec2(137, 1), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W3, ivec2(138, 1), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W3, ivec2(139, 1), 0);
        vec4 v2_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W3, ivec2(140, 1), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W3, ivec2(141, 1), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W3, ivec2(142, 1), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W3, ivec2(143, 1), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W3, ivec2(0, 1), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W3, ivec2(1, 1), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W3, ivec2(2, 1), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W3, ivec2(3, 1), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W3, ivec2(4, 1), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W3, ivec2(5, 1), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W3, ivec2(6, 1), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W3, ivec2(7, 1), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W3, ivec2(8, 1), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W3, ivec2(9, 1), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W3, ivec2(10, 1), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W3, ivec2(11, 1), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W3, ivec2(12, 1), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W3, ivec2(13, 1), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W3, ivec2(14, 1), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W3, ivec2(15, 1), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W3, ivec2(16, 1), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W3, ivec2(17, 1), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W3, ivec2(18, 1), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W3, ivec2(19, 1), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W3, ivec2(20, 1), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W3, ivec2(21, 1), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W3, ivec2(22, 1), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W3, ivec2(23, 1), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W3, ivec2(24, 1), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W3, ivec2(25, 1), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W3, ivec2(26, 1), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W3, ivec2(27, 1), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W3, ivec2(28, 1), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W3, ivec2(29, 1), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W3, ivec2(30, 1), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W3, ivec2(31, 1), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W3, ivec2(32, 1), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W3, ivec2(33, 1), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W3, ivec2(34, 1), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W3, ivec2(35, 1), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W3, ivec2(36, 1), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W3, ivec2(37, 1), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W3, ivec2(38, 1), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W3, ivec2(39, 1), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W3, ivec2(40, 1), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W3, ivec2(41, 1), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W3, ivec2(42, 1), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W3, ivec2(43, 1), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W3, ivec2(44, 1), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W3, ivec2(45, 1), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W3, ivec2(46, 1), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W3, ivec2(47, 1), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W3, ivec2(48, 1), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W3, ivec2(49, 1), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W3, ivec2(50, 1), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W3, ivec2(51, 1), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W3, ivec2(52, 1), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W3, ivec2(53, 1), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W3, ivec2(54, 1), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W3, ivec2(55, 1), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W3, ivec2(56, 1), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W3, ivec2(57, 1), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W3, ivec2(58, 1), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W3, ivec2(59, 1), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W3, ivec2(60, 1), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W3, ivec2(61, 1), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W3, ivec2(62, 1), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W3, ivec2(63, 1), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W3, ivec2(64, 1), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W3, ivec2(65, 1), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W3, ivec2(66, 1), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W3, ivec2(67, 1), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W3, ivec2(68, 1), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W3, ivec2(69, 1), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W3, ivec2(70, 1), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W3, ivec2(71, 1), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W3, ivec2(72, 1), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W3, ivec2(73, 1), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W3, ivec2(74, 1), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W3, ivec2(75, 1), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W3, ivec2(76, 1), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W3, ivec2(77, 1), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W3, ivec2(78, 1), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W3, ivec2(79, 1), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W3, ivec2(80, 1), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W3, ivec2(81, 1), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W3, ivec2(82, 1), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W3, ivec2(83, 1), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W3, ivec2(84, 1), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W3, ivec2(85, 1), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W3, ivec2(86, 1), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W3, ivec2(87, 1), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W3, ivec2(88, 1), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W3, ivec2(89, 1), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W3, ivec2(90, 1), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W3, ivec2(91, 1), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W3, ivec2(92, 1), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W3, ivec2(93, 1), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W3, ivec2(94, 1), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W3, ivec2(95, 1), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W3, ivec2(96, 1), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W3, ivec2(97, 1), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W3, ivec2(98, 1), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W3, ivec2(99, 1), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W3, ivec2(100, 1), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W3, ivec2(101, 1), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W3, ivec2(102, 1), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W3, ivec2(103, 1), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W3, ivec2(104, 1), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W3, ivec2(105, 1), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W3, ivec2(106, 1), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W3, ivec2(107, 1), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W3, ivec2(108, 1), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W3, ivec2(109, 1), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W3, ivec2(110, 1), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W3, ivec2(111, 1), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W3, ivec2(112, 1), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W3, ivec2(113, 1), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W3, ivec2(114, 1), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W3, ivec2(115, 1), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W3, ivec2(116, 1), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W3, ivec2(117, 1), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W3, ivec2(118, 1), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W3, ivec2(119, 1), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W3, ivec2(120, 1), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W3, ivec2(121, 1), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W3, ivec2(122, 1), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W3, ivec2(123, 1), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W3, ivec2(124, 1), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W3, ivec2(125, 1), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W3, ivec2(126, 1), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W3, ivec2(127, 1), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W3, ivec2(128, 1), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W3, ivec2(129, 1), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W3, ivec2(130, 1), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W3, ivec2(131, 1), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W3, ivec2(132, 1), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W3, ivec2(133, 1), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W3, ivec2(134, 1), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W3, ivec2(135, 1), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W3, ivec2(136, 1), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W3, ivec2(137, 1), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W3, ivec2(138, 1), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W3, ivec2(139, 1), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W3, ivec2(140, 1), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W3, ivec2(141, 1), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W3, ivec2(142, 1), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W3, ivec2(143, 1), 0);
    }
    sum += vec4(-0.03506899515,0.02700026133,0.1239169034,0.01248244914);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.008162499405, -128), quantize(sum.y, 0.008162499405, -128), quantize(sum.z, 0.008162499405, -128), quantize(sum.w, 0.008162499405, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W3
//!BIND F2_0
//!BIND F2_1
//!BIND F2_2
//!BIND F2_3
//!SAVE F3_2
//!DESC [ARM_SESR_M5_QAT_int8] conv 3 output 2
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W3, ivec2(0, 2), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W3, ivec2(1, 2), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W3, ivec2(2, 2), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W3, ivec2(3, 2), 0);
        vec4 v0_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W3, ivec2(4, 2), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W3, ivec2(5, 2), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W3, ivec2(6, 2), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W3, ivec2(7, 2), 0);
        vec4 v0_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W3, ivec2(8, 2), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W3, ivec2(9, 2), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W3, ivec2(10, 2), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W3, ivec2(11, 2), 0);
        vec4 v0_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W3, ivec2(12, 2), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W3, ivec2(13, 2), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W3, ivec2(14, 2), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W3, ivec2(15, 2), 0);
        vec4 v0_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W3, ivec2(16, 2), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W3, ivec2(17, 2), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W3, ivec2(18, 2), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W3, ivec2(19, 2), 0);
        vec4 v0_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W3, ivec2(20, 2), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W3, ivec2(21, 2), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W3, ivec2(22, 2), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W3, ivec2(23, 2), 0);
        vec4 v0_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W3, ivec2(24, 2), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W3, ivec2(25, 2), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W3, ivec2(26, 2), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W3, ivec2(27, 2), 0);
        vec4 v0_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W3, ivec2(28, 2), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W3, ivec2(29, 2), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W3, ivec2(30, 2), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W3, ivec2(31, 2), 0);
        vec4 v0_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W3, ivec2(32, 2), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W3, ivec2(33, 2), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W3, ivec2(34, 2), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W3, ivec2(35, 2), 0);
        vec4 v0_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W3, ivec2(36, 2), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W3, ivec2(37, 2), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W3, ivec2(38, 2), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W3, ivec2(39, 2), 0);
        vec4 v0_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W3, ivec2(40, 2), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W3, ivec2(41, 2), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W3, ivec2(42, 2), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W3, ivec2(43, 2), 0);
        vec4 v0_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W3, ivec2(44, 2), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W3, ivec2(45, 2), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W3, ivec2(46, 2), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W3, ivec2(47, 2), 0);
        vec4 v1_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W3, ivec2(48, 2), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W3, ivec2(49, 2), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W3, ivec2(50, 2), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W3, ivec2(51, 2), 0);
        vec4 v1_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W3, ivec2(52, 2), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W3, ivec2(53, 2), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W3, ivec2(54, 2), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W3, ivec2(55, 2), 0);
        vec4 v1_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W3, ivec2(56, 2), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W3, ivec2(57, 2), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W3, ivec2(58, 2), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W3, ivec2(59, 2), 0);
        vec4 v1_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W3, ivec2(60, 2), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W3, ivec2(61, 2), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W3, ivec2(62, 2), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W3, ivec2(63, 2), 0);
        vec4 v1_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W3, ivec2(64, 2), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W3, ivec2(65, 2), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W3, ivec2(66, 2), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W3, ivec2(67, 2), 0);
        vec4 v1_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W3, ivec2(68, 2), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W3, ivec2(69, 2), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W3, ivec2(70, 2), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W3, ivec2(71, 2), 0);
        vec4 v1_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W3, ivec2(72, 2), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W3, ivec2(73, 2), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W3, ivec2(74, 2), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W3, ivec2(75, 2), 0);
        vec4 v1_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W3, ivec2(76, 2), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W3, ivec2(77, 2), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W3, ivec2(78, 2), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W3, ivec2(79, 2), 0);
        vec4 v1_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W3, ivec2(80, 2), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W3, ivec2(81, 2), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W3, ivec2(82, 2), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W3, ivec2(83, 2), 0);
        vec4 v1_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W3, ivec2(84, 2), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W3, ivec2(85, 2), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W3, ivec2(86, 2), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W3, ivec2(87, 2), 0);
        vec4 v1_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W3, ivec2(88, 2), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W3, ivec2(89, 2), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W3, ivec2(90, 2), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W3, ivec2(91, 2), 0);
        vec4 v1_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W3, ivec2(92, 2), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W3, ivec2(93, 2), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W3, ivec2(94, 2), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W3, ivec2(95, 2), 0);
        vec4 v2_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W3, ivec2(96, 2), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W3, ivec2(97, 2), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W3, ivec2(98, 2), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W3, ivec2(99, 2), 0);
        vec4 v2_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W3, ivec2(100, 2), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W3, ivec2(101, 2), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W3, ivec2(102, 2), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W3, ivec2(103, 2), 0);
        vec4 v2_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W3, ivec2(104, 2), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W3, ivec2(105, 2), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W3, ivec2(106, 2), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W3, ivec2(107, 2), 0);
        vec4 v2_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W3, ivec2(108, 2), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W3, ivec2(109, 2), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W3, ivec2(110, 2), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W3, ivec2(111, 2), 0);
        vec4 v2_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W3, ivec2(112, 2), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W3, ivec2(113, 2), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W3, ivec2(114, 2), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W3, ivec2(115, 2), 0);
        vec4 v2_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W3, ivec2(116, 2), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W3, ivec2(117, 2), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W3, ivec2(118, 2), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W3, ivec2(119, 2), 0);
        vec4 v2_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W3, ivec2(120, 2), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W3, ivec2(121, 2), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W3, ivec2(122, 2), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W3, ivec2(123, 2), 0);
        vec4 v2_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W3, ivec2(124, 2), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W3, ivec2(125, 2), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W3, ivec2(126, 2), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W3, ivec2(127, 2), 0);
        vec4 v2_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W3, ivec2(128, 2), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W3, ivec2(129, 2), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W3, ivec2(130, 2), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W3, ivec2(131, 2), 0);
        vec4 v2_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W3, ivec2(132, 2), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W3, ivec2(133, 2), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W3, ivec2(134, 2), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W3, ivec2(135, 2), 0);
        vec4 v2_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W3, ivec2(136, 2), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W3, ivec2(137, 2), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W3, ivec2(138, 2), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W3, ivec2(139, 2), 0);
        vec4 v2_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W3, ivec2(140, 2), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W3, ivec2(141, 2), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W3, ivec2(142, 2), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W3, ivec2(143, 2), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W3, ivec2(0, 2), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W3, ivec2(1, 2), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W3, ivec2(2, 2), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W3, ivec2(3, 2), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W3, ivec2(4, 2), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W3, ivec2(5, 2), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W3, ivec2(6, 2), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W3, ivec2(7, 2), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W3, ivec2(8, 2), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W3, ivec2(9, 2), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W3, ivec2(10, 2), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W3, ivec2(11, 2), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W3, ivec2(12, 2), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W3, ivec2(13, 2), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W3, ivec2(14, 2), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W3, ivec2(15, 2), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W3, ivec2(16, 2), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W3, ivec2(17, 2), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W3, ivec2(18, 2), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W3, ivec2(19, 2), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W3, ivec2(20, 2), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W3, ivec2(21, 2), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W3, ivec2(22, 2), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W3, ivec2(23, 2), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W3, ivec2(24, 2), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W3, ivec2(25, 2), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W3, ivec2(26, 2), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W3, ivec2(27, 2), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W3, ivec2(28, 2), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W3, ivec2(29, 2), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W3, ivec2(30, 2), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W3, ivec2(31, 2), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W3, ivec2(32, 2), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W3, ivec2(33, 2), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W3, ivec2(34, 2), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W3, ivec2(35, 2), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W3, ivec2(36, 2), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W3, ivec2(37, 2), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W3, ivec2(38, 2), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W3, ivec2(39, 2), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W3, ivec2(40, 2), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W3, ivec2(41, 2), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W3, ivec2(42, 2), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W3, ivec2(43, 2), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W3, ivec2(44, 2), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W3, ivec2(45, 2), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W3, ivec2(46, 2), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W3, ivec2(47, 2), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W3, ivec2(48, 2), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W3, ivec2(49, 2), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W3, ivec2(50, 2), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W3, ivec2(51, 2), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W3, ivec2(52, 2), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W3, ivec2(53, 2), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W3, ivec2(54, 2), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W3, ivec2(55, 2), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W3, ivec2(56, 2), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W3, ivec2(57, 2), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W3, ivec2(58, 2), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W3, ivec2(59, 2), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W3, ivec2(60, 2), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W3, ivec2(61, 2), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W3, ivec2(62, 2), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W3, ivec2(63, 2), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W3, ivec2(64, 2), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W3, ivec2(65, 2), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W3, ivec2(66, 2), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W3, ivec2(67, 2), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W3, ivec2(68, 2), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W3, ivec2(69, 2), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W3, ivec2(70, 2), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W3, ivec2(71, 2), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W3, ivec2(72, 2), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W3, ivec2(73, 2), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W3, ivec2(74, 2), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W3, ivec2(75, 2), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W3, ivec2(76, 2), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W3, ivec2(77, 2), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W3, ivec2(78, 2), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W3, ivec2(79, 2), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W3, ivec2(80, 2), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W3, ivec2(81, 2), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W3, ivec2(82, 2), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W3, ivec2(83, 2), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W3, ivec2(84, 2), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W3, ivec2(85, 2), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W3, ivec2(86, 2), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W3, ivec2(87, 2), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W3, ivec2(88, 2), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W3, ivec2(89, 2), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W3, ivec2(90, 2), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W3, ivec2(91, 2), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W3, ivec2(92, 2), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W3, ivec2(93, 2), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W3, ivec2(94, 2), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W3, ivec2(95, 2), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W3, ivec2(96, 2), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W3, ivec2(97, 2), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W3, ivec2(98, 2), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W3, ivec2(99, 2), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W3, ivec2(100, 2), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W3, ivec2(101, 2), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W3, ivec2(102, 2), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W3, ivec2(103, 2), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W3, ivec2(104, 2), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W3, ivec2(105, 2), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W3, ivec2(106, 2), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W3, ivec2(107, 2), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W3, ivec2(108, 2), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W3, ivec2(109, 2), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W3, ivec2(110, 2), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W3, ivec2(111, 2), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W3, ivec2(112, 2), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W3, ivec2(113, 2), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W3, ivec2(114, 2), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W3, ivec2(115, 2), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W3, ivec2(116, 2), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W3, ivec2(117, 2), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W3, ivec2(118, 2), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W3, ivec2(119, 2), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W3, ivec2(120, 2), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W3, ivec2(121, 2), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W3, ivec2(122, 2), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W3, ivec2(123, 2), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W3, ivec2(124, 2), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W3, ivec2(125, 2), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W3, ivec2(126, 2), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W3, ivec2(127, 2), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W3, ivec2(128, 2), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W3, ivec2(129, 2), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W3, ivec2(130, 2), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W3, ivec2(131, 2), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W3, ivec2(132, 2), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W3, ivec2(133, 2), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W3, ivec2(134, 2), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W3, ivec2(135, 2), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W3, ivec2(136, 2), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W3, ivec2(137, 2), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W3, ivec2(138, 2), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W3, ivec2(139, 2), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W3, ivec2(140, 2), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W3, ivec2(141, 2), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W3, ivec2(142, 2), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W3, ivec2(143, 2), 0);
    }
    sum += vec4(0.03722690606,-0.007075019439,-0.01532342931,0.04789020695);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.008162499405, -128), quantize(sum.y, 0.008162499405, -128), quantize(sum.z, 0.008162499405, -128), quantize(sum.w, 0.008162499405, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W3
//!BIND F2_0
//!BIND F2_1
//!BIND F2_2
//!BIND F2_3
//!SAVE F3_3
//!DESC [ARM_SESR_M5_QAT_int8] conv 3 output 3
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W3, ivec2(0, 3), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W3, ivec2(1, 3), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W3, ivec2(2, 3), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W3, ivec2(3, 3), 0);
        vec4 v0_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W3, ivec2(4, 3), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W3, ivec2(5, 3), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W3, ivec2(6, 3), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W3, ivec2(7, 3), 0);
        vec4 v0_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W3, ivec2(8, 3), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W3, ivec2(9, 3), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W3, ivec2(10, 3), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W3, ivec2(11, 3), 0);
        vec4 v0_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W3, ivec2(12, 3), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W3, ivec2(13, 3), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W3, ivec2(14, 3), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W3, ivec2(15, 3), 0);
        vec4 v0_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W3, ivec2(16, 3), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W3, ivec2(17, 3), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W3, ivec2(18, 3), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W3, ivec2(19, 3), 0);
        vec4 v0_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W3, ivec2(20, 3), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W3, ivec2(21, 3), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W3, ivec2(22, 3), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W3, ivec2(23, 3), 0);
        vec4 v0_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W3, ivec2(24, 3), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W3, ivec2(25, 3), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W3, ivec2(26, 3), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W3, ivec2(27, 3), 0);
        vec4 v0_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W3, ivec2(28, 3), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W3, ivec2(29, 3), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W3, ivec2(30, 3), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W3, ivec2(31, 3), 0);
        vec4 v0_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W3, ivec2(32, 3), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W3, ivec2(33, 3), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W3, ivec2(34, 3), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W3, ivec2(35, 3), 0);
        vec4 v0_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W3, ivec2(36, 3), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W3, ivec2(37, 3), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W3, ivec2(38, 3), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W3, ivec2(39, 3), 0);
        vec4 v0_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W3, ivec2(40, 3), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W3, ivec2(41, 3), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W3, ivec2(42, 3), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W3, ivec2(43, 3), 0);
        vec4 v0_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W3, ivec2(44, 3), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W3, ivec2(45, 3), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W3, ivec2(46, 3), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W3, ivec2(47, 3), 0);
        vec4 v1_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W3, ivec2(48, 3), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W3, ivec2(49, 3), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W3, ivec2(50, 3), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W3, ivec2(51, 3), 0);
        vec4 v1_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W3, ivec2(52, 3), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W3, ivec2(53, 3), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W3, ivec2(54, 3), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W3, ivec2(55, 3), 0);
        vec4 v1_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W3, ivec2(56, 3), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W3, ivec2(57, 3), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W3, ivec2(58, 3), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W3, ivec2(59, 3), 0);
        vec4 v1_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W3, ivec2(60, 3), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W3, ivec2(61, 3), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W3, ivec2(62, 3), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W3, ivec2(63, 3), 0);
        vec4 v1_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W3, ivec2(64, 3), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W3, ivec2(65, 3), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W3, ivec2(66, 3), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W3, ivec2(67, 3), 0);
        vec4 v1_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W3, ivec2(68, 3), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W3, ivec2(69, 3), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W3, ivec2(70, 3), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W3, ivec2(71, 3), 0);
        vec4 v1_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W3, ivec2(72, 3), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W3, ivec2(73, 3), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W3, ivec2(74, 3), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W3, ivec2(75, 3), 0);
        vec4 v1_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W3, ivec2(76, 3), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W3, ivec2(77, 3), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W3, ivec2(78, 3), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W3, ivec2(79, 3), 0);
        vec4 v1_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W3, ivec2(80, 3), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W3, ivec2(81, 3), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W3, ivec2(82, 3), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W3, ivec2(83, 3), 0);
        vec4 v1_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W3, ivec2(84, 3), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W3, ivec2(85, 3), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W3, ivec2(86, 3), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W3, ivec2(87, 3), 0);
        vec4 v1_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W3, ivec2(88, 3), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W3, ivec2(89, 3), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W3, ivec2(90, 3), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W3, ivec2(91, 3), 0);
        vec4 v1_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W3, ivec2(92, 3), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W3, ivec2(93, 3), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W3, ivec2(94, 3), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W3, ivec2(95, 3), 0);
        vec4 v2_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W3, ivec2(96, 3), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W3, ivec2(97, 3), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W3, ivec2(98, 3), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W3, ivec2(99, 3), 0);
        vec4 v2_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W3, ivec2(100, 3), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W3, ivec2(101, 3), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W3, ivec2(102, 3), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W3, ivec2(103, 3), 0);
        vec4 v2_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W3, ivec2(104, 3), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W3, ivec2(105, 3), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W3, ivec2(106, 3), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W3, ivec2(107, 3), 0);
        vec4 v2_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W3, ivec2(108, 3), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W3, ivec2(109, 3), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W3, ivec2(110, 3), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W3, ivec2(111, 3), 0);
        vec4 v2_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W3, ivec2(112, 3), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W3, ivec2(113, 3), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W3, ivec2(114, 3), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W3, ivec2(115, 3), 0);
        vec4 v2_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W3, ivec2(116, 3), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W3, ivec2(117, 3), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W3, ivec2(118, 3), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W3, ivec2(119, 3), 0);
        vec4 v2_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W3, ivec2(120, 3), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W3, ivec2(121, 3), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W3, ivec2(122, 3), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W3, ivec2(123, 3), 0);
        vec4 v2_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W3, ivec2(124, 3), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W3, ivec2(125, 3), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W3, ivec2(126, 3), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W3, ivec2(127, 3), 0);
        vec4 v2_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W3, ivec2(128, 3), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W3, ivec2(129, 3), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W3, ivec2(130, 3), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W3, ivec2(131, 3), 0);
        vec4 v2_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W3, ivec2(132, 3), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W3, ivec2(133, 3), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W3, ivec2(134, 3), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W3, ivec2(135, 3), 0);
        vec4 v2_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W3, ivec2(136, 3), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W3, ivec2(137, 3), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W3, ivec2(138, 3), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W3, ivec2(139, 3), 0);
        vec4 v2_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W3, ivec2(140, 3), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W3, ivec2(141, 3), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W3, ivec2(142, 3), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W3, ivec2(143, 3), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W3, ivec2(0, 3), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W3, ivec2(1, 3), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W3, ivec2(2, 3), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W3, ivec2(3, 3), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W3, ivec2(4, 3), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W3, ivec2(5, 3), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W3, ivec2(6, 3), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W3, ivec2(7, 3), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W3, ivec2(8, 3), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W3, ivec2(9, 3), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W3, ivec2(10, 3), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W3, ivec2(11, 3), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W3, ivec2(12, 3), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W3, ivec2(13, 3), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W3, ivec2(14, 3), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W3, ivec2(15, 3), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W3, ivec2(16, 3), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W3, ivec2(17, 3), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W3, ivec2(18, 3), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W3, ivec2(19, 3), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W3, ivec2(20, 3), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W3, ivec2(21, 3), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W3, ivec2(22, 3), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W3, ivec2(23, 3), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W3, ivec2(24, 3), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W3, ivec2(25, 3), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W3, ivec2(26, 3), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W3, ivec2(27, 3), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W3, ivec2(28, 3), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W3, ivec2(29, 3), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W3, ivec2(30, 3), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W3, ivec2(31, 3), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W3, ivec2(32, 3), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W3, ivec2(33, 3), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W3, ivec2(34, 3), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W3, ivec2(35, 3), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W3, ivec2(36, 3), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W3, ivec2(37, 3), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W3, ivec2(38, 3), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W3, ivec2(39, 3), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W3, ivec2(40, 3), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W3, ivec2(41, 3), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W3, ivec2(42, 3), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W3, ivec2(43, 3), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W3, ivec2(44, 3), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W3, ivec2(45, 3), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W3, ivec2(46, 3), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W3, ivec2(47, 3), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W3, ivec2(48, 3), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W3, ivec2(49, 3), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W3, ivec2(50, 3), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W3, ivec2(51, 3), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W3, ivec2(52, 3), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W3, ivec2(53, 3), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W3, ivec2(54, 3), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W3, ivec2(55, 3), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W3, ivec2(56, 3), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W3, ivec2(57, 3), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W3, ivec2(58, 3), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W3, ivec2(59, 3), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W3, ivec2(60, 3), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W3, ivec2(61, 3), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W3, ivec2(62, 3), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W3, ivec2(63, 3), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W3, ivec2(64, 3), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W3, ivec2(65, 3), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W3, ivec2(66, 3), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W3, ivec2(67, 3), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W3, ivec2(68, 3), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W3, ivec2(69, 3), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W3, ivec2(70, 3), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W3, ivec2(71, 3), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W3, ivec2(72, 3), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W3, ivec2(73, 3), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W3, ivec2(74, 3), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W3, ivec2(75, 3), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W3, ivec2(76, 3), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W3, ivec2(77, 3), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W3, ivec2(78, 3), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W3, ivec2(79, 3), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W3, ivec2(80, 3), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W3, ivec2(81, 3), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W3, ivec2(82, 3), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W3, ivec2(83, 3), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W3, ivec2(84, 3), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W3, ivec2(85, 3), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W3, ivec2(86, 3), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W3, ivec2(87, 3), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W3, ivec2(88, 3), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W3, ivec2(89, 3), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W3, ivec2(90, 3), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W3, ivec2(91, 3), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W3, ivec2(92, 3), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W3, ivec2(93, 3), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W3, ivec2(94, 3), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W3, ivec2(95, 3), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W3, ivec2(96, 3), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W3, ivec2(97, 3), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W3, ivec2(98, 3), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W3, ivec2(99, 3), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W3, ivec2(100, 3), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W3, ivec2(101, 3), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W3, ivec2(102, 3), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W3, ivec2(103, 3), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W3, ivec2(104, 3), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W3, ivec2(105, 3), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W3, ivec2(106, 3), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W3, ivec2(107, 3), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W3, ivec2(108, 3), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W3, ivec2(109, 3), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W3, ivec2(110, 3), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W3, ivec2(111, 3), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W3, ivec2(112, 3), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W3, ivec2(113, 3), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W3, ivec2(114, 3), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W3, ivec2(115, 3), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W3, ivec2(116, 3), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W3, ivec2(117, 3), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W3, ivec2(118, 3), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W3, ivec2(119, 3), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W3, ivec2(120, 3), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W3, ivec2(121, 3), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W3, ivec2(122, 3), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W3, ivec2(123, 3), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W3, ivec2(124, 3), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W3, ivec2(125, 3), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W3, ivec2(126, 3), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W3, ivec2(127, 3), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F2_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F2_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F2_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F2_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W3, ivec2(128, 3), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W3, ivec2(129, 3), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W3, ivec2(130, 3), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W3, ivec2(131, 3), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W3, ivec2(132, 3), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W3, ivec2(133, 3), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W3, ivec2(134, 3), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W3, ivec2(135, 3), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W3, ivec2(136, 3), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W3, ivec2(137, 3), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W3, ivec2(138, 3), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W3, ivec2(139, 3), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W3, ivec2(140, 3), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W3, ivec2(141, 3), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W3, ivec2(142, 3), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W3, ivec2(143, 3), 0);
    }
    sum += vec4(0.04351148768,0.04284147146,-0.07493391135,0.1368466782);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.008162499405, -128), quantize(sum.y, 0.008162499405, -128), quantize(sum.z, 0.008162499405, -128), quantize(sum.w, 0.008162499405, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W4
//!BIND F3_0
//!BIND F3_1
//!BIND F3_2
//!BIND F3_3
//!SAVE F4_0
//!DESC [ARM_SESR_M5_QAT_int8] conv 4 output 0
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W4, ivec2(0, 0), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W4, ivec2(1, 0), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W4, ivec2(2, 0), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W4, ivec2(3, 0), 0);
        vec4 v0_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W4, ivec2(4, 0), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W4, ivec2(5, 0), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W4, ivec2(6, 0), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W4, ivec2(7, 0), 0);
        vec4 v0_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W4, ivec2(8, 0), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W4, ivec2(9, 0), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W4, ivec2(10, 0), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W4, ivec2(11, 0), 0);
        vec4 v0_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W4, ivec2(12, 0), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W4, ivec2(13, 0), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W4, ivec2(14, 0), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W4, ivec2(15, 0), 0);
        vec4 v0_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W4, ivec2(16, 0), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W4, ivec2(17, 0), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W4, ivec2(18, 0), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W4, ivec2(19, 0), 0);
        vec4 v0_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W4, ivec2(20, 0), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W4, ivec2(21, 0), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W4, ivec2(22, 0), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W4, ivec2(23, 0), 0);
        vec4 v0_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W4, ivec2(24, 0), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W4, ivec2(25, 0), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W4, ivec2(26, 0), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W4, ivec2(27, 0), 0);
        vec4 v0_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W4, ivec2(28, 0), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W4, ivec2(29, 0), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W4, ivec2(30, 0), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W4, ivec2(31, 0), 0);
        vec4 v0_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W4, ivec2(32, 0), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W4, ivec2(33, 0), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W4, ivec2(34, 0), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W4, ivec2(35, 0), 0);
        vec4 v0_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W4, ivec2(36, 0), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W4, ivec2(37, 0), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W4, ivec2(38, 0), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W4, ivec2(39, 0), 0);
        vec4 v0_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W4, ivec2(40, 0), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W4, ivec2(41, 0), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W4, ivec2(42, 0), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W4, ivec2(43, 0), 0);
        vec4 v0_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W4, ivec2(44, 0), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W4, ivec2(45, 0), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W4, ivec2(46, 0), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W4, ivec2(47, 0), 0);
        vec4 v1_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W4, ivec2(48, 0), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W4, ivec2(49, 0), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W4, ivec2(50, 0), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W4, ivec2(51, 0), 0);
        vec4 v1_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W4, ivec2(52, 0), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W4, ivec2(53, 0), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W4, ivec2(54, 0), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W4, ivec2(55, 0), 0);
        vec4 v1_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W4, ivec2(56, 0), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W4, ivec2(57, 0), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W4, ivec2(58, 0), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W4, ivec2(59, 0), 0);
        vec4 v1_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W4, ivec2(60, 0), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W4, ivec2(61, 0), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W4, ivec2(62, 0), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W4, ivec2(63, 0), 0);
        vec4 v1_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W4, ivec2(64, 0), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W4, ivec2(65, 0), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W4, ivec2(66, 0), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W4, ivec2(67, 0), 0);
        vec4 v1_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W4, ivec2(68, 0), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W4, ivec2(69, 0), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W4, ivec2(70, 0), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W4, ivec2(71, 0), 0);
        vec4 v1_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W4, ivec2(72, 0), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W4, ivec2(73, 0), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W4, ivec2(74, 0), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W4, ivec2(75, 0), 0);
        vec4 v1_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W4, ivec2(76, 0), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W4, ivec2(77, 0), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W4, ivec2(78, 0), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W4, ivec2(79, 0), 0);
        vec4 v1_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W4, ivec2(80, 0), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W4, ivec2(81, 0), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W4, ivec2(82, 0), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W4, ivec2(83, 0), 0);
        vec4 v1_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W4, ivec2(84, 0), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W4, ivec2(85, 0), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W4, ivec2(86, 0), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W4, ivec2(87, 0), 0);
        vec4 v1_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W4, ivec2(88, 0), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W4, ivec2(89, 0), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W4, ivec2(90, 0), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W4, ivec2(91, 0), 0);
        vec4 v1_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W4, ivec2(92, 0), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W4, ivec2(93, 0), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W4, ivec2(94, 0), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W4, ivec2(95, 0), 0);
        vec4 v2_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W4, ivec2(96, 0), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W4, ivec2(97, 0), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W4, ivec2(98, 0), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W4, ivec2(99, 0), 0);
        vec4 v2_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W4, ivec2(100, 0), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W4, ivec2(101, 0), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W4, ivec2(102, 0), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W4, ivec2(103, 0), 0);
        vec4 v2_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W4, ivec2(104, 0), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W4, ivec2(105, 0), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W4, ivec2(106, 0), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W4, ivec2(107, 0), 0);
        vec4 v2_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W4, ivec2(108, 0), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W4, ivec2(109, 0), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W4, ivec2(110, 0), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W4, ivec2(111, 0), 0);
        vec4 v2_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W4, ivec2(112, 0), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W4, ivec2(113, 0), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W4, ivec2(114, 0), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W4, ivec2(115, 0), 0);
        vec4 v2_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W4, ivec2(116, 0), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W4, ivec2(117, 0), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W4, ivec2(118, 0), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W4, ivec2(119, 0), 0);
        vec4 v2_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W4, ivec2(120, 0), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W4, ivec2(121, 0), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W4, ivec2(122, 0), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W4, ivec2(123, 0), 0);
        vec4 v2_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W4, ivec2(124, 0), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W4, ivec2(125, 0), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W4, ivec2(126, 0), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W4, ivec2(127, 0), 0);
        vec4 v2_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W4, ivec2(128, 0), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W4, ivec2(129, 0), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W4, ivec2(130, 0), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W4, ivec2(131, 0), 0);
        vec4 v2_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W4, ivec2(132, 0), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W4, ivec2(133, 0), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W4, ivec2(134, 0), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W4, ivec2(135, 0), 0);
        vec4 v2_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W4, ivec2(136, 0), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W4, ivec2(137, 0), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W4, ivec2(138, 0), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W4, ivec2(139, 0), 0);
        vec4 v2_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W4, ivec2(140, 0), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W4, ivec2(141, 0), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W4, ivec2(142, 0), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W4, ivec2(143, 0), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W4, ivec2(0, 0), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W4, ivec2(1, 0), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W4, ivec2(2, 0), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W4, ivec2(3, 0), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W4, ivec2(4, 0), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W4, ivec2(5, 0), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W4, ivec2(6, 0), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W4, ivec2(7, 0), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W4, ivec2(8, 0), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W4, ivec2(9, 0), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W4, ivec2(10, 0), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W4, ivec2(11, 0), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W4, ivec2(12, 0), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W4, ivec2(13, 0), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W4, ivec2(14, 0), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W4, ivec2(15, 0), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W4, ivec2(16, 0), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W4, ivec2(17, 0), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W4, ivec2(18, 0), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W4, ivec2(19, 0), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W4, ivec2(20, 0), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W4, ivec2(21, 0), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W4, ivec2(22, 0), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W4, ivec2(23, 0), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W4, ivec2(24, 0), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W4, ivec2(25, 0), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W4, ivec2(26, 0), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W4, ivec2(27, 0), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W4, ivec2(28, 0), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W4, ivec2(29, 0), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W4, ivec2(30, 0), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W4, ivec2(31, 0), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W4, ivec2(32, 0), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W4, ivec2(33, 0), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W4, ivec2(34, 0), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W4, ivec2(35, 0), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W4, ivec2(36, 0), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W4, ivec2(37, 0), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W4, ivec2(38, 0), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W4, ivec2(39, 0), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W4, ivec2(40, 0), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W4, ivec2(41, 0), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W4, ivec2(42, 0), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W4, ivec2(43, 0), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W4, ivec2(44, 0), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W4, ivec2(45, 0), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W4, ivec2(46, 0), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W4, ivec2(47, 0), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W4, ivec2(48, 0), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W4, ivec2(49, 0), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W4, ivec2(50, 0), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W4, ivec2(51, 0), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W4, ivec2(52, 0), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W4, ivec2(53, 0), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W4, ivec2(54, 0), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W4, ivec2(55, 0), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W4, ivec2(56, 0), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W4, ivec2(57, 0), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W4, ivec2(58, 0), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W4, ivec2(59, 0), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W4, ivec2(60, 0), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W4, ivec2(61, 0), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W4, ivec2(62, 0), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W4, ivec2(63, 0), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W4, ivec2(64, 0), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W4, ivec2(65, 0), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W4, ivec2(66, 0), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W4, ivec2(67, 0), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W4, ivec2(68, 0), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W4, ivec2(69, 0), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W4, ivec2(70, 0), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W4, ivec2(71, 0), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W4, ivec2(72, 0), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W4, ivec2(73, 0), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W4, ivec2(74, 0), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W4, ivec2(75, 0), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W4, ivec2(76, 0), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W4, ivec2(77, 0), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W4, ivec2(78, 0), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W4, ivec2(79, 0), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W4, ivec2(80, 0), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W4, ivec2(81, 0), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W4, ivec2(82, 0), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W4, ivec2(83, 0), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W4, ivec2(84, 0), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W4, ivec2(85, 0), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W4, ivec2(86, 0), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W4, ivec2(87, 0), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W4, ivec2(88, 0), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W4, ivec2(89, 0), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W4, ivec2(90, 0), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W4, ivec2(91, 0), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W4, ivec2(92, 0), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W4, ivec2(93, 0), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W4, ivec2(94, 0), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W4, ivec2(95, 0), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W4, ivec2(96, 0), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W4, ivec2(97, 0), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W4, ivec2(98, 0), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W4, ivec2(99, 0), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W4, ivec2(100, 0), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W4, ivec2(101, 0), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W4, ivec2(102, 0), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W4, ivec2(103, 0), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W4, ivec2(104, 0), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W4, ivec2(105, 0), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W4, ivec2(106, 0), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W4, ivec2(107, 0), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W4, ivec2(108, 0), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W4, ivec2(109, 0), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W4, ivec2(110, 0), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W4, ivec2(111, 0), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W4, ivec2(112, 0), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W4, ivec2(113, 0), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W4, ivec2(114, 0), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W4, ivec2(115, 0), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W4, ivec2(116, 0), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W4, ivec2(117, 0), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W4, ivec2(118, 0), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W4, ivec2(119, 0), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W4, ivec2(120, 0), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W4, ivec2(121, 0), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W4, ivec2(122, 0), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W4, ivec2(123, 0), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W4, ivec2(124, 0), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W4, ivec2(125, 0), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W4, ivec2(126, 0), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W4, ivec2(127, 0), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W4, ivec2(128, 0), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W4, ivec2(129, 0), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W4, ivec2(130, 0), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W4, ivec2(131, 0), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W4, ivec2(132, 0), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W4, ivec2(133, 0), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W4, ivec2(134, 0), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W4, ivec2(135, 0), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W4, ivec2(136, 0), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W4, ivec2(137, 0), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W4, ivec2(138, 0), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W4, ivec2(139, 0), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W4, ivec2(140, 0), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W4, ivec2(141, 0), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W4, ivec2(142, 0), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W4, ivec2(143, 0), 0);
    }
    sum += vec4(-0.04540045696,-0.1316016702,-0.05167791824,-0.05807536723);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.01259312406, -128), quantize(sum.y, 0.01259312406, -128), quantize(sum.z, 0.01259312406, -128), quantize(sum.w, 0.01259312406, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W4
//!BIND F3_0
//!BIND F3_1
//!BIND F3_2
//!BIND F3_3
//!SAVE F4_1
//!DESC [ARM_SESR_M5_QAT_int8] conv 4 output 1
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W4, ivec2(0, 1), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W4, ivec2(1, 1), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W4, ivec2(2, 1), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W4, ivec2(3, 1), 0);
        vec4 v0_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W4, ivec2(4, 1), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W4, ivec2(5, 1), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W4, ivec2(6, 1), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W4, ivec2(7, 1), 0);
        vec4 v0_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W4, ivec2(8, 1), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W4, ivec2(9, 1), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W4, ivec2(10, 1), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W4, ivec2(11, 1), 0);
        vec4 v0_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W4, ivec2(12, 1), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W4, ivec2(13, 1), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W4, ivec2(14, 1), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W4, ivec2(15, 1), 0);
        vec4 v0_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W4, ivec2(16, 1), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W4, ivec2(17, 1), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W4, ivec2(18, 1), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W4, ivec2(19, 1), 0);
        vec4 v0_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W4, ivec2(20, 1), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W4, ivec2(21, 1), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W4, ivec2(22, 1), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W4, ivec2(23, 1), 0);
        vec4 v0_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W4, ivec2(24, 1), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W4, ivec2(25, 1), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W4, ivec2(26, 1), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W4, ivec2(27, 1), 0);
        vec4 v0_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W4, ivec2(28, 1), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W4, ivec2(29, 1), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W4, ivec2(30, 1), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W4, ivec2(31, 1), 0);
        vec4 v0_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W4, ivec2(32, 1), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W4, ivec2(33, 1), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W4, ivec2(34, 1), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W4, ivec2(35, 1), 0);
        vec4 v0_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W4, ivec2(36, 1), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W4, ivec2(37, 1), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W4, ivec2(38, 1), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W4, ivec2(39, 1), 0);
        vec4 v0_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W4, ivec2(40, 1), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W4, ivec2(41, 1), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W4, ivec2(42, 1), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W4, ivec2(43, 1), 0);
        vec4 v0_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W4, ivec2(44, 1), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W4, ivec2(45, 1), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W4, ivec2(46, 1), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W4, ivec2(47, 1), 0);
        vec4 v1_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W4, ivec2(48, 1), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W4, ivec2(49, 1), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W4, ivec2(50, 1), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W4, ivec2(51, 1), 0);
        vec4 v1_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W4, ivec2(52, 1), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W4, ivec2(53, 1), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W4, ivec2(54, 1), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W4, ivec2(55, 1), 0);
        vec4 v1_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W4, ivec2(56, 1), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W4, ivec2(57, 1), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W4, ivec2(58, 1), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W4, ivec2(59, 1), 0);
        vec4 v1_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W4, ivec2(60, 1), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W4, ivec2(61, 1), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W4, ivec2(62, 1), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W4, ivec2(63, 1), 0);
        vec4 v1_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W4, ivec2(64, 1), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W4, ivec2(65, 1), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W4, ivec2(66, 1), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W4, ivec2(67, 1), 0);
        vec4 v1_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W4, ivec2(68, 1), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W4, ivec2(69, 1), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W4, ivec2(70, 1), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W4, ivec2(71, 1), 0);
        vec4 v1_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W4, ivec2(72, 1), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W4, ivec2(73, 1), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W4, ivec2(74, 1), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W4, ivec2(75, 1), 0);
        vec4 v1_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W4, ivec2(76, 1), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W4, ivec2(77, 1), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W4, ivec2(78, 1), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W4, ivec2(79, 1), 0);
        vec4 v1_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W4, ivec2(80, 1), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W4, ivec2(81, 1), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W4, ivec2(82, 1), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W4, ivec2(83, 1), 0);
        vec4 v1_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W4, ivec2(84, 1), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W4, ivec2(85, 1), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W4, ivec2(86, 1), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W4, ivec2(87, 1), 0);
        vec4 v1_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W4, ivec2(88, 1), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W4, ivec2(89, 1), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W4, ivec2(90, 1), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W4, ivec2(91, 1), 0);
        vec4 v1_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W4, ivec2(92, 1), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W4, ivec2(93, 1), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W4, ivec2(94, 1), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W4, ivec2(95, 1), 0);
        vec4 v2_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W4, ivec2(96, 1), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W4, ivec2(97, 1), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W4, ivec2(98, 1), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W4, ivec2(99, 1), 0);
        vec4 v2_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W4, ivec2(100, 1), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W4, ivec2(101, 1), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W4, ivec2(102, 1), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W4, ivec2(103, 1), 0);
        vec4 v2_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W4, ivec2(104, 1), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W4, ivec2(105, 1), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W4, ivec2(106, 1), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W4, ivec2(107, 1), 0);
        vec4 v2_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W4, ivec2(108, 1), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W4, ivec2(109, 1), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W4, ivec2(110, 1), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W4, ivec2(111, 1), 0);
        vec4 v2_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W4, ivec2(112, 1), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W4, ivec2(113, 1), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W4, ivec2(114, 1), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W4, ivec2(115, 1), 0);
        vec4 v2_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W4, ivec2(116, 1), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W4, ivec2(117, 1), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W4, ivec2(118, 1), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W4, ivec2(119, 1), 0);
        vec4 v2_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W4, ivec2(120, 1), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W4, ivec2(121, 1), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W4, ivec2(122, 1), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W4, ivec2(123, 1), 0);
        vec4 v2_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W4, ivec2(124, 1), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W4, ivec2(125, 1), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W4, ivec2(126, 1), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W4, ivec2(127, 1), 0);
        vec4 v2_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W4, ivec2(128, 1), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W4, ivec2(129, 1), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W4, ivec2(130, 1), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W4, ivec2(131, 1), 0);
        vec4 v2_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W4, ivec2(132, 1), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W4, ivec2(133, 1), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W4, ivec2(134, 1), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W4, ivec2(135, 1), 0);
        vec4 v2_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W4, ivec2(136, 1), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W4, ivec2(137, 1), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W4, ivec2(138, 1), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W4, ivec2(139, 1), 0);
        vec4 v2_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W4, ivec2(140, 1), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W4, ivec2(141, 1), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W4, ivec2(142, 1), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W4, ivec2(143, 1), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W4, ivec2(0, 1), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W4, ivec2(1, 1), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W4, ivec2(2, 1), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W4, ivec2(3, 1), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W4, ivec2(4, 1), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W4, ivec2(5, 1), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W4, ivec2(6, 1), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W4, ivec2(7, 1), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W4, ivec2(8, 1), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W4, ivec2(9, 1), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W4, ivec2(10, 1), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W4, ivec2(11, 1), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W4, ivec2(12, 1), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W4, ivec2(13, 1), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W4, ivec2(14, 1), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W4, ivec2(15, 1), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W4, ivec2(16, 1), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W4, ivec2(17, 1), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W4, ivec2(18, 1), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W4, ivec2(19, 1), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W4, ivec2(20, 1), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W4, ivec2(21, 1), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W4, ivec2(22, 1), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W4, ivec2(23, 1), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W4, ivec2(24, 1), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W4, ivec2(25, 1), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W4, ivec2(26, 1), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W4, ivec2(27, 1), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W4, ivec2(28, 1), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W4, ivec2(29, 1), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W4, ivec2(30, 1), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W4, ivec2(31, 1), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W4, ivec2(32, 1), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W4, ivec2(33, 1), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W4, ivec2(34, 1), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W4, ivec2(35, 1), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W4, ivec2(36, 1), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W4, ivec2(37, 1), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W4, ivec2(38, 1), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W4, ivec2(39, 1), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W4, ivec2(40, 1), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W4, ivec2(41, 1), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W4, ivec2(42, 1), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W4, ivec2(43, 1), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W4, ivec2(44, 1), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W4, ivec2(45, 1), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W4, ivec2(46, 1), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W4, ivec2(47, 1), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W4, ivec2(48, 1), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W4, ivec2(49, 1), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W4, ivec2(50, 1), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W4, ivec2(51, 1), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W4, ivec2(52, 1), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W4, ivec2(53, 1), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W4, ivec2(54, 1), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W4, ivec2(55, 1), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W4, ivec2(56, 1), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W4, ivec2(57, 1), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W4, ivec2(58, 1), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W4, ivec2(59, 1), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W4, ivec2(60, 1), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W4, ivec2(61, 1), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W4, ivec2(62, 1), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W4, ivec2(63, 1), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W4, ivec2(64, 1), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W4, ivec2(65, 1), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W4, ivec2(66, 1), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W4, ivec2(67, 1), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W4, ivec2(68, 1), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W4, ivec2(69, 1), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W4, ivec2(70, 1), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W4, ivec2(71, 1), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W4, ivec2(72, 1), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W4, ivec2(73, 1), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W4, ivec2(74, 1), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W4, ivec2(75, 1), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W4, ivec2(76, 1), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W4, ivec2(77, 1), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W4, ivec2(78, 1), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W4, ivec2(79, 1), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W4, ivec2(80, 1), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W4, ivec2(81, 1), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W4, ivec2(82, 1), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W4, ivec2(83, 1), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W4, ivec2(84, 1), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W4, ivec2(85, 1), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W4, ivec2(86, 1), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W4, ivec2(87, 1), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W4, ivec2(88, 1), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W4, ivec2(89, 1), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W4, ivec2(90, 1), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W4, ivec2(91, 1), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W4, ivec2(92, 1), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W4, ivec2(93, 1), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W4, ivec2(94, 1), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W4, ivec2(95, 1), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W4, ivec2(96, 1), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W4, ivec2(97, 1), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W4, ivec2(98, 1), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W4, ivec2(99, 1), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W4, ivec2(100, 1), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W4, ivec2(101, 1), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W4, ivec2(102, 1), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W4, ivec2(103, 1), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W4, ivec2(104, 1), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W4, ivec2(105, 1), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W4, ivec2(106, 1), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W4, ivec2(107, 1), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W4, ivec2(108, 1), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W4, ivec2(109, 1), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W4, ivec2(110, 1), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W4, ivec2(111, 1), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W4, ivec2(112, 1), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W4, ivec2(113, 1), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W4, ivec2(114, 1), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W4, ivec2(115, 1), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W4, ivec2(116, 1), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W4, ivec2(117, 1), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W4, ivec2(118, 1), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W4, ivec2(119, 1), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W4, ivec2(120, 1), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W4, ivec2(121, 1), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W4, ivec2(122, 1), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W4, ivec2(123, 1), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W4, ivec2(124, 1), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W4, ivec2(125, 1), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W4, ivec2(126, 1), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W4, ivec2(127, 1), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W4, ivec2(128, 1), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W4, ivec2(129, 1), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W4, ivec2(130, 1), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W4, ivec2(131, 1), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W4, ivec2(132, 1), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W4, ivec2(133, 1), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W4, ivec2(134, 1), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W4, ivec2(135, 1), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W4, ivec2(136, 1), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W4, ivec2(137, 1), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W4, ivec2(138, 1), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W4, ivec2(139, 1), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W4, ivec2(140, 1), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W4, ivec2(141, 1), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W4, ivec2(142, 1), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W4, ivec2(143, 1), 0);
    }
    sum += vec4(-0.01788968466,-0.08506585356,-0.1248505499,-0.0575196633);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.01259312406, -128), quantize(sum.y, 0.01259312406, -128), quantize(sum.z, 0.01259312406, -128), quantize(sum.w, 0.01259312406, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W4
//!BIND F3_0
//!BIND F3_1
//!BIND F3_2
//!BIND F3_3
//!SAVE F4_2
//!DESC [ARM_SESR_M5_QAT_int8] conv 4 output 2
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W4, ivec2(0, 2), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W4, ivec2(1, 2), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W4, ivec2(2, 2), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W4, ivec2(3, 2), 0);
        vec4 v0_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W4, ivec2(4, 2), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W4, ivec2(5, 2), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W4, ivec2(6, 2), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W4, ivec2(7, 2), 0);
        vec4 v0_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W4, ivec2(8, 2), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W4, ivec2(9, 2), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W4, ivec2(10, 2), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W4, ivec2(11, 2), 0);
        vec4 v0_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W4, ivec2(12, 2), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W4, ivec2(13, 2), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W4, ivec2(14, 2), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W4, ivec2(15, 2), 0);
        vec4 v0_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W4, ivec2(16, 2), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W4, ivec2(17, 2), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W4, ivec2(18, 2), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W4, ivec2(19, 2), 0);
        vec4 v0_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W4, ivec2(20, 2), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W4, ivec2(21, 2), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W4, ivec2(22, 2), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W4, ivec2(23, 2), 0);
        vec4 v0_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W4, ivec2(24, 2), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W4, ivec2(25, 2), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W4, ivec2(26, 2), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W4, ivec2(27, 2), 0);
        vec4 v0_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W4, ivec2(28, 2), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W4, ivec2(29, 2), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W4, ivec2(30, 2), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W4, ivec2(31, 2), 0);
        vec4 v0_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W4, ivec2(32, 2), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W4, ivec2(33, 2), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W4, ivec2(34, 2), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W4, ivec2(35, 2), 0);
        vec4 v0_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W4, ivec2(36, 2), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W4, ivec2(37, 2), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W4, ivec2(38, 2), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W4, ivec2(39, 2), 0);
        vec4 v0_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W4, ivec2(40, 2), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W4, ivec2(41, 2), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W4, ivec2(42, 2), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W4, ivec2(43, 2), 0);
        vec4 v0_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W4, ivec2(44, 2), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W4, ivec2(45, 2), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W4, ivec2(46, 2), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W4, ivec2(47, 2), 0);
        vec4 v1_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W4, ivec2(48, 2), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W4, ivec2(49, 2), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W4, ivec2(50, 2), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W4, ivec2(51, 2), 0);
        vec4 v1_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W4, ivec2(52, 2), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W4, ivec2(53, 2), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W4, ivec2(54, 2), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W4, ivec2(55, 2), 0);
        vec4 v1_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W4, ivec2(56, 2), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W4, ivec2(57, 2), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W4, ivec2(58, 2), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W4, ivec2(59, 2), 0);
        vec4 v1_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W4, ivec2(60, 2), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W4, ivec2(61, 2), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W4, ivec2(62, 2), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W4, ivec2(63, 2), 0);
        vec4 v1_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W4, ivec2(64, 2), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W4, ivec2(65, 2), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W4, ivec2(66, 2), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W4, ivec2(67, 2), 0);
        vec4 v1_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W4, ivec2(68, 2), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W4, ivec2(69, 2), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W4, ivec2(70, 2), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W4, ivec2(71, 2), 0);
        vec4 v1_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W4, ivec2(72, 2), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W4, ivec2(73, 2), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W4, ivec2(74, 2), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W4, ivec2(75, 2), 0);
        vec4 v1_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W4, ivec2(76, 2), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W4, ivec2(77, 2), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W4, ivec2(78, 2), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W4, ivec2(79, 2), 0);
        vec4 v1_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W4, ivec2(80, 2), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W4, ivec2(81, 2), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W4, ivec2(82, 2), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W4, ivec2(83, 2), 0);
        vec4 v1_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W4, ivec2(84, 2), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W4, ivec2(85, 2), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W4, ivec2(86, 2), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W4, ivec2(87, 2), 0);
        vec4 v1_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W4, ivec2(88, 2), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W4, ivec2(89, 2), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W4, ivec2(90, 2), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W4, ivec2(91, 2), 0);
        vec4 v1_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W4, ivec2(92, 2), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W4, ivec2(93, 2), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W4, ivec2(94, 2), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W4, ivec2(95, 2), 0);
        vec4 v2_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W4, ivec2(96, 2), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W4, ivec2(97, 2), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W4, ivec2(98, 2), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W4, ivec2(99, 2), 0);
        vec4 v2_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W4, ivec2(100, 2), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W4, ivec2(101, 2), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W4, ivec2(102, 2), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W4, ivec2(103, 2), 0);
        vec4 v2_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W4, ivec2(104, 2), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W4, ivec2(105, 2), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W4, ivec2(106, 2), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W4, ivec2(107, 2), 0);
        vec4 v2_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W4, ivec2(108, 2), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W4, ivec2(109, 2), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W4, ivec2(110, 2), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W4, ivec2(111, 2), 0);
        vec4 v2_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W4, ivec2(112, 2), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W4, ivec2(113, 2), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W4, ivec2(114, 2), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W4, ivec2(115, 2), 0);
        vec4 v2_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W4, ivec2(116, 2), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W4, ivec2(117, 2), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W4, ivec2(118, 2), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W4, ivec2(119, 2), 0);
        vec4 v2_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W4, ivec2(120, 2), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W4, ivec2(121, 2), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W4, ivec2(122, 2), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W4, ivec2(123, 2), 0);
        vec4 v2_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W4, ivec2(124, 2), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W4, ivec2(125, 2), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W4, ivec2(126, 2), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W4, ivec2(127, 2), 0);
        vec4 v2_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W4, ivec2(128, 2), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W4, ivec2(129, 2), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W4, ivec2(130, 2), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W4, ivec2(131, 2), 0);
        vec4 v2_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W4, ivec2(132, 2), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W4, ivec2(133, 2), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W4, ivec2(134, 2), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W4, ivec2(135, 2), 0);
        vec4 v2_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W4, ivec2(136, 2), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W4, ivec2(137, 2), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W4, ivec2(138, 2), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W4, ivec2(139, 2), 0);
        vec4 v2_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W4, ivec2(140, 2), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W4, ivec2(141, 2), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W4, ivec2(142, 2), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W4, ivec2(143, 2), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W4, ivec2(0, 2), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W4, ivec2(1, 2), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W4, ivec2(2, 2), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W4, ivec2(3, 2), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W4, ivec2(4, 2), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W4, ivec2(5, 2), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W4, ivec2(6, 2), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W4, ivec2(7, 2), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W4, ivec2(8, 2), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W4, ivec2(9, 2), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W4, ivec2(10, 2), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W4, ivec2(11, 2), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W4, ivec2(12, 2), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W4, ivec2(13, 2), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W4, ivec2(14, 2), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W4, ivec2(15, 2), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W4, ivec2(16, 2), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W4, ivec2(17, 2), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W4, ivec2(18, 2), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W4, ivec2(19, 2), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W4, ivec2(20, 2), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W4, ivec2(21, 2), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W4, ivec2(22, 2), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W4, ivec2(23, 2), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W4, ivec2(24, 2), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W4, ivec2(25, 2), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W4, ivec2(26, 2), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W4, ivec2(27, 2), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W4, ivec2(28, 2), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W4, ivec2(29, 2), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W4, ivec2(30, 2), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W4, ivec2(31, 2), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W4, ivec2(32, 2), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W4, ivec2(33, 2), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W4, ivec2(34, 2), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W4, ivec2(35, 2), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W4, ivec2(36, 2), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W4, ivec2(37, 2), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W4, ivec2(38, 2), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W4, ivec2(39, 2), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W4, ivec2(40, 2), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W4, ivec2(41, 2), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W4, ivec2(42, 2), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W4, ivec2(43, 2), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W4, ivec2(44, 2), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W4, ivec2(45, 2), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W4, ivec2(46, 2), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W4, ivec2(47, 2), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W4, ivec2(48, 2), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W4, ivec2(49, 2), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W4, ivec2(50, 2), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W4, ivec2(51, 2), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W4, ivec2(52, 2), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W4, ivec2(53, 2), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W4, ivec2(54, 2), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W4, ivec2(55, 2), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W4, ivec2(56, 2), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W4, ivec2(57, 2), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W4, ivec2(58, 2), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W4, ivec2(59, 2), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W4, ivec2(60, 2), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W4, ivec2(61, 2), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W4, ivec2(62, 2), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W4, ivec2(63, 2), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W4, ivec2(64, 2), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W4, ivec2(65, 2), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W4, ivec2(66, 2), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W4, ivec2(67, 2), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W4, ivec2(68, 2), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W4, ivec2(69, 2), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W4, ivec2(70, 2), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W4, ivec2(71, 2), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W4, ivec2(72, 2), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W4, ivec2(73, 2), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W4, ivec2(74, 2), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W4, ivec2(75, 2), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W4, ivec2(76, 2), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W4, ivec2(77, 2), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W4, ivec2(78, 2), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W4, ivec2(79, 2), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W4, ivec2(80, 2), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W4, ivec2(81, 2), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W4, ivec2(82, 2), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W4, ivec2(83, 2), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W4, ivec2(84, 2), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W4, ivec2(85, 2), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W4, ivec2(86, 2), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W4, ivec2(87, 2), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W4, ivec2(88, 2), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W4, ivec2(89, 2), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W4, ivec2(90, 2), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W4, ivec2(91, 2), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W4, ivec2(92, 2), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W4, ivec2(93, 2), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W4, ivec2(94, 2), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W4, ivec2(95, 2), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W4, ivec2(96, 2), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W4, ivec2(97, 2), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W4, ivec2(98, 2), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W4, ivec2(99, 2), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W4, ivec2(100, 2), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W4, ivec2(101, 2), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W4, ivec2(102, 2), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W4, ivec2(103, 2), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W4, ivec2(104, 2), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W4, ivec2(105, 2), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W4, ivec2(106, 2), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W4, ivec2(107, 2), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W4, ivec2(108, 2), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W4, ivec2(109, 2), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W4, ivec2(110, 2), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W4, ivec2(111, 2), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W4, ivec2(112, 2), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W4, ivec2(113, 2), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W4, ivec2(114, 2), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W4, ivec2(115, 2), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W4, ivec2(116, 2), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W4, ivec2(117, 2), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W4, ivec2(118, 2), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W4, ivec2(119, 2), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W4, ivec2(120, 2), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W4, ivec2(121, 2), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W4, ivec2(122, 2), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W4, ivec2(123, 2), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W4, ivec2(124, 2), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W4, ivec2(125, 2), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W4, ivec2(126, 2), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W4, ivec2(127, 2), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W4, ivec2(128, 2), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W4, ivec2(129, 2), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W4, ivec2(130, 2), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W4, ivec2(131, 2), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W4, ivec2(132, 2), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W4, ivec2(133, 2), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W4, ivec2(134, 2), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W4, ivec2(135, 2), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W4, ivec2(136, 2), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W4, ivec2(137, 2), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W4, ivec2(138, 2), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W4, ivec2(139, 2), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W4, ivec2(140, 2), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W4, ivec2(141, 2), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W4, ivec2(142, 2), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W4, ivec2(143, 2), 0);
    }
    sum += vec4(-0.04491116722,-0.1335170839,-0.1217448708,0.01993196071);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.01259312406, -128), quantize(sum.y, 0.01259312406, -128), quantize(sum.z, 0.01259312406, -128), quantize(sum.w, 0.01259312406, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W4
//!BIND F3_0
//!BIND F3_1
//!BIND F3_2
//!BIND F3_3
//!SAVE F4_3
//!DESC [ARM_SESR_M5_QAT_int8] conv 4 output 3
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W4, ivec2(0, 3), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W4, ivec2(1, 3), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W4, ivec2(2, 3), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W4, ivec2(3, 3), 0);
        vec4 v0_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W4, ivec2(4, 3), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W4, ivec2(5, 3), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W4, ivec2(6, 3), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W4, ivec2(7, 3), 0);
        vec4 v0_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W4, ivec2(8, 3), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W4, ivec2(9, 3), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W4, ivec2(10, 3), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W4, ivec2(11, 3), 0);
        vec4 v0_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W4, ivec2(12, 3), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W4, ivec2(13, 3), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W4, ivec2(14, 3), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W4, ivec2(15, 3), 0);
        vec4 v0_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W4, ivec2(16, 3), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W4, ivec2(17, 3), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W4, ivec2(18, 3), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W4, ivec2(19, 3), 0);
        vec4 v0_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W4, ivec2(20, 3), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W4, ivec2(21, 3), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W4, ivec2(22, 3), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W4, ivec2(23, 3), 0);
        vec4 v0_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W4, ivec2(24, 3), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W4, ivec2(25, 3), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W4, ivec2(26, 3), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W4, ivec2(27, 3), 0);
        vec4 v0_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W4, ivec2(28, 3), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W4, ivec2(29, 3), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W4, ivec2(30, 3), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W4, ivec2(31, 3), 0);
        vec4 v0_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W4, ivec2(32, 3), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W4, ivec2(33, 3), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W4, ivec2(34, 3), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W4, ivec2(35, 3), 0);
        vec4 v0_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W4, ivec2(36, 3), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W4, ivec2(37, 3), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W4, ivec2(38, 3), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W4, ivec2(39, 3), 0);
        vec4 v0_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W4, ivec2(40, 3), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W4, ivec2(41, 3), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W4, ivec2(42, 3), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W4, ivec2(43, 3), 0);
        vec4 v0_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W4, ivec2(44, 3), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W4, ivec2(45, 3), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W4, ivec2(46, 3), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W4, ivec2(47, 3), 0);
        vec4 v1_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W4, ivec2(48, 3), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W4, ivec2(49, 3), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W4, ivec2(50, 3), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W4, ivec2(51, 3), 0);
        vec4 v1_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W4, ivec2(52, 3), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W4, ivec2(53, 3), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W4, ivec2(54, 3), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W4, ivec2(55, 3), 0);
        vec4 v1_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W4, ivec2(56, 3), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W4, ivec2(57, 3), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W4, ivec2(58, 3), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W4, ivec2(59, 3), 0);
        vec4 v1_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W4, ivec2(60, 3), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W4, ivec2(61, 3), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W4, ivec2(62, 3), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W4, ivec2(63, 3), 0);
        vec4 v1_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W4, ivec2(64, 3), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W4, ivec2(65, 3), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W4, ivec2(66, 3), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W4, ivec2(67, 3), 0);
        vec4 v1_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W4, ivec2(68, 3), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W4, ivec2(69, 3), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W4, ivec2(70, 3), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W4, ivec2(71, 3), 0);
        vec4 v1_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W4, ivec2(72, 3), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W4, ivec2(73, 3), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W4, ivec2(74, 3), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W4, ivec2(75, 3), 0);
        vec4 v1_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W4, ivec2(76, 3), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W4, ivec2(77, 3), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W4, ivec2(78, 3), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W4, ivec2(79, 3), 0);
        vec4 v1_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W4, ivec2(80, 3), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W4, ivec2(81, 3), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W4, ivec2(82, 3), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W4, ivec2(83, 3), 0);
        vec4 v1_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W4, ivec2(84, 3), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W4, ivec2(85, 3), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W4, ivec2(86, 3), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W4, ivec2(87, 3), 0);
        vec4 v1_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W4, ivec2(88, 3), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W4, ivec2(89, 3), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W4, ivec2(90, 3), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W4, ivec2(91, 3), 0);
        vec4 v1_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W4, ivec2(92, 3), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W4, ivec2(93, 3), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W4, ivec2(94, 3), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W4, ivec2(95, 3), 0);
        vec4 v2_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W4, ivec2(96, 3), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W4, ivec2(97, 3), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W4, ivec2(98, 3), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W4, ivec2(99, 3), 0);
        vec4 v2_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W4, ivec2(100, 3), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W4, ivec2(101, 3), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W4, ivec2(102, 3), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W4, ivec2(103, 3), 0);
        vec4 v2_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W4, ivec2(104, 3), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W4, ivec2(105, 3), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W4, ivec2(106, 3), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W4, ivec2(107, 3), 0);
        vec4 v2_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W4, ivec2(108, 3), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W4, ivec2(109, 3), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W4, ivec2(110, 3), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W4, ivec2(111, 3), 0);
        vec4 v2_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W4, ivec2(112, 3), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W4, ivec2(113, 3), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W4, ivec2(114, 3), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W4, ivec2(115, 3), 0);
        vec4 v2_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W4, ivec2(116, 3), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W4, ivec2(117, 3), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W4, ivec2(118, 3), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W4, ivec2(119, 3), 0);
        vec4 v2_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W4, ivec2(120, 3), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W4, ivec2(121, 3), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W4, ivec2(122, 3), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W4, ivec2(123, 3), 0);
        vec4 v2_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W4, ivec2(124, 3), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W4, ivec2(125, 3), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W4, ivec2(126, 3), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W4, ivec2(127, 3), 0);
        vec4 v2_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W4, ivec2(128, 3), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W4, ivec2(129, 3), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W4, ivec2(130, 3), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W4, ivec2(131, 3), 0);
        vec4 v2_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W4, ivec2(132, 3), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W4, ivec2(133, 3), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W4, ivec2(134, 3), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W4, ivec2(135, 3), 0);
        vec4 v2_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W4, ivec2(136, 3), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W4, ivec2(137, 3), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W4, ivec2(138, 3), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W4, ivec2(139, 3), 0);
        vec4 v2_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W4, ivec2(140, 3), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W4, ivec2(141, 3), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W4, ivec2(142, 3), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W4, ivec2(143, 3), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W4, ivec2(0, 3), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W4, ivec2(1, 3), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W4, ivec2(2, 3), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W4, ivec2(3, 3), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W4, ivec2(4, 3), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W4, ivec2(5, 3), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W4, ivec2(6, 3), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W4, ivec2(7, 3), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W4, ivec2(8, 3), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W4, ivec2(9, 3), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W4, ivec2(10, 3), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W4, ivec2(11, 3), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W4, ivec2(12, 3), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W4, ivec2(13, 3), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W4, ivec2(14, 3), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W4, ivec2(15, 3), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W4, ivec2(16, 3), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W4, ivec2(17, 3), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W4, ivec2(18, 3), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W4, ivec2(19, 3), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W4, ivec2(20, 3), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W4, ivec2(21, 3), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W4, ivec2(22, 3), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W4, ivec2(23, 3), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W4, ivec2(24, 3), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W4, ivec2(25, 3), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W4, ivec2(26, 3), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W4, ivec2(27, 3), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W4, ivec2(28, 3), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W4, ivec2(29, 3), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W4, ivec2(30, 3), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W4, ivec2(31, 3), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W4, ivec2(32, 3), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W4, ivec2(33, 3), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W4, ivec2(34, 3), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W4, ivec2(35, 3), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W4, ivec2(36, 3), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W4, ivec2(37, 3), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W4, ivec2(38, 3), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W4, ivec2(39, 3), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W4, ivec2(40, 3), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W4, ivec2(41, 3), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W4, ivec2(42, 3), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W4, ivec2(43, 3), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W4, ivec2(44, 3), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W4, ivec2(45, 3), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W4, ivec2(46, 3), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W4, ivec2(47, 3), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W4, ivec2(48, 3), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W4, ivec2(49, 3), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W4, ivec2(50, 3), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W4, ivec2(51, 3), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W4, ivec2(52, 3), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W4, ivec2(53, 3), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W4, ivec2(54, 3), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W4, ivec2(55, 3), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W4, ivec2(56, 3), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W4, ivec2(57, 3), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W4, ivec2(58, 3), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W4, ivec2(59, 3), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W4, ivec2(60, 3), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W4, ivec2(61, 3), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W4, ivec2(62, 3), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W4, ivec2(63, 3), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W4, ivec2(64, 3), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W4, ivec2(65, 3), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W4, ivec2(66, 3), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W4, ivec2(67, 3), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W4, ivec2(68, 3), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W4, ivec2(69, 3), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W4, ivec2(70, 3), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W4, ivec2(71, 3), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W4, ivec2(72, 3), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W4, ivec2(73, 3), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W4, ivec2(74, 3), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W4, ivec2(75, 3), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W4, ivec2(76, 3), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W4, ivec2(77, 3), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W4, ivec2(78, 3), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W4, ivec2(79, 3), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W4, ivec2(80, 3), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W4, ivec2(81, 3), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W4, ivec2(82, 3), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W4, ivec2(83, 3), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W4, ivec2(84, 3), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W4, ivec2(85, 3), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W4, ivec2(86, 3), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W4, ivec2(87, 3), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W4, ivec2(88, 3), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W4, ivec2(89, 3), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W4, ivec2(90, 3), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W4, ivec2(91, 3), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W4, ivec2(92, 3), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W4, ivec2(93, 3), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W4, ivec2(94, 3), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W4, ivec2(95, 3), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W4, ivec2(96, 3), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W4, ivec2(97, 3), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W4, ivec2(98, 3), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W4, ivec2(99, 3), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W4, ivec2(100, 3), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W4, ivec2(101, 3), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W4, ivec2(102, 3), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W4, ivec2(103, 3), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W4, ivec2(104, 3), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W4, ivec2(105, 3), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W4, ivec2(106, 3), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W4, ivec2(107, 3), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W4, ivec2(108, 3), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W4, ivec2(109, 3), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W4, ivec2(110, 3), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W4, ivec2(111, 3), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W4, ivec2(112, 3), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W4, ivec2(113, 3), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W4, ivec2(114, 3), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W4, ivec2(115, 3), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W4, ivec2(116, 3), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W4, ivec2(117, 3), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W4, ivec2(118, 3), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W4, ivec2(119, 3), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W4, ivec2(120, 3), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W4, ivec2(121, 3), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W4, ivec2(122, 3), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W4, ivec2(123, 3), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W4, ivec2(124, 3), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W4, ivec2(125, 3), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W4, ivec2(126, 3), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W4, ivec2(127, 3), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F3_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F3_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F3_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F3_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W4, ivec2(128, 3), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W4, ivec2(129, 3), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W4, ivec2(130, 3), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W4, ivec2(131, 3), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W4, ivec2(132, 3), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W4, ivec2(133, 3), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W4, ivec2(134, 3), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W4, ivec2(135, 3), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W4, ivec2(136, 3), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W4, ivec2(137, 3), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W4, ivec2(138, 3), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W4, ivec2(139, 3), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W4, ivec2(140, 3), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W4, ivec2(141, 3), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W4, ivec2(142, 3), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W4, ivec2(143, 3), 0);
    }
    sum += vec4(-0.0204081725,-0.0894784859,-0.08679727131,-0.01024295894);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.01259312406, -128), quantize(sum.y, 0.01259312406, -128), quantize(sum.z, 0.01259312406, -128), quantize(sum.w, 0.01259312406, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W5
//!BIND F4_0
//!BIND F4_1
//!BIND F4_2
//!BIND F4_3
//!SAVE F5_0
//!DESC [ARM_SESR_M5_QAT_int8] conv 5 output 0
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W5, ivec2(0, 0), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W5, ivec2(1, 0), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W5, ivec2(2, 0), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W5, ivec2(3, 0), 0);
        vec4 v0_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W5, ivec2(4, 0), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W5, ivec2(5, 0), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W5, ivec2(6, 0), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W5, ivec2(7, 0), 0);
        vec4 v0_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W5, ivec2(8, 0), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W5, ivec2(9, 0), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W5, ivec2(10, 0), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W5, ivec2(11, 0), 0);
        vec4 v0_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W5, ivec2(12, 0), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W5, ivec2(13, 0), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W5, ivec2(14, 0), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W5, ivec2(15, 0), 0);
        vec4 v0_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W5, ivec2(16, 0), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W5, ivec2(17, 0), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W5, ivec2(18, 0), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W5, ivec2(19, 0), 0);
        vec4 v0_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W5, ivec2(20, 0), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W5, ivec2(21, 0), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W5, ivec2(22, 0), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W5, ivec2(23, 0), 0);
        vec4 v0_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W5, ivec2(24, 0), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W5, ivec2(25, 0), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W5, ivec2(26, 0), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W5, ivec2(27, 0), 0);
        vec4 v0_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W5, ivec2(28, 0), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W5, ivec2(29, 0), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W5, ivec2(30, 0), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W5, ivec2(31, 0), 0);
        vec4 v0_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W5, ivec2(32, 0), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W5, ivec2(33, 0), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W5, ivec2(34, 0), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W5, ivec2(35, 0), 0);
        vec4 v0_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W5, ivec2(36, 0), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W5, ivec2(37, 0), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W5, ivec2(38, 0), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W5, ivec2(39, 0), 0);
        vec4 v0_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W5, ivec2(40, 0), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W5, ivec2(41, 0), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W5, ivec2(42, 0), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W5, ivec2(43, 0), 0);
        vec4 v0_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W5, ivec2(44, 0), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W5, ivec2(45, 0), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W5, ivec2(46, 0), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W5, ivec2(47, 0), 0);
        vec4 v1_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W5, ivec2(48, 0), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W5, ivec2(49, 0), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W5, ivec2(50, 0), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W5, ivec2(51, 0), 0);
        vec4 v1_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W5, ivec2(52, 0), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W5, ivec2(53, 0), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W5, ivec2(54, 0), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W5, ivec2(55, 0), 0);
        vec4 v1_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W5, ivec2(56, 0), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W5, ivec2(57, 0), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W5, ivec2(58, 0), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W5, ivec2(59, 0), 0);
        vec4 v1_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W5, ivec2(60, 0), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W5, ivec2(61, 0), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W5, ivec2(62, 0), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W5, ivec2(63, 0), 0);
        vec4 v1_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W5, ivec2(64, 0), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W5, ivec2(65, 0), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W5, ivec2(66, 0), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W5, ivec2(67, 0), 0);
        vec4 v1_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W5, ivec2(68, 0), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W5, ivec2(69, 0), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W5, ivec2(70, 0), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W5, ivec2(71, 0), 0);
        vec4 v1_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W5, ivec2(72, 0), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W5, ivec2(73, 0), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W5, ivec2(74, 0), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W5, ivec2(75, 0), 0);
        vec4 v1_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W5, ivec2(76, 0), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W5, ivec2(77, 0), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W5, ivec2(78, 0), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W5, ivec2(79, 0), 0);
        vec4 v1_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W5, ivec2(80, 0), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W5, ivec2(81, 0), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W5, ivec2(82, 0), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W5, ivec2(83, 0), 0);
        vec4 v1_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W5, ivec2(84, 0), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W5, ivec2(85, 0), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W5, ivec2(86, 0), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W5, ivec2(87, 0), 0);
        vec4 v1_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W5, ivec2(88, 0), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W5, ivec2(89, 0), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W5, ivec2(90, 0), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W5, ivec2(91, 0), 0);
        vec4 v1_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W5, ivec2(92, 0), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W5, ivec2(93, 0), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W5, ivec2(94, 0), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W5, ivec2(95, 0), 0);
        vec4 v2_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W5, ivec2(96, 0), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W5, ivec2(97, 0), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W5, ivec2(98, 0), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W5, ivec2(99, 0), 0);
        vec4 v2_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W5, ivec2(100, 0), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W5, ivec2(101, 0), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W5, ivec2(102, 0), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W5, ivec2(103, 0), 0);
        vec4 v2_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W5, ivec2(104, 0), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W5, ivec2(105, 0), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W5, ivec2(106, 0), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W5, ivec2(107, 0), 0);
        vec4 v2_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W5, ivec2(108, 0), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W5, ivec2(109, 0), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W5, ivec2(110, 0), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W5, ivec2(111, 0), 0);
        vec4 v2_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W5, ivec2(112, 0), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W5, ivec2(113, 0), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W5, ivec2(114, 0), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W5, ivec2(115, 0), 0);
        vec4 v2_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W5, ivec2(116, 0), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W5, ivec2(117, 0), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W5, ivec2(118, 0), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W5, ivec2(119, 0), 0);
        vec4 v2_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W5, ivec2(120, 0), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W5, ivec2(121, 0), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W5, ivec2(122, 0), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W5, ivec2(123, 0), 0);
        vec4 v2_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W5, ivec2(124, 0), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W5, ivec2(125, 0), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W5, ivec2(126, 0), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W5, ivec2(127, 0), 0);
        vec4 v2_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W5, ivec2(128, 0), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W5, ivec2(129, 0), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W5, ivec2(130, 0), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W5, ivec2(131, 0), 0);
        vec4 v2_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W5, ivec2(132, 0), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W5, ivec2(133, 0), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W5, ivec2(134, 0), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W5, ivec2(135, 0), 0);
        vec4 v2_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W5, ivec2(136, 0), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W5, ivec2(137, 0), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W5, ivec2(138, 0), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W5, ivec2(139, 0), 0);
        vec4 v2_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W5, ivec2(140, 0), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W5, ivec2(141, 0), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W5, ivec2(142, 0), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W5, ivec2(143, 0), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W5, ivec2(0, 0), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W5, ivec2(1, 0), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W5, ivec2(2, 0), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W5, ivec2(3, 0), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W5, ivec2(4, 0), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W5, ivec2(5, 0), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W5, ivec2(6, 0), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W5, ivec2(7, 0), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W5, ivec2(8, 0), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W5, ivec2(9, 0), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W5, ivec2(10, 0), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W5, ivec2(11, 0), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W5, ivec2(12, 0), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W5, ivec2(13, 0), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W5, ivec2(14, 0), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W5, ivec2(15, 0), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W5, ivec2(16, 0), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W5, ivec2(17, 0), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W5, ivec2(18, 0), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W5, ivec2(19, 0), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W5, ivec2(20, 0), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W5, ivec2(21, 0), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W5, ivec2(22, 0), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W5, ivec2(23, 0), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W5, ivec2(24, 0), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W5, ivec2(25, 0), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W5, ivec2(26, 0), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W5, ivec2(27, 0), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W5, ivec2(28, 0), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W5, ivec2(29, 0), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W5, ivec2(30, 0), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W5, ivec2(31, 0), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W5, ivec2(32, 0), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W5, ivec2(33, 0), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W5, ivec2(34, 0), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W5, ivec2(35, 0), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W5, ivec2(36, 0), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W5, ivec2(37, 0), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W5, ivec2(38, 0), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W5, ivec2(39, 0), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W5, ivec2(40, 0), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W5, ivec2(41, 0), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W5, ivec2(42, 0), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W5, ivec2(43, 0), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W5, ivec2(44, 0), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W5, ivec2(45, 0), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W5, ivec2(46, 0), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W5, ivec2(47, 0), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W5, ivec2(48, 0), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W5, ivec2(49, 0), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W5, ivec2(50, 0), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W5, ivec2(51, 0), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W5, ivec2(52, 0), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W5, ivec2(53, 0), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W5, ivec2(54, 0), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W5, ivec2(55, 0), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W5, ivec2(56, 0), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W5, ivec2(57, 0), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W5, ivec2(58, 0), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W5, ivec2(59, 0), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W5, ivec2(60, 0), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W5, ivec2(61, 0), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W5, ivec2(62, 0), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W5, ivec2(63, 0), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W5, ivec2(64, 0), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W5, ivec2(65, 0), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W5, ivec2(66, 0), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W5, ivec2(67, 0), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W5, ivec2(68, 0), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W5, ivec2(69, 0), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W5, ivec2(70, 0), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W5, ivec2(71, 0), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W5, ivec2(72, 0), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W5, ivec2(73, 0), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W5, ivec2(74, 0), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W5, ivec2(75, 0), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W5, ivec2(76, 0), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W5, ivec2(77, 0), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W5, ivec2(78, 0), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W5, ivec2(79, 0), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W5, ivec2(80, 0), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W5, ivec2(81, 0), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W5, ivec2(82, 0), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W5, ivec2(83, 0), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W5, ivec2(84, 0), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W5, ivec2(85, 0), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W5, ivec2(86, 0), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W5, ivec2(87, 0), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W5, ivec2(88, 0), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W5, ivec2(89, 0), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W5, ivec2(90, 0), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W5, ivec2(91, 0), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W5, ivec2(92, 0), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W5, ivec2(93, 0), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W5, ivec2(94, 0), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W5, ivec2(95, 0), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W5, ivec2(96, 0), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W5, ivec2(97, 0), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W5, ivec2(98, 0), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W5, ivec2(99, 0), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W5, ivec2(100, 0), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W5, ivec2(101, 0), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W5, ivec2(102, 0), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W5, ivec2(103, 0), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W5, ivec2(104, 0), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W5, ivec2(105, 0), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W5, ivec2(106, 0), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W5, ivec2(107, 0), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W5, ivec2(108, 0), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W5, ivec2(109, 0), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W5, ivec2(110, 0), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W5, ivec2(111, 0), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W5, ivec2(112, 0), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W5, ivec2(113, 0), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W5, ivec2(114, 0), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W5, ivec2(115, 0), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W5, ivec2(116, 0), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W5, ivec2(117, 0), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W5, ivec2(118, 0), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W5, ivec2(119, 0), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W5, ivec2(120, 0), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W5, ivec2(121, 0), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W5, ivec2(122, 0), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W5, ivec2(123, 0), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W5, ivec2(124, 0), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W5, ivec2(125, 0), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W5, ivec2(126, 0), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W5, ivec2(127, 0), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W5, ivec2(128, 0), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W5, ivec2(129, 0), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W5, ivec2(130, 0), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W5, ivec2(131, 0), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W5, ivec2(132, 0), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W5, ivec2(133, 0), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W5, ivec2(134, 0), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W5, ivec2(135, 0), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W5, ivec2(136, 0), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W5, ivec2(137, 0), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W5, ivec2(138, 0), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W5, ivec2(139, 0), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W5, ivec2(140, 0), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W5, ivec2(141, 0), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W5, ivec2(142, 0), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W5, ivec2(143, 0), 0);
    }
    sum += vec4(0.001614501971,-0.1530868691,-0.08774549738,-0.02533512363);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.005941348616, -128), quantize(sum.y, 0.005941348616, -128), quantize(sum.z, 0.005941348616, -128), quantize(sum.w, 0.005941348616, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W5
//!BIND F4_0
//!BIND F4_1
//!BIND F4_2
//!BIND F4_3
//!SAVE F5_1
//!DESC [ARM_SESR_M5_QAT_int8] conv 5 output 1
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W5, ivec2(0, 1), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W5, ivec2(1, 1), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W5, ivec2(2, 1), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W5, ivec2(3, 1), 0);
        vec4 v0_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W5, ivec2(4, 1), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W5, ivec2(5, 1), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W5, ivec2(6, 1), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W5, ivec2(7, 1), 0);
        vec4 v0_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W5, ivec2(8, 1), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W5, ivec2(9, 1), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W5, ivec2(10, 1), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W5, ivec2(11, 1), 0);
        vec4 v0_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W5, ivec2(12, 1), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W5, ivec2(13, 1), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W5, ivec2(14, 1), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W5, ivec2(15, 1), 0);
        vec4 v0_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W5, ivec2(16, 1), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W5, ivec2(17, 1), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W5, ivec2(18, 1), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W5, ivec2(19, 1), 0);
        vec4 v0_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W5, ivec2(20, 1), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W5, ivec2(21, 1), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W5, ivec2(22, 1), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W5, ivec2(23, 1), 0);
        vec4 v0_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W5, ivec2(24, 1), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W5, ivec2(25, 1), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W5, ivec2(26, 1), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W5, ivec2(27, 1), 0);
        vec4 v0_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W5, ivec2(28, 1), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W5, ivec2(29, 1), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W5, ivec2(30, 1), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W5, ivec2(31, 1), 0);
        vec4 v0_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W5, ivec2(32, 1), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W5, ivec2(33, 1), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W5, ivec2(34, 1), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W5, ivec2(35, 1), 0);
        vec4 v0_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W5, ivec2(36, 1), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W5, ivec2(37, 1), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W5, ivec2(38, 1), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W5, ivec2(39, 1), 0);
        vec4 v0_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W5, ivec2(40, 1), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W5, ivec2(41, 1), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W5, ivec2(42, 1), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W5, ivec2(43, 1), 0);
        vec4 v0_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W5, ivec2(44, 1), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W5, ivec2(45, 1), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W5, ivec2(46, 1), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W5, ivec2(47, 1), 0);
        vec4 v1_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W5, ivec2(48, 1), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W5, ivec2(49, 1), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W5, ivec2(50, 1), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W5, ivec2(51, 1), 0);
        vec4 v1_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W5, ivec2(52, 1), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W5, ivec2(53, 1), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W5, ivec2(54, 1), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W5, ivec2(55, 1), 0);
        vec4 v1_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W5, ivec2(56, 1), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W5, ivec2(57, 1), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W5, ivec2(58, 1), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W5, ivec2(59, 1), 0);
        vec4 v1_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W5, ivec2(60, 1), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W5, ivec2(61, 1), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W5, ivec2(62, 1), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W5, ivec2(63, 1), 0);
        vec4 v1_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W5, ivec2(64, 1), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W5, ivec2(65, 1), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W5, ivec2(66, 1), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W5, ivec2(67, 1), 0);
        vec4 v1_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W5, ivec2(68, 1), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W5, ivec2(69, 1), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W5, ivec2(70, 1), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W5, ivec2(71, 1), 0);
        vec4 v1_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W5, ivec2(72, 1), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W5, ivec2(73, 1), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W5, ivec2(74, 1), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W5, ivec2(75, 1), 0);
        vec4 v1_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W5, ivec2(76, 1), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W5, ivec2(77, 1), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W5, ivec2(78, 1), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W5, ivec2(79, 1), 0);
        vec4 v1_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W5, ivec2(80, 1), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W5, ivec2(81, 1), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W5, ivec2(82, 1), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W5, ivec2(83, 1), 0);
        vec4 v1_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W5, ivec2(84, 1), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W5, ivec2(85, 1), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W5, ivec2(86, 1), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W5, ivec2(87, 1), 0);
        vec4 v1_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W5, ivec2(88, 1), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W5, ivec2(89, 1), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W5, ivec2(90, 1), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W5, ivec2(91, 1), 0);
        vec4 v1_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W5, ivec2(92, 1), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W5, ivec2(93, 1), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W5, ivec2(94, 1), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W5, ivec2(95, 1), 0);
        vec4 v2_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W5, ivec2(96, 1), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W5, ivec2(97, 1), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W5, ivec2(98, 1), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W5, ivec2(99, 1), 0);
        vec4 v2_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W5, ivec2(100, 1), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W5, ivec2(101, 1), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W5, ivec2(102, 1), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W5, ivec2(103, 1), 0);
        vec4 v2_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W5, ivec2(104, 1), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W5, ivec2(105, 1), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W5, ivec2(106, 1), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W5, ivec2(107, 1), 0);
        vec4 v2_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W5, ivec2(108, 1), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W5, ivec2(109, 1), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W5, ivec2(110, 1), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W5, ivec2(111, 1), 0);
        vec4 v2_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W5, ivec2(112, 1), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W5, ivec2(113, 1), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W5, ivec2(114, 1), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W5, ivec2(115, 1), 0);
        vec4 v2_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W5, ivec2(116, 1), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W5, ivec2(117, 1), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W5, ivec2(118, 1), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W5, ivec2(119, 1), 0);
        vec4 v2_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W5, ivec2(120, 1), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W5, ivec2(121, 1), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W5, ivec2(122, 1), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W5, ivec2(123, 1), 0);
        vec4 v2_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W5, ivec2(124, 1), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W5, ivec2(125, 1), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W5, ivec2(126, 1), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W5, ivec2(127, 1), 0);
        vec4 v2_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W5, ivec2(128, 1), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W5, ivec2(129, 1), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W5, ivec2(130, 1), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W5, ivec2(131, 1), 0);
        vec4 v2_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W5, ivec2(132, 1), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W5, ivec2(133, 1), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W5, ivec2(134, 1), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W5, ivec2(135, 1), 0);
        vec4 v2_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W5, ivec2(136, 1), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W5, ivec2(137, 1), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W5, ivec2(138, 1), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W5, ivec2(139, 1), 0);
        vec4 v2_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W5, ivec2(140, 1), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W5, ivec2(141, 1), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W5, ivec2(142, 1), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W5, ivec2(143, 1), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W5, ivec2(0, 1), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W5, ivec2(1, 1), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W5, ivec2(2, 1), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W5, ivec2(3, 1), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W5, ivec2(4, 1), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W5, ivec2(5, 1), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W5, ivec2(6, 1), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W5, ivec2(7, 1), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W5, ivec2(8, 1), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W5, ivec2(9, 1), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W5, ivec2(10, 1), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W5, ivec2(11, 1), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W5, ivec2(12, 1), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W5, ivec2(13, 1), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W5, ivec2(14, 1), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W5, ivec2(15, 1), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W5, ivec2(16, 1), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W5, ivec2(17, 1), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W5, ivec2(18, 1), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W5, ivec2(19, 1), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W5, ivec2(20, 1), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W5, ivec2(21, 1), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W5, ivec2(22, 1), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W5, ivec2(23, 1), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W5, ivec2(24, 1), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W5, ivec2(25, 1), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W5, ivec2(26, 1), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W5, ivec2(27, 1), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W5, ivec2(28, 1), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W5, ivec2(29, 1), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W5, ivec2(30, 1), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W5, ivec2(31, 1), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W5, ivec2(32, 1), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W5, ivec2(33, 1), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W5, ivec2(34, 1), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W5, ivec2(35, 1), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W5, ivec2(36, 1), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W5, ivec2(37, 1), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W5, ivec2(38, 1), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W5, ivec2(39, 1), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W5, ivec2(40, 1), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W5, ivec2(41, 1), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W5, ivec2(42, 1), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W5, ivec2(43, 1), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W5, ivec2(44, 1), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W5, ivec2(45, 1), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W5, ivec2(46, 1), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W5, ivec2(47, 1), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W5, ivec2(48, 1), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W5, ivec2(49, 1), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W5, ivec2(50, 1), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W5, ivec2(51, 1), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W5, ivec2(52, 1), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W5, ivec2(53, 1), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W5, ivec2(54, 1), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W5, ivec2(55, 1), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W5, ivec2(56, 1), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W5, ivec2(57, 1), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W5, ivec2(58, 1), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W5, ivec2(59, 1), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W5, ivec2(60, 1), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W5, ivec2(61, 1), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W5, ivec2(62, 1), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W5, ivec2(63, 1), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W5, ivec2(64, 1), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W5, ivec2(65, 1), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W5, ivec2(66, 1), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W5, ivec2(67, 1), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W5, ivec2(68, 1), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W5, ivec2(69, 1), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W5, ivec2(70, 1), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W5, ivec2(71, 1), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W5, ivec2(72, 1), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W5, ivec2(73, 1), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W5, ivec2(74, 1), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W5, ivec2(75, 1), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W5, ivec2(76, 1), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W5, ivec2(77, 1), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W5, ivec2(78, 1), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W5, ivec2(79, 1), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W5, ivec2(80, 1), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W5, ivec2(81, 1), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W5, ivec2(82, 1), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W5, ivec2(83, 1), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W5, ivec2(84, 1), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W5, ivec2(85, 1), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W5, ivec2(86, 1), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W5, ivec2(87, 1), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W5, ivec2(88, 1), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W5, ivec2(89, 1), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W5, ivec2(90, 1), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W5, ivec2(91, 1), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W5, ivec2(92, 1), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W5, ivec2(93, 1), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W5, ivec2(94, 1), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W5, ivec2(95, 1), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W5, ivec2(96, 1), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W5, ivec2(97, 1), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W5, ivec2(98, 1), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W5, ivec2(99, 1), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W5, ivec2(100, 1), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W5, ivec2(101, 1), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W5, ivec2(102, 1), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W5, ivec2(103, 1), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W5, ivec2(104, 1), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W5, ivec2(105, 1), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W5, ivec2(106, 1), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W5, ivec2(107, 1), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W5, ivec2(108, 1), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W5, ivec2(109, 1), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W5, ivec2(110, 1), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W5, ivec2(111, 1), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W5, ivec2(112, 1), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W5, ivec2(113, 1), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W5, ivec2(114, 1), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W5, ivec2(115, 1), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W5, ivec2(116, 1), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W5, ivec2(117, 1), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W5, ivec2(118, 1), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W5, ivec2(119, 1), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W5, ivec2(120, 1), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W5, ivec2(121, 1), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W5, ivec2(122, 1), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W5, ivec2(123, 1), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W5, ivec2(124, 1), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W5, ivec2(125, 1), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W5, ivec2(126, 1), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W5, ivec2(127, 1), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W5, ivec2(128, 1), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W5, ivec2(129, 1), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W5, ivec2(130, 1), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W5, ivec2(131, 1), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W5, ivec2(132, 1), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W5, ivec2(133, 1), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W5, ivec2(134, 1), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W5, ivec2(135, 1), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W5, ivec2(136, 1), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W5, ivec2(137, 1), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W5, ivec2(138, 1), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W5, ivec2(139, 1), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W5, ivec2(140, 1), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W5, ivec2(141, 1), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W5, ivec2(142, 1), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W5, ivec2(143, 1), 0);
    }
    sum += vec4(-0.0411949913,-0.09520286963,-0.1408943694,0.0458358652);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.005941348616, -128), quantize(sum.y, 0.005941348616, -128), quantize(sum.z, 0.005941348616, -128), quantize(sum.w, 0.005941348616, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W5
//!BIND F4_0
//!BIND F4_1
//!BIND F4_2
//!BIND F4_3
//!SAVE F5_2
//!DESC [ARM_SESR_M5_QAT_int8] conv 5 output 2
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W5, ivec2(0, 2), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W5, ivec2(1, 2), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W5, ivec2(2, 2), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W5, ivec2(3, 2), 0);
        vec4 v0_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W5, ivec2(4, 2), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W5, ivec2(5, 2), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W5, ivec2(6, 2), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W5, ivec2(7, 2), 0);
        vec4 v0_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W5, ivec2(8, 2), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W5, ivec2(9, 2), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W5, ivec2(10, 2), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W5, ivec2(11, 2), 0);
        vec4 v0_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W5, ivec2(12, 2), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W5, ivec2(13, 2), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W5, ivec2(14, 2), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W5, ivec2(15, 2), 0);
        vec4 v0_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W5, ivec2(16, 2), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W5, ivec2(17, 2), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W5, ivec2(18, 2), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W5, ivec2(19, 2), 0);
        vec4 v0_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W5, ivec2(20, 2), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W5, ivec2(21, 2), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W5, ivec2(22, 2), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W5, ivec2(23, 2), 0);
        vec4 v0_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W5, ivec2(24, 2), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W5, ivec2(25, 2), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W5, ivec2(26, 2), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W5, ivec2(27, 2), 0);
        vec4 v0_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W5, ivec2(28, 2), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W5, ivec2(29, 2), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W5, ivec2(30, 2), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W5, ivec2(31, 2), 0);
        vec4 v0_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W5, ivec2(32, 2), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W5, ivec2(33, 2), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W5, ivec2(34, 2), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W5, ivec2(35, 2), 0);
        vec4 v0_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W5, ivec2(36, 2), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W5, ivec2(37, 2), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W5, ivec2(38, 2), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W5, ivec2(39, 2), 0);
        vec4 v0_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W5, ivec2(40, 2), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W5, ivec2(41, 2), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W5, ivec2(42, 2), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W5, ivec2(43, 2), 0);
        vec4 v0_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W5, ivec2(44, 2), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W5, ivec2(45, 2), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W5, ivec2(46, 2), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W5, ivec2(47, 2), 0);
        vec4 v1_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W5, ivec2(48, 2), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W5, ivec2(49, 2), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W5, ivec2(50, 2), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W5, ivec2(51, 2), 0);
        vec4 v1_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W5, ivec2(52, 2), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W5, ivec2(53, 2), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W5, ivec2(54, 2), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W5, ivec2(55, 2), 0);
        vec4 v1_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W5, ivec2(56, 2), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W5, ivec2(57, 2), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W5, ivec2(58, 2), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W5, ivec2(59, 2), 0);
        vec4 v1_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W5, ivec2(60, 2), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W5, ivec2(61, 2), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W5, ivec2(62, 2), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W5, ivec2(63, 2), 0);
        vec4 v1_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W5, ivec2(64, 2), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W5, ivec2(65, 2), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W5, ivec2(66, 2), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W5, ivec2(67, 2), 0);
        vec4 v1_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W5, ivec2(68, 2), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W5, ivec2(69, 2), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W5, ivec2(70, 2), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W5, ivec2(71, 2), 0);
        vec4 v1_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W5, ivec2(72, 2), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W5, ivec2(73, 2), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W5, ivec2(74, 2), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W5, ivec2(75, 2), 0);
        vec4 v1_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W5, ivec2(76, 2), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W5, ivec2(77, 2), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W5, ivec2(78, 2), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W5, ivec2(79, 2), 0);
        vec4 v1_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W5, ivec2(80, 2), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W5, ivec2(81, 2), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W5, ivec2(82, 2), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W5, ivec2(83, 2), 0);
        vec4 v1_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W5, ivec2(84, 2), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W5, ivec2(85, 2), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W5, ivec2(86, 2), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W5, ivec2(87, 2), 0);
        vec4 v1_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W5, ivec2(88, 2), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W5, ivec2(89, 2), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W5, ivec2(90, 2), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W5, ivec2(91, 2), 0);
        vec4 v1_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W5, ivec2(92, 2), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W5, ivec2(93, 2), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W5, ivec2(94, 2), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W5, ivec2(95, 2), 0);
        vec4 v2_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W5, ivec2(96, 2), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W5, ivec2(97, 2), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W5, ivec2(98, 2), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W5, ivec2(99, 2), 0);
        vec4 v2_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W5, ivec2(100, 2), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W5, ivec2(101, 2), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W5, ivec2(102, 2), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W5, ivec2(103, 2), 0);
        vec4 v2_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W5, ivec2(104, 2), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W5, ivec2(105, 2), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W5, ivec2(106, 2), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W5, ivec2(107, 2), 0);
        vec4 v2_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W5, ivec2(108, 2), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W5, ivec2(109, 2), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W5, ivec2(110, 2), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W5, ivec2(111, 2), 0);
        vec4 v2_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W5, ivec2(112, 2), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W5, ivec2(113, 2), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W5, ivec2(114, 2), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W5, ivec2(115, 2), 0);
        vec4 v2_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W5, ivec2(116, 2), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W5, ivec2(117, 2), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W5, ivec2(118, 2), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W5, ivec2(119, 2), 0);
        vec4 v2_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W5, ivec2(120, 2), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W5, ivec2(121, 2), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W5, ivec2(122, 2), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W5, ivec2(123, 2), 0);
        vec4 v2_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W5, ivec2(124, 2), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W5, ivec2(125, 2), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W5, ivec2(126, 2), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W5, ivec2(127, 2), 0);
        vec4 v2_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W5, ivec2(128, 2), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W5, ivec2(129, 2), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W5, ivec2(130, 2), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W5, ivec2(131, 2), 0);
        vec4 v2_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W5, ivec2(132, 2), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W5, ivec2(133, 2), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W5, ivec2(134, 2), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W5, ivec2(135, 2), 0);
        vec4 v2_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W5, ivec2(136, 2), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W5, ivec2(137, 2), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W5, ivec2(138, 2), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W5, ivec2(139, 2), 0);
        vec4 v2_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W5, ivec2(140, 2), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W5, ivec2(141, 2), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W5, ivec2(142, 2), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W5, ivec2(143, 2), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W5, ivec2(0, 2), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W5, ivec2(1, 2), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W5, ivec2(2, 2), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W5, ivec2(3, 2), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W5, ivec2(4, 2), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W5, ivec2(5, 2), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W5, ivec2(6, 2), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W5, ivec2(7, 2), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W5, ivec2(8, 2), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W5, ivec2(9, 2), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W5, ivec2(10, 2), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W5, ivec2(11, 2), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W5, ivec2(12, 2), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W5, ivec2(13, 2), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W5, ivec2(14, 2), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W5, ivec2(15, 2), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W5, ivec2(16, 2), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W5, ivec2(17, 2), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W5, ivec2(18, 2), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W5, ivec2(19, 2), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W5, ivec2(20, 2), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W5, ivec2(21, 2), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W5, ivec2(22, 2), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W5, ivec2(23, 2), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W5, ivec2(24, 2), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W5, ivec2(25, 2), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W5, ivec2(26, 2), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W5, ivec2(27, 2), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W5, ivec2(28, 2), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W5, ivec2(29, 2), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W5, ivec2(30, 2), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W5, ivec2(31, 2), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W5, ivec2(32, 2), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W5, ivec2(33, 2), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W5, ivec2(34, 2), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W5, ivec2(35, 2), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W5, ivec2(36, 2), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W5, ivec2(37, 2), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W5, ivec2(38, 2), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W5, ivec2(39, 2), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W5, ivec2(40, 2), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W5, ivec2(41, 2), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W5, ivec2(42, 2), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W5, ivec2(43, 2), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W5, ivec2(44, 2), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W5, ivec2(45, 2), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W5, ivec2(46, 2), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W5, ivec2(47, 2), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W5, ivec2(48, 2), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W5, ivec2(49, 2), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W5, ivec2(50, 2), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W5, ivec2(51, 2), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W5, ivec2(52, 2), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W5, ivec2(53, 2), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W5, ivec2(54, 2), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W5, ivec2(55, 2), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W5, ivec2(56, 2), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W5, ivec2(57, 2), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W5, ivec2(58, 2), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W5, ivec2(59, 2), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W5, ivec2(60, 2), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W5, ivec2(61, 2), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W5, ivec2(62, 2), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W5, ivec2(63, 2), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W5, ivec2(64, 2), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W5, ivec2(65, 2), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W5, ivec2(66, 2), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W5, ivec2(67, 2), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W5, ivec2(68, 2), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W5, ivec2(69, 2), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W5, ivec2(70, 2), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W5, ivec2(71, 2), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W5, ivec2(72, 2), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W5, ivec2(73, 2), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W5, ivec2(74, 2), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W5, ivec2(75, 2), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W5, ivec2(76, 2), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W5, ivec2(77, 2), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W5, ivec2(78, 2), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W5, ivec2(79, 2), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W5, ivec2(80, 2), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W5, ivec2(81, 2), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W5, ivec2(82, 2), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W5, ivec2(83, 2), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W5, ivec2(84, 2), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W5, ivec2(85, 2), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W5, ivec2(86, 2), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W5, ivec2(87, 2), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W5, ivec2(88, 2), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W5, ivec2(89, 2), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W5, ivec2(90, 2), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W5, ivec2(91, 2), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W5, ivec2(92, 2), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W5, ivec2(93, 2), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W5, ivec2(94, 2), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W5, ivec2(95, 2), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W5, ivec2(96, 2), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W5, ivec2(97, 2), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W5, ivec2(98, 2), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W5, ivec2(99, 2), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W5, ivec2(100, 2), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W5, ivec2(101, 2), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W5, ivec2(102, 2), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W5, ivec2(103, 2), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W5, ivec2(104, 2), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W5, ivec2(105, 2), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W5, ivec2(106, 2), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W5, ivec2(107, 2), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W5, ivec2(108, 2), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W5, ivec2(109, 2), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W5, ivec2(110, 2), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W5, ivec2(111, 2), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W5, ivec2(112, 2), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W5, ivec2(113, 2), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W5, ivec2(114, 2), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W5, ivec2(115, 2), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W5, ivec2(116, 2), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W5, ivec2(117, 2), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W5, ivec2(118, 2), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W5, ivec2(119, 2), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W5, ivec2(120, 2), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W5, ivec2(121, 2), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W5, ivec2(122, 2), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W5, ivec2(123, 2), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W5, ivec2(124, 2), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W5, ivec2(125, 2), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W5, ivec2(126, 2), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W5, ivec2(127, 2), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W5, ivec2(128, 2), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W5, ivec2(129, 2), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W5, ivec2(130, 2), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W5, ivec2(131, 2), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W5, ivec2(132, 2), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W5, ivec2(133, 2), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W5, ivec2(134, 2), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W5, ivec2(135, 2), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W5, ivec2(136, 2), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W5, ivec2(137, 2), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W5, ivec2(138, 2), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W5, ivec2(139, 2), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W5, ivec2(140, 2), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W5, ivec2(141, 2), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W5, ivec2(142, 2), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W5, ivec2(143, 2), 0);
    }
    sum += vec4(-0.09305302947,-0.08497799467,-0.07361749667,-0.131385453);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.005941348616, -128), quantize(sum.y, 0.005941348616, -128), quantize(sum.z, 0.005941348616, -128), quantize(sum.w, 0.005941348616, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W5
//!BIND F4_0
//!BIND F4_1
//!BIND F4_2
//!BIND F4_3
//!SAVE F5_3
//!DESC [ARM_SESR_M5_QAT_int8] conv 5 output 3
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 1 && p.y >= 1 && p.x < sz.x - 1 && p.y < sz.y - 1) {
        vec4 v0_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_0[0]) * texelFetch(W5, ivec2(0, 3), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W5, ivec2(1, 3), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W5, ivec2(2, 3), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W5, ivec2(3, 3), 0);
        vec4 v0_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_1[0]) * texelFetch(W5, ivec2(4, 3), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W5, ivec2(5, 3), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W5, ivec2(6, 3), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W5, ivec2(7, 3), 0);
        vec4 v0_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_2[0]) * texelFetch(W5, ivec2(8, 3), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W5, ivec2(9, 3), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W5, ivec2(10, 3), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W5, ivec2(11, 3), 0);
        vec4 v0_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v0_0_3[0]) * texelFetch(W5, ivec2(12, 3), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W5, ivec2(13, 3), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W5, ivec2(14, 3), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W5, ivec2(15, 3), 0);
        vec4 v0_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_0[0]) * texelFetch(W5, ivec2(16, 3), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W5, ivec2(17, 3), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W5, ivec2(18, 3), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W5, ivec2(19, 3), 0);
        vec4 v0_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_1[0]) * texelFetch(W5, ivec2(20, 3), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W5, ivec2(21, 3), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W5, ivec2(22, 3), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W5, ivec2(23, 3), 0);
        vec4 v0_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_2[0]) * texelFetch(W5, ivec2(24, 3), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W5, ivec2(25, 3), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W5, ivec2(26, 3), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W5, ivec2(27, 3), 0);
        vec4 v0_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v0_1_3[0]) * texelFetch(W5, ivec2(28, 3), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W5, ivec2(29, 3), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W5, ivec2(30, 3), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W5, ivec2(31, 3), 0);
        vec4 v0_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_0[0]) * texelFetch(W5, ivec2(32, 3), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W5, ivec2(33, 3), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W5, ivec2(34, 3), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W5, ivec2(35, 3), 0);
        vec4 v0_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_1[0]) * texelFetch(W5, ivec2(36, 3), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W5, ivec2(37, 3), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W5, ivec2(38, 3), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W5, ivec2(39, 3), 0);
        vec4 v0_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_2[0]) * texelFetch(W5, ivec2(40, 3), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W5, ivec2(41, 3), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W5, ivec2(42, 3), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W5, ivec2(43, 3), 0);
        vec4 v0_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v0_2_3[0]) * texelFetch(W5, ivec2(44, 3), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W5, ivec2(45, 3), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W5, ivec2(46, 3), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W5, ivec2(47, 3), 0);
        vec4 v1_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_0[0]) * texelFetch(W5, ivec2(48, 3), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W5, ivec2(49, 3), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W5, ivec2(50, 3), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W5, ivec2(51, 3), 0);
        vec4 v1_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_1[0]) * texelFetch(W5, ivec2(52, 3), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W5, ivec2(53, 3), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W5, ivec2(54, 3), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W5, ivec2(55, 3), 0);
        vec4 v1_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_2[0]) * texelFetch(W5, ivec2(56, 3), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W5, ivec2(57, 3), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W5, ivec2(58, 3), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W5, ivec2(59, 3), 0);
        vec4 v1_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v1_0_3[0]) * texelFetch(W5, ivec2(60, 3), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W5, ivec2(61, 3), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W5, ivec2(62, 3), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W5, ivec2(63, 3), 0);
        vec4 v1_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_0[0]) * texelFetch(W5, ivec2(64, 3), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W5, ivec2(65, 3), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W5, ivec2(66, 3), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W5, ivec2(67, 3), 0);
        vec4 v1_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_1[0]) * texelFetch(W5, ivec2(68, 3), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W5, ivec2(69, 3), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W5, ivec2(70, 3), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W5, ivec2(71, 3), 0);
        vec4 v1_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_2[0]) * texelFetch(W5, ivec2(72, 3), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W5, ivec2(73, 3), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W5, ivec2(74, 3), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W5, ivec2(75, 3), 0);
        vec4 v1_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v1_1_3[0]) * texelFetch(W5, ivec2(76, 3), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W5, ivec2(77, 3), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W5, ivec2(78, 3), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W5, ivec2(79, 3), 0);
        vec4 v1_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_0[0]) * texelFetch(W5, ivec2(80, 3), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W5, ivec2(81, 3), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W5, ivec2(82, 3), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W5, ivec2(83, 3), 0);
        vec4 v1_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_1[0]) * texelFetch(W5, ivec2(84, 3), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W5, ivec2(85, 3), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W5, ivec2(86, 3), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W5, ivec2(87, 3), 0);
        vec4 v1_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_2[0]) * texelFetch(W5, ivec2(88, 3), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W5, ivec2(89, 3), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W5, ivec2(90, 3), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W5, ivec2(91, 3), 0);
        vec4 v1_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v1_2_3[0]) * texelFetch(W5, ivec2(92, 3), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W5, ivec2(93, 3), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W5, ivec2(94, 3), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W5, ivec2(95, 3), 0);
        vec4 v2_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_0[0]) * texelFetch(W5, ivec2(96, 3), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W5, ivec2(97, 3), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W5, ivec2(98, 3), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W5, ivec2(99, 3), 0);
        vec4 v2_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_1[0]) * texelFetch(W5, ivec2(100, 3), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W5, ivec2(101, 3), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W5, ivec2(102, 3), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W5, ivec2(103, 3), 0);
        vec4 v2_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_2[0]) * texelFetch(W5, ivec2(104, 3), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W5, ivec2(105, 3), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W5, ivec2(106, 3), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W5, ivec2(107, 3), 0);
        vec4 v2_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v2_0_3[0]) * texelFetch(W5, ivec2(108, 3), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W5, ivec2(109, 3), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W5, ivec2(110, 3), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W5, ivec2(111, 3), 0);
        vec4 v2_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_0[0]) * texelFetch(W5, ivec2(112, 3), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W5, ivec2(113, 3), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W5, ivec2(114, 3), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W5, ivec2(115, 3), 0);
        vec4 v2_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_1[0]) * texelFetch(W5, ivec2(116, 3), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W5, ivec2(117, 3), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W5, ivec2(118, 3), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W5, ivec2(119, 3), 0);
        vec4 v2_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_2[0]) * texelFetch(W5, ivec2(120, 3), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W5, ivec2(121, 3), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W5, ivec2(122, 3), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W5, ivec2(123, 3), 0);
        vec4 v2_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v2_1_3[0]) * texelFetch(W5, ivec2(124, 3), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W5, ivec2(125, 3), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W5, ivec2(126, 3), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W5, ivec2(127, 3), 0);
        vec4 v2_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_0[0]) * texelFetch(W5, ivec2(128, 3), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W5, ivec2(129, 3), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W5, ivec2(130, 3), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W5, ivec2(131, 3), 0);
        vec4 v2_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_1[0]) * texelFetch(W5, ivec2(132, 3), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W5, ivec2(133, 3), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W5, ivec2(134, 3), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W5, ivec2(135, 3), 0);
        vec4 v2_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_2[0]) * texelFetch(W5, ivec2(136, 3), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W5, ivec2(137, 3), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W5, ivec2(138, 3), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W5, ivec2(139, 3), 0);
        vec4 v2_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v2_2_3[0]) * texelFetch(W5, ivec2(140, 3), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W5, ivec2(141, 3), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W5, ivec2(142, 3), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W5, ivec2(143, 3), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-1, -1);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, -1));
            s0_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, -1));
            s0_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, -1));
            s0_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W5, ivec2(0, 3), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W5, ivec2(1, 3), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W5, ivec2(2, 3), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W5, ivec2(3, 3), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W5, ivec2(4, 3), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W5, ivec2(5, 3), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W5, ivec2(6, 3), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W5, ivec2(7, 3), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W5, ivec2(8, 3), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W5, ivec2(9, 3), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W5, ivec2(10, 3), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W5, ivec2(11, 3), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W5, ivec2(12, 3), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W5, ivec2(13, 3), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W5, ivec2(14, 3), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W5, ivec2(15, 3), 0);
        ivec2 t0_1 = p + ivec2(0, -1);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, -1));
            s0_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, -1));
            s0_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, -1));
            s0_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W5, ivec2(16, 3), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W5, ivec2(17, 3), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W5, ivec2(18, 3), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W5, ivec2(19, 3), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W5, ivec2(20, 3), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W5, ivec2(21, 3), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W5, ivec2(22, 3), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W5, ivec2(23, 3), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W5, ivec2(24, 3), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W5, ivec2(25, 3), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W5, ivec2(26, 3), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W5, ivec2(27, 3), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W5, ivec2(28, 3), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W5, ivec2(29, 3), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W5, ivec2(30, 3), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W5, ivec2(31, 3), 0);
        ivec2 t0_2 = p + ivec2(1, -1);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, -1));
            s0_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, -1));
            s0_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, -1));
            s0_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W5, ivec2(32, 3), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W5, ivec2(33, 3), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W5, ivec2(34, 3), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W5, ivec2(35, 3), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W5, ivec2(36, 3), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W5, ivec2(37, 3), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W5, ivec2(38, 3), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W5, ivec2(39, 3), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W5, ivec2(40, 3), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W5, ivec2(41, 3), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W5, ivec2(42, 3), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W5, ivec2(43, 3), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W5, ivec2(44, 3), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W5, ivec2(45, 3), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W5, ivec2(46, 3), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W5, ivec2(47, 3), 0);
        ivec2 t1_0 = p + ivec2(-1, 0);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 0));
            s1_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 0));
            s1_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 0));
            s1_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W5, ivec2(48, 3), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W5, ivec2(49, 3), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W5, ivec2(50, 3), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W5, ivec2(51, 3), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W5, ivec2(52, 3), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W5, ivec2(53, 3), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W5, ivec2(54, 3), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W5, ivec2(55, 3), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W5, ivec2(56, 3), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W5, ivec2(57, 3), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W5, ivec2(58, 3), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W5, ivec2(59, 3), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W5, ivec2(60, 3), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W5, ivec2(61, 3), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W5, ivec2(62, 3), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W5, ivec2(63, 3), 0);
        ivec2 t1_1 = p + ivec2(0, 0);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 0));
            s1_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 0));
            s1_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 0));
            s1_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W5, ivec2(64, 3), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W5, ivec2(65, 3), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W5, ivec2(66, 3), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W5, ivec2(67, 3), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W5, ivec2(68, 3), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W5, ivec2(69, 3), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W5, ivec2(70, 3), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W5, ivec2(71, 3), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W5, ivec2(72, 3), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W5, ivec2(73, 3), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W5, ivec2(74, 3), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W5, ivec2(75, 3), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W5, ivec2(76, 3), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W5, ivec2(77, 3), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W5, ivec2(78, 3), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W5, ivec2(79, 3), 0);
        ivec2 t1_2 = p + ivec2(1, 0);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 0));
            s1_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 0));
            s1_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 0));
            s1_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W5, ivec2(80, 3), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W5, ivec2(81, 3), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W5, ivec2(82, 3), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W5, ivec2(83, 3), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W5, ivec2(84, 3), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W5, ivec2(85, 3), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W5, ivec2(86, 3), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W5, ivec2(87, 3), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W5, ivec2(88, 3), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W5, ivec2(89, 3), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W5, ivec2(90, 3), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W5, ivec2(91, 3), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W5, ivec2(92, 3), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W5, ivec2(93, 3), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W5, ivec2(94, 3), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W5, ivec2(95, 3), 0);
        ivec2 t2_0 = p + ivec2(-1, 1);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(-1, 1));
            s2_0_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(-1, 1));
            s2_0_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(-1, 1));
            s2_0_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W5, ivec2(96, 3), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W5, ivec2(97, 3), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W5, ivec2(98, 3), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W5, ivec2(99, 3), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W5, ivec2(100, 3), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W5, ivec2(101, 3), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W5, ivec2(102, 3), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W5, ivec2(103, 3), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W5, ivec2(104, 3), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W5, ivec2(105, 3), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W5, ivec2(106, 3), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W5, ivec2(107, 3), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W5, ivec2(108, 3), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W5, ivec2(109, 3), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W5, ivec2(110, 3), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W5, ivec2(111, 3), 0);
        ivec2 t2_1 = p + ivec2(0, 1);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(0, 1));
            s2_1_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(0, 1));
            s2_1_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(0, 1));
            s2_1_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W5, ivec2(112, 3), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W5, ivec2(113, 3), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W5, ivec2(114, 3), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W5, ivec2(115, 3), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W5, ivec2(116, 3), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W5, ivec2(117, 3), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W5, ivec2(118, 3), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W5, ivec2(119, 3), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W5, ivec2(120, 3), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W5, ivec2(121, 3), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W5, ivec2(122, 3), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W5, ivec2(123, 3), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W5, ivec2(124, 3), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W5, ivec2(125, 3), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W5, ivec2(126, 3), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W5, ivec2(127, 3), 0);
        ivec2 t2_2 = p + ivec2(1, 1);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F4_0_raw, p, 0, ivec2(1, 1));
            s2_2_1 = texelFetchOffset(F4_1_raw, p, 0, ivec2(1, 1));
            s2_2_2 = texelFetchOffset(F4_2_raw, p, 0, ivec2(1, 1));
            s2_2_3 = texelFetchOffset(F4_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W5, ivec2(128, 3), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W5, ivec2(129, 3), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W5, ivec2(130, 3), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W5, ivec2(131, 3), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W5, ivec2(132, 3), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W5, ivec2(133, 3), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W5, ivec2(134, 3), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W5, ivec2(135, 3), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W5, ivec2(136, 3), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W5, ivec2(137, 3), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W5, ivec2(138, 3), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W5, ivec2(139, 3), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W5, ivec2(140, 3), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W5, ivec2(141, 3), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W5, ivec2(142, 3), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W5, ivec2(143, 3), 0);
    }
    sum += vec4(-0.00352142808,-0.02366831169,-0.006799698021,-0.01591328931);
    sum = max(sum, vec4(0.0));
    return vec4(quantize(sum.x, 0.005941348616, -128), quantize(sum.y, 0.005941348616, -128), quantize(sum.z, 0.005941348616, -128), quantize(sum.w, 0.005941348616, -128));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND F5_0
//!BIND F0_0
//!SAVE F6_0
//!DESC [ARM_SESR_M5_QAT_int8] residual merge 0
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    vec4 x = texelFetch(F5_0_raw, p, 0) + texelFetch(F0_0_raw, p, 0);
    return vec4(quantize(x.x,0.008024659008,-96),quantize(x.y,0.008024659008,-96),quantize(x.z,0.008024659008,-96),quantize(x.w,0.008024659008,-96));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND F5_1
//!BIND F0_1
//!SAVE F6_1
//!DESC [ARM_SESR_M5_QAT_int8] residual merge 1
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    vec4 x = texelFetch(F5_1_raw, p, 0) + texelFetch(F0_1_raw, p, 0);
    return vec4(quantize(x.x,0.008024659008,-96),quantize(x.y,0.008024659008,-96),quantize(x.z,0.008024659008,-96),quantize(x.w,0.008024659008,-96));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND F5_2
//!BIND F0_2
//!SAVE F6_2
//!DESC [ARM_SESR_M5_QAT_int8] residual merge 2
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    vec4 x = texelFetch(F5_2_raw, p, 0) + texelFetch(F0_2_raw, p, 0);
    return vec4(quantize(x.x,0.008024659008,-96),quantize(x.y,0.008024659008,-96),quantize(x.z,0.008024659008,-96),quantize(x.w,0.008024659008,-96));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND F5_3
//!BIND F0_3
//!SAVE F6_3
//!DESC [ARM_SESR_M5_QAT_int8] residual merge 3
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    vec4 x = texelFetch(F5_3_raw, p, 0) + texelFetch(F0_3_raw, p, 0);
    return vec4(quantize(x.x,0.008024659008,-96),quantize(x.y,0.008024659008,-96),quantize(x.z,0.008024659008,-96),quantize(x.w,0.008024659008,-96));
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND W6
//!BIND F6_0
//!BIND F6_1
//!BIND F6_2
//!BIND F6_3
//!SAVE SESR_LOW
//!DESC [ARM_SESR_M5_QAT_int8] output convolution
//!WIDTH HOOKED.w
//!HEIGHT HOOKED.h
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *
//!COMPONENTS 4

float quantize(float x, float scale, float zero) {
    float q = clamp(floor(x / scale + zero + 0.5), -128.0, 127.0);
    return (q - zero) * scale;
}

vec4 hook() {
    ivec2 p = ivec2(HOOKED_pos * HOOKED_size);
    ivec2 sz = ivec2(HOOKED_size);
    vec4 sum = vec4(0.0);
    if (p.x >= 2 && p.y >= 2 && p.x < sz.x - 2 && p.y < sz.y - 2) {
        vec4 v0_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, -2));
        sum += vec4(v0_0_0[0]) * texelFetch(W6, ivec2(0, 0), 0);
        sum += vec4(v0_0_0[1]) * texelFetch(W6, ivec2(1, 0), 0);
        sum += vec4(v0_0_0[2]) * texelFetch(W6, ivec2(2, 0), 0);
        sum += vec4(v0_0_0[3]) * texelFetch(W6, ivec2(3, 0), 0);
        vec4 v0_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, -2));
        sum += vec4(v0_0_1[0]) * texelFetch(W6, ivec2(4, 0), 0);
        sum += vec4(v0_0_1[1]) * texelFetch(W6, ivec2(5, 0), 0);
        sum += vec4(v0_0_1[2]) * texelFetch(W6, ivec2(6, 0), 0);
        sum += vec4(v0_0_1[3]) * texelFetch(W6, ivec2(7, 0), 0);
        vec4 v0_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, -2));
        sum += vec4(v0_0_2[0]) * texelFetch(W6, ivec2(8, 0), 0);
        sum += vec4(v0_0_2[1]) * texelFetch(W6, ivec2(9, 0), 0);
        sum += vec4(v0_0_2[2]) * texelFetch(W6, ivec2(10, 0), 0);
        sum += vec4(v0_0_2[3]) * texelFetch(W6, ivec2(11, 0), 0);
        vec4 v0_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, -2));
        sum += vec4(v0_0_3[0]) * texelFetch(W6, ivec2(12, 0), 0);
        sum += vec4(v0_0_3[1]) * texelFetch(W6, ivec2(13, 0), 0);
        sum += vec4(v0_0_3[2]) * texelFetch(W6, ivec2(14, 0), 0);
        sum += vec4(v0_0_3[3]) * texelFetch(W6, ivec2(15, 0), 0);
        vec4 v0_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, -2));
        sum += vec4(v0_1_0[0]) * texelFetch(W6, ivec2(16, 0), 0);
        sum += vec4(v0_1_0[1]) * texelFetch(W6, ivec2(17, 0), 0);
        sum += vec4(v0_1_0[2]) * texelFetch(W6, ivec2(18, 0), 0);
        sum += vec4(v0_1_0[3]) * texelFetch(W6, ivec2(19, 0), 0);
        vec4 v0_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, -2));
        sum += vec4(v0_1_1[0]) * texelFetch(W6, ivec2(20, 0), 0);
        sum += vec4(v0_1_1[1]) * texelFetch(W6, ivec2(21, 0), 0);
        sum += vec4(v0_1_1[2]) * texelFetch(W6, ivec2(22, 0), 0);
        sum += vec4(v0_1_1[3]) * texelFetch(W6, ivec2(23, 0), 0);
        vec4 v0_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, -2));
        sum += vec4(v0_1_2[0]) * texelFetch(W6, ivec2(24, 0), 0);
        sum += vec4(v0_1_2[1]) * texelFetch(W6, ivec2(25, 0), 0);
        sum += vec4(v0_1_2[2]) * texelFetch(W6, ivec2(26, 0), 0);
        sum += vec4(v0_1_2[3]) * texelFetch(W6, ivec2(27, 0), 0);
        vec4 v0_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, -2));
        sum += vec4(v0_1_3[0]) * texelFetch(W6, ivec2(28, 0), 0);
        sum += vec4(v0_1_3[1]) * texelFetch(W6, ivec2(29, 0), 0);
        sum += vec4(v0_1_3[2]) * texelFetch(W6, ivec2(30, 0), 0);
        sum += vec4(v0_1_3[3]) * texelFetch(W6, ivec2(31, 0), 0);
        vec4 v0_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, -2));
        sum += vec4(v0_2_0[0]) * texelFetch(W6, ivec2(32, 0), 0);
        sum += vec4(v0_2_0[1]) * texelFetch(W6, ivec2(33, 0), 0);
        sum += vec4(v0_2_0[2]) * texelFetch(W6, ivec2(34, 0), 0);
        sum += vec4(v0_2_0[3]) * texelFetch(W6, ivec2(35, 0), 0);
        vec4 v0_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, -2));
        sum += vec4(v0_2_1[0]) * texelFetch(W6, ivec2(36, 0), 0);
        sum += vec4(v0_2_1[1]) * texelFetch(W6, ivec2(37, 0), 0);
        sum += vec4(v0_2_1[2]) * texelFetch(W6, ivec2(38, 0), 0);
        sum += vec4(v0_2_1[3]) * texelFetch(W6, ivec2(39, 0), 0);
        vec4 v0_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, -2));
        sum += vec4(v0_2_2[0]) * texelFetch(W6, ivec2(40, 0), 0);
        sum += vec4(v0_2_2[1]) * texelFetch(W6, ivec2(41, 0), 0);
        sum += vec4(v0_2_2[2]) * texelFetch(W6, ivec2(42, 0), 0);
        sum += vec4(v0_2_2[3]) * texelFetch(W6, ivec2(43, 0), 0);
        vec4 v0_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, -2));
        sum += vec4(v0_2_3[0]) * texelFetch(W6, ivec2(44, 0), 0);
        sum += vec4(v0_2_3[1]) * texelFetch(W6, ivec2(45, 0), 0);
        sum += vec4(v0_2_3[2]) * texelFetch(W6, ivec2(46, 0), 0);
        sum += vec4(v0_2_3[3]) * texelFetch(W6, ivec2(47, 0), 0);
        vec4 v0_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, -2));
        sum += vec4(v0_3_0[0]) * texelFetch(W6, ivec2(48, 0), 0);
        sum += vec4(v0_3_0[1]) * texelFetch(W6, ivec2(49, 0), 0);
        sum += vec4(v0_3_0[2]) * texelFetch(W6, ivec2(50, 0), 0);
        sum += vec4(v0_3_0[3]) * texelFetch(W6, ivec2(51, 0), 0);
        vec4 v0_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, -2));
        sum += vec4(v0_3_1[0]) * texelFetch(W6, ivec2(52, 0), 0);
        sum += vec4(v0_3_1[1]) * texelFetch(W6, ivec2(53, 0), 0);
        sum += vec4(v0_3_1[2]) * texelFetch(W6, ivec2(54, 0), 0);
        sum += vec4(v0_3_1[3]) * texelFetch(W6, ivec2(55, 0), 0);
        vec4 v0_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, -2));
        sum += vec4(v0_3_2[0]) * texelFetch(W6, ivec2(56, 0), 0);
        sum += vec4(v0_3_2[1]) * texelFetch(W6, ivec2(57, 0), 0);
        sum += vec4(v0_3_2[2]) * texelFetch(W6, ivec2(58, 0), 0);
        sum += vec4(v0_3_2[3]) * texelFetch(W6, ivec2(59, 0), 0);
        vec4 v0_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, -2));
        sum += vec4(v0_3_3[0]) * texelFetch(W6, ivec2(60, 0), 0);
        sum += vec4(v0_3_3[1]) * texelFetch(W6, ivec2(61, 0), 0);
        sum += vec4(v0_3_3[2]) * texelFetch(W6, ivec2(62, 0), 0);
        sum += vec4(v0_3_3[3]) * texelFetch(W6, ivec2(63, 0), 0);
        vec4 v0_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, -2));
        sum += vec4(v0_4_0[0]) * texelFetch(W6, ivec2(64, 0), 0);
        sum += vec4(v0_4_0[1]) * texelFetch(W6, ivec2(65, 0), 0);
        sum += vec4(v0_4_0[2]) * texelFetch(W6, ivec2(66, 0), 0);
        sum += vec4(v0_4_0[3]) * texelFetch(W6, ivec2(67, 0), 0);
        vec4 v0_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, -2));
        sum += vec4(v0_4_1[0]) * texelFetch(W6, ivec2(68, 0), 0);
        sum += vec4(v0_4_1[1]) * texelFetch(W6, ivec2(69, 0), 0);
        sum += vec4(v0_4_1[2]) * texelFetch(W6, ivec2(70, 0), 0);
        sum += vec4(v0_4_1[3]) * texelFetch(W6, ivec2(71, 0), 0);
        vec4 v0_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, -2));
        sum += vec4(v0_4_2[0]) * texelFetch(W6, ivec2(72, 0), 0);
        sum += vec4(v0_4_2[1]) * texelFetch(W6, ivec2(73, 0), 0);
        sum += vec4(v0_4_2[2]) * texelFetch(W6, ivec2(74, 0), 0);
        sum += vec4(v0_4_2[3]) * texelFetch(W6, ivec2(75, 0), 0);
        vec4 v0_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, -2));
        sum += vec4(v0_4_3[0]) * texelFetch(W6, ivec2(76, 0), 0);
        sum += vec4(v0_4_3[1]) * texelFetch(W6, ivec2(77, 0), 0);
        sum += vec4(v0_4_3[2]) * texelFetch(W6, ivec2(78, 0), 0);
        sum += vec4(v0_4_3[3]) * texelFetch(W6, ivec2(79, 0), 0);
        vec4 v1_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, -1));
        sum += vec4(v1_0_0[0]) * texelFetch(W6, ivec2(80, 0), 0);
        sum += vec4(v1_0_0[1]) * texelFetch(W6, ivec2(81, 0), 0);
        sum += vec4(v1_0_0[2]) * texelFetch(W6, ivec2(82, 0), 0);
        sum += vec4(v1_0_0[3]) * texelFetch(W6, ivec2(83, 0), 0);
        vec4 v1_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, -1));
        sum += vec4(v1_0_1[0]) * texelFetch(W6, ivec2(84, 0), 0);
        sum += vec4(v1_0_1[1]) * texelFetch(W6, ivec2(85, 0), 0);
        sum += vec4(v1_0_1[2]) * texelFetch(W6, ivec2(86, 0), 0);
        sum += vec4(v1_0_1[3]) * texelFetch(W6, ivec2(87, 0), 0);
        vec4 v1_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, -1));
        sum += vec4(v1_0_2[0]) * texelFetch(W6, ivec2(88, 0), 0);
        sum += vec4(v1_0_2[1]) * texelFetch(W6, ivec2(89, 0), 0);
        sum += vec4(v1_0_2[2]) * texelFetch(W6, ivec2(90, 0), 0);
        sum += vec4(v1_0_2[3]) * texelFetch(W6, ivec2(91, 0), 0);
        vec4 v1_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, -1));
        sum += vec4(v1_0_3[0]) * texelFetch(W6, ivec2(92, 0), 0);
        sum += vec4(v1_0_3[1]) * texelFetch(W6, ivec2(93, 0), 0);
        sum += vec4(v1_0_3[2]) * texelFetch(W6, ivec2(94, 0), 0);
        sum += vec4(v1_0_3[3]) * texelFetch(W6, ivec2(95, 0), 0);
        vec4 v1_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v1_1_0[0]) * texelFetch(W6, ivec2(96, 0), 0);
        sum += vec4(v1_1_0[1]) * texelFetch(W6, ivec2(97, 0), 0);
        sum += vec4(v1_1_0[2]) * texelFetch(W6, ivec2(98, 0), 0);
        sum += vec4(v1_1_0[3]) * texelFetch(W6, ivec2(99, 0), 0);
        vec4 v1_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v1_1_1[0]) * texelFetch(W6, ivec2(100, 0), 0);
        sum += vec4(v1_1_1[1]) * texelFetch(W6, ivec2(101, 0), 0);
        sum += vec4(v1_1_1[2]) * texelFetch(W6, ivec2(102, 0), 0);
        sum += vec4(v1_1_1[3]) * texelFetch(W6, ivec2(103, 0), 0);
        vec4 v1_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v1_1_2[0]) * texelFetch(W6, ivec2(104, 0), 0);
        sum += vec4(v1_1_2[1]) * texelFetch(W6, ivec2(105, 0), 0);
        sum += vec4(v1_1_2[2]) * texelFetch(W6, ivec2(106, 0), 0);
        sum += vec4(v1_1_2[3]) * texelFetch(W6, ivec2(107, 0), 0);
        vec4 v1_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, -1));
        sum += vec4(v1_1_3[0]) * texelFetch(W6, ivec2(108, 0), 0);
        sum += vec4(v1_1_3[1]) * texelFetch(W6, ivec2(109, 0), 0);
        sum += vec4(v1_1_3[2]) * texelFetch(W6, ivec2(110, 0), 0);
        sum += vec4(v1_1_3[3]) * texelFetch(W6, ivec2(111, 0), 0);
        vec4 v1_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, -1));
        sum += vec4(v1_2_0[0]) * texelFetch(W6, ivec2(112, 0), 0);
        sum += vec4(v1_2_0[1]) * texelFetch(W6, ivec2(113, 0), 0);
        sum += vec4(v1_2_0[2]) * texelFetch(W6, ivec2(114, 0), 0);
        sum += vec4(v1_2_0[3]) * texelFetch(W6, ivec2(115, 0), 0);
        vec4 v1_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, -1));
        sum += vec4(v1_2_1[0]) * texelFetch(W6, ivec2(116, 0), 0);
        sum += vec4(v1_2_1[1]) * texelFetch(W6, ivec2(117, 0), 0);
        sum += vec4(v1_2_1[2]) * texelFetch(W6, ivec2(118, 0), 0);
        sum += vec4(v1_2_1[3]) * texelFetch(W6, ivec2(119, 0), 0);
        vec4 v1_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, -1));
        sum += vec4(v1_2_2[0]) * texelFetch(W6, ivec2(120, 0), 0);
        sum += vec4(v1_2_2[1]) * texelFetch(W6, ivec2(121, 0), 0);
        sum += vec4(v1_2_2[2]) * texelFetch(W6, ivec2(122, 0), 0);
        sum += vec4(v1_2_2[3]) * texelFetch(W6, ivec2(123, 0), 0);
        vec4 v1_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, -1));
        sum += vec4(v1_2_3[0]) * texelFetch(W6, ivec2(124, 0), 0);
        sum += vec4(v1_2_3[1]) * texelFetch(W6, ivec2(125, 0), 0);
        sum += vec4(v1_2_3[2]) * texelFetch(W6, ivec2(126, 0), 0);
        sum += vec4(v1_2_3[3]) * texelFetch(W6, ivec2(127, 0), 0);
        vec4 v1_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, -1));
        sum += vec4(v1_3_0[0]) * texelFetch(W6, ivec2(128, 0), 0);
        sum += vec4(v1_3_0[1]) * texelFetch(W6, ivec2(129, 0), 0);
        sum += vec4(v1_3_0[2]) * texelFetch(W6, ivec2(130, 0), 0);
        sum += vec4(v1_3_0[3]) * texelFetch(W6, ivec2(131, 0), 0);
        vec4 v1_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, -1));
        sum += vec4(v1_3_1[0]) * texelFetch(W6, ivec2(132, 0), 0);
        sum += vec4(v1_3_1[1]) * texelFetch(W6, ivec2(133, 0), 0);
        sum += vec4(v1_3_1[2]) * texelFetch(W6, ivec2(134, 0), 0);
        sum += vec4(v1_3_1[3]) * texelFetch(W6, ivec2(135, 0), 0);
        vec4 v1_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, -1));
        sum += vec4(v1_3_2[0]) * texelFetch(W6, ivec2(136, 0), 0);
        sum += vec4(v1_3_2[1]) * texelFetch(W6, ivec2(137, 0), 0);
        sum += vec4(v1_3_2[2]) * texelFetch(W6, ivec2(138, 0), 0);
        sum += vec4(v1_3_2[3]) * texelFetch(W6, ivec2(139, 0), 0);
        vec4 v1_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, -1));
        sum += vec4(v1_3_3[0]) * texelFetch(W6, ivec2(140, 0), 0);
        sum += vec4(v1_3_3[1]) * texelFetch(W6, ivec2(141, 0), 0);
        sum += vec4(v1_3_3[2]) * texelFetch(W6, ivec2(142, 0), 0);
        sum += vec4(v1_3_3[3]) * texelFetch(W6, ivec2(143, 0), 0);
        vec4 v1_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, -1));
        sum += vec4(v1_4_0[0]) * texelFetch(W6, ivec2(144, 0), 0);
        sum += vec4(v1_4_0[1]) * texelFetch(W6, ivec2(145, 0), 0);
        sum += vec4(v1_4_0[2]) * texelFetch(W6, ivec2(146, 0), 0);
        sum += vec4(v1_4_0[3]) * texelFetch(W6, ivec2(147, 0), 0);
        vec4 v1_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, -1));
        sum += vec4(v1_4_1[0]) * texelFetch(W6, ivec2(148, 0), 0);
        sum += vec4(v1_4_1[1]) * texelFetch(W6, ivec2(149, 0), 0);
        sum += vec4(v1_4_1[2]) * texelFetch(W6, ivec2(150, 0), 0);
        sum += vec4(v1_4_1[3]) * texelFetch(W6, ivec2(151, 0), 0);
        vec4 v1_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, -1));
        sum += vec4(v1_4_2[0]) * texelFetch(W6, ivec2(152, 0), 0);
        sum += vec4(v1_4_2[1]) * texelFetch(W6, ivec2(153, 0), 0);
        sum += vec4(v1_4_2[2]) * texelFetch(W6, ivec2(154, 0), 0);
        sum += vec4(v1_4_2[3]) * texelFetch(W6, ivec2(155, 0), 0);
        vec4 v1_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, -1));
        sum += vec4(v1_4_3[0]) * texelFetch(W6, ivec2(156, 0), 0);
        sum += vec4(v1_4_3[1]) * texelFetch(W6, ivec2(157, 0), 0);
        sum += vec4(v1_4_3[2]) * texelFetch(W6, ivec2(158, 0), 0);
        sum += vec4(v1_4_3[3]) * texelFetch(W6, ivec2(159, 0), 0);
        vec4 v2_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, 0));
        sum += vec4(v2_0_0[0]) * texelFetch(W6, ivec2(160, 0), 0);
        sum += vec4(v2_0_0[1]) * texelFetch(W6, ivec2(161, 0), 0);
        sum += vec4(v2_0_0[2]) * texelFetch(W6, ivec2(162, 0), 0);
        sum += vec4(v2_0_0[3]) * texelFetch(W6, ivec2(163, 0), 0);
        vec4 v2_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, 0));
        sum += vec4(v2_0_1[0]) * texelFetch(W6, ivec2(164, 0), 0);
        sum += vec4(v2_0_1[1]) * texelFetch(W6, ivec2(165, 0), 0);
        sum += vec4(v2_0_1[2]) * texelFetch(W6, ivec2(166, 0), 0);
        sum += vec4(v2_0_1[3]) * texelFetch(W6, ivec2(167, 0), 0);
        vec4 v2_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, 0));
        sum += vec4(v2_0_2[0]) * texelFetch(W6, ivec2(168, 0), 0);
        sum += vec4(v2_0_2[1]) * texelFetch(W6, ivec2(169, 0), 0);
        sum += vec4(v2_0_2[2]) * texelFetch(W6, ivec2(170, 0), 0);
        sum += vec4(v2_0_2[3]) * texelFetch(W6, ivec2(171, 0), 0);
        vec4 v2_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, 0));
        sum += vec4(v2_0_3[0]) * texelFetch(W6, ivec2(172, 0), 0);
        sum += vec4(v2_0_3[1]) * texelFetch(W6, ivec2(173, 0), 0);
        sum += vec4(v2_0_3[2]) * texelFetch(W6, ivec2(174, 0), 0);
        sum += vec4(v2_0_3[3]) * texelFetch(W6, ivec2(175, 0), 0);
        vec4 v2_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v2_1_0[0]) * texelFetch(W6, ivec2(176, 0), 0);
        sum += vec4(v2_1_0[1]) * texelFetch(W6, ivec2(177, 0), 0);
        sum += vec4(v2_1_0[2]) * texelFetch(W6, ivec2(178, 0), 0);
        sum += vec4(v2_1_0[3]) * texelFetch(W6, ivec2(179, 0), 0);
        vec4 v2_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v2_1_1[0]) * texelFetch(W6, ivec2(180, 0), 0);
        sum += vec4(v2_1_1[1]) * texelFetch(W6, ivec2(181, 0), 0);
        sum += vec4(v2_1_1[2]) * texelFetch(W6, ivec2(182, 0), 0);
        sum += vec4(v2_1_1[3]) * texelFetch(W6, ivec2(183, 0), 0);
        vec4 v2_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v2_1_2[0]) * texelFetch(W6, ivec2(184, 0), 0);
        sum += vec4(v2_1_2[1]) * texelFetch(W6, ivec2(185, 0), 0);
        sum += vec4(v2_1_2[2]) * texelFetch(W6, ivec2(186, 0), 0);
        sum += vec4(v2_1_2[3]) * texelFetch(W6, ivec2(187, 0), 0);
        vec4 v2_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, 0));
        sum += vec4(v2_1_3[0]) * texelFetch(W6, ivec2(188, 0), 0);
        sum += vec4(v2_1_3[1]) * texelFetch(W6, ivec2(189, 0), 0);
        sum += vec4(v2_1_3[2]) * texelFetch(W6, ivec2(190, 0), 0);
        sum += vec4(v2_1_3[3]) * texelFetch(W6, ivec2(191, 0), 0);
        vec4 v2_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, 0));
        sum += vec4(v2_2_0[0]) * texelFetch(W6, ivec2(192, 0), 0);
        sum += vec4(v2_2_0[1]) * texelFetch(W6, ivec2(193, 0), 0);
        sum += vec4(v2_2_0[2]) * texelFetch(W6, ivec2(194, 0), 0);
        sum += vec4(v2_2_0[3]) * texelFetch(W6, ivec2(195, 0), 0);
        vec4 v2_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, 0));
        sum += vec4(v2_2_1[0]) * texelFetch(W6, ivec2(196, 0), 0);
        sum += vec4(v2_2_1[1]) * texelFetch(W6, ivec2(197, 0), 0);
        sum += vec4(v2_2_1[2]) * texelFetch(W6, ivec2(198, 0), 0);
        sum += vec4(v2_2_1[3]) * texelFetch(W6, ivec2(199, 0), 0);
        vec4 v2_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, 0));
        sum += vec4(v2_2_2[0]) * texelFetch(W6, ivec2(200, 0), 0);
        sum += vec4(v2_2_2[1]) * texelFetch(W6, ivec2(201, 0), 0);
        sum += vec4(v2_2_2[2]) * texelFetch(W6, ivec2(202, 0), 0);
        sum += vec4(v2_2_2[3]) * texelFetch(W6, ivec2(203, 0), 0);
        vec4 v2_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, 0));
        sum += vec4(v2_2_3[0]) * texelFetch(W6, ivec2(204, 0), 0);
        sum += vec4(v2_2_3[1]) * texelFetch(W6, ivec2(205, 0), 0);
        sum += vec4(v2_2_3[2]) * texelFetch(W6, ivec2(206, 0), 0);
        sum += vec4(v2_2_3[3]) * texelFetch(W6, ivec2(207, 0), 0);
        vec4 v2_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, 0));
        sum += vec4(v2_3_0[0]) * texelFetch(W6, ivec2(208, 0), 0);
        sum += vec4(v2_3_0[1]) * texelFetch(W6, ivec2(209, 0), 0);
        sum += vec4(v2_3_0[2]) * texelFetch(W6, ivec2(210, 0), 0);
        sum += vec4(v2_3_0[3]) * texelFetch(W6, ivec2(211, 0), 0);
        vec4 v2_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, 0));
        sum += vec4(v2_3_1[0]) * texelFetch(W6, ivec2(212, 0), 0);
        sum += vec4(v2_3_1[1]) * texelFetch(W6, ivec2(213, 0), 0);
        sum += vec4(v2_3_1[2]) * texelFetch(W6, ivec2(214, 0), 0);
        sum += vec4(v2_3_1[3]) * texelFetch(W6, ivec2(215, 0), 0);
        vec4 v2_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, 0));
        sum += vec4(v2_3_2[0]) * texelFetch(W6, ivec2(216, 0), 0);
        sum += vec4(v2_3_2[1]) * texelFetch(W6, ivec2(217, 0), 0);
        sum += vec4(v2_3_2[2]) * texelFetch(W6, ivec2(218, 0), 0);
        sum += vec4(v2_3_2[3]) * texelFetch(W6, ivec2(219, 0), 0);
        vec4 v2_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, 0));
        sum += vec4(v2_3_3[0]) * texelFetch(W6, ivec2(220, 0), 0);
        sum += vec4(v2_3_3[1]) * texelFetch(W6, ivec2(221, 0), 0);
        sum += vec4(v2_3_3[2]) * texelFetch(W6, ivec2(222, 0), 0);
        sum += vec4(v2_3_3[3]) * texelFetch(W6, ivec2(223, 0), 0);
        vec4 v2_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, 0));
        sum += vec4(v2_4_0[0]) * texelFetch(W6, ivec2(224, 0), 0);
        sum += vec4(v2_4_0[1]) * texelFetch(W6, ivec2(225, 0), 0);
        sum += vec4(v2_4_0[2]) * texelFetch(W6, ivec2(226, 0), 0);
        sum += vec4(v2_4_0[3]) * texelFetch(W6, ivec2(227, 0), 0);
        vec4 v2_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, 0));
        sum += vec4(v2_4_1[0]) * texelFetch(W6, ivec2(228, 0), 0);
        sum += vec4(v2_4_1[1]) * texelFetch(W6, ivec2(229, 0), 0);
        sum += vec4(v2_4_1[2]) * texelFetch(W6, ivec2(230, 0), 0);
        sum += vec4(v2_4_1[3]) * texelFetch(W6, ivec2(231, 0), 0);
        vec4 v2_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, 0));
        sum += vec4(v2_4_2[0]) * texelFetch(W6, ivec2(232, 0), 0);
        sum += vec4(v2_4_2[1]) * texelFetch(W6, ivec2(233, 0), 0);
        sum += vec4(v2_4_2[2]) * texelFetch(W6, ivec2(234, 0), 0);
        sum += vec4(v2_4_2[3]) * texelFetch(W6, ivec2(235, 0), 0);
        vec4 v2_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, 0));
        sum += vec4(v2_4_3[0]) * texelFetch(W6, ivec2(236, 0), 0);
        sum += vec4(v2_4_3[1]) * texelFetch(W6, ivec2(237, 0), 0);
        sum += vec4(v2_4_3[2]) * texelFetch(W6, ivec2(238, 0), 0);
        sum += vec4(v2_4_3[3]) * texelFetch(W6, ivec2(239, 0), 0);
        vec4 v3_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, 1));
        sum += vec4(v3_0_0[0]) * texelFetch(W6, ivec2(240, 0), 0);
        sum += vec4(v3_0_0[1]) * texelFetch(W6, ivec2(241, 0), 0);
        sum += vec4(v3_0_0[2]) * texelFetch(W6, ivec2(242, 0), 0);
        sum += vec4(v3_0_0[3]) * texelFetch(W6, ivec2(243, 0), 0);
        vec4 v3_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, 1));
        sum += vec4(v3_0_1[0]) * texelFetch(W6, ivec2(244, 0), 0);
        sum += vec4(v3_0_1[1]) * texelFetch(W6, ivec2(245, 0), 0);
        sum += vec4(v3_0_1[2]) * texelFetch(W6, ivec2(246, 0), 0);
        sum += vec4(v3_0_1[3]) * texelFetch(W6, ivec2(247, 0), 0);
        vec4 v3_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, 1));
        sum += vec4(v3_0_2[0]) * texelFetch(W6, ivec2(248, 0), 0);
        sum += vec4(v3_0_2[1]) * texelFetch(W6, ivec2(249, 0), 0);
        sum += vec4(v3_0_2[2]) * texelFetch(W6, ivec2(250, 0), 0);
        sum += vec4(v3_0_2[3]) * texelFetch(W6, ivec2(251, 0), 0);
        vec4 v3_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, 1));
        sum += vec4(v3_0_3[0]) * texelFetch(W6, ivec2(252, 0), 0);
        sum += vec4(v3_0_3[1]) * texelFetch(W6, ivec2(253, 0), 0);
        sum += vec4(v3_0_3[2]) * texelFetch(W6, ivec2(254, 0), 0);
        sum += vec4(v3_0_3[3]) * texelFetch(W6, ivec2(255, 0), 0);
        vec4 v3_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v3_1_0[0]) * texelFetch(W6, ivec2(256, 0), 0);
        sum += vec4(v3_1_0[1]) * texelFetch(W6, ivec2(257, 0), 0);
        sum += vec4(v3_1_0[2]) * texelFetch(W6, ivec2(258, 0), 0);
        sum += vec4(v3_1_0[3]) * texelFetch(W6, ivec2(259, 0), 0);
        vec4 v3_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v3_1_1[0]) * texelFetch(W6, ivec2(260, 0), 0);
        sum += vec4(v3_1_1[1]) * texelFetch(W6, ivec2(261, 0), 0);
        sum += vec4(v3_1_1[2]) * texelFetch(W6, ivec2(262, 0), 0);
        sum += vec4(v3_1_1[3]) * texelFetch(W6, ivec2(263, 0), 0);
        vec4 v3_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v3_1_2[0]) * texelFetch(W6, ivec2(264, 0), 0);
        sum += vec4(v3_1_2[1]) * texelFetch(W6, ivec2(265, 0), 0);
        sum += vec4(v3_1_2[2]) * texelFetch(W6, ivec2(266, 0), 0);
        sum += vec4(v3_1_2[3]) * texelFetch(W6, ivec2(267, 0), 0);
        vec4 v3_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, 1));
        sum += vec4(v3_1_3[0]) * texelFetch(W6, ivec2(268, 0), 0);
        sum += vec4(v3_1_3[1]) * texelFetch(W6, ivec2(269, 0), 0);
        sum += vec4(v3_1_3[2]) * texelFetch(W6, ivec2(270, 0), 0);
        sum += vec4(v3_1_3[3]) * texelFetch(W6, ivec2(271, 0), 0);
        vec4 v3_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, 1));
        sum += vec4(v3_2_0[0]) * texelFetch(W6, ivec2(272, 0), 0);
        sum += vec4(v3_2_0[1]) * texelFetch(W6, ivec2(273, 0), 0);
        sum += vec4(v3_2_0[2]) * texelFetch(W6, ivec2(274, 0), 0);
        sum += vec4(v3_2_0[3]) * texelFetch(W6, ivec2(275, 0), 0);
        vec4 v3_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, 1));
        sum += vec4(v3_2_1[0]) * texelFetch(W6, ivec2(276, 0), 0);
        sum += vec4(v3_2_1[1]) * texelFetch(W6, ivec2(277, 0), 0);
        sum += vec4(v3_2_1[2]) * texelFetch(W6, ivec2(278, 0), 0);
        sum += vec4(v3_2_1[3]) * texelFetch(W6, ivec2(279, 0), 0);
        vec4 v3_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, 1));
        sum += vec4(v3_2_2[0]) * texelFetch(W6, ivec2(280, 0), 0);
        sum += vec4(v3_2_2[1]) * texelFetch(W6, ivec2(281, 0), 0);
        sum += vec4(v3_2_2[2]) * texelFetch(W6, ivec2(282, 0), 0);
        sum += vec4(v3_2_2[3]) * texelFetch(W6, ivec2(283, 0), 0);
        vec4 v3_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, 1));
        sum += vec4(v3_2_3[0]) * texelFetch(W6, ivec2(284, 0), 0);
        sum += vec4(v3_2_3[1]) * texelFetch(W6, ivec2(285, 0), 0);
        sum += vec4(v3_2_3[2]) * texelFetch(W6, ivec2(286, 0), 0);
        sum += vec4(v3_2_3[3]) * texelFetch(W6, ivec2(287, 0), 0);
        vec4 v3_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, 1));
        sum += vec4(v3_3_0[0]) * texelFetch(W6, ivec2(288, 0), 0);
        sum += vec4(v3_3_0[1]) * texelFetch(W6, ivec2(289, 0), 0);
        sum += vec4(v3_3_0[2]) * texelFetch(W6, ivec2(290, 0), 0);
        sum += vec4(v3_3_0[3]) * texelFetch(W6, ivec2(291, 0), 0);
        vec4 v3_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, 1));
        sum += vec4(v3_3_1[0]) * texelFetch(W6, ivec2(292, 0), 0);
        sum += vec4(v3_3_1[1]) * texelFetch(W6, ivec2(293, 0), 0);
        sum += vec4(v3_3_1[2]) * texelFetch(W6, ivec2(294, 0), 0);
        sum += vec4(v3_3_1[3]) * texelFetch(W6, ivec2(295, 0), 0);
        vec4 v3_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, 1));
        sum += vec4(v3_3_2[0]) * texelFetch(W6, ivec2(296, 0), 0);
        sum += vec4(v3_3_2[1]) * texelFetch(W6, ivec2(297, 0), 0);
        sum += vec4(v3_3_2[2]) * texelFetch(W6, ivec2(298, 0), 0);
        sum += vec4(v3_3_2[3]) * texelFetch(W6, ivec2(299, 0), 0);
        vec4 v3_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, 1));
        sum += vec4(v3_3_3[0]) * texelFetch(W6, ivec2(300, 0), 0);
        sum += vec4(v3_3_3[1]) * texelFetch(W6, ivec2(301, 0), 0);
        sum += vec4(v3_3_3[2]) * texelFetch(W6, ivec2(302, 0), 0);
        sum += vec4(v3_3_3[3]) * texelFetch(W6, ivec2(303, 0), 0);
        vec4 v3_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, 1));
        sum += vec4(v3_4_0[0]) * texelFetch(W6, ivec2(304, 0), 0);
        sum += vec4(v3_4_0[1]) * texelFetch(W6, ivec2(305, 0), 0);
        sum += vec4(v3_4_0[2]) * texelFetch(W6, ivec2(306, 0), 0);
        sum += vec4(v3_4_0[3]) * texelFetch(W6, ivec2(307, 0), 0);
        vec4 v3_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, 1));
        sum += vec4(v3_4_1[0]) * texelFetch(W6, ivec2(308, 0), 0);
        sum += vec4(v3_4_1[1]) * texelFetch(W6, ivec2(309, 0), 0);
        sum += vec4(v3_4_1[2]) * texelFetch(W6, ivec2(310, 0), 0);
        sum += vec4(v3_4_1[3]) * texelFetch(W6, ivec2(311, 0), 0);
        vec4 v3_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, 1));
        sum += vec4(v3_4_2[0]) * texelFetch(W6, ivec2(312, 0), 0);
        sum += vec4(v3_4_2[1]) * texelFetch(W6, ivec2(313, 0), 0);
        sum += vec4(v3_4_2[2]) * texelFetch(W6, ivec2(314, 0), 0);
        sum += vec4(v3_4_2[3]) * texelFetch(W6, ivec2(315, 0), 0);
        vec4 v3_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, 1));
        sum += vec4(v3_4_3[0]) * texelFetch(W6, ivec2(316, 0), 0);
        sum += vec4(v3_4_3[1]) * texelFetch(W6, ivec2(317, 0), 0);
        sum += vec4(v3_4_3[2]) * texelFetch(W6, ivec2(318, 0), 0);
        sum += vec4(v3_4_3[3]) * texelFetch(W6, ivec2(319, 0), 0);
        vec4 v4_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, 2));
        sum += vec4(v4_0_0[0]) * texelFetch(W6, ivec2(320, 0), 0);
        sum += vec4(v4_0_0[1]) * texelFetch(W6, ivec2(321, 0), 0);
        sum += vec4(v4_0_0[2]) * texelFetch(W6, ivec2(322, 0), 0);
        sum += vec4(v4_0_0[3]) * texelFetch(W6, ivec2(323, 0), 0);
        vec4 v4_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, 2));
        sum += vec4(v4_0_1[0]) * texelFetch(W6, ivec2(324, 0), 0);
        sum += vec4(v4_0_1[1]) * texelFetch(W6, ivec2(325, 0), 0);
        sum += vec4(v4_0_1[2]) * texelFetch(W6, ivec2(326, 0), 0);
        sum += vec4(v4_0_1[3]) * texelFetch(W6, ivec2(327, 0), 0);
        vec4 v4_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, 2));
        sum += vec4(v4_0_2[0]) * texelFetch(W6, ivec2(328, 0), 0);
        sum += vec4(v4_0_2[1]) * texelFetch(W6, ivec2(329, 0), 0);
        sum += vec4(v4_0_2[2]) * texelFetch(W6, ivec2(330, 0), 0);
        sum += vec4(v4_0_2[3]) * texelFetch(W6, ivec2(331, 0), 0);
        vec4 v4_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, 2));
        sum += vec4(v4_0_3[0]) * texelFetch(W6, ivec2(332, 0), 0);
        sum += vec4(v4_0_3[1]) * texelFetch(W6, ivec2(333, 0), 0);
        sum += vec4(v4_0_3[2]) * texelFetch(W6, ivec2(334, 0), 0);
        sum += vec4(v4_0_3[3]) * texelFetch(W6, ivec2(335, 0), 0);
        vec4 v4_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, 2));
        sum += vec4(v4_1_0[0]) * texelFetch(W6, ivec2(336, 0), 0);
        sum += vec4(v4_1_0[1]) * texelFetch(W6, ivec2(337, 0), 0);
        sum += vec4(v4_1_0[2]) * texelFetch(W6, ivec2(338, 0), 0);
        sum += vec4(v4_1_0[3]) * texelFetch(W6, ivec2(339, 0), 0);
        vec4 v4_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, 2));
        sum += vec4(v4_1_1[0]) * texelFetch(W6, ivec2(340, 0), 0);
        sum += vec4(v4_1_1[1]) * texelFetch(W6, ivec2(341, 0), 0);
        sum += vec4(v4_1_1[2]) * texelFetch(W6, ivec2(342, 0), 0);
        sum += vec4(v4_1_1[3]) * texelFetch(W6, ivec2(343, 0), 0);
        vec4 v4_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, 2));
        sum += vec4(v4_1_2[0]) * texelFetch(W6, ivec2(344, 0), 0);
        sum += vec4(v4_1_2[1]) * texelFetch(W6, ivec2(345, 0), 0);
        sum += vec4(v4_1_2[2]) * texelFetch(W6, ivec2(346, 0), 0);
        sum += vec4(v4_1_2[3]) * texelFetch(W6, ivec2(347, 0), 0);
        vec4 v4_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, 2));
        sum += vec4(v4_1_3[0]) * texelFetch(W6, ivec2(348, 0), 0);
        sum += vec4(v4_1_3[1]) * texelFetch(W6, ivec2(349, 0), 0);
        sum += vec4(v4_1_3[2]) * texelFetch(W6, ivec2(350, 0), 0);
        sum += vec4(v4_1_3[3]) * texelFetch(W6, ivec2(351, 0), 0);
        vec4 v4_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, 2));
        sum += vec4(v4_2_0[0]) * texelFetch(W6, ivec2(352, 0), 0);
        sum += vec4(v4_2_0[1]) * texelFetch(W6, ivec2(353, 0), 0);
        sum += vec4(v4_2_0[2]) * texelFetch(W6, ivec2(354, 0), 0);
        sum += vec4(v4_2_0[3]) * texelFetch(W6, ivec2(355, 0), 0);
        vec4 v4_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, 2));
        sum += vec4(v4_2_1[0]) * texelFetch(W6, ivec2(356, 0), 0);
        sum += vec4(v4_2_1[1]) * texelFetch(W6, ivec2(357, 0), 0);
        sum += vec4(v4_2_1[2]) * texelFetch(W6, ivec2(358, 0), 0);
        sum += vec4(v4_2_1[3]) * texelFetch(W6, ivec2(359, 0), 0);
        vec4 v4_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, 2));
        sum += vec4(v4_2_2[0]) * texelFetch(W6, ivec2(360, 0), 0);
        sum += vec4(v4_2_2[1]) * texelFetch(W6, ivec2(361, 0), 0);
        sum += vec4(v4_2_2[2]) * texelFetch(W6, ivec2(362, 0), 0);
        sum += vec4(v4_2_2[3]) * texelFetch(W6, ivec2(363, 0), 0);
        vec4 v4_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, 2));
        sum += vec4(v4_2_3[0]) * texelFetch(W6, ivec2(364, 0), 0);
        sum += vec4(v4_2_3[1]) * texelFetch(W6, ivec2(365, 0), 0);
        sum += vec4(v4_2_3[2]) * texelFetch(W6, ivec2(366, 0), 0);
        sum += vec4(v4_2_3[3]) * texelFetch(W6, ivec2(367, 0), 0);
        vec4 v4_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, 2));
        sum += vec4(v4_3_0[0]) * texelFetch(W6, ivec2(368, 0), 0);
        sum += vec4(v4_3_0[1]) * texelFetch(W6, ivec2(369, 0), 0);
        sum += vec4(v4_3_0[2]) * texelFetch(W6, ivec2(370, 0), 0);
        sum += vec4(v4_3_0[3]) * texelFetch(W6, ivec2(371, 0), 0);
        vec4 v4_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, 2));
        sum += vec4(v4_3_1[0]) * texelFetch(W6, ivec2(372, 0), 0);
        sum += vec4(v4_3_1[1]) * texelFetch(W6, ivec2(373, 0), 0);
        sum += vec4(v4_3_1[2]) * texelFetch(W6, ivec2(374, 0), 0);
        sum += vec4(v4_3_1[3]) * texelFetch(W6, ivec2(375, 0), 0);
        vec4 v4_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, 2));
        sum += vec4(v4_3_2[0]) * texelFetch(W6, ivec2(376, 0), 0);
        sum += vec4(v4_3_2[1]) * texelFetch(W6, ivec2(377, 0), 0);
        sum += vec4(v4_3_2[2]) * texelFetch(W6, ivec2(378, 0), 0);
        sum += vec4(v4_3_2[3]) * texelFetch(W6, ivec2(379, 0), 0);
        vec4 v4_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, 2));
        sum += vec4(v4_3_3[0]) * texelFetch(W6, ivec2(380, 0), 0);
        sum += vec4(v4_3_3[1]) * texelFetch(W6, ivec2(381, 0), 0);
        sum += vec4(v4_3_3[2]) * texelFetch(W6, ivec2(382, 0), 0);
        sum += vec4(v4_3_3[3]) * texelFetch(W6, ivec2(383, 0), 0);
        vec4 v4_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, 2));
        sum += vec4(v4_4_0[0]) * texelFetch(W6, ivec2(384, 0), 0);
        sum += vec4(v4_4_0[1]) * texelFetch(W6, ivec2(385, 0), 0);
        sum += vec4(v4_4_0[2]) * texelFetch(W6, ivec2(386, 0), 0);
        sum += vec4(v4_4_0[3]) * texelFetch(W6, ivec2(387, 0), 0);
        vec4 v4_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, 2));
        sum += vec4(v4_4_1[0]) * texelFetch(W6, ivec2(388, 0), 0);
        sum += vec4(v4_4_1[1]) * texelFetch(W6, ivec2(389, 0), 0);
        sum += vec4(v4_4_1[2]) * texelFetch(W6, ivec2(390, 0), 0);
        sum += vec4(v4_4_1[3]) * texelFetch(W6, ivec2(391, 0), 0);
        vec4 v4_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, 2));
        sum += vec4(v4_4_2[0]) * texelFetch(W6, ivec2(392, 0), 0);
        sum += vec4(v4_4_2[1]) * texelFetch(W6, ivec2(393, 0), 0);
        sum += vec4(v4_4_2[2]) * texelFetch(W6, ivec2(394, 0), 0);
        sum += vec4(v4_4_2[3]) * texelFetch(W6, ivec2(395, 0), 0);
        vec4 v4_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, 2));
        sum += vec4(v4_4_3[0]) * texelFetch(W6, ivec2(396, 0), 0);
        sum += vec4(v4_4_3[1]) * texelFetch(W6, ivec2(397, 0), 0);
        sum += vec4(v4_4_3[2]) * texelFetch(W6, ivec2(398, 0), 0);
        sum += vec4(v4_4_3[3]) * texelFetch(W6, ivec2(399, 0), 0);
    } else {
        ivec2 t0_0 = p + ivec2(-2, -2);
        vec4 s0_0_0 = vec4(0.0);
        vec4 s0_0_1 = vec4(0.0);
        vec4 s0_0_2 = vec4(0.0);
        vec4 s0_0_3 = vec4(0.0);
        if (uint(t0_0.x) < uint(sz.x) && uint(t0_0.y) < uint(sz.y)) {
            s0_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, -2));
            s0_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, -2));
            s0_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, -2));
            s0_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, -2));
        }
        sum += vec4(s0_0_0[0]) * texelFetch(W6, ivec2(0, 0), 0);
        sum += vec4(s0_0_0[1]) * texelFetch(W6, ivec2(1, 0), 0);
        sum += vec4(s0_0_0[2]) * texelFetch(W6, ivec2(2, 0), 0);
        sum += vec4(s0_0_0[3]) * texelFetch(W6, ivec2(3, 0), 0);
        sum += vec4(s0_0_1[0]) * texelFetch(W6, ivec2(4, 0), 0);
        sum += vec4(s0_0_1[1]) * texelFetch(W6, ivec2(5, 0), 0);
        sum += vec4(s0_0_1[2]) * texelFetch(W6, ivec2(6, 0), 0);
        sum += vec4(s0_0_1[3]) * texelFetch(W6, ivec2(7, 0), 0);
        sum += vec4(s0_0_2[0]) * texelFetch(W6, ivec2(8, 0), 0);
        sum += vec4(s0_0_2[1]) * texelFetch(W6, ivec2(9, 0), 0);
        sum += vec4(s0_0_2[2]) * texelFetch(W6, ivec2(10, 0), 0);
        sum += vec4(s0_0_2[3]) * texelFetch(W6, ivec2(11, 0), 0);
        sum += vec4(s0_0_3[0]) * texelFetch(W6, ivec2(12, 0), 0);
        sum += vec4(s0_0_3[1]) * texelFetch(W6, ivec2(13, 0), 0);
        sum += vec4(s0_0_3[2]) * texelFetch(W6, ivec2(14, 0), 0);
        sum += vec4(s0_0_3[3]) * texelFetch(W6, ivec2(15, 0), 0);
        ivec2 t0_1 = p + ivec2(-1, -2);
        vec4 s0_1_0 = vec4(0.0);
        vec4 s0_1_1 = vec4(0.0);
        vec4 s0_1_2 = vec4(0.0);
        vec4 s0_1_3 = vec4(0.0);
        if (uint(t0_1.x) < uint(sz.x) && uint(t0_1.y) < uint(sz.y)) {
            s0_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, -2));
            s0_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, -2));
            s0_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, -2));
            s0_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, -2));
        }
        sum += vec4(s0_1_0[0]) * texelFetch(W6, ivec2(16, 0), 0);
        sum += vec4(s0_1_0[1]) * texelFetch(W6, ivec2(17, 0), 0);
        sum += vec4(s0_1_0[2]) * texelFetch(W6, ivec2(18, 0), 0);
        sum += vec4(s0_1_0[3]) * texelFetch(W6, ivec2(19, 0), 0);
        sum += vec4(s0_1_1[0]) * texelFetch(W6, ivec2(20, 0), 0);
        sum += vec4(s0_1_1[1]) * texelFetch(W6, ivec2(21, 0), 0);
        sum += vec4(s0_1_1[2]) * texelFetch(W6, ivec2(22, 0), 0);
        sum += vec4(s0_1_1[3]) * texelFetch(W6, ivec2(23, 0), 0);
        sum += vec4(s0_1_2[0]) * texelFetch(W6, ivec2(24, 0), 0);
        sum += vec4(s0_1_2[1]) * texelFetch(W6, ivec2(25, 0), 0);
        sum += vec4(s0_1_2[2]) * texelFetch(W6, ivec2(26, 0), 0);
        sum += vec4(s0_1_2[3]) * texelFetch(W6, ivec2(27, 0), 0);
        sum += vec4(s0_1_3[0]) * texelFetch(W6, ivec2(28, 0), 0);
        sum += vec4(s0_1_3[1]) * texelFetch(W6, ivec2(29, 0), 0);
        sum += vec4(s0_1_3[2]) * texelFetch(W6, ivec2(30, 0), 0);
        sum += vec4(s0_1_3[3]) * texelFetch(W6, ivec2(31, 0), 0);
        ivec2 t0_2 = p + ivec2(0, -2);
        vec4 s0_2_0 = vec4(0.0);
        vec4 s0_2_1 = vec4(0.0);
        vec4 s0_2_2 = vec4(0.0);
        vec4 s0_2_3 = vec4(0.0);
        if (uint(t0_2.x) < uint(sz.x) && uint(t0_2.y) < uint(sz.y)) {
            s0_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, -2));
            s0_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, -2));
            s0_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, -2));
            s0_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, -2));
        }
        sum += vec4(s0_2_0[0]) * texelFetch(W6, ivec2(32, 0), 0);
        sum += vec4(s0_2_0[1]) * texelFetch(W6, ivec2(33, 0), 0);
        sum += vec4(s0_2_0[2]) * texelFetch(W6, ivec2(34, 0), 0);
        sum += vec4(s0_2_0[3]) * texelFetch(W6, ivec2(35, 0), 0);
        sum += vec4(s0_2_1[0]) * texelFetch(W6, ivec2(36, 0), 0);
        sum += vec4(s0_2_1[1]) * texelFetch(W6, ivec2(37, 0), 0);
        sum += vec4(s0_2_1[2]) * texelFetch(W6, ivec2(38, 0), 0);
        sum += vec4(s0_2_1[3]) * texelFetch(W6, ivec2(39, 0), 0);
        sum += vec4(s0_2_2[0]) * texelFetch(W6, ivec2(40, 0), 0);
        sum += vec4(s0_2_2[1]) * texelFetch(W6, ivec2(41, 0), 0);
        sum += vec4(s0_2_2[2]) * texelFetch(W6, ivec2(42, 0), 0);
        sum += vec4(s0_2_2[3]) * texelFetch(W6, ivec2(43, 0), 0);
        sum += vec4(s0_2_3[0]) * texelFetch(W6, ivec2(44, 0), 0);
        sum += vec4(s0_2_3[1]) * texelFetch(W6, ivec2(45, 0), 0);
        sum += vec4(s0_2_3[2]) * texelFetch(W6, ivec2(46, 0), 0);
        sum += vec4(s0_2_3[3]) * texelFetch(W6, ivec2(47, 0), 0);
        ivec2 t0_3 = p + ivec2(1, -2);
        vec4 s0_3_0 = vec4(0.0);
        vec4 s0_3_1 = vec4(0.0);
        vec4 s0_3_2 = vec4(0.0);
        vec4 s0_3_3 = vec4(0.0);
        if (uint(t0_3.x) < uint(sz.x) && uint(t0_3.y) < uint(sz.y)) {
            s0_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, -2));
            s0_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, -2));
            s0_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, -2));
            s0_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, -2));
        }
        sum += vec4(s0_3_0[0]) * texelFetch(W6, ivec2(48, 0), 0);
        sum += vec4(s0_3_0[1]) * texelFetch(W6, ivec2(49, 0), 0);
        sum += vec4(s0_3_0[2]) * texelFetch(W6, ivec2(50, 0), 0);
        sum += vec4(s0_3_0[3]) * texelFetch(W6, ivec2(51, 0), 0);
        sum += vec4(s0_3_1[0]) * texelFetch(W6, ivec2(52, 0), 0);
        sum += vec4(s0_3_1[1]) * texelFetch(W6, ivec2(53, 0), 0);
        sum += vec4(s0_3_1[2]) * texelFetch(W6, ivec2(54, 0), 0);
        sum += vec4(s0_3_1[3]) * texelFetch(W6, ivec2(55, 0), 0);
        sum += vec4(s0_3_2[0]) * texelFetch(W6, ivec2(56, 0), 0);
        sum += vec4(s0_3_2[1]) * texelFetch(W6, ivec2(57, 0), 0);
        sum += vec4(s0_3_2[2]) * texelFetch(W6, ivec2(58, 0), 0);
        sum += vec4(s0_3_2[3]) * texelFetch(W6, ivec2(59, 0), 0);
        sum += vec4(s0_3_3[0]) * texelFetch(W6, ivec2(60, 0), 0);
        sum += vec4(s0_3_3[1]) * texelFetch(W6, ivec2(61, 0), 0);
        sum += vec4(s0_3_3[2]) * texelFetch(W6, ivec2(62, 0), 0);
        sum += vec4(s0_3_3[3]) * texelFetch(W6, ivec2(63, 0), 0);
        ivec2 t0_4 = p + ivec2(2, -2);
        vec4 s0_4_0 = vec4(0.0);
        vec4 s0_4_1 = vec4(0.0);
        vec4 s0_4_2 = vec4(0.0);
        vec4 s0_4_3 = vec4(0.0);
        if (uint(t0_4.x) < uint(sz.x) && uint(t0_4.y) < uint(sz.y)) {
            s0_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, -2));
            s0_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, -2));
            s0_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, -2));
            s0_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, -2));
        }
        sum += vec4(s0_4_0[0]) * texelFetch(W6, ivec2(64, 0), 0);
        sum += vec4(s0_4_0[1]) * texelFetch(W6, ivec2(65, 0), 0);
        sum += vec4(s0_4_0[2]) * texelFetch(W6, ivec2(66, 0), 0);
        sum += vec4(s0_4_0[3]) * texelFetch(W6, ivec2(67, 0), 0);
        sum += vec4(s0_4_1[0]) * texelFetch(W6, ivec2(68, 0), 0);
        sum += vec4(s0_4_1[1]) * texelFetch(W6, ivec2(69, 0), 0);
        sum += vec4(s0_4_1[2]) * texelFetch(W6, ivec2(70, 0), 0);
        sum += vec4(s0_4_1[3]) * texelFetch(W6, ivec2(71, 0), 0);
        sum += vec4(s0_4_2[0]) * texelFetch(W6, ivec2(72, 0), 0);
        sum += vec4(s0_4_2[1]) * texelFetch(W6, ivec2(73, 0), 0);
        sum += vec4(s0_4_2[2]) * texelFetch(W6, ivec2(74, 0), 0);
        sum += vec4(s0_4_2[3]) * texelFetch(W6, ivec2(75, 0), 0);
        sum += vec4(s0_4_3[0]) * texelFetch(W6, ivec2(76, 0), 0);
        sum += vec4(s0_4_3[1]) * texelFetch(W6, ivec2(77, 0), 0);
        sum += vec4(s0_4_3[2]) * texelFetch(W6, ivec2(78, 0), 0);
        sum += vec4(s0_4_3[3]) * texelFetch(W6, ivec2(79, 0), 0);
        ivec2 t1_0 = p + ivec2(-2, -1);
        vec4 s1_0_0 = vec4(0.0);
        vec4 s1_0_1 = vec4(0.0);
        vec4 s1_0_2 = vec4(0.0);
        vec4 s1_0_3 = vec4(0.0);
        if (uint(t1_0.x) < uint(sz.x) && uint(t1_0.y) < uint(sz.y)) {
            s1_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, -1));
            s1_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, -1));
            s1_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, -1));
            s1_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, -1));
        }
        sum += vec4(s1_0_0[0]) * texelFetch(W6, ivec2(80, 0), 0);
        sum += vec4(s1_0_0[1]) * texelFetch(W6, ivec2(81, 0), 0);
        sum += vec4(s1_0_0[2]) * texelFetch(W6, ivec2(82, 0), 0);
        sum += vec4(s1_0_0[3]) * texelFetch(W6, ivec2(83, 0), 0);
        sum += vec4(s1_0_1[0]) * texelFetch(W6, ivec2(84, 0), 0);
        sum += vec4(s1_0_1[1]) * texelFetch(W6, ivec2(85, 0), 0);
        sum += vec4(s1_0_1[2]) * texelFetch(W6, ivec2(86, 0), 0);
        sum += vec4(s1_0_1[3]) * texelFetch(W6, ivec2(87, 0), 0);
        sum += vec4(s1_0_2[0]) * texelFetch(W6, ivec2(88, 0), 0);
        sum += vec4(s1_0_2[1]) * texelFetch(W6, ivec2(89, 0), 0);
        sum += vec4(s1_0_2[2]) * texelFetch(W6, ivec2(90, 0), 0);
        sum += vec4(s1_0_2[3]) * texelFetch(W6, ivec2(91, 0), 0);
        sum += vec4(s1_0_3[0]) * texelFetch(W6, ivec2(92, 0), 0);
        sum += vec4(s1_0_3[1]) * texelFetch(W6, ivec2(93, 0), 0);
        sum += vec4(s1_0_3[2]) * texelFetch(W6, ivec2(94, 0), 0);
        sum += vec4(s1_0_3[3]) * texelFetch(W6, ivec2(95, 0), 0);
        ivec2 t1_1 = p + ivec2(-1, -1);
        vec4 s1_1_0 = vec4(0.0);
        vec4 s1_1_1 = vec4(0.0);
        vec4 s1_1_2 = vec4(0.0);
        vec4 s1_1_3 = vec4(0.0);
        if (uint(t1_1.x) < uint(sz.x) && uint(t1_1.y) < uint(sz.y)) {
            s1_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, -1));
            s1_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, -1));
            s1_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, -1));
            s1_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, -1));
        }
        sum += vec4(s1_1_0[0]) * texelFetch(W6, ivec2(96, 0), 0);
        sum += vec4(s1_1_0[1]) * texelFetch(W6, ivec2(97, 0), 0);
        sum += vec4(s1_1_0[2]) * texelFetch(W6, ivec2(98, 0), 0);
        sum += vec4(s1_1_0[3]) * texelFetch(W6, ivec2(99, 0), 0);
        sum += vec4(s1_1_1[0]) * texelFetch(W6, ivec2(100, 0), 0);
        sum += vec4(s1_1_1[1]) * texelFetch(W6, ivec2(101, 0), 0);
        sum += vec4(s1_1_1[2]) * texelFetch(W6, ivec2(102, 0), 0);
        sum += vec4(s1_1_1[3]) * texelFetch(W6, ivec2(103, 0), 0);
        sum += vec4(s1_1_2[0]) * texelFetch(W6, ivec2(104, 0), 0);
        sum += vec4(s1_1_2[1]) * texelFetch(W6, ivec2(105, 0), 0);
        sum += vec4(s1_1_2[2]) * texelFetch(W6, ivec2(106, 0), 0);
        sum += vec4(s1_1_2[3]) * texelFetch(W6, ivec2(107, 0), 0);
        sum += vec4(s1_1_3[0]) * texelFetch(W6, ivec2(108, 0), 0);
        sum += vec4(s1_1_3[1]) * texelFetch(W6, ivec2(109, 0), 0);
        sum += vec4(s1_1_3[2]) * texelFetch(W6, ivec2(110, 0), 0);
        sum += vec4(s1_1_3[3]) * texelFetch(W6, ivec2(111, 0), 0);
        ivec2 t1_2 = p + ivec2(0, -1);
        vec4 s1_2_0 = vec4(0.0);
        vec4 s1_2_1 = vec4(0.0);
        vec4 s1_2_2 = vec4(0.0);
        vec4 s1_2_3 = vec4(0.0);
        if (uint(t1_2.x) < uint(sz.x) && uint(t1_2.y) < uint(sz.y)) {
            s1_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, -1));
            s1_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, -1));
            s1_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, -1));
            s1_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, -1));
        }
        sum += vec4(s1_2_0[0]) * texelFetch(W6, ivec2(112, 0), 0);
        sum += vec4(s1_2_0[1]) * texelFetch(W6, ivec2(113, 0), 0);
        sum += vec4(s1_2_0[2]) * texelFetch(W6, ivec2(114, 0), 0);
        sum += vec4(s1_2_0[3]) * texelFetch(W6, ivec2(115, 0), 0);
        sum += vec4(s1_2_1[0]) * texelFetch(W6, ivec2(116, 0), 0);
        sum += vec4(s1_2_1[1]) * texelFetch(W6, ivec2(117, 0), 0);
        sum += vec4(s1_2_1[2]) * texelFetch(W6, ivec2(118, 0), 0);
        sum += vec4(s1_2_1[3]) * texelFetch(W6, ivec2(119, 0), 0);
        sum += vec4(s1_2_2[0]) * texelFetch(W6, ivec2(120, 0), 0);
        sum += vec4(s1_2_2[1]) * texelFetch(W6, ivec2(121, 0), 0);
        sum += vec4(s1_2_2[2]) * texelFetch(W6, ivec2(122, 0), 0);
        sum += vec4(s1_2_2[3]) * texelFetch(W6, ivec2(123, 0), 0);
        sum += vec4(s1_2_3[0]) * texelFetch(W6, ivec2(124, 0), 0);
        sum += vec4(s1_2_3[1]) * texelFetch(W6, ivec2(125, 0), 0);
        sum += vec4(s1_2_3[2]) * texelFetch(W6, ivec2(126, 0), 0);
        sum += vec4(s1_2_3[3]) * texelFetch(W6, ivec2(127, 0), 0);
        ivec2 t1_3 = p + ivec2(1, -1);
        vec4 s1_3_0 = vec4(0.0);
        vec4 s1_3_1 = vec4(0.0);
        vec4 s1_3_2 = vec4(0.0);
        vec4 s1_3_3 = vec4(0.0);
        if (uint(t1_3.x) < uint(sz.x) && uint(t1_3.y) < uint(sz.y)) {
            s1_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, -1));
            s1_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, -1));
            s1_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, -1));
            s1_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, -1));
        }
        sum += vec4(s1_3_0[0]) * texelFetch(W6, ivec2(128, 0), 0);
        sum += vec4(s1_3_0[1]) * texelFetch(W6, ivec2(129, 0), 0);
        sum += vec4(s1_3_0[2]) * texelFetch(W6, ivec2(130, 0), 0);
        sum += vec4(s1_3_0[3]) * texelFetch(W6, ivec2(131, 0), 0);
        sum += vec4(s1_3_1[0]) * texelFetch(W6, ivec2(132, 0), 0);
        sum += vec4(s1_3_1[1]) * texelFetch(W6, ivec2(133, 0), 0);
        sum += vec4(s1_3_1[2]) * texelFetch(W6, ivec2(134, 0), 0);
        sum += vec4(s1_3_1[3]) * texelFetch(W6, ivec2(135, 0), 0);
        sum += vec4(s1_3_2[0]) * texelFetch(W6, ivec2(136, 0), 0);
        sum += vec4(s1_3_2[1]) * texelFetch(W6, ivec2(137, 0), 0);
        sum += vec4(s1_3_2[2]) * texelFetch(W6, ivec2(138, 0), 0);
        sum += vec4(s1_3_2[3]) * texelFetch(W6, ivec2(139, 0), 0);
        sum += vec4(s1_3_3[0]) * texelFetch(W6, ivec2(140, 0), 0);
        sum += vec4(s1_3_3[1]) * texelFetch(W6, ivec2(141, 0), 0);
        sum += vec4(s1_3_3[2]) * texelFetch(W6, ivec2(142, 0), 0);
        sum += vec4(s1_3_3[3]) * texelFetch(W6, ivec2(143, 0), 0);
        ivec2 t1_4 = p + ivec2(2, -1);
        vec4 s1_4_0 = vec4(0.0);
        vec4 s1_4_1 = vec4(0.0);
        vec4 s1_4_2 = vec4(0.0);
        vec4 s1_4_3 = vec4(0.0);
        if (uint(t1_4.x) < uint(sz.x) && uint(t1_4.y) < uint(sz.y)) {
            s1_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, -1));
            s1_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, -1));
            s1_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, -1));
            s1_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, -1));
        }
        sum += vec4(s1_4_0[0]) * texelFetch(W6, ivec2(144, 0), 0);
        sum += vec4(s1_4_0[1]) * texelFetch(W6, ivec2(145, 0), 0);
        sum += vec4(s1_4_0[2]) * texelFetch(W6, ivec2(146, 0), 0);
        sum += vec4(s1_4_0[3]) * texelFetch(W6, ivec2(147, 0), 0);
        sum += vec4(s1_4_1[0]) * texelFetch(W6, ivec2(148, 0), 0);
        sum += vec4(s1_4_1[1]) * texelFetch(W6, ivec2(149, 0), 0);
        sum += vec4(s1_4_1[2]) * texelFetch(W6, ivec2(150, 0), 0);
        sum += vec4(s1_4_1[3]) * texelFetch(W6, ivec2(151, 0), 0);
        sum += vec4(s1_4_2[0]) * texelFetch(W6, ivec2(152, 0), 0);
        sum += vec4(s1_4_2[1]) * texelFetch(W6, ivec2(153, 0), 0);
        sum += vec4(s1_4_2[2]) * texelFetch(W6, ivec2(154, 0), 0);
        sum += vec4(s1_4_2[3]) * texelFetch(W6, ivec2(155, 0), 0);
        sum += vec4(s1_4_3[0]) * texelFetch(W6, ivec2(156, 0), 0);
        sum += vec4(s1_4_3[1]) * texelFetch(W6, ivec2(157, 0), 0);
        sum += vec4(s1_4_3[2]) * texelFetch(W6, ivec2(158, 0), 0);
        sum += vec4(s1_4_3[3]) * texelFetch(W6, ivec2(159, 0), 0);
        ivec2 t2_0 = p + ivec2(-2, 0);
        vec4 s2_0_0 = vec4(0.0);
        vec4 s2_0_1 = vec4(0.0);
        vec4 s2_0_2 = vec4(0.0);
        vec4 s2_0_3 = vec4(0.0);
        if (uint(t2_0.x) < uint(sz.x) && uint(t2_0.y) < uint(sz.y)) {
            s2_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, 0));
            s2_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, 0));
            s2_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, 0));
            s2_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, 0));
        }
        sum += vec4(s2_0_0[0]) * texelFetch(W6, ivec2(160, 0), 0);
        sum += vec4(s2_0_0[1]) * texelFetch(W6, ivec2(161, 0), 0);
        sum += vec4(s2_0_0[2]) * texelFetch(W6, ivec2(162, 0), 0);
        sum += vec4(s2_0_0[3]) * texelFetch(W6, ivec2(163, 0), 0);
        sum += vec4(s2_0_1[0]) * texelFetch(W6, ivec2(164, 0), 0);
        sum += vec4(s2_0_1[1]) * texelFetch(W6, ivec2(165, 0), 0);
        sum += vec4(s2_0_1[2]) * texelFetch(W6, ivec2(166, 0), 0);
        sum += vec4(s2_0_1[3]) * texelFetch(W6, ivec2(167, 0), 0);
        sum += vec4(s2_0_2[0]) * texelFetch(W6, ivec2(168, 0), 0);
        sum += vec4(s2_0_2[1]) * texelFetch(W6, ivec2(169, 0), 0);
        sum += vec4(s2_0_2[2]) * texelFetch(W6, ivec2(170, 0), 0);
        sum += vec4(s2_0_2[3]) * texelFetch(W6, ivec2(171, 0), 0);
        sum += vec4(s2_0_3[0]) * texelFetch(W6, ivec2(172, 0), 0);
        sum += vec4(s2_0_3[1]) * texelFetch(W6, ivec2(173, 0), 0);
        sum += vec4(s2_0_3[2]) * texelFetch(W6, ivec2(174, 0), 0);
        sum += vec4(s2_0_3[3]) * texelFetch(W6, ivec2(175, 0), 0);
        ivec2 t2_1 = p + ivec2(-1, 0);
        vec4 s2_1_0 = vec4(0.0);
        vec4 s2_1_1 = vec4(0.0);
        vec4 s2_1_2 = vec4(0.0);
        vec4 s2_1_3 = vec4(0.0);
        if (uint(t2_1.x) < uint(sz.x) && uint(t2_1.y) < uint(sz.y)) {
            s2_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, 0));
            s2_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, 0));
            s2_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, 0));
            s2_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, 0));
        }
        sum += vec4(s2_1_0[0]) * texelFetch(W6, ivec2(176, 0), 0);
        sum += vec4(s2_1_0[1]) * texelFetch(W6, ivec2(177, 0), 0);
        sum += vec4(s2_1_0[2]) * texelFetch(W6, ivec2(178, 0), 0);
        sum += vec4(s2_1_0[3]) * texelFetch(W6, ivec2(179, 0), 0);
        sum += vec4(s2_1_1[0]) * texelFetch(W6, ivec2(180, 0), 0);
        sum += vec4(s2_1_1[1]) * texelFetch(W6, ivec2(181, 0), 0);
        sum += vec4(s2_1_1[2]) * texelFetch(W6, ivec2(182, 0), 0);
        sum += vec4(s2_1_1[3]) * texelFetch(W6, ivec2(183, 0), 0);
        sum += vec4(s2_1_2[0]) * texelFetch(W6, ivec2(184, 0), 0);
        sum += vec4(s2_1_2[1]) * texelFetch(W6, ivec2(185, 0), 0);
        sum += vec4(s2_1_2[2]) * texelFetch(W6, ivec2(186, 0), 0);
        sum += vec4(s2_1_2[3]) * texelFetch(W6, ivec2(187, 0), 0);
        sum += vec4(s2_1_3[0]) * texelFetch(W6, ivec2(188, 0), 0);
        sum += vec4(s2_1_3[1]) * texelFetch(W6, ivec2(189, 0), 0);
        sum += vec4(s2_1_3[2]) * texelFetch(W6, ivec2(190, 0), 0);
        sum += vec4(s2_1_3[3]) * texelFetch(W6, ivec2(191, 0), 0);
        ivec2 t2_2 = p + ivec2(0, 0);
        vec4 s2_2_0 = vec4(0.0);
        vec4 s2_2_1 = vec4(0.0);
        vec4 s2_2_2 = vec4(0.0);
        vec4 s2_2_3 = vec4(0.0);
        if (uint(t2_2.x) < uint(sz.x) && uint(t2_2.y) < uint(sz.y)) {
            s2_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, 0));
            s2_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, 0));
            s2_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, 0));
            s2_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, 0));
        }
        sum += vec4(s2_2_0[0]) * texelFetch(W6, ivec2(192, 0), 0);
        sum += vec4(s2_2_0[1]) * texelFetch(W6, ivec2(193, 0), 0);
        sum += vec4(s2_2_0[2]) * texelFetch(W6, ivec2(194, 0), 0);
        sum += vec4(s2_2_0[3]) * texelFetch(W6, ivec2(195, 0), 0);
        sum += vec4(s2_2_1[0]) * texelFetch(W6, ivec2(196, 0), 0);
        sum += vec4(s2_2_1[1]) * texelFetch(W6, ivec2(197, 0), 0);
        sum += vec4(s2_2_1[2]) * texelFetch(W6, ivec2(198, 0), 0);
        sum += vec4(s2_2_1[3]) * texelFetch(W6, ivec2(199, 0), 0);
        sum += vec4(s2_2_2[0]) * texelFetch(W6, ivec2(200, 0), 0);
        sum += vec4(s2_2_2[1]) * texelFetch(W6, ivec2(201, 0), 0);
        sum += vec4(s2_2_2[2]) * texelFetch(W6, ivec2(202, 0), 0);
        sum += vec4(s2_2_2[3]) * texelFetch(W6, ivec2(203, 0), 0);
        sum += vec4(s2_2_3[0]) * texelFetch(W6, ivec2(204, 0), 0);
        sum += vec4(s2_2_3[1]) * texelFetch(W6, ivec2(205, 0), 0);
        sum += vec4(s2_2_3[2]) * texelFetch(W6, ivec2(206, 0), 0);
        sum += vec4(s2_2_3[3]) * texelFetch(W6, ivec2(207, 0), 0);
        ivec2 t2_3 = p + ivec2(1, 0);
        vec4 s2_3_0 = vec4(0.0);
        vec4 s2_3_1 = vec4(0.0);
        vec4 s2_3_2 = vec4(0.0);
        vec4 s2_3_3 = vec4(0.0);
        if (uint(t2_3.x) < uint(sz.x) && uint(t2_3.y) < uint(sz.y)) {
            s2_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, 0));
            s2_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, 0));
            s2_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, 0));
            s2_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, 0));
        }
        sum += vec4(s2_3_0[0]) * texelFetch(W6, ivec2(208, 0), 0);
        sum += vec4(s2_3_0[1]) * texelFetch(W6, ivec2(209, 0), 0);
        sum += vec4(s2_3_0[2]) * texelFetch(W6, ivec2(210, 0), 0);
        sum += vec4(s2_3_0[3]) * texelFetch(W6, ivec2(211, 0), 0);
        sum += vec4(s2_3_1[0]) * texelFetch(W6, ivec2(212, 0), 0);
        sum += vec4(s2_3_1[1]) * texelFetch(W6, ivec2(213, 0), 0);
        sum += vec4(s2_3_1[2]) * texelFetch(W6, ivec2(214, 0), 0);
        sum += vec4(s2_3_1[3]) * texelFetch(W6, ivec2(215, 0), 0);
        sum += vec4(s2_3_2[0]) * texelFetch(W6, ivec2(216, 0), 0);
        sum += vec4(s2_3_2[1]) * texelFetch(W6, ivec2(217, 0), 0);
        sum += vec4(s2_3_2[2]) * texelFetch(W6, ivec2(218, 0), 0);
        sum += vec4(s2_3_2[3]) * texelFetch(W6, ivec2(219, 0), 0);
        sum += vec4(s2_3_3[0]) * texelFetch(W6, ivec2(220, 0), 0);
        sum += vec4(s2_3_3[1]) * texelFetch(W6, ivec2(221, 0), 0);
        sum += vec4(s2_3_3[2]) * texelFetch(W6, ivec2(222, 0), 0);
        sum += vec4(s2_3_3[3]) * texelFetch(W6, ivec2(223, 0), 0);
        ivec2 t2_4 = p + ivec2(2, 0);
        vec4 s2_4_0 = vec4(0.0);
        vec4 s2_4_1 = vec4(0.0);
        vec4 s2_4_2 = vec4(0.0);
        vec4 s2_4_3 = vec4(0.0);
        if (uint(t2_4.x) < uint(sz.x) && uint(t2_4.y) < uint(sz.y)) {
            s2_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, 0));
            s2_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, 0));
            s2_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, 0));
            s2_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, 0));
        }
        sum += vec4(s2_4_0[0]) * texelFetch(W6, ivec2(224, 0), 0);
        sum += vec4(s2_4_0[1]) * texelFetch(W6, ivec2(225, 0), 0);
        sum += vec4(s2_4_0[2]) * texelFetch(W6, ivec2(226, 0), 0);
        sum += vec4(s2_4_0[3]) * texelFetch(W6, ivec2(227, 0), 0);
        sum += vec4(s2_4_1[0]) * texelFetch(W6, ivec2(228, 0), 0);
        sum += vec4(s2_4_1[1]) * texelFetch(W6, ivec2(229, 0), 0);
        sum += vec4(s2_4_1[2]) * texelFetch(W6, ivec2(230, 0), 0);
        sum += vec4(s2_4_1[3]) * texelFetch(W6, ivec2(231, 0), 0);
        sum += vec4(s2_4_2[0]) * texelFetch(W6, ivec2(232, 0), 0);
        sum += vec4(s2_4_2[1]) * texelFetch(W6, ivec2(233, 0), 0);
        sum += vec4(s2_4_2[2]) * texelFetch(W6, ivec2(234, 0), 0);
        sum += vec4(s2_4_2[3]) * texelFetch(W6, ivec2(235, 0), 0);
        sum += vec4(s2_4_3[0]) * texelFetch(W6, ivec2(236, 0), 0);
        sum += vec4(s2_4_3[1]) * texelFetch(W6, ivec2(237, 0), 0);
        sum += vec4(s2_4_3[2]) * texelFetch(W6, ivec2(238, 0), 0);
        sum += vec4(s2_4_3[3]) * texelFetch(W6, ivec2(239, 0), 0);
        ivec2 t3_0 = p + ivec2(-2, 1);
        vec4 s3_0_0 = vec4(0.0);
        vec4 s3_0_1 = vec4(0.0);
        vec4 s3_0_2 = vec4(0.0);
        vec4 s3_0_3 = vec4(0.0);
        if (uint(t3_0.x) < uint(sz.x) && uint(t3_0.y) < uint(sz.y)) {
            s3_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, 1));
            s3_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, 1));
            s3_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, 1));
            s3_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, 1));
        }
        sum += vec4(s3_0_0[0]) * texelFetch(W6, ivec2(240, 0), 0);
        sum += vec4(s3_0_0[1]) * texelFetch(W6, ivec2(241, 0), 0);
        sum += vec4(s3_0_0[2]) * texelFetch(W6, ivec2(242, 0), 0);
        sum += vec4(s3_0_0[3]) * texelFetch(W6, ivec2(243, 0), 0);
        sum += vec4(s3_0_1[0]) * texelFetch(W6, ivec2(244, 0), 0);
        sum += vec4(s3_0_1[1]) * texelFetch(W6, ivec2(245, 0), 0);
        sum += vec4(s3_0_1[2]) * texelFetch(W6, ivec2(246, 0), 0);
        sum += vec4(s3_0_1[3]) * texelFetch(W6, ivec2(247, 0), 0);
        sum += vec4(s3_0_2[0]) * texelFetch(W6, ivec2(248, 0), 0);
        sum += vec4(s3_0_2[1]) * texelFetch(W6, ivec2(249, 0), 0);
        sum += vec4(s3_0_2[2]) * texelFetch(W6, ivec2(250, 0), 0);
        sum += vec4(s3_0_2[3]) * texelFetch(W6, ivec2(251, 0), 0);
        sum += vec4(s3_0_3[0]) * texelFetch(W6, ivec2(252, 0), 0);
        sum += vec4(s3_0_3[1]) * texelFetch(W6, ivec2(253, 0), 0);
        sum += vec4(s3_0_3[2]) * texelFetch(W6, ivec2(254, 0), 0);
        sum += vec4(s3_0_3[3]) * texelFetch(W6, ivec2(255, 0), 0);
        ivec2 t3_1 = p + ivec2(-1, 1);
        vec4 s3_1_0 = vec4(0.0);
        vec4 s3_1_1 = vec4(0.0);
        vec4 s3_1_2 = vec4(0.0);
        vec4 s3_1_3 = vec4(0.0);
        if (uint(t3_1.x) < uint(sz.x) && uint(t3_1.y) < uint(sz.y)) {
            s3_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, 1));
            s3_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, 1));
            s3_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, 1));
            s3_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, 1));
        }
        sum += vec4(s3_1_0[0]) * texelFetch(W6, ivec2(256, 0), 0);
        sum += vec4(s3_1_0[1]) * texelFetch(W6, ivec2(257, 0), 0);
        sum += vec4(s3_1_0[2]) * texelFetch(W6, ivec2(258, 0), 0);
        sum += vec4(s3_1_0[3]) * texelFetch(W6, ivec2(259, 0), 0);
        sum += vec4(s3_1_1[0]) * texelFetch(W6, ivec2(260, 0), 0);
        sum += vec4(s3_1_1[1]) * texelFetch(W6, ivec2(261, 0), 0);
        sum += vec4(s3_1_1[2]) * texelFetch(W6, ivec2(262, 0), 0);
        sum += vec4(s3_1_1[3]) * texelFetch(W6, ivec2(263, 0), 0);
        sum += vec4(s3_1_2[0]) * texelFetch(W6, ivec2(264, 0), 0);
        sum += vec4(s3_1_2[1]) * texelFetch(W6, ivec2(265, 0), 0);
        sum += vec4(s3_1_2[2]) * texelFetch(W6, ivec2(266, 0), 0);
        sum += vec4(s3_1_2[3]) * texelFetch(W6, ivec2(267, 0), 0);
        sum += vec4(s3_1_3[0]) * texelFetch(W6, ivec2(268, 0), 0);
        sum += vec4(s3_1_3[1]) * texelFetch(W6, ivec2(269, 0), 0);
        sum += vec4(s3_1_3[2]) * texelFetch(W6, ivec2(270, 0), 0);
        sum += vec4(s3_1_3[3]) * texelFetch(W6, ivec2(271, 0), 0);
        ivec2 t3_2 = p + ivec2(0, 1);
        vec4 s3_2_0 = vec4(0.0);
        vec4 s3_2_1 = vec4(0.0);
        vec4 s3_2_2 = vec4(0.0);
        vec4 s3_2_3 = vec4(0.0);
        if (uint(t3_2.x) < uint(sz.x) && uint(t3_2.y) < uint(sz.y)) {
            s3_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, 1));
            s3_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, 1));
            s3_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, 1));
            s3_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, 1));
        }
        sum += vec4(s3_2_0[0]) * texelFetch(W6, ivec2(272, 0), 0);
        sum += vec4(s3_2_0[1]) * texelFetch(W6, ivec2(273, 0), 0);
        sum += vec4(s3_2_0[2]) * texelFetch(W6, ivec2(274, 0), 0);
        sum += vec4(s3_2_0[3]) * texelFetch(W6, ivec2(275, 0), 0);
        sum += vec4(s3_2_1[0]) * texelFetch(W6, ivec2(276, 0), 0);
        sum += vec4(s3_2_1[1]) * texelFetch(W6, ivec2(277, 0), 0);
        sum += vec4(s3_2_1[2]) * texelFetch(W6, ivec2(278, 0), 0);
        sum += vec4(s3_2_1[3]) * texelFetch(W6, ivec2(279, 0), 0);
        sum += vec4(s3_2_2[0]) * texelFetch(W6, ivec2(280, 0), 0);
        sum += vec4(s3_2_2[1]) * texelFetch(W6, ivec2(281, 0), 0);
        sum += vec4(s3_2_2[2]) * texelFetch(W6, ivec2(282, 0), 0);
        sum += vec4(s3_2_2[3]) * texelFetch(W6, ivec2(283, 0), 0);
        sum += vec4(s3_2_3[0]) * texelFetch(W6, ivec2(284, 0), 0);
        sum += vec4(s3_2_3[1]) * texelFetch(W6, ivec2(285, 0), 0);
        sum += vec4(s3_2_3[2]) * texelFetch(W6, ivec2(286, 0), 0);
        sum += vec4(s3_2_3[3]) * texelFetch(W6, ivec2(287, 0), 0);
        ivec2 t3_3 = p + ivec2(1, 1);
        vec4 s3_3_0 = vec4(0.0);
        vec4 s3_3_1 = vec4(0.0);
        vec4 s3_3_2 = vec4(0.0);
        vec4 s3_3_3 = vec4(0.0);
        if (uint(t3_3.x) < uint(sz.x) && uint(t3_3.y) < uint(sz.y)) {
            s3_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, 1));
            s3_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, 1));
            s3_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, 1));
            s3_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, 1));
        }
        sum += vec4(s3_3_0[0]) * texelFetch(W6, ivec2(288, 0), 0);
        sum += vec4(s3_3_0[1]) * texelFetch(W6, ivec2(289, 0), 0);
        sum += vec4(s3_3_0[2]) * texelFetch(W6, ivec2(290, 0), 0);
        sum += vec4(s3_3_0[3]) * texelFetch(W6, ivec2(291, 0), 0);
        sum += vec4(s3_3_1[0]) * texelFetch(W6, ivec2(292, 0), 0);
        sum += vec4(s3_3_1[1]) * texelFetch(W6, ivec2(293, 0), 0);
        sum += vec4(s3_3_1[2]) * texelFetch(W6, ivec2(294, 0), 0);
        sum += vec4(s3_3_1[3]) * texelFetch(W6, ivec2(295, 0), 0);
        sum += vec4(s3_3_2[0]) * texelFetch(W6, ivec2(296, 0), 0);
        sum += vec4(s3_3_2[1]) * texelFetch(W6, ivec2(297, 0), 0);
        sum += vec4(s3_3_2[2]) * texelFetch(W6, ivec2(298, 0), 0);
        sum += vec4(s3_3_2[3]) * texelFetch(W6, ivec2(299, 0), 0);
        sum += vec4(s3_3_3[0]) * texelFetch(W6, ivec2(300, 0), 0);
        sum += vec4(s3_3_3[1]) * texelFetch(W6, ivec2(301, 0), 0);
        sum += vec4(s3_3_3[2]) * texelFetch(W6, ivec2(302, 0), 0);
        sum += vec4(s3_3_3[3]) * texelFetch(W6, ivec2(303, 0), 0);
        ivec2 t3_4 = p + ivec2(2, 1);
        vec4 s3_4_0 = vec4(0.0);
        vec4 s3_4_1 = vec4(0.0);
        vec4 s3_4_2 = vec4(0.0);
        vec4 s3_4_3 = vec4(0.0);
        if (uint(t3_4.x) < uint(sz.x) && uint(t3_4.y) < uint(sz.y)) {
            s3_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, 1));
            s3_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, 1));
            s3_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, 1));
            s3_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, 1));
        }
        sum += vec4(s3_4_0[0]) * texelFetch(W6, ivec2(304, 0), 0);
        sum += vec4(s3_4_0[1]) * texelFetch(W6, ivec2(305, 0), 0);
        sum += vec4(s3_4_0[2]) * texelFetch(W6, ivec2(306, 0), 0);
        sum += vec4(s3_4_0[3]) * texelFetch(W6, ivec2(307, 0), 0);
        sum += vec4(s3_4_1[0]) * texelFetch(W6, ivec2(308, 0), 0);
        sum += vec4(s3_4_1[1]) * texelFetch(W6, ivec2(309, 0), 0);
        sum += vec4(s3_4_1[2]) * texelFetch(W6, ivec2(310, 0), 0);
        sum += vec4(s3_4_1[3]) * texelFetch(W6, ivec2(311, 0), 0);
        sum += vec4(s3_4_2[0]) * texelFetch(W6, ivec2(312, 0), 0);
        sum += vec4(s3_4_2[1]) * texelFetch(W6, ivec2(313, 0), 0);
        sum += vec4(s3_4_2[2]) * texelFetch(W6, ivec2(314, 0), 0);
        sum += vec4(s3_4_2[3]) * texelFetch(W6, ivec2(315, 0), 0);
        sum += vec4(s3_4_3[0]) * texelFetch(W6, ivec2(316, 0), 0);
        sum += vec4(s3_4_3[1]) * texelFetch(W6, ivec2(317, 0), 0);
        sum += vec4(s3_4_3[2]) * texelFetch(W6, ivec2(318, 0), 0);
        sum += vec4(s3_4_3[3]) * texelFetch(W6, ivec2(319, 0), 0);
        ivec2 t4_0 = p + ivec2(-2, 2);
        vec4 s4_0_0 = vec4(0.0);
        vec4 s4_0_1 = vec4(0.0);
        vec4 s4_0_2 = vec4(0.0);
        vec4 s4_0_3 = vec4(0.0);
        if (uint(t4_0.x) < uint(sz.x) && uint(t4_0.y) < uint(sz.y)) {
            s4_0_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-2, 2));
            s4_0_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-2, 2));
            s4_0_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-2, 2));
            s4_0_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-2, 2));
        }
        sum += vec4(s4_0_0[0]) * texelFetch(W6, ivec2(320, 0), 0);
        sum += vec4(s4_0_0[1]) * texelFetch(W6, ivec2(321, 0), 0);
        sum += vec4(s4_0_0[2]) * texelFetch(W6, ivec2(322, 0), 0);
        sum += vec4(s4_0_0[3]) * texelFetch(W6, ivec2(323, 0), 0);
        sum += vec4(s4_0_1[0]) * texelFetch(W6, ivec2(324, 0), 0);
        sum += vec4(s4_0_1[1]) * texelFetch(W6, ivec2(325, 0), 0);
        sum += vec4(s4_0_1[2]) * texelFetch(W6, ivec2(326, 0), 0);
        sum += vec4(s4_0_1[3]) * texelFetch(W6, ivec2(327, 0), 0);
        sum += vec4(s4_0_2[0]) * texelFetch(W6, ivec2(328, 0), 0);
        sum += vec4(s4_0_2[1]) * texelFetch(W6, ivec2(329, 0), 0);
        sum += vec4(s4_0_2[2]) * texelFetch(W6, ivec2(330, 0), 0);
        sum += vec4(s4_0_2[3]) * texelFetch(W6, ivec2(331, 0), 0);
        sum += vec4(s4_0_3[0]) * texelFetch(W6, ivec2(332, 0), 0);
        sum += vec4(s4_0_3[1]) * texelFetch(W6, ivec2(333, 0), 0);
        sum += vec4(s4_0_3[2]) * texelFetch(W6, ivec2(334, 0), 0);
        sum += vec4(s4_0_3[3]) * texelFetch(W6, ivec2(335, 0), 0);
        ivec2 t4_1 = p + ivec2(-1, 2);
        vec4 s4_1_0 = vec4(0.0);
        vec4 s4_1_1 = vec4(0.0);
        vec4 s4_1_2 = vec4(0.0);
        vec4 s4_1_3 = vec4(0.0);
        if (uint(t4_1.x) < uint(sz.x) && uint(t4_1.y) < uint(sz.y)) {
            s4_1_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(-1, 2));
            s4_1_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(-1, 2));
            s4_1_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(-1, 2));
            s4_1_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(-1, 2));
        }
        sum += vec4(s4_1_0[0]) * texelFetch(W6, ivec2(336, 0), 0);
        sum += vec4(s4_1_0[1]) * texelFetch(W6, ivec2(337, 0), 0);
        sum += vec4(s4_1_0[2]) * texelFetch(W6, ivec2(338, 0), 0);
        sum += vec4(s4_1_0[3]) * texelFetch(W6, ivec2(339, 0), 0);
        sum += vec4(s4_1_1[0]) * texelFetch(W6, ivec2(340, 0), 0);
        sum += vec4(s4_1_1[1]) * texelFetch(W6, ivec2(341, 0), 0);
        sum += vec4(s4_1_1[2]) * texelFetch(W6, ivec2(342, 0), 0);
        sum += vec4(s4_1_1[3]) * texelFetch(W6, ivec2(343, 0), 0);
        sum += vec4(s4_1_2[0]) * texelFetch(W6, ivec2(344, 0), 0);
        sum += vec4(s4_1_2[1]) * texelFetch(W6, ivec2(345, 0), 0);
        sum += vec4(s4_1_2[2]) * texelFetch(W6, ivec2(346, 0), 0);
        sum += vec4(s4_1_2[3]) * texelFetch(W6, ivec2(347, 0), 0);
        sum += vec4(s4_1_3[0]) * texelFetch(W6, ivec2(348, 0), 0);
        sum += vec4(s4_1_3[1]) * texelFetch(W6, ivec2(349, 0), 0);
        sum += vec4(s4_1_3[2]) * texelFetch(W6, ivec2(350, 0), 0);
        sum += vec4(s4_1_3[3]) * texelFetch(W6, ivec2(351, 0), 0);
        ivec2 t4_2 = p + ivec2(0, 2);
        vec4 s4_2_0 = vec4(0.0);
        vec4 s4_2_1 = vec4(0.0);
        vec4 s4_2_2 = vec4(0.0);
        vec4 s4_2_3 = vec4(0.0);
        if (uint(t4_2.x) < uint(sz.x) && uint(t4_2.y) < uint(sz.y)) {
            s4_2_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(0, 2));
            s4_2_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(0, 2));
            s4_2_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(0, 2));
            s4_2_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(0, 2));
        }
        sum += vec4(s4_2_0[0]) * texelFetch(W6, ivec2(352, 0), 0);
        sum += vec4(s4_2_0[1]) * texelFetch(W6, ivec2(353, 0), 0);
        sum += vec4(s4_2_0[2]) * texelFetch(W6, ivec2(354, 0), 0);
        sum += vec4(s4_2_0[3]) * texelFetch(W6, ivec2(355, 0), 0);
        sum += vec4(s4_2_1[0]) * texelFetch(W6, ivec2(356, 0), 0);
        sum += vec4(s4_2_1[1]) * texelFetch(W6, ivec2(357, 0), 0);
        sum += vec4(s4_2_1[2]) * texelFetch(W6, ivec2(358, 0), 0);
        sum += vec4(s4_2_1[3]) * texelFetch(W6, ivec2(359, 0), 0);
        sum += vec4(s4_2_2[0]) * texelFetch(W6, ivec2(360, 0), 0);
        sum += vec4(s4_2_2[1]) * texelFetch(W6, ivec2(361, 0), 0);
        sum += vec4(s4_2_2[2]) * texelFetch(W6, ivec2(362, 0), 0);
        sum += vec4(s4_2_2[3]) * texelFetch(W6, ivec2(363, 0), 0);
        sum += vec4(s4_2_3[0]) * texelFetch(W6, ivec2(364, 0), 0);
        sum += vec4(s4_2_3[1]) * texelFetch(W6, ivec2(365, 0), 0);
        sum += vec4(s4_2_3[2]) * texelFetch(W6, ivec2(366, 0), 0);
        sum += vec4(s4_2_3[3]) * texelFetch(W6, ivec2(367, 0), 0);
        ivec2 t4_3 = p + ivec2(1, 2);
        vec4 s4_3_0 = vec4(0.0);
        vec4 s4_3_1 = vec4(0.0);
        vec4 s4_3_2 = vec4(0.0);
        vec4 s4_3_3 = vec4(0.0);
        if (uint(t4_3.x) < uint(sz.x) && uint(t4_3.y) < uint(sz.y)) {
            s4_3_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(1, 2));
            s4_3_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(1, 2));
            s4_3_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(1, 2));
            s4_3_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(1, 2));
        }
        sum += vec4(s4_3_0[0]) * texelFetch(W6, ivec2(368, 0), 0);
        sum += vec4(s4_3_0[1]) * texelFetch(W6, ivec2(369, 0), 0);
        sum += vec4(s4_3_0[2]) * texelFetch(W6, ivec2(370, 0), 0);
        sum += vec4(s4_3_0[3]) * texelFetch(W6, ivec2(371, 0), 0);
        sum += vec4(s4_3_1[0]) * texelFetch(W6, ivec2(372, 0), 0);
        sum += vec4(s4_3_1[1]) * texelFetch(W6, ivec2(373, 0), 0);
        sum += vec4(s4_3_1[2]) * texelFetch(W6, ivec2(374, 0), 0);
        sum += vec4(s4_3_1[3]) * texelFetch(W6, ivec2(375, 0), 0);
        sum += vec4(s4_3_2[0]) * texelFetch(W6, ivec2(376, 0), 0);
        sum += vec4(s4_3_2[1]) * texelFetch(W6, ivec2(377, 0), 0);
        sum += vec4(s4_3_2[2]) * texelFetch(W6, ivec2(378, 0), 0);
        sum += vec4(s4_3_2[3]) * texelFetch(W6, ivec2(379, 0), 0);
        sum += vec4(s4_3_3[0]) * texelFetch(W6, ivec2(380, 0), 0);
        sum += vec4(s4_3_3[1]) * texelFetch(W6, ivec2(381, 0), 0);
        sum += vec4(s4_3_3[2]) * texelFetch(W6, ivec2(382, 0), 0);
        sum += vec4(s4_3_3[3]) * texelFetch(W6, ivec2(383, 0), 0);
        ivec2 t4_4 = p + ivec2(2, 2);
        vec4 s4_4_0 = vec4(0.0);
        vec4 s4_4_1 = vec4(0.0);
        vec4 s4_4_2 = vec4(0.0);
        vec4 s4_4_3 = vec4(0.0);
        if (uint(t4_4.x) < uint(sz.x) && uint(t4_4.y) < uint(sz.y)) {
            s4_4_0 = texelFetchOffset(F6_0_raw, p, 0, ivec2(2, 2));
            s4_4_1 = texelFetchOffset(F6_1_raw, p, 0, ivec2(2, 2));
            s4_4_2 = texelFetchOffset(F6_2_raw, p, 0, ivec2(2, 2));
            s4_4_3 = texelFetchOffset(F6_3_raw, p, 0, ivec2(2, 2));
        }
        sum += vec4(s4_4_0[0]) * texelFetch(W6, ivec2(384, 0), 0);
        sum += vec4(s4_4_0[1]) * texelFetch(W6, ivec2(385, 0), 0);
        sum += vec4(s4_4_0[2]) * texelFetch(W6, ivec2(386, 0), 0);
        sum += vec4(s4_4_0[3]) * texelFetch(W6, ivec2(387, 0), 0);
        sum += vec4(s4_4_1[0]) * texelFetch(W6, ivec2(388, 0), 0);
        sum += vec4(s4_4_1[1]) * texelFetch(W6, ivec2(389, 0), 0);
        sum += vec4(s4_4_1[2]) * texelFetch(W6, ivec2(390, 0), 0);
        sum += vec4(s4_4_1[3]) * texelFetch(W6, ivec2(391, 0), 0);
        sum += vec4(s4_4_2[0]) * texelFetch(W6, ivec2(392, 0), 0);
        sum += vec4(s4_4_2[1]) * texelFetch(W6, ivec2(393, 0), 0);
        sum += vec4(s4_4_2[2]) * texelFetch(W6, ivec2(394, 0), 0);
        sum += vec4(s4_4_2[3]) * texelFetch(W6, ivec2(395, 0), 0);
        sum += vec4(s4_4_3[0]) * texelFetch(W6, ivec2(396, 0), 0);
        sum += vec4(s4_4_3[1]) * texelFetch(W6, ivec2(397, 0), 0);
        sum += vec4(s4_4_3[2]) * texelFetch(W6, ivec2(398, 0), 0);
        sum += vec4(s4_4_3[3]) * texelFetch(W6, ivec2(399, 0), 0);
    }
    sum += vec4(0,0,0,0);
    sum = vec4(quantize(sum.x,0.002295564627,-3),quantize(sum.y,0.002295564627,-3),quantize(sum.z,0.002295564627,-3),quantize(sum.w,0.002295564627,-3));
    float source = quantize(HOOKED_texOff(0).r - 0.5, 0.003367935773, 2);
    sum = vec4(quantize(sum.x+source,0.003374498105,2),quantize(sum.y+source,0.003374498105,2),quantize(sum.z+source,0.003374498105,2),quantize(sum.w+source,0.003374498105,2));
    return sum;
}

//!HOOK LUMA
//!BIND HOOKED
//!BIND SESR_LOW
//!SAVE HOOKED
//!DESC [ARM_SESR_M5_QAT_int8] x2 depth-to-space
//!WIDTH HOOKED.w 2 *
//!HEIGHT HOOKED.h 2 *
//!WHEN OUTPUT.w HOOKED.w 1.200 * > OUTPUT.h HOOKED.h 1.200 * > *

vec4 hook() {
    ivec2 p = ivec2(gl_FragCoord.xy);
    ivec2 src = p / 2;
    int phase = (p.y & 1) * 2 + (p.x & 1);
    float y = texelFetch(SESR_LOW_raw, src, 0)[phase];
    return vec4(clamp(y + 0.5, 0.0, 1.0), 0.0, 0.0, 1.0);
}

//!TEXTURE W0
//!SIZE 25 4
//!FORMAT rgba16hf
//!FILTER NEAREST
//!BORDER CLAMP
75244bab592848ac452c7831cca11399f1ad8fb012315822c2ad8fac47aa58a6af2a78a9ba1f132175a48f2c59a858a26eaf78a5012f13a992a9293801b709b5
9daf4ba37c2f8dad00000000012fc2ac7528622aea3158a6212e8f2cccb5c52fe5353cbbab37ff34c231e6341bb46431f1298fa8f82f1fa875204b2747ae7124
92a978a531359daf21ae3e3138b64b2b92a94b2f472e1f2875a48fa896b0faa675241aacba2371a4cdaf8f28ccb1fa2a0eab78ad6632fa2675207825ba1b5826
92a98fa8cc21b52911a096a4d5a51e18d42f04aed5a5a2245fb0961cd5256f2aea2603a860242d26452cbba5d5a525a1522372add5a11e2404af282d60302525
75327232d5213db234b2bb2d783134234a2596a04aa767a9e2204db1d5a588ad5f308c381a294fb086afbcb2c9b9042d112804b2d5a525310000962cd5a12d9e
b225bb29d521a22c86afbb25ed2e2d22821629b6bd2c1634ef2f96b0d5a51eace2a84e2a60a4b8a7fcace0a6d59d67a9ba2703281aa9a2a8a030722dd5a5b8a7
eaaa732f4a2be32879ac9620d59d34abb31d05279f2714a8b3a99e1d9fa3f8ad6aae052babaa0130fdac05ab252ffd2ab32936a4b729fd22b3a136a49f273ea5
b3ad9e299fab9630a839e1b5c43471b00000f8314ab43930b3219e1dab2af3ac6a2e9e9d87b0a99c41b57a381f35d3ad2ab193b990bbfd267fb87fb29939f32c
b3a1522e4ab0fda246289e219f27d3a146a432b331aed331f835ea389f275e34000063309f9f9fb4e13105a79f1f68ae202b36249f2bd3a16aaa9e1d000068ae
b31dabaec4a814acb3a552aab729182db3a99e25ab2a1424c81cd5aa332bc6aa62a49d26d4ad1eaec62a0431332be82b2ca34a9d7ca175292ea99d26f9ac8723
95acd924cd288131e0ad9f2d8bab8420622c3eb0242db7af601e68287cad15a9922fd5ae0730452153b2efa7dba6b72bf9aad72dcda478b0c820ff327135a52d
fa29bba5a8b19c2cc52f68a8dba2a5ad922768a08bab57abc626bbb11da4272f2f300d2333affab195a8efa3492c842860222c2ad4a98d2d95a8d9a48b2727a7
609a4aa5b72f603094a59dae1da0000060267e2707b0069a2daa00002c2684ac

//!TEXTURE W1
//!SIZE 144 4
//!FORMAT rgba16hf
//!FILTER NEAREST
//!BORDER CLAMP
21b0c2ad572d8eb1cc2ac29dd3a5599e5f307a2edaa80000d425c2a14f2e25ab58adc2a54faec324ccaa09a995b1bf2e9635c434c42f5db05f2c8eaf0ab3f42d
ccaac2a1c41bc32421347f30cb2af0ab8e32c2a94f2ec3a4d4a97a2a4f2af630ccaa65ad57b1c3a850b21e2ecb2ac3a45fb4512cd329c32cd425c2a1cbaac3a8
40b8322b5eacf027db307fb019ad59aa502ec2255e2cf0a7bc34d62e8dae5926d42d23305e2cc324c527322f5e2c5d30123609a9d32dd6b70bb37aaec4a359a6
c51f322748af8ea9eb38323386b35926d435c2a5482b59220000322bc4abf63021308e2fd321f0ab67b90cb4013429b130b8c231c4238e315f2ceaab5ea88ea9
d4a5ad2c952d25af58b109b1d3ad25abc5a35124192d591ecc3232afcb2a8eadc59f8eb3c4a790b4d4a551acc4ab292d492fc2a18d2ec3b4d4311e328daef232
c523c229bb30bf2e5f2c68b4d321f0af502ec221d3a159ae49b3c2b1482bc3b0c5abc21dc42f29b1c5276834e3b30000c52332af9cacf02fdbacdb307d305926
31b609ad5e28c328c52b322bb4b1f02bdb28ad309cac591e58b1adac8daef4b1d4b151285e2c599ed42d09290130f0af5f30d62efa30c3a8d42d7fb411b4f42d
58311e2ed32df0ab5fb05128d3a1bf2ec51feab376b559229db0c221d3a9c3a84034653130b20000dbacadac57a9252bc51fea2b202cf0a7d429c22119ad252b
b63b09a9bbb059aa4fb8b639eb328e2dc59f7fb0b4375922cc38ad30fab04d3accaa652dda2cc3a458ad93314fae5dac87b365ad8633c1b5d4a965adac32f6b0
58b5eaab8d2ebfaefab4c22d95318cb230b8f0314833aa3458310c3448af293121b0d62e0000593221b051a8c41f592acc2ec225c4275db0c5a7c29dc49b599e
ccaa652dc4abc330cc2e7cb520ac0bb7502e32ab48af8a2f58ad51286e3225b35f2c652debb22b30c5a335b6572d25b3d4293ab4202cf4b55f2cbc3757a94434
c52bad2ccba6f03319b177b7cba6c3b4c59fadb0daa8ceb9d4a9c2a5dab05932c59fdb34c42329b15fac683419adc13121346531202c9034582d7cb5da3077b4
49af0929d321592ad4a9512448ab5922d4addbb019b1599e58ad51241132591e00003227112e59aad4a951ac20acc3a4d4ad4c325e2c0000d4a532af20b45d30
d42909294faa0000c5abadacc4a759aac5a732a757298ead582dea2f192d59ae21b051a84f2ec3a8db34c2a9f2b12bb05f2c51a8cbaa5db0dbacea2b482b25ab
d4ad7a2a112e59b28733dbb4e3b359a29db4a8b2c4a3f027d4adea2b113211b421300935192d59a6c51fea2f1931c324d4b532b3573127b296b1f0b1c4a7c3b0
5f30f03120b01134ccaec2a55eacc328c5abeab34fb259aed431322f0000f630db2c65adcb2a57b3c5af4c3257a9f2325831ad303fb0252bd4ad1eb201b08aaf
db28c2adc42b59aac52709a95ea82b30cc2ed6320000f6b0c5270433192dbfaec5afeab35ea8252fc51ff0b5fab45dac58b57aae3f34bfb28e32933511ae2b30
582df031d3a9bd33c5a396b4c49bc3b0502e65319cacf634dba8a8b2daac00005fac4c32daa48e299d30adb0c423f0abdbac65ad86af591ed42d3227cba6bfae
ce2f05a317b2e5a7f2b1ae9c9ca8e523db35182c9c28b0b4b12a6f2ae6ab7130f2b1502fc3319bb464b10527e62b000034293e34443194a6d5ac18a844a58638
f29d6f2e44a5073476ac44a99526193534b59bafed31942e6f27e6b4eda916b234a9aeb0f0b094ae2232d931952616324630f92cf0ac91af76a8ae20723066b3
34358f3147b0432976280527e6a343a5e0b2e62ff0301c34d52c6faedb349bac4630aea044a1432d343105a77230e52ff2219b3468b7e82ed52c052f95aa2eb5
e032d9a944a13cabf2adaeb4472c40aea5b0f92c9ca8efacd5ac18ac2f354032ceaf1e3144219ba893353736c6b043a510332a339532e5ab05b5182847b0e52f
76a8d92547ac3cab6f2faea044a500000000d9adf034439dd5b08fb144299bacf2296faa72b03cab17b4d9b1e62f9426932d2b3495ae1cb0b12e8f2d412eef2c
b1aad9a5472c9bac5eb4d3b095aa3cab22326fae6bb643a1b12e63b008b4c1b1f2adae1c1ab140ae52b63eb09c30ec2905b1aea4e6a3e5276f2b052fe6a340ae
76b0ae1c3eabc5b093ad44ad92af163276248fade9ae1c3022b2ae9cc3b1ecad76b0763495aa2bb652326334e62b39b96fa73e344431e5a317b8b4b144257134
000024324425ec35f2297533953227b8ceaf5cb6e92eecb110339b2f92afe8b29fb33eb444355c385e34d925952e32b417301e35442d47acce2faeb0eda947ac
e0b23eb4e6279ba8db359b37723043b5f22de6af3eab1cb03fb305b33eab43a9e739f9b0442d19356f335038edad40366f2ba5383a39972d34add931edb1e836
f22995329c28e8ae93353e3472b0e8ae523875376b32402e64311828e6279731d5acd929e92eec29f2a9aea0e6a7be3252aed925f0acc131d52c6f2ac630ecb1
f21dae2c803643a964b12ab332b4e82e4cb59b2be9b243a9ce37f9acf030433176b4ffb15c341931ceb3e6b398b59b2ce0b28f3113b8e5ab2e34d92ded352eb5
f2a5ae9c47ac97adceafb4b156b643296f2bae1cbcb39b2810b3d3b047ace8320531b431983143256f2fc0335935942e52ae89b0e6a3e52b762c6fae6bb24321
17acf930e6a39b28d530d92595aa439d0ab6d9a9edadef307628ae30e62be5a76fb3d330412e94a6f22518acf0b09b2ca53018349831942e6f2bd92544a5ef38
76ac182ce92e4321f229aeb0eda9ef2c3429aea01db494a676acbaae3eab47b4ce33ae281ab1e5a734b105ab47ace5a7522eaea4e6ab473417acd9ad92af6d31
db3550339cb416326f2becb51a3194aece2f182c9ca800007b359b37e6b3c5300000ae281ab1e523b1b2d3b09831e5236fa7ba32e623e52f9f33ba3241ae3cb7
6fa76fae6e31e5abd52c632cc335ec29f2ad18b0e62b43a1d52caeac1d3443296f2f56b5e6ab71b076a82ab3952a94a634a9ae20443119b1173044ad441d472c
f2a105279c2cec2905b550b398314325b132d925000043a16f2f8f2d9c28942e76286f2ae6a3472cce33b4b1442943a100008f3544a59bb0b12a182c6b324321
17b0d9a544a143a193b13eb06bb69426d5b4ae1c1736e5a3f2a905b3449d9b283f3350337234942664b1d3b0e6a3e8b2a53005a344ade82e17b4442de6239b28
000096304c3387a8bfb296acea1b3ea74b2bdc2bb02d35b190ae0000efa94d308fb43da5ea9fe22d602cdca7ef3187a803b0dc2beaaf52b5a82fdc2b7129132c
773496acea1f3ea31ba996b0efad04b3a7b18d2aeaa3e2adedae3da5d3b06f25d5ad0000d3b0fb30bd2c3da9edae873062373dad2f2e35316132342fea2f6f25
4b3334aff2b0de3460348d2af2b0ecb3bfb28dae6baf3e1fd51d3db1742830b44baf423074b01cb2902eeab044b487283130342fed324db8a82f8daa74283e2f
cab9000032b1783361b2e52d74a88cb900008db26bab39b600003da9b3b487a88fb03da5ea9b87b4bd303db13430d43960ac8daaeab3b237a82f8d2a83b4b2b3
bd343d2dea2b00008fb03da1ab2ffb2ced2e8d2eab2f1c3203b53d29f2ac87b033b23da56b336fb17831962c74a813b04bab8d2a1530c6b56132962cd0b1e22d
0330dc2f0f32fb2c4b2b3da1a33435b560243932eda64db4edaeea3051b1fb30332e00000cb3fb2c1a343d25ad2e04b3edaee132f23413ac8fb4dc2bea1b5632
00003d35ed2a4d304b3342b4ea9b56ae03303d29b3b0132c1b293d218e326fa54b2713b53231c63503b09634d330caaed51d42b474b4872877b434b3f23487ac
bfb234af2cb3fbacec34dcb7b3b45632902e96acedb2fb2c60b442306e36000090aa2db8efa11cb21ab43d35ad2eca3260b08d327428fbb06034eab0d3b04db0
77b48daaed2ae2b51b2d6c3434acc639d5b596b02cb33e2333ae3da1513130bb3134c03474a85632d5a18d2ab0b13e27a8afdc2beaa7a93578ad8dae0c3304b3
ca393d21b031ff356028333d34ac52353130e132da372b3a7936dc278b332137902e342ff2a41835d531dcabeaa3043303b496b0eda687acedb2dcabeaa33e1f
1ba93dad2caffbb033aeea3064341cb21a340000813587b0d5313d2112b1fb30bd2c3d2105b4a9b1032c8d2a4e323531bfb23d2dea333eaf77b43d21b3b43e27
61b68d2eea2fe2b160a83dad0f324d3460a83da554303e1f6030e5ad81354db04bb3dc27adb64d30902ae1b2b3ac8728bf328d2aeda635b1d59d962cef213e9f
bf3242b46eaa3e9f032c423012b13e1f77b4dc2b24343e9f1b2ddcb3edaa6f29d5ade5adf2246fa57933962cef29fbac03301335cdb2b22f9032962cf2ac13ac
1bad3da9ea9f3e1f902ae5b16e2a132ced358d2a4cb33ea3d5a596b46eb24db09036e52d8bb3fb2c61b6ea34d330a9b5d5b1dca7dd363eafbdac3d31adae3e23
03343db12f32a9b11bb567b5f2b4562a03343d2d342cca2e3134ea3071313eafa6343da1b3b06fa931b08db674a83e2bd51d67b5b3ac0438ecb0dc336b2f872c
ecb4dc27b3ac6fa9a6b413b5a3b4563249b891b14cb33e2bd5a98d32ed2a13b41bb11834ab2ffbac00003da593b44d30a82f3da13430cab262b734b3ed2ea931
d5213d25edb2e22d332e9630543087b0d525eab02fb64db0d5a1dc2f90b5caae4bb33d25fd36e23131b48d2e71ade22dbd3096ac2f2e5235a73196aceaa787ac
33aedc275135b2b31c338daeb330132c903296ac54b0fbacbfb23d21ea273ea303b43d256e2a87a833b296acea9b3e2f31b0e5ad34ac1330a638e5ad6e2a87a8
88307a29e231b0a97d2f429ee22952b27db348b1fcaf96abe22742a20ba960ad0000a72eb9a20132bb2442aa3430b02d56307a2919b4be2c4e1e16b1e2a9b0a9
b32ed3270bad2335bb28b224d5b00fa1b3ae0bafb922d9b588b4b230772d962b0000d3af91ab37b1202d1cb0d5b0f432bba8162de22d60314e2642aa0000beb4
8429d3a734ac30b44ea642a6b9aacc36bba4d32b77ad37b588b0b2a891ab37b5d4b474b218b20f25e9b1d9b24fb452aa03363db341314533b73142224e2e3034
20ad7a2dacb1013688b07a29e2b16d28b32ed3abe22d0f3581b28030acb57b3256b4b2a834a888314eae0baf91ab52324ea6a7ae25b70fa184a9422a77311cb4
e233422ae22952b24e2642a60b25f42a8132b22800006d304bb37a2991afa32e4e2a1c306a34be307d2f0babac3144b4393500005c35522ab32e422a4eb21c30
84ada72eac31be3356ac0b2b5c38b02d4e2e162d0b31a32ee22f42a23428452f182fb22485b4602dbb344e2cef320f1d4ea64e30f0340fa94e260b2b18b20fb1
e92d42a6912b37b1b32e93b577b1beacb3aeb2a825af6dac182bd327ac3196ab4eaa000034a8e6303935422ae2a90f29ccb6b2ac4eb6b03123b442a2d5301cac
bba44e2cb9ae2a32e93174b2f0b4e6b04bb348b1000096ab8132b2a8343037b184add3af84b252aa4e9e42a20ba5beacbb244831e2290f31edb0b2b0e2b1e6b0
b3b2b224913344b00a344222c6b70fad18b30babb9a2e733bb284226e231b0adbb28e430000059b4202dacb1f0b4f42ae2a7a7aee2b108344e26b22c77350f31
84310000912fb0ad563416319fb46d34bb30b224acba6da8ed3442aa0b316d2ce1387a3141b50fa906b5363a1832be307daf42ae5b3ab02d4e327aa95bb30539
4eae80b04fb40fa1bb30422ac838373100007a291934b02d8431b2a8d4b696a34e2ab2a8342896afa134ac319e361cb04e9e483177382a36d0b5613591b588b1
18b3d32fc633f42ab3b2d32b4f3896afb735d3ab9f340fad56ac42a60b2901b24eb27a295cb81c2c4e22b2b49fb4d9b18435d3a7b9b296af0ab4d32b7735b02d
b32e10b2e2a9012ee2a70b3334a852a656300bab9f2cbe2c3d34fdb40bad96234ea2422e9f2c4430e6b24226252f522a4eb2a133f0b496a320add3b3b9ae0f21
bba84e30b92296ab84b5e4b0e22d96234eaab2a4b926962f4eae0b2b9133f42a4e1eb228b9aa0fa5bba46f33ef32522e8132422a6a30522ee2a7422e9fac5226
e2376fb3b92a52a6e2b74e2cb9a20f2556306f3334ac0fad423ab2b0253360ade22bd32734ac0fa539b54eb0e2ad88b1e9b580b0d5b00f9da13442224e320f31
31b7103234a8be2cbb2cb2b04eb2beac64b7ac316a301c304b33a72ee2ad1cacccb63d33252f0fa1a1b442aa41b50f294e22b2280b290000e22fa7b277ad6dac
e22b0000b9a696a356b4d32f912ba3aebb2842aeb92a0fa556306faf4eb200004e2a421e252f6d2ce6b2ac31e2adb029203142aae231962f842d0bab34acb0a9
b32eb2a8342c52aa6f3442a6d530b02956acd32791ab0f214eae421ed530b0ad4ea216adc7b552aa0ab4421e0b29522e20adb228b9a26da8842d421ee22952a6

//!TEXTURE W2
//!SIZE 144 4
//!FORMAT rgba16hf
//!FILTER NEAREST
//!BORDER CLAMP
b630d72d0baa21aa8bb20e345f21aa33b62c312908a8aaab3cb50e340b32aaaf30ac23335f2937307330ca2fb7a621ae3c310eb888b0993430207d2e08285d31
3c2d7d2eb5ad992c733438b0b3ac99a8a0352a32de30e6363030caa75fa521a68bb223b75db05d2d8bb22a32b72e212230a4ca27b9affbb43ca9ca2708a421a2
5134deb0082caa2b3cb138300baa21ae3c2931b1b5b1fb3448328b2cb72668b4da2fd0320baa2126ceaeca2b0bb25d2d48aa99b909ad5dad0e342333b726aa2b
da33b43432b05db1c2ad4db7000048b330a0b434de302f3bdab331a134b11eb830a0debb8ab121a2ceb261b8cd36aa3784388bb036b2fbb8ce2e31295fa921aa
7330ca2bb7aa99b448ae7daab52d063454afd7adb72aaaab48aa7daab32899ac3030b4340baa992cc2ad31a1092d21a2973301b65fa537b441387d325db406b4
48368b34b7aabf35c2ad61b45f2915be05b23129092d0634b62c23af5fa506b4c2ad8bb4632b5d350eb4d7310b36063848a6ca2b5fa9e6aeda3331ad08ac212a
302054365f3199acc2ad7d2a8c32bf3173b431a90b2e21aeb83738b088b006bcb634613408245d2d483631a50b2e5d2dceae27bd0824212e48a6caab5f2521a6
b63031315fa5fb343ca90eb45d2c0000542bd7315f253734f93431255fb15dad000023bb5d2c2122da2f232fb32821ae73b8ca2fde30fbb01ab52ab2612e2132
1f38d7358ab5a7b997bb923af635d8b92b3900005d346834b13984b15f1d2136c231232f5d2c9930b62cde343833fbb4ceb2d7b9e0316834482edeb05f21e632
30ac7d36b72e803843bb4db8e03199a869360e345d30373827bcca33e433e6bafbbbf3bb4834cab4973731a108a899b82bb9d7adb72afbbc1ab58b302a39ca38
b6b4232f08ac9cbac2adca275f21992897b331215f25fbb0ce32312108a806b4c22d0136b72a373405b63129b3a821aa30a0d0b2632b212211b7d7ad0baaaaaf
54ab8431082cfb348fb9deb85f31fbb430a87d2e5d30793711b3ca2b0baaccbd0e38fab663ab06b430304db808b4203d3c2dd7ad5f215db54826312d5f258038
94346138b32ce6b2e33961b4b9b35db530a084b1b7265d2de3b501b65db0e62e482a07355dac992c1ab58bac082c212694b4f3b75fa99934733031a9b7a699a8
48aeca2bb92faa33303084b15fa1aaabc2317d2a08a4e6ae30b4d7ad632b5d35ceae7db208a437303028caa7b7a6fb30b6b88bb0b7aaaa2bb6b4de3038b399a8
9bba2a3a553917b7ce3a31a963b737b8c2b13830e0b121a23cb9d731b5adaaab542b2a36632b5d2d30207dae63af06b497b3d7b55f9dfb34542b8bb009ad5d2d
54b38435de305d35c2b576b35fa937308b3631a1b726212a7abaca27b52dcab41ab976b35d2c48b397332a3208a821b23028d731b5adaa2f4138fab6f6b5aaaf
51b80136612e83b68b3238b009adbfb530a8d72d092dcab43c2d7d2a61ae21a29733d0325f21213297b38bac5fa137b454af7daa0000aa2b3cb10136b726aa33
b630de340830e632efb631adb32883b230a0232f5fa1000051b4de30b3a8212e48ae31b108a4373054b33125de3037383c29ca2763ab21ae97b331b55fad5d31
5fac000034a89da7273484b39b2db6311eae12b4b5b39db3433803214fb6c2303eadb7b98eb400006eb300004f2e9dabfe32032d41359d2bfeaa622c9ba90000
3e314336a8329d33ceb0d43388b700003e29263800009dafdeaf84a7b52f9da7fe2ebb3641b59d2fce340325f5359d275fac62ac9b29b6adfe26432a34289d27
fea212b04131aa323e2d03299b299da7ceb0a3319ba1ffb8e63584a79ba59d27fe26f9bc000000005fb862b422b6c2b0feb293328e30c2b03eb103ad8eb49d2b
fe3262308eb43036eab8b2b065bac2343e35622c4f329d2f5fb40000a8b2aab2a6b73f397838aa32de373ab415b53c393eb1432a02af9d27fea203a1022f9d2b
6eb3b23002ab9d2b3ead622c9ba100009734032d4131c2b05f2ca3ad34a89d27fe2edbb8e8309d27feaee42e9b219d271e2e34338e309d2706bd03a1b52f0000
fe224332bb34b63136b743aee830aa325facf3319bb19d2b5f2c43aee830b6adfe2a6b3602abb62dce38f3312fb749383ea98427342c9d275f2c032534a8b62d
3e31d4b7a8b2000056ba84b322ba0000eab884afa4b8b6b53eb903b58eb40c403e2d26bc08349d2b3eb184ab41b5b6b1feb2b238342c0000ae3184afbbb49d2b
6e330c378e30c230fe2aa331febc9d278e360335d5369d276eb7e42e9b2985b80635b23408b49da73e2d4332343c9d2fdebb34b336bd3cbd6e379332022b9d2b
56b68abcb533c230fe32b23408380cbc8e3aa3ad7b3a423f76b5622c34b0493406354ebc4f2e9da73e39843358398e43fe2ed4338e309daffeb684a790bd9d2f
7635d437e830b6313e2da3ad4bbcaa3227343a34f5319d2be6bd123834b4f9bf1e2e84379b31c2b4deaf93b6c8358538f0be84b38e3849bce23ad4334f32b631
feaa1b364faeaab28e32433202ab9d2ffea6432a22b6c2b4fea2a32d022b0000ae3103b93434c230fe2203a5e8acb6ad5f2ccb35022f9da7eabccbb5022f9db3
1e2e12305c374934e635b2b034a89da73e3162b034309d2f5fb09eb85c33b6ade635e436f5b1aa36e6b962306eb93c39ceb0cbb534a8b6adce3084af41b1b631
de2f6bb69b2d9d2f06b512305cb39db3fe2293329bb1b6b127b8dbb48eb0aa3a1e2e8fb9a8320000deaf03a1342c9d27ce34b234b5af9d273e290325b5af9d2b
fe32d4339b21c230fe2aa32d41b1b62dfe32e42e8e309da797b42b3588b749b4ae3103a19ba5b62dfe2e032d4135b62dfeaacbb5b5b39d2b6e3b0325b52fc234
06b9e4b24faec2bcceb08a344faeaab6fea203ad342c49b8feaab2b04fb29d2f6e331bbae82c9da7fe2e03a561b4b6ad973462309b2daa32ce3062ac41b99dab
c63643369b2d3036fe2ab2304fb29d2f27348433e82c9d2bf8bc2bb5e8b024b75f2ce42ef531b6adfea6e4ae083400005f30a3b541b1b6ade63d93b234b0f33d
aeb1032d9b290cb85fb412b04fae9d27aeb1e4aec8359db3de2f03a9e82c00005f2c17b9e82cb62dfea60325e8acb62d6e33622c9b290000de2ff3319b2d9d2f
ae31b2308e34aa32de2f8427e8309d27fea63a349b219d2bdeafacb78e3000003e31432a02b39dab3e2d62b434b43036fe2a03a99b25c2b0a63703b161b43036
bb2345275a2bf125cc2945b15aa32eb3d5282eae98b0f1a948328b2a6faef428482ed1a9e72cec9ff8b373ada8afeca78eb12eae8429eca70000b92c0000eca3
3f2fd1342026f1295031ffabbdaaf1a9502d4531d0336daf50b15cace71ceca3bb238bae0c2fefaa3f2fb9ace79cf129cca5d1a9e728f42c59ac732d5a27752c
bba345ab8429ec1f1bb05c36bdaaf1b1592c45315db4f1b55930ffaf20a6f42cd52816ad20aaec275930a22f0cafefaaebb95c2ce724f1254832e82e352deca7
502da234202e3331d5305c364832ec9f013bd131bf30f4a8502dd121f72bf12920b72eb5f9316d2fc3ae162dbdaeec9fccb573ad5aab752cc32a0000e724752c
cc255ca4982cec270ab25c30bdaeefaabba75cb020a635b000000000e7a4f4a8ccadff31e720eca7bb278baee720efae50b545abe7a0ec2fc32e2e30bd2eef2e
bb2f5c3535adeca38eb55c28e72072ad8e3516a9f72fefae592c2eaee7a4f125c332d125202af4283f3351b9acb40e37cc25d1a54aa8f125bba75c285aa30000
bb235ca84a2cf430c3367f39dd3892b5bb1f8b3698aceca350ad2eb08236efaa0ab20000e79cec9f1b3073334ab0f1ad7db3b9ac842defaa4832162de728eca7
1b30a2340000f1291231162d5a2bf4acdb398bb0a833f1a5cca95cb0202eefaacc292e308431752cb6b4d12120a6f1a9bb2ba23436b4f1251b30a22fd2adef2e
ccad16295a3735b050b55c34ddb84e378eb1c5b92235dc3b29b6ff2bd22decaf592c5cace71cefaabb2317b8d22d5538d5b8d1a584a9f4acbb9fe8ae4aa8ecab
0a36513898b035b459acff384a30f12d2f3bd121e432f4b04836d13123b0ad37f8b35c28f7abec2b7db745346faef1a56dbb00004aa8333559b4e8b24aa8ec2b
12358b2e5a2335301b305cb0f93170aebba373355a27b2b10ab2d121e79c702eb6344531e7a8eca78eb58bae842defae67b616a920a6ec23ccad2e345a33afb2
502d5c37e7acf42ce2bae8354832ec9fab3ba22fe7306db301b3e8b47130eca778b8b9b4e72875b029365c2c5c3526b838ba5c2884adb231502dff2fe7240000
d52816ad20a675b001b7ffabe728af3248ae2eb0e72472adcc312eb66f32f125d528e8ae5a27ecabc32a7331e7a8ef2abb1fe8b284a9f1adcca9d1a55a2bef2a
d534453384a975b0c32a5ca85aa3ec1fbb2f5ca8202eec2b483245b7e71cec27502d73ade720ec23cca5732de728f4a850b1b9acbdaef4acbbaf73adf7aff434
3a344536f7b3ec2b97b4d0b698b0b2311b34d1255aabb43097b4d1295c316daf1b30d129e72472add5302eb2e72070328eb916ad6faeeca3d5a8ffab7130f1a5
3f33a2345aaf72b1d5b045274aacecabcc39d12d2330f4accca9d138d13653b5d5b0d1b1982cec2b3f2f73b3e724ec234ebbd1adbfb0f1a901b717b46f32f434
f833ffaf20ae00008eb173b15a27ef3259b4d129bdaaecaf59b08baae7200000c32ab92ce7acf4a88eb5ff2f5a2b0000e2b6d11de7a8f1a97d332eb0e71c70b2
59b45c34abb1f1a5b6b4d1a1e72875acc3365c246f2ef1ad123516ad4a2c6d2f0a325cb04a2cf12550315c300eb1753497b845ab4aacef2acc35162d5aa3f129
d7a9bd2cb32c15315bb1bd30d5a2752f23ab0fa8d5aac7aa232b5836c431eeb5d7adbd28d526153131a191308dad6c257da6f4b7fbad52388bac172a0000bf2c
7da6fe3445281130d7ad6aa545a8153131a5e830d5a66c318b2c6a2145ac1aae31a917ae43af112831a50f2420a9c7aa31a56a1d4528c3b1319d6a21d52ac72a
8ba80facd5a2112c31a9ec3543afc7aa23af13adb3301128ca2b6a25202dbfb4ca233f31d51ebf2c7d2e0fa8683215318b2c31b7d52a413554b20f34432f6834
31a56e32682ef23631ad6a9d68aebf340e30803545acc331842d6aa5fb296c25693608b920a5c72e8b30c8af2025a9b8de2ce8b4fb29c3317da66aa1d5226c21
232b6aa120a56c217d2abd2cd526c72a2a2e13b545ac6ca1d7ad17aed51e6c25caa30f3445acc331caa37cb4fbad6c212a2ee8b4452cc331842d4232d5a26c29
caab1736b0abbf3431a966b020a96cb1ca23722ffbad00007da646b32025bf30ca2317b2d52a75afd7ad2d36b0ab752fca2713b1d526000000000fa4d59e1130
84ade83420a9eab40e38173283b6bfac27396a35b033112ca038a7344db6a0b7ca236a2945a8112c23376aa9452815b5deb0dab6b32c6ca5ca2313ad0000112c
4db39535d5261e33d0b26aa1d5a26ca1ca2f9db38d2dc72a84ad6a2100003c382ab21bb7fb2dc331de301bafb3ac6ca977b7f433573193343125e8b0202d11ac
7d2e172ee9300abdcaa36ab13b3961bda0b36a2d45b84135d7a90fa497b4933400006a1d2025bf30b4b43bb0fba9e13b31a11bb7b330c3b10e30722f8d31cb33
38b4722bd52ec33108b19d3320a915b17da6c1b179b393387daa132d8d351ab64d335fb92035c331fa326aad4528bf3423386a31c83a5dbcd7b16a2920b11eb3
d729bd30d526d8b9319d9932d52acbb34db3bdacfb2dbfb0b4306a29fb2d112c772fec318dad6c2d08b53f31682e68b47d2695b5d522112ca0b329352029a0bb
7d2a6a31b32c11a8ca276a35682e47bc312d722f31b21128382c29b545b06cad232f5fb961b4f236a0b4423616b69c3ad72972ab45286ca9319dec350000cbb3
842dd234d5b270b22a2ebda845a8c73677b3bda843af6c2dc9346eb220ad3c3431253b30b0ab6c2d0000bd28d5aa75af31a5ecb5453000008ba817aad52e1128
31b1bd2c20a56830caab0fa845286ca1ca2b25b4fb29112ccaa713add5a2bf2cd7296aa9202911288b28c4a6fba900002aaef433b0ab1a2ed0b213ad203111b0
d0b2053845b01aba84ad1bafc4311e332a320f24613468b07d26722f45286ca5deacc82fd5a2cb338ba86a1d2031c3b1b4303fb5b32cc7aa31a917b20f301531
caa3bd34fb2d6c2131a9bd288dad75af7d2a91b045b0bf30232fab35452c32bc8b2c46b3fb2970b200006eb220296834de303b34fb2911289538b3b7b3b097b5
232b1736b32ceeb531a11baf202d9c368bac6a31d59e11a87d2617aad5226ca9ca27722b45a86c2d31a95836d52ec3b5ca2b17aad5a6c3b131310000452804ba
2a2e6e36b330bfacca2bbd2cd522a0b7319d0fa47cb01a2e8b2c25b4d5263cb8312542b2d51e6ca9aeb16e2e45b01a3231a5722fd52a11ac3129bd30d52a11a8

//!TEXTURE W3
//!SIZE 144 4
//!FORMAT rgba16hf
//!FILTER NEAREST
//!BORDER CLAMP
25ada89fedb46f2e8636253553ad04af0b2cb3aa53292432f6b0203875b5aea80b302d2f0f358e31dfb4a8ab87b0432dc7aca82743b08e3181b47632b9b3182c
b331bea9642e1830fcaea82b642a18b0692c2dafa8326fae5aafa81fb9b3d92de2b1c928642a4f335aafb3aefd2fba326f32b32e5331aea069ac4eb0432404ab
842da89f20b204ab25312daf20b61834f63062b964aeae2c0b30763687b0aea0e7b381317539d92d28b6432d532904ab6924f03243a8432de2215e3853ad6f2e
692ca8337533d9ad0bac2dafcbac69b50b2c2daf0fb1d92911b21130642eae2cc730c9a843acf830cd32a82f433018ac0b2cbe3187306f2e98b043ad642e43ad
e2a94eac20b2d929842dc9a843b0432d5ab3be2943a4aea4e29dc92c0fb51830c7ac4e2c6534aea86fb6432d53a918b05a27000097b1ae2cfc2ebe29cbacd9a9
523443312032ae20b82fbe29752f6faec7b02daf4320aea81132a8a364aa04abf630b32a43a8ba320000063164a66f2e6924c92c752f18b0e21dc928dc2daea0
69b0b3ae53b1d9b10e35bead432488b45aafa8270fb118b4e22da8b353a9e5339eb2b32a642643b5a4b8a82b75ab8eb50baca8a730b3ae20e2a1c9ac65b46330
e2a9432d53b1ae200bacbea5642ed92d6f32b3aa43244f37e29d43adfeb505b82529be25fd379aaf0b2cfbb153a918ac5a2b2dafcb30aeb425b111304330d3b4
0bb0be25db37182ce2a1a82f6426feb55aab993b543804b39e2aa82b21b89a2fc7b4e533ed34b4b5e21d2d2f642ed93140aeb3aacb34ae2c3db5f0b2103c6f2e
5ab343ad75336330b82f8cb0a8b64335f6b081b1fdb78838f6b4a8af303b1eb52529c9a865b488b4b3b1a827753500009830be253abcaeb06fb606315438d9b5
0bb00000642ec0b7b833bea9432c4331e2a14e2c4328432d0bb47632cbac4331e73311b021340427fcaebea95331d931fcb2432d43a8d9a925a9a82b53b1aea0
25a9bea5532d182c6928bea943309a33e2adb32acbb024b2863643ad6426042be2adbe2543a88e3125310000ecae43b1c7ac4e2ca8b224b25a33bea543346f2e
fcaec9b087b4a4bcb833f0b287b09436402ea82becae042b69acb32e53296f329eaebe2d0f31ae2057b6b3aacb306fae40aec9ac642a6fae5aa7a89f43b004b7
5435c928ec2e8e3569acc9ac433018ac5a27be2575af4fb369a806b164b2f834e21dc9ac7533aeb40b30c930752baeace7b3a82b43b004a7692843b564361830
cdb28c3030b32abb9e2e8cb0642efeb59e2a38aeb933ba32b8b3382e6426d9ad843106b1ec2e6f2ee229fbb1fdafe5339eaa06b5752bd9ad5aab62b5a8b2e6b8
6c35b32e43a004ab69a8c92ccbacaeac69acbea5ec2e1eb58d384eac20b28e350bacbe2d6432aeac0e3581b153a963b054b5b332fd2f182c3d358cb8b937aea0
3a34b3aea9b404aff9b5fb3153a918ace29da82f0f31432d5a27be25a9b48e319eb2a8270f31aea4d6b9f0b264aa75b76924bea5432c432d252da81fdcad0427
b331a8afcbb0ae2011b2bea953ad43adfc2ebea543a00000b5b611b0dcb1ae2c69a40000752fd9a95a2fa82700009a2f692ca82353b1ae300eb5beadb933042f
d124dd30b41c4f2f5db00b31e1294fafb8adc4ade8b2512184b0d8ae0eaba532d120c4210ea751add1a8af2c7eb351a137acafac0ea752b0ec2e34a795adfcb0
1e2d39b5c2ae51a9842cd82eb4a4a5aad1247caa4a29a7b06b2d0bad0ea3503291b1342b77aaa52a10b053ac772ea532392320ae0e2fa5aa84b0c4adb424a5aa
deb1d8b2e12d51216bad20b6d9b0a72c9faa53b4aab851a93923532ca4ab5131842c53a868b0a72c0000af2cb428fa2b00003cb4b42ca730aa303427b4a4a734
86af34270e2ba7ac6b29dd342531d1b5d12cc4a570b151b1d12c3433ffacfaaf52aeedaf68acfa2b39a3c4212cb27c346ba97caad93051310526ed2fbbb1fb2d
d3ab7c2ab42451299fae7caa1dac4f3305a6c4a1b4a8a7acb8ad672d2cb25129d32bedabe12952b0d1302032682c51a105aa53b00ea74f2fd128c4a568ac4f2f
1e2daf301dac4f2fd1ac53a4592fa5b205a60bad0eab51a5d1a4c4a5e1a5a7ac0000c49d8eb051219f2ac49d00005125d11ced2be12dfb2db82d53281d30a5ae
d19cedaf0ea3a7acd12006b77e33a72cecae65b668b052b037287c2a952dfa2bd120aab61d2851a544b14eb2bb31a5aad1a8342b8e30faa79faa67adc22efbad
842cd8aeffb052b0b8adaa328e30a52a6b31bf33b4ac4faf6ba9bfb7b4a4faab86b3ba3868345129d12053a8c2aea7acf7305035b428a52a1ead342b5132a52e
d12c47b8a42f5234d1a40936b4247cb4bdb8af348ab65230373400b9a134503639b3edabe131fa276ba97c2e0e27fc30d19cacb55933503637b0b8b9a42f2739
37ac53b41daca52a2338f235772a27b55d3022b90eb3463d522e7c32ff34fcb4052a0ba956b4523052b225b06830fb31c0b7afb4e12dfa27d120ed2be1255032
522e202e253151a5523234abb41cfa2fd12c81b0b424fbadb82d3931e129a52eb8adc41d68ac5032052eafb0efaf51a56b2d0000b4ac51299f32db351d2c512d
d3ab67ad0eab5129862fc425e13152b439a7afaca4b3a5ae392b7c32b4a827b4b831afb0683451216bb1532c0e2ba5331eb17c2eb4a451a5372c34ab5132fc30
2bb2953183350000c73867b5b4a44f2fecaeafb077ae51a19f2ac4a98e304f33522eafb04a2d51a1d32b7538953151adad33ed2b952dfcb0392f3c34a42f51ad
1eb181b0bbb1fa2784ac4e322c2e512184acc425b49cfa271e35f4b477aaa52a37280b31b424faa76badc42d0e2351a5d3af5324d930a52e8430c4a1a42ba5aa
13b30d34bb35a53384b0d8b2e1a9512105ae7c2a30b4faabd124d6b70e27a53237340b294a3151a97936f2b595b151a5052e53b4773251a55db425b0772e51a9
d1b053a49db2a72c44317c2a4a2d51ad99b70bb10000a52ad33734a701b8fa27392bc4a51d3450b205aeed2f0e2bfbad862fd832253152306738edaba4ab51a5
9faac4a5683052309131c429433051a96ba9c4a12cae5125d1a4dd30e1a551299f2aed2bb49cfbadc6b253340ea3fa2b522e95b11d2cfaa76b297c2aa4abfa27
05b28130b42851a505320b31ef2f52b0d19c4eb24aa951ad842ced2b06b2a5aa37b0af2ce12951ad05aa34ab4aada72c6b315330703151a93933d82e683451ad
deac66afe6270a231fa908ae8ab40aa7192435b505b60a272ca794a6bd2842b31bb7662f872966b0eeb44eae51b29e344ab4a92c51a2f0b1d0b3202bbdb066a8
a92a9eb5ecb10a27a22d0035ef30d7acde304eae51260a2fafafd033d6340a2ba22986b44eb7b8ad4ab4adaf8ab40aaf199cb7b2efb00aaf2c27c1ade6ab4725
6daf942a5122472d82316328e6272eb01f294030a43445361f2d631c58acb8adbdb46330bda4b8b1252a3531d3350a33a9b2adb3efb4ebaf19b035adefb00fb1
67b25ab8bda8f0b119a494a61b2f66ac2cab4030ef30d72c19a8efa88ab047a561ad0bb41baf47a59c28352d58340a239ca8ad2b87a90aaf1fad942e58300a23
672e4e2eb62e0a9fa2b108aab6aeb82d192cf3af87b10fb11f2d662fec2deb2fbdb094a6519eb3b32caf631c802f99b2e4ad86b05122292eaf2bad2b51260a2b
3a30cc3487357aaf46b2639cbda447ad9c2cef2c512666309c2c7ba5bd2866a83ab0f3af1baf4725fe34ef2851a280b16d2f202f1b2f0aa71f29ef28e6a79eb0
a2adf3af09b566a8afabfdb271b4d7acafafad27ba31d7ac5bb01cb484b299ae40b1639cb3b345b6a2b1da32e62780b109b4352decb10aa767b6fdb61bb70a1f
1fa908aeb3330aa7f033a92ce627eb2f000037b884b2292e61b1e431ef3047a92c2b0fb780b70c36252686308432b3b3113863344e37b82d1f31ad2722b59eb4
a9ae1c34ec350fb1a9aedab6efb46628a23163b471b40aa79c28d0330c344ab46d2f0fb7d6b412b41f2defb0efb429aee4b1e4b5ecb5d7acfbb67132a434fcba
19a44eb6e62b66b0fe302033ec2d5e375db71235453abb34fb36dab2ecb547adfeb4082ee6ab99b2afaf942a1b2bb3b3612d202bec31292eafaf9eb180b399b2
f033631ce62b0aa71fb186346a364725192094a6553129aa5b2cc12d80af0aa3deb0352de627d72c67aead27e6272b3519a4942a1bab99ae67364e323b35ebab
252a58318a349cb550b508aee6af662c003808b2efb442b31f2594a2519e2932a2b558311b339e30f03363a4bd280aa34a34ad271baf9eb0a92a7b25ec31eb2b
192025b8e6af0000feb0a53687a961b6192c63ac51a666acdeb0ad27511e97b71fa99432b62e29ae4cb3efac51ae7a37a9ae863487b10aafa9aa63b01bab9e30
9ca812b5bda4292a25a635310000eb2b192848b8bd280a27deacad2f51a6d72c25ae7bb11fb20a2b6135ada7e6ab7a2f0532dd3422b1472525a2632051a666b0
6b34a930512680311fad74b4bda8bbb49c2840b051aed232a92a6330e62f82b41f2519b651ae29ae19a0a9b0b333ebb361ad32b71bab0a272532942251320a2f
1fadf3afec2db8ad3ab0632cb62ed2b22c2b2037bd307a37a9b2b7b622b182b4252620afe6abd2322c27bab458ac47312532a93422ad9932a9ae9eb53b359eb4
5b2c082aef300aa377367b2de6ab292a19a0ef28ef300a231fa5632058acb8ada2ad082ae6a799ae7bb0353132380a2b2ca786b01bab66a89c2c2b325126d7ac
a22de431ec2d47ad1f29082a22adeb2b6b3471b2bda8b82d2cafad27bd3066ac1fa5202b84b229aafeb0ef281b2bd2b26d2f94a6e6a70a9f5b2c6328872966b4
4eae5ab1d0295fb234b02db25c3096b2fcaf96aefc2819a53428961ed0311eb78534a234a5225f36a0308fb53bb2ccae6a30d32f27a85fb6a02c1e300000acac
e2b18fb1e1345f2eba26c4b1a522ac300bad9622fc24cc9e4f346232fca4acac41b55ab1c7303f28ba9e5a35a51ecc2291abcbb25cb0cc1e91ab1e2827284f31
77311eb0a52a3fa8ba1e2535272819adba2a3433afb3fe34a0b069b39b31acb8d5b0d333fcb0be3a25afd3af27ac192934acf1a47a2f09b084b21e2c3b2e7630
a0b453b4703239afba269622d029f2296a34f130a5a2f22dd5b0c4a906325f2ee2ad96aa31315fb2baa6cb3291b03f280b29d3b3dab2c734fcaf87aca5aacca2
342c96a266ade3b425af0033dab2c73434b0cbb29b314f31ba221e28a5a2000077adc4a97aaf6b35fcaf1eb4a51ef2b1ba9ec4a9912c17b8baae1ea8a526ac30
efb2f1a8c7b019295b33f12c2728a533ba2a2d2e0faf19a5ba22f124a51e192dba1e1e2ca59ecc3291b3f1249b315bb4baa200afd02939afba1e1eb0fc244f31
4eaebcb0912ce3b4a02c0438fcb019a94e2e69b37a2bcc2eba2e38b498ba19ad4e2e5ab100008631ba9ef1a8fca4acb0d534872ce42ff2b1912f1e2ca59e5bb4
41b1f12c5cb0f2ad91abc42dd02d0000bab200afa522ac306936969e3bae76b492b987b0e43396b20b351ea8fca8cc2efc33c4a94cb5392f26b5f1a8da32f229
0b2d69abe4b7c7b491b389ba91ac5bb4e2a9d3b3ac3824b4efb287acb6b97ab64fb445b87a2f19b10bb10033fc3496b23428deb527a8f2b1a0b4b8b7d0b51bba
91b38fb1e433cc2a8432603827341925ac3a1a37fcb476b4c7b91eb80d3824b8ad352d2e42b409b04eae961eebb5392f913ab13627a88a374eae1eb466ad3fb4
34ac5aad27ac19b50b31a2344234bcb14eaed32fc036a5ab0bad2db2afb3cc2ae2ad5330fca8a52be2a9961e31b1a52ffcaf1eac9bb13fac26b5f12881b5cc1e
18b2962efca4cc226a302d2ea52a5b344eb2b1b65cb4f2b5baaebcb0a52a863177351336d029862dbab2961e5cb05fae0badcbb270b276b40b318f31fc24a533
4eae53b03b3224b4ba2ed3afc7b0bcb10b319622d029cc9e342c5a2d4cb509304e2e53b07a2f392fbaae87b4a52219a5ba262db291300000e2a987b0fca419b1
000053b07a2b192de2ad1e28fca4cca2ba2296322728f2a934a8d6b4fca43fb034b062320faf5f2e912b00333b3219b134b4f1b47a2ba5afe2a9f1b03b2e3933
baa269b3da3696b641b1f8351ab8192dfcaff1ac06325f2ea0ac9eb3a51e19a5e2b15aad00005f2e4e2ef1a4662dbcb1c7339eb37a2fcc261832c4b17a3386b1
77b15a3191ac3fa8ba2e692fe4afcca6a02c3433d035000041318730fca81eb7a0ac96b631318631fc2ff1b0fc2c000091ab9622fca8cca234ac87acc7b40e36
ba222db2d02d02b3baae96aeda32a5af0b25f1241635f22d3428bcb4d0ad19adbaaa872ca5ae2932baa26db49bb51929a02cf128912c19290b2596a25c303fb0
ba2a962aa522f2a9baa696260fb3f22dfcaf45b8c734bcb134288f317ab302b3ba9ef128fc247630e22d2d323b2eccaeba9e2db2a52aa5abba222531a5ae5b34

//!TEXTURE W4
//!SIZE 144 4
//!FORMAT rgba16hf
//!FILTER NEAREST
//!BORDER CLAMP
042806b468aeba26b1a655a21aa6b02f000039a4532bc4a1b22f032db6b2baa6b0ad5ab01aa63f2a5a9dc028b6aa533006aa03b5462cf82e59ac55aa942c02ae
04a8d13453a7edb0b0ad632f68b253a8b12e472de2203f2e5a2dc0acefafbaae062a032de22c49ad2fb0392430b1c4a9dc3247a59430bab25a2d8a311aae72b0
afa8eaaf6d30d936593047311ab2ba3604b0552ae2287d2e9a347cac9430ba2a5cab393053af492d853139b49135c4a16fb4c02c59b41136b1a655a6e2ac7db2
07af47311aaa17b3af289e306d34a6b504a45ab0b6aa0634062e55aaf3b1ba2604a4552246ac49a95aa5dcae1a3249a98f3855a653ab72b45a2117b053279cb2
afb4399cccad352fb126eaabe2a0b0305a2155aa1aa6b0af443411b21aaacea45bae63a7942cb0b005ad399cef2bc4215bae7c2c532b2b31dab0ce29e2a4ce24
afac28b4b6aa73af5bb2c8b3bb30ed303031ce2d1aa6492906aaeaab7ea9ce30062e17b046a887adafaca72fbb305eb25a2d7cac0000cea8000039a0e29c53a8
072facb168ae91acb0ad39203031533004a879b51eb0b0a75a2d6327e2a8b02fb126000046a802ae0428d13453afcea4b12617b8e2ac49b15aad3930053391ac
afb052374630ce28042c391ce21cba2a5c2f55a2b9b5c425b1aec0b0a7b4ba2a5cab17384638352b04a4fe326d3035b0b12639a0a5b100005aad063432b4912c
873320b36d3044b44f3869314630edb4a4b83038bb303f2aafb055aea12ff2355caf392053a321325aa163af663791b0dbb5993246b43ab55a25b8b7d8b8a137
0428b83705373faa5ab5dc2ee21cbf3404308aadf33591ac85b14ab407b60c2d503939b453a7ceac06ae393094b4492d30b14ab4052f532805b5c0b4b62e6334
5aa59e30e2a016b0af2c8aada1afb0a75aad41b3462853285bae06346db0b03444348ab57eb149b107af14358fb2c421b1a63930b62ecea4af2cf2344634b027
5aa5a9b6f3b1b0235a1d77b668b2ceb0062e6337b62eb0af07afac31ef2f35b0062e6bb4ccad73af5cb3c0b0e2a4b09b5b2e202f0000532c0430ce31e2a8b023
b2af8aadccad352b5caf8ab1a5b13f2a592cc0281a2abaaeafa855261a26732fb1ae391c94acc4a5af28632b682eb01f042c4725462c49ad04283924bbb0ceb0
b126e2301aa6b0235a1dce2d1a2abaaab1aa5522b6b2ce28b2af472953afcea4062ac028b62ab0a7dcb24725463053b05a2163a7e22c3f32b1a663276db4b02b
afb4ea2befab0cb1dbb1dc3246a816b4db3539a4b63244b42f34cead1a2a3a35b2af7cac41b2ceb084b05ab04132ee33dd33eaabe21c63b404b0ea2b57b1d4b5
0733112e302db033db31eaab7e29022eb1a6392c462c16b0853163a77eb1913044b447a95323baa6af28dcaa7ea972305cab20af6db02b3171b663a753ab352b
b1aa47a9532fb01f07af03b153ab21b2592c5526e29c492d06323924302de3315ab1202f1aa6c4b15a2ddcaa7eadc421b02d3928ef2bbaa659b039ace22c912c
5a2539ac46acb01b04a447ade224352f04a4ea331a2ac4a1b12aeaab1aaacea85aade2b046a8c4a15a1d391ce2acc425b12a8a2de21c3f2eb2af112e532bb02f
1ba9b5a655b1f5b01b295f2e72b028aa731e5e9dc7ad1aa4d624b5261c231a248627082d00361aac73a2b52e39301aa8732a06b01c1f799d602106ac392a7929
4d9c5ea58eb17921739e092a1c274db1d6a8b52a55ad1aa8e925b32d1c9f2eaf3d2db2281c2fc934a5a95fb2aab24db1cb2b1c3472a879314da4b5260000799d
1ba95ea11c2737353dadb22caa30722c73220831393479a5862333b5000079b56021b633c7b6d02d082c5e253932ab32ebb25ea58eaf79a5b82a0bb3e32c21ad
60a561af00b428b2732288b155315336a5ad0b2f1ca3d7ae86a361afaaae46b40c2e5cac00b22eaf2eaa33b5392e0000e9a9f4b51cb12eaffd265cb071b2d7a6
60295c3039aed0b1cbaf5e9d8e331a2c4d985fae392a1a2491a80b2f1cabab3291285eb18eb3c9ac4d9cb23400b0c9286facb526392e7fae1b2d06301caf86ab
91ac34b200acd72ab42c5cac8eb1862ffdaa0b2f7230d7a64da05e9d0000dd2f4d24b2ac39aec92886a734b2c7b3c9ac4d9c0628aab0d726739e06248eb179a9
3dad06a4003028b673a6b6335529862bb82a06b400b0f5b486abe1b3392e9eb04d205ea172ac1ab086a35c34002c5332fda65eb572acfcb1a5a9b33155b40233
8627363300b286330000b2b0392e1ab086a34ab6553521b5da2ec7b45525d0b1b82a333900b5c13673aeb5ae1c9fc9b01b2d5fb2713200000000b2b4aab072ac
862331b000323d362c31b2b4c734d7ae732a0b3339ba6eb91ba99f3672305a333b3071b40e3b79ad443453391c31b43880b0b2ac0ebb212d1fb3e1b7c73179a5
b82e612f3930f5b4a9af9c34aaae4d35a5ad9c341cab3034e9a509ae8e2fd7b2e9315fb2d539000000000831c72d79a9822db230c7b49e342e2a612f39357f32
6029092e1c1ffcb11b2931301ca3d72e86a709aa5529212d912c5faeaa381aa82a2c5fae1c2f86ab73a2092a1c2786af1faf0630aab0792551ae343255adf5b0
73aef2b4aaaec928ff335e1d55a979a1cb2bb532722cddaf0830b22c00b579252c31b2ac1c2f79a53dad5cb072a84630732e5e291c27c9ac082c5ea555a99eb0
86a733b1e3acd7b2082cb3ad72a8c9a8d6a406248e2f792108acb2281c27c928e929092e00001a2ca529b52a000086ab08b0e032722c7234a92f092a1c9f79a9
000033b1e32c79adb8aa5e2555ad792586abb5a6e3ac7fae732a062872b01a2ca52d5ea1aa2e7f2e91a806a400b51aa473ae5ea51cab1aa886a3b22c3930d0b1
e9a5333172b4d02dfda6b52e1cb3d0ad86275cac1c9f86af00005e21c733d7264da4b5ae39b5c9ac60a55c305529d02d412b08b18eaf86afd62461af72ac28ae
2eaa08b18e3379a5b82a0baf1caf79a5412b3130aab2212dfd3261ab713721ad1ba987305529d72ed6a80bb3e32c2eb3e9a5b5aae32cdd2f4d98ddb02ab88633
60a506ac00ac792591a861ab1cb3d72e73265e295525722c86abb5a6c7ad7925d624b32d1c337929e925b52e1c1f7929c7ad06241cb11a2c73ae5ead3932d7aa
60295fae8eb31aa8b82ab5261cab000086273432c73121ad082c09aae32c21b1e929b5ae392a791d41abb5aac7b3792186230628723079ad822d00008e35d7ae
0b2442adcead5723bd260ab4a42f1ea60b2822b0cead1e220bac23b3a42fe52cbdaac3aee42481a9bd2a03221c266cae393183abe420ba2a67b252341c2a48a8
8db0632e55a7f42b0bacc32e1cb2e518bd2e6ab4e41c332936b0e2acbcb0baa6e3b0e32f0b314824112a22b0b9aa57270b30d2b1e424f42714af52301caa57a3
bda6822cb92e572324b5e33380b196286429822c80a981250ba4c33280b10cad642582b4e4b4e518bd2e832f0bb1beb092b6423144b283303931b3b355a381ad
672eb2b047b0482c923283ab7e36482cbbb1a2ada9b448a40000b2b455273329c0af5230f22bbaa60bac632ece311ea2bdaac32a47a8571f612cd2b5ce2d57a3
0ba8333247b0e51836b40332072ff42700000326472ce59c36346ab4952ce518000093b220b033a92134c3aa5b3448a864b103a632ad33296aab03a295b4baa6
61ace3afce2df72d8db023337e36092b649d42ad3231a5ab11b223b395b8d02911aa63aeb9ae579f9232b333952c1eaabb3183a7e424e528c02f03a66bae48a4
6a2b823455af21ac0bac832f59b1e5ac3cb21235552357ab112a03a66bb233adbda663b6e42c6c2e64a5d2b1552fe59c11aec332e41c93b26a33e3af4535e22e
6421e2b444328032bdae0a34bcb06caabbade3afcbb3beac6ab3223034b46caa393542b52a3896306a2b123544b2a5ab14af6a3407b3e5a46aaf83a755af1ea2
bd3263b2943557277f3722b44436e52c59b93bb780b1e518613452b45b345a2d641df336f4b60cad0e2d8a3544b209ab36b823b3ceb1302f57b852b4b3b86fac
bbb1723955b3f427e3b46a34b92e572f6a37f7b9ce3548a864a142ad0733f53277344235bbb55aad0b34d235a934d1341136832bda38e5a8112a422d6b325723
64a5039e55a31ea2b8283a3420b45723eb33f3b255a36c2a0000833745b50c2d0b24dbb6b92e6caa11b2fb3759310cadbbad83a75533572326b603aee4b06caa
a53583b3ce310c31673242ad5537e5a0641d9b37322d33b14fb5a2b192b68129672e032e82384824e63142a90b35e5a0e3b0000095b457a3bbad63321cae33a9
0ba482ac5523beacc0b3039e472c482c112e52b05527a8adbd2a422d55ab0000b8ac63ae322da52b6425a2ade4a80000bda6db366b2e93ae649dc3b2f22f0a32
363082a8552b4828c0af82244728e51cbbad42296bb27eaf0bb0c3b280a95a2d8d3023afce31db3464a95230ce2de52cb82c123180ad6eb161ac031e472c1eaa
6ab38224e4a8212c39b5032e47acf72d643542b547acf7ad3f33a2b180291e2efeb6823047ace22ebb2d83278031ccafe33472b5a42f1ea6cdb403ae0bb59233
8d308327a4af5a2dbd268327552b6fac61b0533347a8932ebd2e82b4a4b31e2abbad333255a309ab6130832ff22b1eaeb8a8032e2030f42b3fb3cab455af572f
c02f83b36baee5240ba482ac47ac0000641d632ee41c48280b2c82a4f2ab57a736b403a6552ba52b3630d2b1e41c48ac8f310322cbb309abbb3183a7e41c1ea2
c0af223000004830c0af0326552fd0290b3033b2322df7ad0bb0e3afbcb4ba26e3300000b9aaf42767b212311cae572b64a582a8e42809ab649d22ace4a848a8
4ca7b7a70628dd26bca91c2ee32c7ea9bc296e269a24d6ad2b246e2ae3307ea14cb380a852b176b04cab6eaac0312e2ad12fca2953b260b436a52529e7b20000
90b0b72775b4dd2ae8322531f6b41eac84ae05b087347e2941262525c0ade5af8faf251d9a28e52f2b20fcb0e7aa8dab362db7273e347630b12cd32cc3af7e21
4cb3e1b319341e28c7aa05b40a3668b5b1ac251d2d3176ac4c2b2eac7530b1326332b7b30ab2d62dd2306eaa9aa8ce28f4ac65b7c0b1cea88faf653359b87ea1
2032132fe7b2cea84c2b19343fb552b12b2013b37e38ddaa58b1132bbeb426add133772d7ab3d6310ab0aab053b2d63141a6253153ae7e31362db73390b82e2a
fe2db7239a287e292032d3ac50acdd26bca9252d9aa81ea4bca9d3ac30332e2e79b1caa9e5b17ea5792d6eaae722ceac41ae132fc0257e9d79ad80307a2fddaa
84aeaab0e3b07e2d2b1c6eb2be307e31412e25a9762d1ea4f4b0b7af193476b0c7aa6eaa9dae1ea42b1c132fe7b27ea9bcad252106b01e30f4ac25a5e7a27e25
4d302e2c76b576ac8faf132b9fb3fab0bc3180a806ac2eaee832b72be72252310fb6252576b1fab0ddb1d33030af1eb0bc2d2eb07a2bce2879b58028763185b2
d1afb723c2327e9d3631053053ae1ea4f42c3ab52bb01e2c842e3cb3c0317e9d1bb49732c2364ab0bcad8028beb47ea97f34c1b206ac4a3836ad3cb37631352f
4cb3193489b576b441a61b39c3b373b912b85a3659b87ea536b16e3278327634e3346ea606b026b141368eb350ac352fddb1caade334ddae23b843b859b835b3
fe35c1b2ac346137842ea0b1c333d63136ad252d9aa4aab1d1ab6cb41e37b933b636f3b19d2e2e2e9a31b727c0a5aa31e8b22e304136263120b26cb8c3332e32
4d306e2a53b62eaa3629132f9aa402b24db0b7af2b308dab7931652f6435d631a5b2caad06a88daf7931b7a376311e302b9c80b09aa81e28092fcaadf9b6ce2c
e8b277ad2b34d6adb128d32c62b4aab5362d6e2ee7aaa230ddb1cab12b301ea82ba025259a9ccea8f4b01c2e532a7e2db128b7232b302e2ab12cb7af75347e25
2b2480b075b04a34b1b0251de8b361b32b20d3ac302fce2c412a25319a9c26add1abd3ac302fce30412600002d291e2c4c27d3309f331e2436ad25219aac1e24
4caf2e2c30b31eb42bac252d9a30ceacb1a880287aab2631c7aeb7a3e72ab1b22b1c6ea650b0dda6feb125a1062c1eb0dd317731302f1e2c2b244e3150b02eaa
58b10530e833ce343625453206b07e2d41a6a3b7c025ceac2ba8b72b9aac6fb6d23057b02d2d4a342b9c2e2c9b3135af793125adf7b552b5c7aee1b32b34d635
4c332e3019b4b1b2092fb72b9db2e5b341ae80a87a2fce302ba8a03175b002b6362d073606a8262d2b20803476b1ddb62bb380a85030763079b1132bc0a9e5af
2ba025a9c02d7ea5bc29b7a32dadceac2b246e269a9cd62d8f2fb723e5b1b1b2c7aed32ce72e59322ba025a9c3af8daf41a657b0e7a6262dfead25a92dad76ac
4caf132b9ab01e3036a5b7a77ab3262d90302e3052357e21b1a805b03eb476b441a6ca2d9d2e8d2b36adc1ae62b4852e4c2b252d0000a2b06e2ce133e7aece28

//!TEXTURE W5
//!SIZE 144 4
//!FORMAT rgba16hf
//!FILTER NEAREST
//!BORDER CLAMP
9120ccb367b14928b521fbb367b1bd26d922fbb367b1e69c90269eb367b1202a6cacfbb367b1f6ab23a1ccb334b1bda69114ccb334b1202ad91eccb39bb15923
9120ccb367b1bfacb5a1fbb334b1202223299eb367b183259114fbb39bb183a9d99accb334b1bd26da28ccb334b1591f9120ccb334b1a82b9120fbb367b1e624
6c29ccb334b136b04824fbb367b120229114fbb367b159a7232c41b3ceb1fa302328fbb39ab08eb4919cfbb334b15cad6ca715b434b1bb33d922fbb334b120a6
232515b467b16eb24824ccb39bb1aa2dd926ccb334b1fab04830ccb334b1bdaeb59dccb334b149a4fea515b467b16e326c23fbb367b15d34232accb367b1bd32
fe1ffbb367b1982c9120ccb367b1e6206c27ccb39bb1952e472215b434b10b2b6ca8fbb367b159afb5a515b434b1599f2321ccb367b19828fe25fbb334b12022
23a1ccb367b1802f4828ccb367b1f6a7b59dfbb334b1352923a1fbb334b1d0b2919cccb367b14928d99accb334b149302325ccb334b15923911cfbb367b10000
6c29ccb367b1e6209118fbb334b1e698fe27fbb367b1202a9198fbb367b149a4fea5ccb367b1bd26b52115b467b120aafea7fbb334b120a223a7ccb334b16e2a
23a5fbb367b1322fb5299eb334b1e6a4b5ad15b4ceb0a9b29114fbb367b120a2c82cccb3ceb1f6abd91accb367b159276ca5ccb334b15927da24fbb367b19828
a32c2cb49ab0a8ab47a6c23967b149a4232ffbb35b3abd3291a9ccb301b1e2338830ccb367b1202afea7ccb334b198a847a2fbb334b10dadda2443b468b20000
232b9eb334b18329352e15b468b28e34b52b9eb39ab0713023aa15b434b1591ffeaa9eb39baf0bb3232f2cb4ceb06eaa919c89b401b2dc3423aa9eb368b29731
b51d9eb367b1832d4824ccb39ab020266cab15b4ceb1cfaffe1f15b49bb18325919815b434b19828d9a6fbb39bb1f6abd91e9eb301b149a46c2d9eb301b1f9ad
2325ccb334b1f62fb5a5fbb39bb1e6b02328ccb334b1e620232bfbb39bb12026feaa15b49bb1592fd91efbb367b1f6a79198ccb367b1202afea3ccb334b1322f
6c25fbb39bb1e6280000fbb334b1e698d922fbb367b1599ffe9fccb334b1f6a791a0ccb334b198a8911cccb334b1bd26d922fbb367b183a523a1ccb367b12026
47a6ccb367b1e6182321ccb367b120a24824fbb334b183a5d922ccb334b1e6a4b52bfbb39bb1d129d91efbb367b1e69cd99eccb334b1bdaa4722ccb367b1e69c
fe239eb367b1222c4722fbb334b100009120fbb367b183a9911815b467b1f6279194fbb367b1f6a74824fbb39bb1599f47269eb334b135a9b628ccb334b120a6
b628ccb367b1e6289129fbb334b120a26c23ccb367b1e6a4b51dfbb334b10000fea5fbb367b183a96c2afbb367b1e6a0232bccb367b1a8af4726fbb367b159ab
4824fbb367b1591f6c23ccb334b12022fe1ffbb367b12022daa4ccb334b149a4fe9fccb334b1e6a0d91accb301b15923911cccb334b1e6a0fe23fbb367b1222c
6c23ccb334b159a39026fbb39bb14924b51dccb367b120a223a5ccb367b1e620fea7fbb3ceb0f6272321ccb367b120a691949eb334b159a76ca3ccb334b12026
b6241bb105b4cb9f7e251bb105b4df20d9271bb11cb4df207e2de6b005b4a128b6204fb134b417aa15ae1bb11cb4cb9bb6201bb105b4d89d752b1bb11cb4d81d
d9a71bb11cb4d22210a74fb11cb4a1a81027e6b005b49a2998b14fb11cb44ea7b6a01bb105b45c2583b04fb105b4cb1f06301bb105b4cb97b6241bb105b4cb9f
ac2a1bb134b4df2047a21bb105b4d825102b4fb11cb4d8a1de32e6b0dbb3ac2facae4fb14bb4cb9f47a64fb134b4cb17472283b1dbb3a1a81aa91bb105b4a128
d9af4fb14bb462a4471a1bb1dbb3d2261a294fb134b4df28deb21bb105b4cb2bb6204fb11cb4cb171fb04fb1dbb35ca5472e4fb1acb35526b6a41bb1dbb3932a
752b1bb105b4cb1b512ce6b005b4cb23102f1bb1dbb3df20b6b41bb105b45c29102f4fb134b4d81d15b24fb134b4dfa038301bb105b4d8a100001bb105b4d89d
7ea91bb105b4d81de3291bb11cb4d222d9271bb105b4cb1be8b04fb14bb455261a2d1bb11cb4d821e82ce6b005b4d222d9a71bb105b4df2012b44fb11cb45c25
ac2ab2b005b4cb2b471a4fb11cb45526472a1bb105b44e271ab14fb134b4cba3d927e6b01cb4df2875ab4fb11cb4d8a1832c4fb11cb45ca5d92b1bb11cb4cba3
7e251bb1dbb3cba37e251bb105b46228d9a31bb162b4d22a102b1bb11cb4cb9fb6a44fb11cb4df280000e6b01cb4cb237e2d4fb105b4d8a551a81bb105b4d825
3b36b2b01db51d311aa91bb134b4cb1b479e1bb17db3cba71fb483b1a8b4cba7b6a4b7b1dbb31d2d1a297b3a1cb455aae3291bb1cd39cb1b47a2c2b3dbb31d31
33317eb01cb4bb331fb04fb1acb355aeb1adb2b0acb3cb2fd9274fb11cb4dfa8471a7eb005b46eaf06b083b134b46e331a2df1ae1cb4cb1775b383b120b3d8a9
de2ee6b005b4622465b11bb105b4f72de82c4fb162b40000b1b51bb1dbb362a8a4b51bb11cb4df287e2983b134b443acd6354fb11cb46228b62083b1dbb3102b
832c1bb1dbb362a49cb04fb14bb4df281a2d1bb1dbb3000051a883b105b417aea9b44fb11cb4cba37ea91bb105b4cb1f51341bb105b4cb1f33b11bb105b40000
7a2e1bb105b4cba3471e1bb11cb4cb1f47a21bb11cb4df24479e1bb11cb4d81db6281bb11cb4932a51a84fb105b4d8a1b6a01bb11cb4cb17b6241bb11cb4d2a2
10ab4fb11cb4cb9b7ea51bb11cb4cb237e291bb11cb44e271aad1bb11cb4d81d1f2c1bb105b4d825479a1bb11cb4df20479e4fb11cb46224471e1bb11cb45c25
fc311bb1dbb34ea710271bb11cb45526479ee6b01cb4a12800001bb11cb4102b47a61bb11cb4d825d9af4fb11cb48dab47a21bb11cb41d29d923e6b005b4242c
1fac1bb105b4d8a1472a1bb11cb4a12ce32d4fb105b4df207ea51bb11cb4a12847a283b11cb410ab10a71bb11cb44e27b628e6b034b4102fac2ae6b034b48d2f
c0b31bb11cb462a4e82c1bb105b4cb1bb1ade6b01cb4cb271a291bb105b4d81db6a01bb11cb4172a472ab7b105b4a1a81fac1bb11cb40000d92be6b01cb4d226
acae1bb11cb4cb2715ae1bb11cb4cb177e291bb11cb4cb2383ac1bb11cb4d8251a2d4fb11cb4cb17479e1bb11cb4d89d38341bb11cb41d29de321bb105b4d821
11b1deb111b205b111b1deb111b205b111b1deb1e0b105b145b1deb111b2d0b0ddb0deb1b0b105b111b1deb111b205b111b1deb141b205b111b110b2e0b105b1
11b1deb111b205b111b1deb1e0b13bb145b1deb141b205b1ddb010b2e0b105b145b1deb141b205b111b1deb141b205b111b1deb111b205b111b1deb111b205b1
45b1deb1b0b105b145b1deb111b205b111b1acb1b0b105b1acb1deb111b29ab011b17ab111b205b111b1acb1e0b105b1ddb0deb172b23bb111b1acb141b205b1
11b1deb1b0b105b145b110b241b205b145b17ab1b0b105b111b1acb141b23bb111b1acb1e0b105b1ddb010b211b205b111b1deb172b205b145b110b241b205b1
11b1deb111b205b145b1deb111b205b111b110b241b205b111b1deb172b205b111b1acb17fb105b111b1deb111b205b111b1deb1e0b105b111b1deb141b205b1
11b1deb141b23bb111b1deb111b205b111b1deb141b205b111b1acb1b0b105b111b1deb111b2d0b045b1deb172b205b111b1deb141b205b111b110b211b205b1
78b1deb141b2d0b011b1deb111b205b111b1acb141b205b111b110b2e0b13bb145b1deb141b205b111b1deb1e0b105b1ddb0acb111b205b111b110b211b205b1
11b110b241b205b111b1acb141b205b111b148b1e0b13bb111b1deb1e0b105b145b1deb1b0b1d0b045b110b241b205b1ddb0deb111b205b111b1deb141b23bb1
acb116b1eeb005b111b110b2e0b105b145b1a6b2e0b1d0b011b148b14fb105b111b1deb172b205b1ddb07ab1e0b105b145b1deb1b0b105b114aed3b3f6af70b1
6f3a7ab172b29ab011b1363ab0b105b145b17ab1053a05b1ddb0deb111b2a43a75b07ab1f6b370b1a9b0b2b07fb1a6b111b16fb3b0b1a6b1a9b042b241b270b1
45b1deb141b205b145b17ab103b305b111b110b28cb03bb1ddb042b272b23bb111b110b272b23bb111b110b24fb1d0b045b17ab1e0b1d0b011b148b172b205b1
11b110b241b205b145b1deb14fb105b111b1acb141b205b1ddb042b2b0b13bb1ddb042b2b0b170b111b1deb111b205b111b1deb1e0b1d0b045b110b272b205b1
45b110b211b2d0b011b1deb111b205b145b1deb111b205b111b1deb111b205b111b1acb111b205b111b1deb111b205b111b1deb111b205b111b1deb141b205b1
11b1deb1e0b105b111b1deb111b205b111b1deb1e0b105b111b1deb111b23bb111b110b2e0b105b145b1deb111b205b111b1acb111b205b145b1deb141b2d0b0
45b1deb141b2d0b011b1deb111b205b111b1deb111b23bb111b1deb111b205b1ddb0acb1e0b13bb1ddb010b2b0b105b145b1acb111b2d0b045b17ab172b205b1
45b1deb111b2d0b011b1acb111b23bb111b1acb141b2d0b011b1deb141b205b111b110b2b0b105b145b1deb111b205b178b1acb1b0b105b178b1deb1b0b105b1
11b110b241b23bb145b1acb141b2d0b011b1deb111b205b111b1deb111b205b145b1acb141b205b111b17ab141b2d0b011b1deb111b205b145b110b241b205b1
11b1acb111b205b111b110b2e0b13bb145b1deb141b205b111b1deb111b205b111b1acb141b205b111b1deb111b205b145b1acb1e0b1d0b045b1acb141b205b1
c62027aae9a623ac5d2288249c1804a5f423d4a52fa58424c624d42d7da743a85d9ac5ab2fa504adc6a488249c2006235da22ea1e9268429f423db28a0aa84ac
5d1a7a26082403a0000088ac000000005d1eb22ce5a806a3c62458ad08a4c6ab5d1e882c9c28039c29272027772c03205d1a8824000044295d9e36a8e9a20324
c62020277da7c52af4237a2a9c9803a829277aaae9a224ad143024357d27a4b02cadd4a9c22d4633912588a42f2db4305d1ab2b0e52c032cc624202b7d2bc52e
5d222eade5a84328c620db2ce9a284ac5d2a20a77d2b062b5d9afdade9a60425c32a2027312ec62b2c2905ad08a8c42829277aaa792905a62c29882ce9a243a8
c62027aa9c9804a9c6207a2a08a406abc6202e2956a686abf423c52b9ca45330c62c72ab9c9863ac912520272f2913305d9ad4a59ca486ab00002e19a02a262f
c6a02e19e9a605a600002e1d9ca400005d1e20279c2003a891295face5a823acc628202b2f250398f4a7362c08a404215d9e7aa2e91e032060287a2a56260324
5d1e8131c6ab051e5d1e36a8e91e8627c62020ab562684a5292788a852a8051ef423812de5a8c5a95d1ec527e99e0429c6a4c5abe92605a260a888289cac8425
91a5492f9c24051ec6202e199c2003a8c6a088b42dacc4285d22c59f0caa03a479302e992f29e5ad5d9e6c3108a40000c6a027aa0c2ac5a95d227aa29c9c0425
ab31ef33c6abf6b3602888a40eaf8429f42f203308b014b1c3aac59f0e2f86a79330202b8f330000c32a88b0923405aa91252ea179a9662f11b2f6b22133a42d
f62e7434562a0398f62eb13389b006a72db07a2a6430842c8eab49af9ca843a850364ab052a845aa2a325f2ce9a6039c5da672afc2a5b4305da26cb17da7c4ac
29a7272a7da78424f9ac7aa6a22fa4319131dbb068b206a7c6a8cd2a0aad55b291a57aa208ac442d5b2f362c9c280429f729dba8523094305da220a7493466af
8eab2e29e91e0328f42f20a754ad03a891a52e1de92a84a8c6a4b2ac7da7a5aec6287aa61db186abc6202e21e92284a4602888a8562686ab5d9a722f9ca00324
c624053179a9031c5d2200000000059ec620c5279c9c03a45d9ed4252f250328f42336ac9ca004a1c6202ea99c2405265d222ea19c1c0623f4a3d4290824039c
5da2c59f9c98039c5d1e272a2fa584a991292e999c2004295d1adba808a8039cf72d7aaa33ab04a55d1e81299c9803185da220a779298424c62081312f29c529
91a55032c22d06abc624d4a5082485a65d9e2ead58afe4acf7292ea92dac04a12927fdb1c6ab44a92c2d2e212fa503282927db280c2a0421c6242e99c22984a4
f4270b3356268627f42396b156aa86abc6202ea5c42e04a95d2200009c18031cf7290c2c522c64312c29202b08240627f62ec5a379ad06abc42ddbac2db003a0
c6a0272ac2a905a291250c2cc42e03a8f4237aa67daf05225d9e2e9d000005a2c6247aa65228039829270c2c8034143100002e25e922842500007a2633af0421
c624c51f000085265d22d4a9ebaf03a4c620db289c9844a9c6247a22c2a943a85d1a7a261d3105325d1e88a856a684a4f4277a2a2d2cc529c6a0db28e52805aa

//!TEXTURE W6
//!SIZE 400 1
//!FORMAT rgba16hf
//!FILTER NEAREST
//!BORDER CLAMP
a993bc93000000002f23bc930a9ecda1a99bd620e712721e0000000000000000a9130000e7122815b422c51ee79e72a26ea85a202d1917270000bc1700002895
ca1cbc1be712bc9fb422bc1be79ebc9ba91b00009c2128998225bc93e71a31a4a917bc93e712281500000000e792000000000000e79228150000bc9300002815
bf99bc17e71228154f205aa0000031a44fa0bc17b026721ea913000000000000bf990000e79228953a26cda1192431a4e7a78fa588242026a917bc132d9d0000
a9974123bfa0bc1f442598a4509caca8a923bc9f9c21cda1bf19bc9bd3a50000a917bc93e7122819a993bc93e7120000a91bbc17e7962899a99b00002d192815
bf9dbc93e7920000a997982450a0cda1a993bc13501c07280000bc13000028150000bc97e792000082a9c51e80299b2a31a887a650248324bf21cd992da117a3
a997cd9979a683a4b4a21425b0aad6a8a99fbca3b026bc23a913032788a4bca7a917cd1950a02899ca9c0000e71a2819a913bc9b2d192895a997bc17e716bc1b
0000cd992d1d0000a91341a3c41fbc23a91bcda179a6bc1b00000000e7122815a9930000e7120000ca1cc59ee79e2821a99b5aa80a22bc1fa99bcd1de7962899
a917bc97bfa0bc1bb49ebc23e71283a44fa44922f6a4281dbf19bc1788a40000a997bc17e7162899a993cd99e7922815a9130000e7122819a993bc13e7920000
0000cd99e7122819bf19c51e2d9d289dbf9dbc9b501cbc9f00000000000000000000000000000000a997bc130a1e2815b49e41a3bf20289da913bc13e7922895
a91300000000bc9ba91bcd192d9dbc1bbf1dcd9dbf202815a91fbc93502028150000bc9300002815a913000000000000a993bc13e79200000000bc9300000000
0000cd9900000000a99bcd9d19248320bfa11c2856a3bc27a9130000e7960000a913bc172d992895bf99d61c0000721e31a8982479a61727a913bc13e716bc1b
4fa4cd25509cbc274f24cd1d2d1d20a6bf21c5a20a9e729ebf1d5aa0e71628a1a997cd19e7922899a993bc93e71200000000bc932d192899a993bc97e7122899
0000c51e2d1d281dcaa8982456237b29b41e49a2f6a47226a913bc17509c00004fa0cd9d7922281db42acd9d9ca917abfca5bc170a227222a913bc97c41fbc1b
ca2870adb02a17a7dea9bc9b562b2829a9933229d3a57ba54fa0bc93f628729ea99bd69ce79672a2000000002d99bc1ba9a3bc1bbf202819a99fbc1f0a9e2895
bf9d98245024282512a849aa942ad628e8288f25b7a913adbf19d61cc49f83a0b41ed61ce792bc1f3a22792c65ad6aa712a8bc9b50245a28b49e32a9b0267b25
f8acb7a8182eff2c16ad0dacfc2da23077a6cd9d2d251723a99bbc9b50206a27f1a6bc17f62428210725bc23e792cda107295aa4c49f00004fa48f25509c289d
3128bc97e7962819a91f8fa5c49fbc9b2fa351a1db2c17a7a917bc170000bc9b0000bc1700002895ca208fa5c41f2899bf2198a88d2700002fa7cd190a9ebc1b
fca5cd199ca57b258d28bc936ca85129ca1cc5a219a40000bf9d51210a22d62412245aa0e79a281da993cd19e71abc1fa99fbc93509c289dbf19cd992d1d2819
a99fcd1de79a289944a1bc1fbfa4cda1a9a3bc1742a6d6240000bc13e7920000a9130000e7120000f1a61c2442a6281dbf2551a9192883a0ca1ccd992d1d2815
4f20bc93e71ebc9b44a15a24e712bc9ba99bcd192d19721ea91bbc2350a42895a9130000e7122899a997000000002815a993bc13000028150000bc93e7920000
bf99cda1e71a72a2bfa151a95020d6a4b4a2cd2150a47b25a99bbc97e7122819bf9d00002d1d2815f1a68f25e7168328a9a787262da50728bf1dbc972d992899
bfa57e2756a37b2944a58f2565a58328b49e5aa82da17ba9a91bbc93e71e28990000cd1de792721ebf19cd192d992815a917bc93e7922895a99fbc97e796bc9f
a91749262d192899b4aa4a2c1eab452c8229eca9e71249aa07a5bc1756230000a927bc939ca5bc1bb4a668aa8824bc1fa99f1c242da1832444a50b26bfa4cd25
bf29ddad572dffaca9975a2442a628959aafad2f8ead1e31ab28d6a0e79e31a882255aa8e716bc9ba997bc932d19bc9fe727d69ce792bc1fbf9d412749a91727
a91f9dab79aa7ba5772abc1be71e20a62f235a2435a81723fca58fa9bf241727a9133b2879a231a8a9a35a24e79e2026ca20d61c2d1972222a2ec5a2032bcdad
b4a2cd219ca53128a917bc93e716721e4f24d6a4c42328a5bf195125e79e31a410ab1b2e96ac7b2907294922efa9cda112a4cda1b729c5aa8d28c5aaf624cd25
4fa0bc931e272895b42641a7fb2749aa26a94926e79e7b25a9975aa0e712281da91700002d992815912dbeadd92e40abca28b7a8c42bcda1bfa5512580a92825
03ac14291eaba4297b2fcda9272c20ae4d2b22ab5d2ac5aaa9a3d69c0aa6bc9ba923c59e422617a3bf1949262d99bca74fa0bc179ca1cd21bf9dbc1be71217a3
44a1cd990a9e2895a9a351a1e792bc23a02998a40a2683a4a997bc97e7162819a993bc13e79228952fabbca30aa61727bf25bca3c4236aa73a22bc93c41f2899
122898a48d2728a5bfa1412356a7d6a4b41ecda1501ccda5ca9c49222da12821bf9dbc132d992815bf19d61c2d992899a917bc1300002819a91bbc932d19bc9b
bf19bc9be71228a1a91bcd990a2283a08d24bc9f56272899a9930000e71a289500000000e7120000a91fd6a00a22bc1fa9a31425e7a61723a997bc17e7122819
b41ed6a0e7160000a923c5a60a9e00004421bc9f192872a2a99b7ea79c21289da913cd19e7922819a993bc93000000000000bc1be7962819a993bc1be79abc1b
ca20cd2156a383284429982480a9312463a95125882451a90000bc97501c2895a917d61c0aa2bc9b44a11ca4b02628193aa2fa27f6a43124caa0bc932d9dbc1b
e8288726bfa47ba53aa6ae29d3a531a4442587aa19a431244fa04123509c28214fa0bc9f2d2572a60000bc97e7160000a99fbc9bbf20bc9b4fa0bc9bc4232895
ca20512142267ba5582ec52e65a913add9ac5fabfb27722ab4a2d6a09c250728b4a2d6a0bf202819bf213b2c03ab281dab283b280aa620a68da4cda5b0262815
9a2f872ea3ac5daea99b0ba60000729e8b2b492a1ea76aa7ca9c1ca850a0bc1b4fa049a265a5072844a1cd99e7922819b41ed6a02d19281db41e4922c49f28a1
a917c51e0a1e00003aa2d61c2d9d28192f23cd1919a82821a917d69c2d1d28150000bc9be7122815b42a0b26802983a84f28d61c2d99c5aaa99b5aa00aa2bc1b
e7a73229bfa8bc1bcaa8bca3bf2472a277a641279c21289d82255a24501c2899b41ebc930a1e0000a993bc9be712bc9bbf19cd1de79a2815a99bbc932d9d281d
bf19bc17e7922895ca1c51217922cd21bf21bc139c21289da993bc13e7922815a993bc9300002815a99bcd25dba82899fc2551a51e27bca7a997bc97e7160000
a997cd995623832044a149a22da13124a993bc97e71a28212fa7c51ec49f2825a913bc17e7962815a993bc97e7962815a9930000e7962815a913bc97e71a2895
a917bc13e7960000b49e51a150240000a997bc9ff62428190000bc13e7922815a9930000000000004fa0bc93bf20721e4421412765a92815a9970000e7122819
bf9dcd190a1ebc1b44a1cd21e7962895a993bc93e71a8320ca1cbc9b5024bc9ba993bc9300000000a9130000000000000000bc93e7120000a993bc93e7120000
4fa0bc13501cbc1b8da4cda150a028194425bc9fe79ebca3a91b0000e7920000a993bc93e7122895bf190000e712bc9fa91b03270aaa28a1a917bc93e7962899
b49ed6a0501c281d2f27bc13f6a42815ca1c0000192817a34fa01ca465253124a91f0000e79a28950000000000002895bf19bc13e7960000bf19cd19e7960000
bf9dc59e2d19289907a9c5aa6c28bc9f77261c242d9d31a4ca1cc51e509c2895a917bc13e712281912a85aa0bfa483248d241425b0a607a84421bc1fe792bc9b
e8a85aa8e7120000a9277e270aa617a7a91387a6509cbca3a917bc93bf2083240000cd1de79a2819a913bc13e7120000a9170000e7920000a99bbc13e7122899
bf1900002d992815b49e51a19c21cd21caa01c240aa23124a913bc17e712bc9ba9130000e71600002fa7cda5c41f2895fc25cd21e7a220a6bf99bc132d992815
bf1d41a32d21bc1f12a4bc1b502031242fa3cd1d88a43124fca5c59ee71e0000bf99bc932d192895a993bc93e7922815a997000000002895a917bc93e7122815
a913bc132d990000bfa1d61c56a33124a993d61c0000281da99300000000000000000000e7922815ca20d6a0c423721e4421bc9be71ad6a400000000e7160000
0000bc1be7922819bf19bc132d192899bf1d5a20509c28150000bc9b509c28950000000000000000000000000000000000000000e71200000000bc1300000000
