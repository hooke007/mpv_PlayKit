### 伪25或30帧的源转24帧

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import IVTC_STD

clip = video_in

############
# 用户选项 #
############

Ivtc_M = 1
## <1|2> ivtc模式

if container_fps < 24.5 or container_fps > 32 :
	raise Exception("非限定源，已临时禁用该脚本。")

clip = IVTC_STD(clip, fps_in=container_fps, ivtc_m=Ivtc_M)

clip.set_output()
