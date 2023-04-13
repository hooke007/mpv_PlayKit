### 镜头防抖（此类问题常见于胶片转录作品），CPU开销很大

import vapoursynth as vs
from vapoursynth import core
from k7sfunc import STAB_HQ

clip = video_in

clip = STAB_HQ(clip)

clip.set_output()
