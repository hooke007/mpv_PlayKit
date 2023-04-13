### mvtools的偏保守型补帧策略，中等消耗。

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FPS_CTRL, MVT_STD

clip = video_in

############
# 用户选项 #
############

Fps_Out = 60.0
## 目标帧率，示例即约60fps。特殊值比如 display_fps/2 即目标为显示器刷新率的一半帧率；填 container_fps*2 即倍帧（越高的帧率增加耗能，产生更多伪影，通常是不必要的。例如对于144hz的显示器来说，最多只需要补到72fps，剩下的可让 --interpolation 帧混成补偿）

clip = FPS_CTRL(clip, fps_in=container_fps, fps_ret=True)
clip = MVT_LQ(clip, fps_in=container_fps, fps_out=Fps_Out)

clip.set_output()
