### 使用nnedi3算法进行两倍放大
### 追求速度应使用着色器版本，例如 ../shaders/nnedi3_nns128_win8x4.glsl

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import NNEDI3_STD

clip = video_in

############
# 用户选项 #
############

Edi_Nsize = 4
Edi_Nns = 3
Cpu = True
Gpu = -1
## <0|4> 分别对应 8x6 8x4
## <2|3|4> 分别对应 64 128 256
## 使用cpu还是gpu
## 使用gpu时指定的显卡序号，-1为自动，0为排序一号

clip = NNEDI3_STD(clip, edi_nsize=Edi_Nsize, edi_nns=Edi_Nns, cpu=Cpu, gpu=Gpu)

clip.set_output()
