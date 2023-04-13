### Neo f3kdb 动态颗粒去色带

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import DEBAND_STD

clip = video_in

############
# 用户选项 #
############

Bd_Range = 15
Bdy_Rth = 48
Bdc_Rth = 48
Grainy = 48
Grainc = 48
Spl_M = 4
Grain_Dy = True
Depth = 8
## 色带检测范围
## 色带检测阈值 —— Y平面
## 色带检测阈值 —— CbCr平面
## 最后阶段添加的颗粒数 —— Y平面
## 最后阶段添加的颗粒数 —— CbCr平面
## <1|2|3|4> 采样模式，分别对应 Column Square Row Average(Column&Row)
## 是否使用动态颗粒
## <8|10> 最终输出的色深

clip = DEBAND_STD(clip, bd_range=Bd_Range, bdy_rth=Bdy_Rth, bdc_rth=Bdc_Rth, grainy=Grainy, grainc=Grainc, spl_m=Spl_M, grain_dy=Grain_Dy, depth=Depth)

clip.set_output()
