### svpflow倍帧，中等消耗

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FPS_CTRL, SVP_LQ

clip = video_in

############
# 用户选项 #
############

Cpu = 0
Gpu = 0
## <0|1> 是否只使用CPU
## <0|11|12|21> 使用的显卡序号，0为排序一号

clip = FPS_CTRL(clip, fps_in=container_fps, fps_ret=True)
clip = SVP_LQ(clip, fps_in=container_fps, cpu=Cpu, gpu=Gpu)

clip.set_output()
