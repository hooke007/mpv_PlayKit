ExternalProject_Add(libbluray
    DEPENDS
        libudfread
        freetype2
        libxml2
    GIT_REPOSITORY https://code.videolan.org/videolan/libbluray.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    GIT_SUBMODULES ""
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} sed -i [['/find_library/d']] <SOURCE_DIR>/meson.build
    COMMAND ${EXEC} CONF=1 meson setup <BINARY_DIR> <SOURCE_DIR>
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --cross-file=${MESON_CROSS}
        --buildtype=release
        --default-library=static
        -Denable_tools=false
        -Dbdj_jar=disabled
        -Djava9=false
        -Dfreetype=enabled
        -Dlibxml2=enabled
        "-Dc_args='-Ddec_init=libbluray_dec_init'"
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    COMMAND ${EXEC} sed -i [['s/-lbluray/-lbluray -lgdi32/']] ${MINGW_INSTALL_PREFIX}/lib/pkgconfig/libbluray.pc
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(libbluray)
force_meson_configure(libbluray)
cleanup(libbluray install)
