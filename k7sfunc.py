### 文档： https://github.com/hooke007/MPV_lazy/wiki/3_K7sfunc

__version__ = "0.0.7"

__all__ = [
	"FMT_CTRL", "FPS_CHANGE", "FPS_CTRL", 

	"ACNET_STD", "CUGAN_NV", "ESRGAN_NV", "NNEDI3_STD", "WAIFU_NV",

	"MVT_LQ", "MVT_STD", "MVT_POT", "RIFE_STD", "RIFE_NV", "SVP_LQ", "SVP_STD", "SVP_HQ",

	"BM3D_NV", "CCD_STD", "FFT3D_STD", "NLM_STD", "NLM_NV",

	"AA_NV", "DEBAND_STD", "DEINT_STD", "IVTC_STD", "STAB_STD", "STAB_HQ",
]

import typing
import math

import vapoursynth as vs
from vapoursynth import core

from nnedi3_resample import nnedi3_resample
from vsmlrt import CUGAN, RealESRGANv2, Waifu2x, RIFE, BackendV2

##################################################
##################################################

def FMT_CTRL(
	input : vs.VideoNode,
	h_max : typing.Optional[int] = None,
	h_ret : bool = False,
	fmt_pix : typing.Optional[str] = None,
) -> vs.VideoNode :

	fmt_in = input.format.id
	if fmt_pix :
		fmt_out = fmt_pix
		if fmt_out == fmt_in :
			clip = input
		else :
			clip = core.resize.Bilinear(clip=input, format=fmt_out)
	else :
		# https://github.com/mpv-player/mpv/blob/master/video/filter/vf_vapoursynth.c
		fmt_mpv = [
			vs.YUV420P8, vs.YUV420P10,
			vs.YUV422P8, vs.YUV422P10,
			vs.YUV410P8, vs.YUV411P8, vs.YUV440P8, vs.YUV444P8, vs.YUV444P10,
		]
		if fmt_in not in fmt_mpv :
			fmt_out = vs.YUV420P10
			clip = core.resize.Bilinear(clip=input, format=fmt_out)
		else :
			fmt_out = fmt_in
			clip = input

	if h_max :
		w_in = input.width
		h_in = input.height
		if h_in > h_max :
			if h_ret :
				raise Exception("源高度超过限制的范围，已临时中止。")
			else :
				fmt_src = input.format
				w_ds = w_in * (h_max / h_in)
				h_ds = h_max
				if fmt_src.subsampling_w or fmt_src.subsampling_h :
					if not (w_ds % 2 == 0) :
						w_ds = math.floor(w_ds / 2) * 2
					if not (h_ds % 2 == 0) :
						h_ds = math.floor(h_ds / 2) * 2

	if not h_max and not fmt_pix :
		output = clip
	elif h_max and not fmt_pix :
		if h_max >= h_in :
			output = clip
		else :
			output = core.resize.Lanczos(clip=clip, width=w_ds, height=h_ds)
	elif not h_max and fmt_pix :
		if fmt_pix == fmt_out :
			output = clip
		else :
			output = core.resize.Bilinear(clip=clip, format=fmt_pix)
	else :
		if h_max >= h_in :
			if fmt_pix == fmt_out :
				output = clip
			else :
				output = core.resize.Bilinear(clip=clip, format=fmt_pix)
		else :
			if fmt_pix == fmt_out :
				output = core.resize.Lanczos(clip=clip, width=w_ds, height=h_ds)
			else :
				output = core.resize.Lanczos(clip=clip, width=w_ds, height=h_ds, format=fmt_pix)

	return output

##################################################
## MOD HAvsFunc (7f0a9a7a37b60a05b9f408024d203e511e544a61)
##################################################

def FPS_CHANGE(
	input : vs.VideoNode,
	fps_in : float = 24.0,
	fps_out : float = 60.0,
) -> vs.VideoNode :

	def ChangeFPS(clip: vs.VideoNode, fpsnum: int, fpsden: int = 1) -> vs.VideoNode:

		factor = (fpsnum / fpsden) * (1000 / (fps_in * 1000))

		def frame_adjuster(n: int) -> vs.VideoNode:

			real_n = math.floor(n / factor)
			one_frame_clip = clip[real_n] * (len(clip) + 100)

			return one_frame_clip

		attribute_clip = clip.std.BlankClip(length=math.floor(len(clip) * factor), fpsnum=fpsnum, fpsden=fpsden)

		return attribute_clip.std.FrameEval(eval=frame_adjuster)

	fin = ChangeFPS(clip=input, fpsnum=fps_out * 1000, fpsden=1000)
	output = core.std.AssumeFPS(clip=fin, fpsnum=fps_out * 1000, fpsden=1000)

	return output

##################################################
##################################################

def FPS_CTRL(
	input : vs.VideoNode,
	fps_in : float = 23.976,
	fps_max : float = 32.0,
	fps_out : typing.Optional[str] = None,
	fps_ret : bool = False,
) -> vs.VideoNode :

	if fps_in > fps_max :
		if fps_ret :
			raise Exception("源帧率超过限制的范围，已临时中止。")
		else :
			output = FPS_CHANGE(input=input, fps_in=fps_in, fps_out=fps_out if fps_out else fps_max)
	else :
		output = input

	return output

##################################################
##################################################

def ACNET_STD(
	input : vs.VideoNode,
	nr : typing.Literal[0, 1] = 1,
	nr_lv : typing.Literal[1, 2, 3] = 1,
	gpu : typing.Literal[0, 1, 2] = 0,
	gpu_m : typing.Literal["opencl", "cuda"] = "opencl",
) -> vs.VideoNode :

	fmt_in = input.format.id

	cut0 = core.resize.Bilinear(clip=input, format=vs.YUV444P16)
	cut1 = core.anime4kcpp.Anime4KCPP(src=cut0, zoomFactor=2, ACNet=1, GPUMode=1, GPGPUModel=gpu_m, HDN=nr, HDNLevel=nr_lv, platformID=gpu, deviceID=gpu)
	output = core.resize.Bilinear(clip=cut1, format=fmt_in)

	return output

