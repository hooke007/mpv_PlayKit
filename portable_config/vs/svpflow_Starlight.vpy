### Source: https://bbs.vcb-s.com/?14732
### @Starlight 的个人高参脚本，性能要求较高

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import FMT_CTRL, SVP_HQ

clip = video_in

############
# 用户选项 #
############

Cpu = 0
Gpu = 0
## <0|1> 是否只使用CPU
## <0|11|12|21> 使用的显卡序号，0为排序一号

clip = FMT_CTRL(clip, h_max=1080)
clip = SVP_HQ(clip, fps_in=container_fps, fps_dp=display_fps, cpu=Cpu, gpu=Gpu)

clip.set_output()