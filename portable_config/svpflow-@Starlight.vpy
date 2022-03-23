##Source: https://bbs.vcb-s.com/?14732
##@Starlight 的个人高参脚本，性能要求较高

import vapoursynth as vs
from vapoursynth import core

clip = video_in
fps = container_fps or 23.976
freq = display_fps or 59.970
w, h = video_in_dw, video_in_dh

if (freq - fps < 2):
    raise Exception("Interpolation is not necessary.")

# 补帧的目标帧率，取 最小值(刷新率, 最大值(指定帧数, 倍帧, 半刷新率))
# 60hz  显示器播放  24fps 视频，输出  60fps <- min(max(60, 48, 30), 60)
# 120hz 显示器播放  24fps 视频，输出  60fps <- min(max(60, 48, 60), 120)
# 144hz 显示器播放  24fps 视频，输出  72fps <- min(max(60, 48, 72), 144)
# 144hz 显示器播放  60fps 视频，输出 120fps <- min(max(60, 120, 72), 144)
# 144hz 显示器播放 120fps 视频，输出 144fps <- min(max(60, 240, 72), 144)
target_fps = 60

# 为改善性能表现，在补帧前降低大于 vw*vh 的视频分辨率
# 以 object-fit: scale-down; 为目标行为
# 建议设为显示器分辨率，如不需要此功能改成 99999, 99999
vw, vh = 1920, 1080

# svpflow 的参数，json 格式，调整参考下面两个链接
# https://www.svp-team.com/wiki/Manual:SVPflow
# https://blackmickeysvp.blogspot.com/2017/06/smoothvideo-project_2.html
sp, ap, fp = """{
        gpu: 1
    }""", """{
        block: { w: 32, h: 16, overlap: 2 },
        main: {
            levels: 5,
            search: {
                type: 4, distance: -12,
                coarse: { type: 4, distance: -1, trymany: true, bad: { range: 0 } }
            },
            penalty: { lambda: 3.33, plevel: 1.33, lsad: 3300, pzero: 110, pnbour: 50 }
        },
        refine: [{ thsad: 400 }, { thsad: 200, search: { type: 4, distance: -4 } }]
    }""", """{
        gpuid: 0,
        algo: 23, rate: { num: %d, den: %d, abs: true },
        mask: { cover: 80, area: 30, area_sharp: 0.75 },
        scene: { mode: 0, limits: { scene: 6000, zero: 100, blocks: 40 } }
    }""" % (round(min(max(target_fps, fps * 2, freq / 2), freq)) * 1000, 1001)


def fit(clip, w, h, vw, vh):
    r = max(w/vw, h/vh)
    if r > 1:
        def f(x, s=4): return round(x/r/s)*s
        clip = clip.resize.Spline36(width=f(w), height=f(h))
    return clip


def toYUV420(clip):
    if clip.format.id == vs.YUV420P8:
        clip8 = clip
    elif clip.format.id == vs.YUV420P10:
        clip8 = clip.resize.Point(format=vs.YUV420P8)
    else:
        clip = clip.resize.Point(format=vs.YUV420P10)
        clip8 = clip.resize.Point(format=vs.YUV420P8)
    return clip, clip8


def svpflow(clip, fps, sp, ap, fp):
    clip, clip8 = toYUV420(clip)
    s = core.svp1.Super(clip8, sp)
    r = s["clip"], s["data"]
    v = core.svp1.Analyse(*r, clip, ap)
    r = *r, v["clip"], v["data"]
    clip = core.svp2.SmoothFps(clip, *r, fp, src=clip, fps=fps)
    return clip


clip = fit(clip, w, h, vw, vh)
clip = svpflow(clip, fps, sp, ap, fp)
clip.set_output()