##################################################
##################################################

def CUGAN_NV(
	input : vs.VideoNode,
	lt_hd : bool = False,
	nr_lv : typing.Literal[-1, 0, 3] = -1,
	gpu : typing.Literal[0, 1, 2] = 0,
	gpu_t : typing.Literal[1, 2, 3] = 2,
	st_eng : bool = False,
	ws_size : int = 0,
) -> vs.VideoNode :

	w_in, h_in = input.width, input.height
	size_in = w_in * h_in
	colorlv = input.get_frame(0).props._ColorRange
	fmt_in = input.format.id

	if (not lt_hd and (size_in > 1280 * 720)) or (size_in > 2048 * 1080) :
		raise Exception("源分辨率超过限制的范围，已临时中止。")
	if not st_eng and (((w_in > 2048) or (h_in > 1080)) or ((w_in < 64) or (h_in < 64))) :
		raise Exception("源分辨率不属于动态引擎支持的范围，已临时中止。")

	cut1 = input.resize.Bilinear(format=vs.RGBH, matrix_in_s="709")
	cut2 = CUGAN(clip=cut1, noise=nr_lv, scale=2, version=2, backend=BackendV2.TRT(
		num_streams=gpu_t, force_fp16=True, output_format=1,
		workspace=None if ws_size < 128 else (ws_size if st_eng else ws_size * 2),
		use_cuda_graph=True, use_cublas=False, use_cudnn=False,
		static_shape=st_eng, min_shapes=[0, 0] if st_eng else [64, 64],
		opt_shapes=None if st_eng else ([1920, 1080] if lt_hd else [1280, 720]), max_shapes=None if st_eng else ([2048, 1080] if lt_hd else [1280, 720]),
		device_id=gpu))
	output = core.resize.Bilinear(clip=cut2, format=fmt_in, matrix_s="709", range=1 if colorlv==0 else None)

	return output

##################################################
##################################################

def ESRGAN_NV(
	input : vs.VideoNode,
	lt_hd : bool = False,
	scale : typing.Literal[1, 2] = 2,
	gpu : typing.Literal[0, 1, 2] = 0,
	gpu_t : typing.Literal[1, 2, 3] = 2,
	st_eng : bool = False,
	ws_size : int = 0,
) -> vs.VideoNode :

	w_in, h_in = input.width, input.height
	size_in = w_in * h_in
	colorlv = input.get_frame(0).props._ColorRange
	fmt_in = input.format.id

	if (not lt_hd and (size_in > 1280 * 720)) or (size_in > 2048 * 1080) :
		raise Exception("源分辨率超过限制的范围，已临时中止。")
	if not st_eng and (((w_in > 2048) or (h_in > 1080)) or ((w_in < 64) or (h_in < 64))) :
		raise Exception("源分辨率不属于动态引擎支持的范围，已临时中止。")

	cut1 = input.resize.Bilinear(format=vs.RGBH, matrix_in_s="709")
	cut2 = RealESRGANv2(clip=cut1, scale=scale, model=2, backend=BackendV2.TRT(
		num_streams=gpu_t, force_fp16=True, output_format=1,
		workspace=None if ws_size < 128 else (ws_size if st_eng else ws_size * 2),
		use_cuda_graph=True, use_cublas=False, use_cudnn=False,
		static_shape=st_eng, min_shapes=[0, 0] if st_eng else [64, 64],
		opt_shapes=None if st_eng else ([1920, 1080] if lt_hd else [1280, 720]), max_shapes=None if st_eng else ([2048, 1080] if lt_hd else [1280, 720]),
		device_id=gpu))
	output = core.resize.Bilinear(clip=cut2, format=fmt_in, matrix_s="709", range=1 if colorlv==0 else None)

	return output

##################################################
##################################################

def NNEDI3_STD(
	input : vs.VideoNode,
	edi_nsize : typing.Literal[0, 4] = 4,
	edi_nns : typing.Literal[2, 3, 4] = 3,
	cpu : bool = True,
	gpu : typing.Literal[-1, 0, 1, 2] = -1,
) -> vs.VideoNode :

	output = nnedi3_resample(input=input, target_width=input.width * 2, target_height=input.height * 2,
		nsize=edi_nsize, nns=edi_nns, mode="znedi3" if cpu else "nnedi3cl", device=gpu)

	return output

##################################################
##################################################

def WAIFU_NV(
	input : vs.VideoNode,
	lt_hd : bool = False,
	nr_lv : typing.Literal[-1, 0, 1, 2, 3] = 1,
	scale : typing.Literal[1, 2, 3, 4] = 1,
	gpu : typing.Literal[0, 1, 2] = 0,
	gpu_t : typing.Literal[1, 2, 3] = 2,
	st_eng : bool = False,
	ws_size : int = 0,
) -> vs.VideoNode :

	w_in, h_in = input.width, input.height
	size_in = w_in * h_in
	colorlv = input.get_frame(0).props._ColorRange
	fmt_in = input.format.id

	if (not lt_hd and (size_in > 1280 * 720)) or (size_in > 2048 * 1080) :
		raise Exception("源分辨率超过限制的范围，已临时中止。")
	if not st_eng and (((w_in > 2048) or (h_in > 1080)) or ((w_in < 64) or (h_in < 64))) :
		raise Exception("源分辨率不属于动态引擎支持的范围，已临时中止。")

	cut1 = input.resize.Bilinear(format=vs.RGBH, matrix_in_s="709")
	cut2 = Waifu2x(clip=cut1, noise=nr_lv, scale=scale, model=3, backend=BackendV2.TRT(
		num_streams=gpu_t, force_fp16=True, output_format=1,
		workspace=None if ws_size < 128 else (ws_size if st_eng else ws_size * 2),
		use_cuda_graph=True, use_cublas=False, use_cudnn=False,
		static_shape=st_eng, min_shapes=[0, 0] if st_eng else [64, 64],
		opt_shapes=None if st_eng else ([1920, 1080] if lt_hd else [1280, 720]), max_shapes=None if st_eng else ([2048, 1080] if lt_hd else [1280, 720]),
		device_id=gpu))
	output = core.resize.Bilinear(clip=cut2, format=fmt_in, matrix_s="709", range=1 if colorlv==0 else None)

	return output

