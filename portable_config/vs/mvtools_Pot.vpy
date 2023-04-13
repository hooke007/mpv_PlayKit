### 某播放器的内置脚本，开销不低

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FPS_CTRL, MVT_POT

clip = video_in

############
# 用户选项 #
############

Fps_Out = 59.940

## 目标帧率

clip = FPS_CTRL(clip, fps_in=container_fps, fps_ret=True)
clip = MVT_POT(clip, fps_in=container_fps, fps_out=Fps_Out)

clip.set_output()
