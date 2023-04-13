### nnedi3作参考，进行反交错（倍帧模式）

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import DEINT_STD

clip = video_in

############
# 用户选项 #
############

Cpu = True
Gpu = -1
Deint_M = 1
## 使用cpu还是gpu
## 使用gpu的序号，0为排序一号
## <1|2|3> 去隔行的执行核心，分别对应 bwdif yadifmod tdm

clip = DEINT_STD(clip, cpu=Cpu, gpu=Gpu, deint_m=Deint_M)

clip.set_output()