##################################################
##################################################

def MVT_LQ(
	input : vs.VideoNode,
	fps_in : float = 23.976,
	fps_out : float = 59.940,
	recal : bool = True,
	block : bool = True,
) -> vs.VideoNode :

	w_in, h_in = input.width, input.height
	blk_size = 32
	w_tmp = math.ceil(w_in / blk_size) * blk_size - w_in
	h_tmp = math.ceil(h_in / blk_size) * blk_size - h_in

	cut0 = core.std.AddBorders(clip=input, right=w_tmp, bottom=h_tmp)
	cut1 = core.std.AssumeFPS(clip=cut0, fpsnum=int(fps_in * 1000), fpsden=1000)
	cut_s = core.mv.Super(clip=cut1, pel=1, sharp=0)
	cut_b = core.mv.Analyse(super=cut_s, blksize=blk_size, search=2, isb=True)
	cut_f = core.mv.Analyse(super=cut_s, blksize=blk_size, search=2)

	if recal :
		cut_b = core.mv.Recalculate(super=cut_s, vectors=cut_b, thsad=200, blksize=blk_size / 2, search=2, searchparam=1)
		cut_f = core.mv.Recalculate(super=cut_s, vectors=cut_f, thsad=200, blksize=blk_size / 2, search=2, searchparam=1)
	else :
		cut_b, cut_f = cut_b, cut_f

	if block :
		fin = core.mv.BlockFPS(clip=cut1, super=cut_s, mvbw=cut_b, mvfw=cut_f, num=fps_out * 1000, den=1000)
	else :
		fin = core.mv.FlowFPS(clip=cut1, super=cut_s, mvbw=cut_b, mvfw=cut_f, num=fps_out * 1000, den=1000, mask=1)
	output = core.std.Crop(clip=fin, right=w_tmp, bottom=h_tmp)

	return output

##################################################
## MOD https://gist.github.com/KCCat/1b3a7b7f085a066af3719859f88ded02
##################################################

def MVT_STD(
	input : vs.VideoNode,
	fps_in : float = 23.976,
	fps_out : float = 60.0,
) -> vs.VideoNode :

	vs_api = vs.__api_version__.api_major

	def ffps(fps) :
		rfps = int('%.0f' % fps)
		if ( abs(fps - (rfps/1.001)) < abs(fps - (rfps/1.000)) ) :
			vfps, vden = rfps*1000, 1001
		else :
			vfps, vden = rfps*1000, 1000
		return vfps, vden

	vfps, vden = ffps(fps_in)
	cut1 = core.std.AssumeFPS(input, fpsnum=int(vfps), fpsden=vden)
	cut_s = core.mv.Super(clip=cut1, sharp=1, rfilter=4)

	if vs_api >=4 :
		cut_b = core.mv.Analyse(super=cut_s, blksize=64, searchparam=0, pelsearch=3, isb=True, lambda_=0, lsad=10000, overlapv=16, badrange=0, search_coarse=4)
		cut_f = core.mv.Analyse(super=cut_s, blksize=64, searchparam=0, pelsearch=3, lambda_=0, lsad=10000, overlapv=16, badrange=0, search_coarse=4)
	else :
		cut_b = core.mv.Analyse(super=cut_s, blksize=64, searchparam=0, pelsearch=3, isb=True, _lambda=0, lsad=10000, overlapv=16, badrange=0, search_coarse=4)
		cut_f = core.mv.Analyse(super=cut_s, blksize=64, searchparam=0, pelsearch=3, _lambda=0, lsad=10000, overlapv=16, badrange=0, search_coarse=4)
	output = core.mv.BlockFPS(clip=cut1, super=cut_s, mvbw=cut_b, mvfw=cut_f, num=fps_out * 1000, den=vden, mode=2, thscd1=970, thscd2=255, blend=False)

	return output

##################################################
##################################################

def MVT_POT(
	input : vs.VideoNode,
	fps_in : float = 23.976,
	fps_out : float = 59.940,
) -> vs.VideoNode :

	max_flow_width  = 1280
	max_flow_height = 720
	th_block_diff = 8*8*7
	th_flow_diff  = 8*8*7
	th_block_changed = 14
	th_flow_changed  = 14
	blocksize  = 2**4
	target_num = int(fps_out * 1e6)
	target_den = int(1e6)
	source_num = int(fps_in * 1e6)
	source_den = int(1e6)

	clip = core.std.AssumeFPS(input, fpsnum=source_num, fpsden=source_den)
	sup  = core.mv.Super(clip, pel=2, hpad=blocksize, vpad=blocksize)
	bv   = core.mv.Analyse(sup, blksize=blocksize, isb=True , chroma=True, search=3, searchparam=2)
	fv   = core.mv.Analyse(sup, blksize=blocksize, isb=False, chroma=True, search=3, searchparam=2)
	use_block = clip.width > max_flow_width or clip.height > max_flow_height

	if use_block :
		output = core.mv.BlockFPS(clip, sup, bv, fv, num=target_num, den=target_den, mode=3, thscd1=th_block_diff, thscd2=th_block_changed)
	else :
		output = core.mv.FlowFPS(clip, sup, bv, fv, num=target_num, den=target_den, mask=0, thscd1=th_flow_diff, thscd2=th_flow_changed)

	return output

