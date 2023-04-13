### mvtools倍帧，一般开销

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FPS_CTRL, MVT_LQ

clip = video_in

############
# 用户选项 #
############

Recal = True
Block = True
## <True|False> 是否使用二次分析
## <True|False> 是否使用Block模式

clip = FPS_CTRL(clip, fps_in=container_fps, fps_ret=True)
clip = MVT_LQ(clip, fps_in=container_fps, fps_out=container_fps*2, recal=Recal, block=Block)

output.set_output()
