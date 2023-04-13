### rife v4 补帧，性能要求非常高

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FPS_CTRL, RIFE_STD

clip = video_in

############
# 用户选项 #
############

Sc_Mode = 1
Fps_Num = 2
Fps_Den = 1
Gpu = 0
Gpu_T = 2
## <0|1|2> 场景切换检测的模式，0为禁用
## FPS_num/FPS_den 的值即帧率倍数（分子分母必须为整数，计算结果可为浮点）
## .
## 使用的显卡序号，0为排序一号
## 使用的显卡线程数

clip = FPS_CTRL(clip, fps_in=container_fps, fps_ret=True)
clip = RIFE_STD(clip, sc_mode=Sc_Mode, stat_th=60.0, fps_num=Fps_Num, fps_den=Fps_Den, gpu=Gpu, gpu_t=Gpu_T)

clip.set_output()