##################################################
##################################################

def RIFE_STD(
	input : vs.VideoNode,
	sc_mode : typing.Literal[0, 1, 2] = 1,
	stat_th : float = 60.0,
	fps_num : int = 2,
	fps_den : int = 1,
	gpu : typing.Literal[0, 1, 2] = 0,
	gpu_t : typing.Literal[1, 2, 3] = 2,
) -> vs.VideoNode :

	fmt_in = input.format.id
	colorlv = input.get_frame(0).props._ColorRange

	if sc_mode == 0 :
		cut0 = input
	elif sc_mode == 1 :
		cut0 = core.misc.SCDetect(clip=input, threshold=0.15)
	elif sc_mode == 2 :
		sup = core.mv.Super(clip=input, pel=1)
		vec = core.mv.Analyse(super=sup, isb=True)
		cut0 = core.mv.SCDetection(clip=input, vectors=vec, thscd1=240, thscd2=130)

	cut1 = core.resize.Bilinear(clip=cut0, format=vs.RGBS, matrix_in_s="709")
	cut2 = core.rife.RIFE(clip=cut1, model=9, factor_num=fps_num, factor_den=fps_den, gpu_id=gpu, gpu_thread=gpu_t, sc=True if sc_mode else False, skip=True, skip_threshold=stat_th)
	output = core.resize.Bilinear(clip=cut2, format=fmt_in, matrix_s="709", range=1 if colorlv==0 else None)

	return output

##################################################
##################################################

def RIFE_NV(
	input : vs.VideoNode,
	lt_d2k : bool = False,
	sc_mode : typing.Literal[0, 1, 2] = 1,
	fps_num : typing.Literal[2, 3, 4] = 2,
	t_tta : bool = False,
	ext_proc : bool = True,
	gpu : typing.Literal[0, 1, 2] = 0,
	gpu_t : typing.Literal[1, 2, 3] = 2,
	st_eng : bool = False,
	ws_size : int = 0,
) -> vs.VideoNode :

	w_in, h_in = input.width, input.height
	size_in = w_in * h_in
	colorlv = input.get_frame(0).props._ColorRange
	fmt_in = input.format.id

	if not ext_proc :
		st_eng = True
	if (not lt_d2k and (size_in > 2048 * 1088)) or (size_in  > 4096 * 2176) :
		raise Exception("源分辨率超过限制的范围，已临时中止。")
	if not st_eng and (((w_in > 4096) or (h_in > 2176)) or ((w_in < 289) or (h_in < 225))) :
		raise Exception("源分辨率不属于动态引擎支持的范围，已临时中止。")

	scale_model = 1
	if lt_d2k and st_eng and (size_in > 2048 * 1088) :
		scale_model = 0.5
		if not ext_proc :
			scale_model = 1

	tile_size = 32 / scale_model
	w_tmp = math.ceil(w_in / tile_size) * tile_size - w_in
	h_tmp = math.ceil(h_in / tile_size) * tile_size - h_in

	if sc_mode == 0 :
		cut0 = input
	elif sc_mode == 1 :
		cut0 = core.misc.SCDetect(clip=input, threshold=0.15)
	elif sc_mode == 2 :
		sup = core.mv.Super(clip=input, pel=1)
		vec = core.mv.Analyse(super=sup, isb=True)
		cut0 = core.mv.SCDetection(clip=input, vectors=vec, thscd1=240, thscd2=130)

	cut1 = core.resize.Bilinear(clip=cut0, format=vs.RGBH if ext_proc else vs.RGBS, matrix_in_s="709")
	if ext_proc :
		cut1 = core.std.AddBorders(clip=cut1, right=w_tmp, bottom=h_tmp)
		fin = RIFE(clip=cut1, multi=fps_num, scale=scale_model, model=46, ensemble=t_tta, _implementation=1, backend=BackendV2.TRT(
			num_streams=gpu_t, force_fp16=True, output_format=1,
			workspace=None if ws_size < 128 else (ws_size if st_eng else ws_size * 2),
			use_cuda_graph=True, use_cublas=False, use_cudnn=False,
			static_shape=st_eng, min_shapes=[0, 0] if st_eng else [320, 256],
			opt_shapes=None if st_eng else [1920, 1088], max_shapes=None if st_eng else ([4096, 2176] if lt_d2k else [2048, 1088]),
			device_id=gpu))
		fin = core.std.Crop(clip=fin, right=w_tmp, bottom=h_tmp)
	else :
		fin = RIFE(clip=cut1, multi=fps_num, scale=scale_model, model=46, ensemble=t_tta, _implementation=2, backend=BackendV2.TRT(
			num_streams=gpu_t, force_fp16=False, output_format=0,
			workspace=None if ws_size < 128 else ws_size,
			use_cuda_graph=True, use_cublas=False, use_cudnn=False,
			static_shape=st_eng, min_shapes=[0, 0],
			opt_shapes=None, max_shapes=None,
			device_id=gpu))
	output = core.resize.Bilinear(clip=fin, format=fmt_in, matrix_s="709", range=1 if colorlv==0 else None)

	return output

##################################################
##################################################

