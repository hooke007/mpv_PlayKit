### NL-means降噪
### 追求速度应使用着色器版本，例如 ../shaders/nlmeans.glsl

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import NLM_STD

clip = video_in

############
# 用户选项 #
############

Blur_M = 2
Nlm_M = 1
Frame_Num = 1
Rad_Sw = 2
Rad_Snw = 2
Nr_Lv = 3.0
Gpu = 0
## <0|1|2> 分离模式。0为不使用
## <1|2> 降噪核心，分别对应 OpenCL cpu
## 降噪帧数（整数）
## 搜索窗口半径（整数）
## 近邻窗口半径（整数）
## 降噪强度（浮点）
## 指定opencl显卡加速设备，0为排序一号

clip = NLM_STD(clip, blur_m=Blur_M, nlm_m=Nlm_M, frame_num=Frame_Num, rad_sw=Rad_Sw, rad_snw=Rad_Snw, nr_lv=Nr_Lv, gpu=Gpu)

clip.set_output()
