### 使用acnet算法进行两倍放大
### 追求速度应使用着色器版本，例如 ../shaders/ACNet_HDN_L1.glsl

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FMT_CTRL, ACNET_STD

clip = video_in

############
# 用户选项 #
############

Nr = 1
Nr_Lv = 1
Gpu = 0
Gpu_M = "opencl"
## <0|1> 0为禁用降噪
## <1|2|3> 降噪强度
## 指定的显卡加速设备，0为排序一号
## <"opencl"|"cuda"> 使用的加速模型

clip = FMT_CTRL(clip, h_max=1440, h_ret=True)
clip = ACNET_STD(clip, nr=Nr, nr_lv=Nr_Lv, gpu=Gpu, gpu_m=Gpu_M)

clip.set_output()