def SVP_LQ(
	input : vs.VideoNode,
	fps_in : float = 23.976,
	fps_num : typing.Literal[2, 3, 4] = 2,
	cpu : typing.Literal[0, 1] = 0,
	gpu : typing.Literal[0, 11, 12, 21] = 0,
) -> vs.VideoNode :

	fps_num = fps_num
	if cpu == 0 :
		cpu = 1
	else :
		cpu = 0
	gpu = gpu

	smoothfps_params = "{rate:{num:%d,den:1,abs:false},algo:21,gpuid:%d,mask:{area:100},scene:{mode:0,limits:{m1:1800,m2:3600,scene:5200,zero:100,blocks:45}}}" % (fps_num, gpu)
	super_params = "{pel:2,gpu:%d,scale:{up:2,down:4}}" % (cpu)
	analyse_params = "{block:{w:32,h:16,overlap:2},main:{levels:4,search:{type:4,distance:-8,coarse:{type:2,distance:-5,bad:{range:0}}},penalty:{lambda:10.0,plevel:1.5,pzero:110,pnbour:65}},refine:[{thsad:200,search:{type:4,distance:2}}]}"

	clip = input
	if clip.format.id == vs.YUV420P8 :
		clip8 = clip
	elif clip.format.id == vs.YUV420P10 :
		clip8 = clip.resize.Bilinear(format=vs.YUV420P8)
	else :
		clip = clip.resize.Bilinear(format=vs.YUV420P10, dither_type="random")
		clip8 = clip.resize.Bilinear(format=vs.YUV420P8)

	svps = core.svp1.Super(clip8, super_params)
	svpv = core.svp1.Analyse(svps["clip"], svps["data"], clip, analyse_params)
	output = core.svp2.SmoothFps(clip, svps["clip"], svps["data"], svpv["clip"], svpv["data"], smoothfps_params, src=clip, fps=fps_in)

	return output

##################################################
##################################################

def SVP_STD(
	input : vs.VideoNode,
	fps_in : float = 23.976,
	fps_out : float = 59.940,
	cpu : typing.Literal[0, 1] = 0,
	gpu : typing.Literal[0, 11, 12, 21] = 0,
) -> vs.VideoNode :

	fps_in = fps_in
	fps_out = fps_out * 1e6
	if cpu == 0 :
		cpu = 1
	else :
		cpu = 0
	gpu = gpu

	smoothfps_params = "{rate:{num:%f,den:1000000,abs:true},algo:21,gpuid:%d,mask:{area:100},scene:{limits:{m1:1800,m2:3600,scene:5200,zero:100,blocks:45}}}" % (fps_out, gpu)
	super_params = "{pel:2,gpu:%d,scale:{up:2,down:4}}" % (cpu)
	analyse_params = "{block:{w:32,h:32,overlap:2},main:{levels:4,search:{type:4,distance:-8,coarse:{type:4,distance:-5,bad:{range:0}}},penalty:{plevel:1.3,pzero:110,pnbour:75}},refine:[{thsad:200,search:{type:4,distance:2}}]}"

	clip_f = core.resize.Bilinear(clip=input, format=vs.YUV420P8)
	super = core.svp1.Super(clip_f, super_params)
	vectors = core.svp1.Analyse(super["clip"], super["data"], clip_f, analyse_params)
	smooth = core.svp2.SmoothFps(input, super["clip"], super["data"], vectors["clip"], vectors["data"], smoothfps_params, src=clip_f, fps=fps_in)
	output = core.std.AssumeFPS(smooth, fpsnum=smooth.fps_num, fpsden=smooth.fps_den)

	return output

##################################################
## PORT @Starlight
##################################################

def SVP_HQ(
	input : vs.VideoNode,
	fps_in : float = 23.976,
	fps_dp : float = 59.940,
	cpu : typing.Literal[0, 1] = 0,
	gpu : typing.Literal[0, 11, 12, 21] = 0,
) -> vs.VideoNode :

	fps = fps_in or 23.976
	freq = fps_dp or 59.970
	w, h = input.width, input.height

	if (freq - fps < 2):
		raise Exception("Interpolation is not necessary.")

	target_fps = 60

	sp, ap, fp = """{
			gpu: 1
		}""", """{
			block: { w: 32, h: 16, overlap: 2 },
			main: {
				levels: 5,
				search: {
					type: 4, distance: -12,
					coarse: { type: 4, distance: -1, trymany: true, bad: { range: 0 } }
				},
				penalty: { lambda: 3.33, plevel: 1.33, lsad: 3300, pzero: 110, pnbour: 50 }
			},
			refine: [{ thsad: 400 }, { thsad: 200, search: { type: 4, distance: -4 } }]
		}""", """{
			gpuid: 0,
			algo: 23, rate: { num: %d, den: %d, abs: true },
			mask: { cover: 80, area: 30, area_sharp: 0.75 },
			scene: { mode: 0, limits: { scene: 6000, zero: 100, blocks: 40 } }
		}""" % (round(min(max(target_fps, fps * 2, freq / 2), freq)) * 1000, 1001)

	def toYUV420(clip) :
		if clip.format.id == vs.YUV420P8:
			clip8 = clip
		elif clip.format.id == vs.YUV420P10:
			clip8 = clip.resize.Bilinear(format=vs.YUV420P8)
		else:
			clip = clip.resize.Bilinear(format=vs.YUV420P10)
			clip8 = clip.resize.Bilinear(format=vs.YUV420P8)
		return clip, clip8

	def svpflow(clip, fps, sp, ap, fp) :
		clip, clip8 = toYUV420(clip)
		s = core.svp1.Super(clip8, sp)
		r = s["clip"], s["data"]
		v = core.svp1.Analyse(*r, clip, ap)
		r = *r, v["clip"], v["data"]
		clip = core.svp2.SmoothFps(clip, *r, fp, src=clip, fps=fps)
		return clip

	output = svpflow(input, fps, sp, ap, fp)

	return output

##################################################
##################################################

