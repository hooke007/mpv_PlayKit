// 文档参考 https://github.com/hooke007/mpv_PlayKit/wiki/4_GLSL


//!PARAM SIGMA
//!TYPE float
//!MINIMUM 0.0
//!MAXIMUM 0.5
0.03

//!PARAM STR
//!TYPE float
//!MINIMUM 0.0
//!MAXIMUM 1.0
1.0

//!PARAM HARD_T
//!TYPE float
//!MINIMUM 0.0
//!MAXIMUM 5.0
2.9

//!PARAM WIENER_N
//!TYPE float
//!MINIMUM 0.1
//!MAXIMUM 3.0
1.3

//!PARAM RAD
//!TYPE int
//!MINIMUM 1
//!MAXIMUM 5
3

//!PARAM P
//!TYPE DEFINE
//!MINIMUM 3
//!MAXIMUM 7
5

//!PARAM K
//!TYPE DEFINE
//!MINIMUM 4
//!MAXIMUM 16
16

//!PARAM WIEN
//!TYPE DEFINE
//!MINIMUM 0
//!MAXIMUM 1
1


//!HOOK LUMA
//!BIND HOOKED
//!SAVE NLCF_L_BASIC
//!WHEN STR
//!DESC [knl_pro_luma_RT] block-matching + collaborative hard-threshold

#define MAXK 16
#define HP (P / 2)
#define PD (2 * HP + 1)
#define P_AREA (PD * PD)
#define WHT_NORM (1.0 / sqrt(float(K)))

void wht(inout float a[MAXK]) {
	for (int len = 1; len < K; len <<= 1)
		for (int i = 0; i < K; i += (len << 1))
			for (int j = 0; j < len; j++) {
				float u = a[i + j];
				float w = a[i + j + len];
				a[i + j]       = u + w;
				a[i + j + len] = u - w;
			}
	for (int n = 0; n < K; n++)
		a[n] *= WHT_NORM;
}

vec4 hook() {
	vec4 poi = HOOKED_texOff(0);
	float ref = poi.x;

	float ref_patch[P_AREA];
	int pc = 0;
	for (int py = -HP; py <= HP; py++)
		for (int px = -HP; px <= HP; px++)
			ref_patch[pc++] = HOOKED_texOff(vec2(px, py)).x;

	float dist[MAXK];
	float grp[MAXK];
	for (int k = 0; k < K; k++) { dist[k] = 1e20; grp[k] = ref; }

	for (int ry = -RAD; ry <= RAD; ry++)
		for (int rx = -RAD; rx <= RAD; rx++) {
			float d = 0.0;
			int i = 0;
			for (int py = -HP; py <= HP; py++)
				for (int px = -HP; px <= HP; px++) {
					float df = HOOKED_texOff(vec2(rx + px, ry + py)).x - ref_patch[i++];
					d += df * df;
				}

			if (d < dist[K - 1]) {
				dist[K - 1] = d;
				grp[K - 1]  = HOOKED_texOff(vec2(rx, ry)).x;
				for (int k = K - 1; k > 0; k--) {
					if (dist[k] < dist[k - 1]) {
						float td = dist[k]; dist[k] = dist[k - 1]; dist[k - 1] = td;
						float tv = grp[k];  grp[k]  = grp[k - 1];  grp[k - 1]  = tv;
					} else break;
				}
			}
		}

	wht(grp);
	float tau = HARD_T * SIGMA;
	for (int k = 1; k < K; k++)
		grp[k] *= step(tau, abs(grp[k]));
	wht(grp);

	poi.x = grp[0];
	return poi;
}


//!HOOK LUMA
//!BIND HOOKED
//!BIND NLCF_L_BASIC
//!WHEN STR
//!DESC [knl_pro_luma_RT] re-match on basic estimate + collaborative Wiener

#define MAXK 16
#define HP (P / 2)
#define PD (2 * HP + 1)
#define P_AREA (PD * PD)
#define WHT_NORM (1.0 / sqrt(float(K)))
#define EPSILON 1e-12

void wht(inout float a[MAXK]) {
	for (int len = 1; len < K; len <<= 1)
		for (int i = 0; i < K; i += (len << 1))
			for (int j = 0; j < len; j++) {
				float u = a[i + j];
				float w = a[i + j + len];
				a[i + j]       = u + w;
				a[i + j + len] = u - w;
			}
	for (int n = 0; n < K; n++)
		a[n] *= WHT_NORM;
}

vec4 hook() {
	vec4 poi = HOOKED_texOff(0);
	float nref = poi.x;

#if WIEN
	float bref = NLCF_L_BASIC_texOff(0).x;

	float bpatch[P_AREA];
	int pc = 0;
	for (int py = -HP; py <= HP; py++)
		for (int px = -HP; px <= HP; px++)
			bpatch[pc++] = NLCF_L_BASIC_texOff(vec2(px, py)).x;

	float dist[MAXK];
	float gb[MAXK];
	float gn[MAXK];
	for (int k = 0; k < K; k++) { dist[k] = 1e20; gb[k] = bref; gn[k] = nref; }

	for (int ry = -RAD; ry <= RAD; ry++)
		for (int rx = -RAD; rx <= RAD; rx++) {
			float d = 0.0;
			int i = 0;
			for (int py = -HP; py <= HP; py++)
				for (int px = -HP; px <= HP; px++) {
					float df = NLCF_L_BASIC_texOff(vec2(rx + px, ry + py)).x - bpatch[i++];
					d += df * df;
				}

			if (d < dist[K - 1]) {
				dist[K - 1] = d;
				gb[K - 1]   = NLCF_L_BASIC_texOff(vec2(rx, ry)).x;
				gn[K - 1]   = HOOKED_texOff(vec2(rx, ry)).x;
				for (int k = K - 1; k > 0; k--) {
					if (dist[k] < dist[k - 1]) {
						float td = dist[k]; dist[k] = dist[k - 1]; dist[k - 1] = td;
						float ob = gb[k];   gb[k]   = gb[k - 1];   gb[k - 1]   = ob;
						float on = gn[k];   gn[k]   = gn[k - 1];   gn[k - 1]   = on;
					} else break;
				}
			}
		}

	float lo = gn[0], hi = gn[0];
	for (int k = 1; k < K; k++) { lo = min(lo, gn[k]); hi = max(hi, gn[k]); }

	wht(gb);
	wht(gn);
	float s2 = SIGMA * WIENER_N; s2 *= s2;
	for (int k = 0; k < K; k++) {
		float cb2 = gb[k] * gb[k];
		gn[k] *= cb2 / (cb2 + s2 + EPSILON);
	}
	wht(gn);

	float res = clamp(gn[0], lo, hi);
#else
	float res = NLCF_L_BASIC_texOff(0).x;
#endif

	poi.x = mix(nref, res, STR);
	return poi;
}

