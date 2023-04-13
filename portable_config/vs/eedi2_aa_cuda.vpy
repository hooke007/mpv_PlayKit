### eedi2抗锯齿，N卡专用

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import AA_NV

clip = video_in

############
# 用户选项 #
############

Plane = [0]
Gpu = -1
Gpu_T = 2
## 目标平面，全平面即 [0, 1, 2]
## 使用的显卡序号，-1为自动，0为排序一号
## 使用的显卡线程数

clip = AA_NV(clip, plane=Plane, gpu=Gpu, gpu_t=Gpu_T)

clip.set_output()
