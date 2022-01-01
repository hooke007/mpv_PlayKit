[RUSSIAN](./README-RU.md)
# mpv播放器折腾记录

从萌新到大白，<s>用前嫌麻烦</s> 用后真香

![](Temp/index-界面对比.jpg)
![](Temp/index-高级播放列表.png)

[mpv 命令行播放器](https://github.com/mpv-player/mpv)  

我的个人设置备份（在windows10/11平台具有较好的普适性）  
各文件夹内的md也有进一步的说明  
建议直接下载本仓库内的原档文件进行修改，自行新建文本编辑注意编码格式应为 **UTF-8** ，换行符为 **LF** ，否则MPV可能无法识别  

从零开始接触mpv且不使用懒人包的话可参考 [win10/11 mpv播放器通用教程](https://hooke007.github.io/mpv-lazy/mpv.html)

## 懒人包

懒人包是解压即可使用的完整解决方案 [快速说明](https://hooke007.github.io/mpv-lazy/[00]_懒人包快速说明.html)  
说明文档 [我的主页#系列手册](https://hooke007.github.io/#系列手册)  
下载见 [**Releases**](https://github.com/hooke007/MPV_lazy/releases)

## 简易包

简易包是基于mpv.net（一个基于libmpv的前端程序）的中文修改版，更加易于上手。除了涵盖了懒人包的大部分选项外，还实现了一些额外的实用功能与合格的图形交互，更像一个普通人使用的播放器。  
传送门 [mpv.net_CM](https://github.com/hooke007/mpv.net_CM)

## 本地文件树结构

我使用的是 [便携化的设置文件夹](https://mpv.io/manual/master/#files-on-windows)  
此时在 `mpv.conf` 中 `~~/`引用的相对路径即指向 `...\mpv-lazy\portable_config\`

<details>
<summary>展开查看</summary>
<pre><code>

    ...\mpv-lazy\
        mpv.exe & mpv.com
        mpv-BenchMark.conf
        mpv-test.conf
        mpv-？？模式.bat

    ...\mpv-lazy\portable_config\
            input.conf
            mpv.conf
            profiles.conf
            ?????.vpy

    ...\mpv-lazy\portable_config\scripts\
                <脚本群组文件夹>
                ?????.lua

    ...\mpv-lazy\portable_config\script-opts\
                ?????.conf（名称通常对应脚本名）

    ...\mpv-lazy\portable_config\shaders\
                ?????.glsl
                ?????.hook

我也使用便携版Python VapourSynth  
即解压所有包内文件到 `mpv.exe` 的同级

    ...\mpv-lazy\
        python.exe
        VSPipe.exe
        VapourSynth.dll
        xxxx.py
        <等等文件>

    ...\mpv-lazy\vapoursynth64\plugins\
                <这里放置自行添加的vs插件>

youtube-dl或YT-DLP和FFmpeg也被我顺手放一起

    ...\mpv-lazy\
        ffmpeg.exe
        youtube-dl.exe
        yt-dlp.exe

tcl/tk依照我的懒人包预设放在此处

    ...\mpv-lazy\
        tclsh.exe

安装注册的脚本文件置于 `mpv.exe` 的次级

    ...\mpv-lazy\installer\
            mpv-icon.ico
            mpv-install.bat
            mpv-uninstall.bat
</code></pre>
</details>
