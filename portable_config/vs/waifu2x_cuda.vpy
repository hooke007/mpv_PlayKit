### waifu2x (upconv_7_anime_style_art_rgb) 放大或降噪，性能要求非常高，N卡专用

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FMT_CTRL, WAIFU_NV

clip = video_in

############
# 用户选项 #
############

Lt_Hd = False
Nr_Lv = 1
Scale = 2
Gpu = 0
Gpu_T = 2
St_Eng = False
Ws_Size = 0
Lk_Fmt = False
## 是否对超过HD分辨率（720P）的源进行处理
## <-1|0|1|2|3> 降噪等级，-1为不降噪
## <1|2> 放大倍率，1为不放大
## 使用的显卡序号，0为排序一号
## <1|2> 使用的显卡线程数
## 是否使用静态引擎（需要对不同分辨率的源各进行预处理）；动态引擎自适应不同分辨率（64²→DCI2K）
## <0~1024> 约束显存（MiB），静态引擎的最小值为128（动态引擎自动双倍），设为低于此数的值即为不限制
## 是否锁定输出像素格式为yuv420p8

clip = WAIFU_NV(clip, lt_hd=Lt_Hd, nr_lv=Nr_Lv, scale=Scale, gpu=Gpu, gpu_t=Gpu_T, st_eng=St_Eng, ws_size=Ws_Size)
if Lk_Fmt :
	clip = FMT_CTRL(clip, fmt_pix=vs.YUV420P8)

clip.set_output()