def BM3D_NV(
	input : vs.VideoNode,
	nr_lv : typing.List[int] = [5,1,1],
	bs_ref : typing.Literal[1, 2, 3, 4, 5, 6, 7, 8] = 8,
	bs_out : typing.Literal[1, 2, 3, 4, 5, 6, 7, 8] = 7,
	gpu : typing.Literal[0, 1, 2] = 0,
) -> vs.VideoNode :

	fmt_in = input.format.id

	cut0 = core.resize.Bilinear(clip=input, format=vs.YUV444PS)
	ref = core.bm3dcuda_rtc.BM3D(clip=cut0, sigma=nr_lv, block_step=bs_ref, device_id=gpu)
	cut1 = core.bm3dcuda_rtc.BM3D(clip=cut0, ref=ref, sigma=nr_lv, block_step=bs_out, device_id=gpu)
	output = core.resize.Bilinear(clip=cut1, format=fmt_in)

	return output

##################################################
## PORT jvsfunc (7bed2d843fd513505b209470fd82c71ef8bcc0dd)
##################################################

def CCD_STD(
	input : vs.VideoNode,
	nr_lv : float = 20.0,
) -> vs.VideoNode :

	colorlv = input.get_frame(0).props._ColorRange
	fmt_in = input.format.id

	def ccd(src: vs.VideoNode, threshold: float = 4) -> vs.VideoNode:

		if src.format.color_family != vs.RGB or src.format.sample_type != vs.FLOAT:
			raise ValueError('ccd: only RGBS format is supported')

		thr = threshold**2/195075.0
		r = core.std.ShufflePlanes([src, src, src], [0, 0, 0], vs.RGB)
		g = core.std.ShufflePlanes([src, src, src], [1, 1, 1], vs.RGB)
		b = core.std.ShufflePlanes([src, src, src], [2, 2, 2], vs.RGB)

		ex_ccd = core.akarin.Expr([r, g, b, src],
			'x[-12,-12] x - 2 pow y[-12,-12] y - 2 pow z[-12,-12] z - 2 pow + + A! '
			'x[-4,-12] x - 2 pow y[-4,-12] y - 2 pow z[-4,-12] z - 2 pow + + B! '
			'x[4,-12] x - 2 pow y[4,-12] y - 2 pow z[4,-12] z - 2 pow + + C! '
			'x[12,-12] x - 2 pow y[12,-12] y - 2 pow z[12,-12] z - 2 pow + + D! '
			'x[-12,-4] x - 2 pow y[-12,-4] y - 2 pow z[-12,-4] z - 2 pow + + E! '
			'x[-4,-4] x - 2 pow y[-4,-4] y - 2 pow z[-4,-4] z - 2 pow + + F! '
			'x[4,-4] x - 2 pow y[4,-4] y - 2 pow z[4,-4] z - 2 pow + + G! '
			'x[12,-4] x - 2 pow y[12,-4] y - 2 pow z[12,-4] z - 2 pow + + H! '
			'x[-12,4] x - 2 pow y[-12,4] y - 2 pow z[-12,4] z - 2 pow + + I! '
			'x[-4,4] x - 2 pow y[-4,4] y - 2 pow z[-4,4] z - 2 pow + + J! '
			'x[4,4] x - 2 pow y[4,4] y - 2 pow z[4,4] z - 2 pow + + K! '
			'x[12,4] x - 2 pow y[12,4] y - 2 pow z[12,4] z - 2 pow + + L! '
			'x[-12,12] x - 2 pow y[-12,12] y - 2 pow z[-12,12] z - 2 pow + + M! '
			'x[-4,12] x - 2 pow y[-4,12] y - 2 pow z[-4,12] z - 2 pow + + N! '
			'x[4,12] x - 2 pow y[4,12] y - 2 pow z[4,12] z - 2 pow + + O! '
			'x[12,12] x - 2 pow y[12,12] y - 2 pow z[12,12] z - 2 pow + + P! '
			f'A@ {thr} < 1 0 ? B@ {thr} < 1 0 ? C@ {thr} < 1 0 ? D@ {thr} < 1 0 ? '
			f'E@ {thr} < 1 0 ? F@ {thr} < 1 0 ? G@ {thr} < 1 0 ? H@ {thr} < 1 0 ? '
			f'I@ {thr} < 1 0 ? J@ {thr} < 1 0 ? K@ {thr} < 1 0 ? L@ {thr} < 1 0 ? '
			f'M@ {thr} < 1 0 ? N@ {thr} < 1 0 ? O@ {thr} < 1 0 ? P@ {thr} < 1 0 ? '
			'+ + + + + + + + + + + + + + + 1 + Q! '
			f'A@ {thr} < a[-12,-12] 0 ? B@ {thr} < a[-4,-12] 0 ? '
			f'C@ {thr} < a[4,-12] 0 ? D@ {thr} < a[12,-12] 0 ? '
			f'E@ {thr} < a[-12,-4] 0 ? F@ {thr} < a[-4,-4] 0 ? '
			f'G@ {thr} < a[4,-4] 0 ? H@ {thr} < a[12,-4] 0 ? '
			f'I@ {thr} < a[-12,4] 0 ? J@ {thr} < a[-4,4] 0 ? '
			f'K@ {thr} < a[4,4] 0 ? L@ {thr} < a[12,4] 0 ? '
			f'M@ {thr} < a[-12,12] 0 ? N@ {thr} < a[-4,12] 0 ? '
			f'O@ {thr} < a[4,12] 0 ? P@ {thr} < a[12,12] 0 ? '
			'+ + + + + + + + + + + + + + + a + Q@ /')

		return ex_ccd

	cut = core.resize.Bilinear(clip=input, format=vs.RGBS, matrix_in_s="709")
	fin = ccd(src=cut, threshold=nr_lv)
	output = core.resize.Bilinear(clip=fin, format=fmt_in, matrix_s="709", range=1 if colorlv==0 else None)

	return output

##################################################
##################################################

