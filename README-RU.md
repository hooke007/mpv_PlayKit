# # mpv плеер

От новичка до великого белого，<s>От новичка до великого белого</s> Действительно крутой после использования

![](Temp/index-界面对比.jpg)
![](Temp/index-高级播放列表.png)

[проигрыватель командной строки mpv](https://github.com/mpv-player/mpv)  

проигрыватель командной строки mpv（Хорошая универсальность в платформе windows 10/11）  
В папке md в каждой папке также имеется дополнительное описание
Для модификации рекомендуется загрузить оригинальный файл непосредственно из этого репозитория，Создайте свой текстовый файл и обратите внимание, что формат кода должен быть таким **UTF-8** ，Разрыв строки **LF** ，В противном случае MPV может быть не распознан 

Для тех, кто начинает работу с mpv с нуля и не использует mpv-lazy [Win10/11 mpv плеер универсальный учебник](https://hooke007.github.io/mpv-lazy/mpv.html)

## mpv lazy

mpv lazy - это полное решение, готовое к использованию, когда вы его распакуете [Краткое описание](https://hooke007.github.io/mpv-lazy/[00]_懒人包快速说明.html)  
Инструктивные документы [Моя домашняя страница #Брошюра серии](https://hooke007.github.io/#系列手册)  
Для скачивания см. [**Releases**](https://github.com/hooke007/MPV_lazy/releases)

## Легкая упаковка

Пакет Lite - это китайская модификация mpv.net (внешняя программа на базе libmpv), с которой проще начать работу. Помимо того, что она охватывает большинство опций пакета lazy, она также реализует некоторые дополнительные полезные функции с квалифицированным графическим взаимодействием, больше похожим на плеер для обычных людей.  
Портал [mpv.net_CM](https://github.com/hooke007/mpv.net_CM)

## Структура дерева локальных файлов

Я использую [Папка переносных настроек](https://mpv.io/manual/master/#files-on-windows)  
В это время в `mpv.conf` 中 `~~/`Относительный путь ссылки указывается на `...\mpv-lazy\portable_config\`

<details>
<summary>Развернуть для просмотра</summary>
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
                <Папка группы сценариев>
                ?????.lua

    ...\mpv-lazy\portable_config\script-opts\
                ?????.conf（Имя обычно соответствует имени сценария）

    ...\mpv-lazy\portable_config\shaders\
                ?????.glsl
                ?????.hook

Я также использую портативную версию Python VapourSynth  
То есть, распакуйте все файлы пакета по адресу `mpv.exe` одного класса

    ...\mpv-lazy\
        python.exe
        VSPipe.exe
        VapourSynth.dll
        xxxx.py
        <и т.п. документы>

    ...\mpv-lazy\vapoursynth64\plugins\
                <Разместите здесь свои собственные плагины vs>

Я также объединил youtube dl или YT-DLP и FFmpeg.

    ...\mpv-lazy\
        ffmpeg.exe
        youtube-dl.exe
        yt-dlp.exe

tcl/tk размещается здесь в соответствии с моей предварительной установкой mpv-lazy

    ...\mpv-lazy\
        tclsh.exe

Установите зарегистрированный файл скрипта во вторичный `mpv.exe`.

    ...\mpv-lazy\installer\
            mpv-icon.ico
            mpv-install.bat
            mpv-uninstall.bat
</code></pre>
</details>
