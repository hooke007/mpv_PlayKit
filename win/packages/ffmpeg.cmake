ExternalProject_Add(ffmpeg
    DEPENDS
        amf-headers
        avisynth-headers
        ${nvcodec_headers}
        bzip2
        lcms2
        openssl
        libssh
        libsrt
        libass
        libbluray
        libdvdnav
        libdvdread
        libmodplug
        libpng
        libsoxr
        libbs2b
        libwebp
        libzimg
        libmysofa
        fontconfig
        harfbuzz
        libxml2
        libvpl
        libjxl
        shaderc
        libplacebo
        libzvbi
        libaribcaption
        dav1d
        vapoursynth
        ${ffmpeg_uavs3d}
        ${ffmpeg_davs2}
        rubberband
        libva
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !tests/ref/fate"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --pkg-config-flags=--static
        --enable-cross-compile
        --enable-runtime-cpudetect
        --enable-gpl
        --enable-version3
        --enable-nonfree
        --enable-avisynth
        --enable-vapoursynth
        --enable-libass
        --enable-libbluray
        --enable-libdvdnav
        --enable-libdvdread
        --enable-libfreetype
        --enable-libfribidi
        --enable-libfontconfig
        --enable-libharfbuzz
        --enable-libmodplug
        --enable-lcms2
        --enable-libsoxr
        --enable-libbs2b
        --enable-librubberband
        --enable-libwebp
        --enable-libdav1d
        ${ffmpeg_davs2_cmd}
        ${ffmpeg_uavs3d_cmd}
        --enable-libzimg
        --enable-openssl
        --enable-libxml2
        --enable-libmysofa
        --enable-libssh
        --enable-libsrt
        --enable-libvpl
        --enable-libjxl
        --enable-libplacebo
        --enable-libshaderc
        --enable-libzvbi
        --enable-libaribcaption
        ${ffmpeg_cuda}
        --enable-amf
        --enable-opengl
        --enable-vaapi
        --disable-doc
        --disable-ffplay
        --disable-ffprobe
        --disable-vdpau
        --disable-videotoolbox
        --disable-decoder=libaom_av1
        --disable-muxers
        --enable-muxer=avif
        --enable-muxer=image2
        --enable-muxer=webp
        --disable-encoders
        --enable-encoder=av1_nvenc
        --enable-encoder=av1_qsv
        --enable-encoder=av1_amf
        --enable-encoder=av1_vaapi
        --enable-encoder=libjxl
        --enable-encoder=png
        --enable-encoder=rawvideo
        --enable-encoder=libwebp
        ${ffmpeg_lto}
        --extra-cflags='-Wno-error=int-conversion'
        "--extra-libs='${ffmpeg_extra_libs}'" # -lstdc++ / -lc++ needs by libjxl and shaderc
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)