def FFT3D_STD(
	input : vs.VideoNode,
	mode : typing.Literal[1, 2] = 1,
	nr_lv : float = 2.0,
	plane : typing.List[int] = [0],
	frame_bk : typing.Literal[-1, 0, 1, 2, 3, 4, 5] = 3,
	cpu_t : int = 6,
) -> vs.VideoNode :

	if mode == 1 :
		output = core.fft3dfilter.FFT3DFilter(clip=input, sigma=nr_lv, planes=plane, bt=frame_bk, ncpu=cpu_t)
	elif mode == 2 :
		output = core.neo_fft3d.FFT3D(clip=input, sigma=nr_lv, planes=plane, bt=frame_bk, ncpu=cpu_t, mt=False)

	return output

##################################################
##################################################

def NLM_STD(
	input : vs.VideoNode,
	blur_m : typing.Literal[0, 1, 2] = 2,
	nlm_m : typing.Literal[1, 2] = 1,
	frame_num : int = 1,
	rad_sw : int = 2,
	rad_snw : int = 2,
	nr_lv : float = 3.0,
	gpu : typing.Literal[0, 1, 2] = 0,
) -> vs.VideoNode :

	fmt_in = input.format.id

	cut0 = core.resize.Bilinear(clip=input, format=vs.YUV444P16)
	if blur_m == 0 :
		blur = cut0
	elif blur_m == 1 :
		blur = core.rgvs.RemoveGrain(clip=cut0, mode=20)
		blur = core.rgvs.RemoveGrain(clip=blur, mode=20)
		blur = core.rgvs.RemoveGrain(clip=blur, mode=20)
	elif blur_m == 2 :
		blur = core.std.Convolution(clip=cut0, matrix=[1, 1, 1, 1, 1, 1, 1, 1, 1])
		blur = core.std.Convolution(clip=blur, matrix=[1, 1, 1, 1, 1, 1, 1, 1, 1])
		blur = core.std.Convolution(clip=blur, matrix=[1, 1, 1, 1, 1, 1, 1, 1, 1])

	if blur_m :
		diff = core.std.MakeDiff(clipa=cut0, clipb=blur)
		if nlm_m == 1 :
			cut1 = core.knlm.KNLMeansCL(clip=diff, d=frame_num, a=rad_sw, s=rad_snw, h=nr_lv,
				channels="auto", wmode=2, wref=1.0, rclip=None, device_type="GPU", device_id=gpu)
		elif nlm_m == 2 :
			cut1 = core.nlm_ispc.NLMeans(clip=diff, d=frame_num, a=rad_sw, s=rad_snw, h=nr_lv,
				channels="AUTO", wmode=2, wref=1.0, rclip=None)
		merge = core.std.MergeDiff(clipa=blur, clipb=cut1)
	else :
		if nlm_m == 1 :
			cut1 = core.knlm.KNLMeansCL(clip=blur, d=frame_num, a=rad_sw, s=rad_snw, h=nr_lv,
				channels="auto", wmode=2, wref=1.0, rclip=None, device_type="GPU", device_id=gpu)
		elif nlm_m == 2 :
			cut1 = core.nlm_ispc.NLMeans(clip=blur, d=frame_num, a=rad_sw, s=rad_snw, h=nr_lv,
				channels="AUTO", wmode=2, wref=1.0, rclip=None)
	output = core.resize.Bilinear(clip=merge if blur_m else cut1, format=fmt_in)

	return output

##################################################
##################################################

def NLM_NV(
	input : vs.VideoNode,
	blur_m : typing.Literal[0, 1, 2] = 2,
	frame_num : int = 1,
	rad_sw : int = 2,
	rad_snw : int = 2,
	nr_lv : float = 3.0,
	gpu : typing.Literal[0, 1, 2] = 0,
	gpu_t : typing.Literal[1, 2, 3] = 2,
) -> vs.VideoNode :

	fmt_in = input.format.id

	cut0 = core.resize.Bilinear(clip=input, format=vs.YUV444P16)
	if blur_m == 0 :
		blur = cut0
	elif blur_m == 1 :
		blur = core.rgvs.RemoveGrain(clip=cut0, mode=20)
		blur = core.rgvs.RemoveGrain(clip=blur, mode=20)
		blur = core.rgvs.RemoveGrain(clip=blur, mode=20)
	elif blur_m == 2 :
		blur = core.std.Convolution(clip=cut0, matrix=[1, 1, 1, 1, 1, 1, 1, 1, 1])
		blur = core.std.Convolution(clip=blur, matrix=[1, 1, 1, 1, 1, 1, 1, 1, 1])
		blur = core.std.Convolution(clip=blur, matrix=[1, 1, 1, 1, 1, 1, 1, 1, 1])

	if blur_m :
		diff = core.std.MakeDiff(clipa=cut0, clipb=blur)
		cut1 = core.nlm_cuda.NLMeans(clip=diff, d=frame_num, a=rad_sw, s=rad_snw, h=nr_lv,
			channels="AUTO", wmode=2, wref=1.0, rclip=None, device_id=gpu, num_streams=gpu_t)
		merge = core.std.MergeDiff(clipa=blur, clipb=cut1)
	else :
		cut1 = core.nlm_cuda.NLMeans(clip=blur, d=frame_num, a=rad_sw, s=rad_snw, h=nr_lv,
			channels="AUTO", wmode=2, wref=1.0, rclip=None, device_id=gpu, num_streams=gpu_t)
	output = core.resize.Bilinear(clip=merge if blur_m else cut1, format=fmt_in)

	return output

##################################################
##################################################

def AA_NV(
	input : vs.VideoNode,
	plane : typing.List[int] = [0],
	gpu : typing.Literal[-1, 0, 1, 2] = -1,
	gpu_t : typing.Literal[1, 2, 3] = 2,
) -> vs.VideoNode :

	output = core.eedi2cuda.AA2(clip=input, mthresh=10, lthresh=20, vthresh=20, estr=2, dstr=4, maxd=24, map=0, nt=50, pp=1, planes=plane, num_streams=gpu_t, device_id=gpu)

	return output

