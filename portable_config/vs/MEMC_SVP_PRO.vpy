### https://github.com/hooke007/MPV_lazy/wiki/3_K7sfunc
### 基于黑米奇方案的修改简化版

import vapoursynth as vs
from vapoursynth import core
import k7sfunc as k7f

clip = video_in

############
# 用户选项 #
############

H_Pre = 1440
Fps_Num = 60000
Fps_Den = 1001
Abs = True
Nvof = False
Gpu = 0
Lk_Fmt = False
## 整数，预降低处理源高度（填你的显示器高度）
## 整数， Fps_Num/Fps_Den 的计算结果即最终帧率或倍率
## 整数
## <True|False> 输出帧率(True)还是倍率(False)
## <True|False> 是否启用Optical Flow（nvidia专用）
## <0|11|12|21> 使用的显卡序号，0为排序一号
## <True|False> 是否锁定像素格式为yuv420p8

ret = k7f.FPS_CTRL(clip, fps_in=container_fps, fps_ret=True)
clip = k7f.FMT_CTRL(clip, h_max=H_Pre, fmt_pix=1 if Lk_Fmt else 0)
clip = k7f.SVP_PRO(clip, fps_in=container_fps, fps_num=Fps_Num, fps_den=Fps_Den, abs=Abs, nvof=Nvof, gpu=Gpu)

clip.set_output()
