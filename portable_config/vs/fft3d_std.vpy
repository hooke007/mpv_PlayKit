### fft3d降噪

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FFT3D_STD

clip = video_in

############
# 用户选项 #
############

Mode = 1
Nr_Lv = 2.0
Plane = [0]
Frame_Bk = 3
Cpu_T = 6
## <1|2> fft3d内核，分别对应 FFT3DFilter Neo-FFT3D
## 降噪强度
## 降噪处理的平面
## <-1|0|1|2|3|4|5> -1=仅锐化和去光晕 // 0=Temporal Kalman // 1=2D (spatial) Wiener // 2 --- 5 =N帧的3D Wiener
## 使用的处理器线程

clip = FFT3D_STD(clip, mode=Mode, nr_lv=Nr_Lv, plane=Plane, frame_bk=Frame_Bk, cpu_t=Cpu_T)

clip.set_output()
