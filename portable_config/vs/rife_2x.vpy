### rife v4 倍帧（强制输出8比特），性能要求很高

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FPS_CTRL, FMT_CTRL, RIFE_STD

clip = video_in

############
# 用户选项 #
############

H_Max = 720
Sc_Mode = 1
Stat_Th = 60.0
Gpu = 0
Gpu_T = 2
## 若视频的高度超过该长度将被强制降采样，以画质交换性能
## <0|1|2> 场景切换检测的模式，0为禁用
## 静止帧的检测阈值，不对该类帧进行补偿计算
## 使用的显卡序号，0为排序一号
## 使用的显卡线程数

clip = FPS_CTRL(clip, fps_in=container_fps, fps_ret=True)
clip = FMT_CTRL(clip, h_max=H_Max)
clip = RIFE_STD(clip, sc_mode=Sc_Mode, stat_th=Stat_Th, fps_num=2, fps_den=1, gpu=Gpu, gpu_t=Gpu_T)

clip.set_output()