##################################################
##################################################

def DEBAND_STD(
	input : vs.VideoNode,
	bd_range : int = 15,
	bdy_rth : int = 48,
	bdc_rth : int = 48,
	grainy : int = 48,
	grainc : int = 48,
	spl_m : typing.Literal[1, 2, 3, 4] = 4,
	grain_dy : bool = True,
	depth : typing.Literal[8, 10] = 8,
) -> vs.VideoNode :

	color_lv = input.get_frame(0).props._ColorRange

	cut0 = core.resize.Bilinear(clip=input, format=vs.YUV444P16)
	output = core.neo_f3kdb.Deband(clip=cut0, range=bd_range, y=bdy_rth, cb=bdc_rth, cr=bdc_rth, grainy=grainy, grainc=grainc, sample_mode=spl_m, dynamic_grain=grain_dy, mt=True, keep_tv_range=True if color_lv==1 else False, output_depth=depth)

	return output

##################################################
##################################################

def DEINT_STD(
	input : vs.VideoNode,
	cpu : bool = True,
	gpu : typing.Literal[-1, 0, 1, 2] = -1,
	deint_m : typing.Literal[1, 2, 3] = 1,
) -> vs.VideoNode :

	if cpu :
		ref = core.znedi3.nnedi3(clip=input, field=3)
	else :
		ref = core.nnedi3cl.NNEDI3CL(clip=input, field=3, device=gpu)

	if deint_m == 1 :
		output = core.bwdif.Bwdif(clip=input, field=3, edeint=ref)
	elif deint_m == 2 :
		output = core.yadifmod.Yadifmod(clip=input, edeint=ref, order=1, mode=1)
	elif deint_m == 3 :
		output = core.tdm.TDeintMod(clip=input, order=1, mode=1, length=6, ttype=0, edeint=ref)

	return output

##################################################
##################################################

def IVTC_STD(
	input : vs.VideoNode,
	fps_in : float = 23.976,
	ivtc_m : typing.Literal[1, 2] = 1,
) -> vs.VideoNode :

	if fps_in <= 24 or fps_in >= 31 or (fps_in >= 26 and fps_in <= 29) :
		# 无解，跳过
		output = input
	else :

		if ivtc_m == 1 :
			if fps_in > 24 and fps_in < 26 :
				output = core.vivtc.VDecimate(clip=input, cycle=25)
			elif fps_in > 29 and fps_in < 31 :
				output = core.vivtc.VDecimate(clip=input, cycle=5)
		elif ivtc_m == 2 :
			cut0 = core.std.AssumeFPS(clip=input, fpsnum=fps_in * 1000, fpsden=1000)
			cut1 = core.tivtc.TDecimate(clip=cut0, mode=7, rate=24 / 1.001)
			output = core.std.AssumeFPS(clip=cut1, fpsnum=24000, fpsden=1001)

	return output

##################################################
## MOD HAvsFunc (2a9a4770b7d014e1f528ef5f462f6e6e22564b7c)
##################################################

def STAB_STD(
	input : vs.VideoNode,
) -> vs.VideoNode :

	threshold = 255 << (input.format.bits_per_sample - 8)
	temp = input.focus2.TemporalSoften2(7, threshold, threshold, 25, 2)
	inter = core.std.Interleave([core.rgvs.Repair(temp, input.focus2.TemporalSoften2(1, threshold, threshold, 25, 2), mode=[1]), input])
	mdata = inter.mv.DepanEstimate(trust=0, dxmax=4, dymax=4)
	mdata_fin = inter.mv.DepanCompensate(data=mdata, offset=-1, mirror=15)
	output = mdata_fin[::2]

	return output

##################################################
## PORT HAvsFunc (7f0a9a7a37b60a05b9f408024d203e511e544a61)
##################################################

def STAB_HQ(
	input : vs.VideoNode,
) -> vs.VideoNode :

	def SCDetect(clip: vs.VideoNode, threshold: float = 0.1) -> vs.VideoNode:
		def copy_property(n: int, f: vs.VideoFrame) -> vs.VideoFrame:
			fout = f[0].copy()
			fout.props['_SceneChangePrev'] = f[1].props['_SceneChangePrev']
			fout.props['_SceneChangeNext'] = f[1].props['_SceneChangeNext']

			return fout

		sc = clip
		if clip.format.color_family == vs.RGB:
			sc = clip.resize.Point(format=vs.GRAY8, matrix_s='709')
		sc = sc.misc.SCDetect(threshold=threshold)
		if clip.format.color_family == vs.RGB:
			sc = clip.std.ModifyFrame(clips=[clip, sc], selector=copy_property)

		return sc

	def AverageFrames(
		clip: vs.VideoNode, weights: typing.Union[float, typing.Sequence[float]], scenechange: typing.Optional[float] = None, planes: typing.Optional[typing.Union[int, typing.Sequence[int]]] = None
	) -> vs.VideoNode:

		if scenechange:
			clip = SCDetect(clip, threshold=scenechange)

		return clip.std.AverageFrames(weights=weights, scenechange=scenechange, planes=planes)

	def Stab(clp, dxmax=4, dymax=4, mirror=0):

		temp = AverageFrames(clp, weights=[1] * 15, scenechange=25 / 255)
		inter = core.std.Interleave([core.rgvs.Repair(temp, AverageFrames(clp, weights=[1] * 3, scenechange=25 / 255), mode=[1]), clp])
		mdata = inter.mv.DepanEstimate(trust=0, dxmax=dxmax, dymax=dymax)
		last = inter.mv.DepanCompensate(data=mdata, offset=-1, mirror=mirror)

		return last[::2]

	output = Stab(clp=input, mirror=15)

	return output

##################################################
##################################################

