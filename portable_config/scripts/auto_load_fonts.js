/**
 * Source: https://github.com/Hill-98/mpv-config/blob/main/scripts/auto-load-fonts.js
 * 
 * 自动设置 fontconfig 以加载播放文件路径下 fonts 文件夹内的字体文件
 *
 * 需要 sub-font-provider=fontconfig
 */

'use strict';

var FONTCONFIG_XML = '<?xml version="1.0"?><!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd"><fontconfig>%XML%</fontconfig>';
var FONTCONFIG_DIR_XML = '<dir>%FONTS_DIR%</dir>';

var msg = mp.msg;
var utils = mp.utils;
var u = {
    absolute_path: function absolute_path(path) {
        if (path.indexOf('/') === 0 || path.match(/^[A-Za-z]:/) !== null) {
            return path;
        }
        return utils.join_path(mp.get_property_native('working-directory'), path);
    },
    dir_exist: function dir_exist(dir) {
        var info = utils.file_info(dir);
        return typeof info === 'object' && info.is_dir;
    },
    file_exist: function file_exist(file) {
        var info = utils.file_info(file);
        return typeof info === 'object' && info.is_file;
    }
};
var fonts_conf = mp.command_native(['expand-path', '~/.auto_load_fonts.conf']);
var options = {
    enable: true,
};
mp.options.read_options(options, 'auto_load_fonts');

/**
 * @param {string} str
 * @returns {string}
 */
function escape_xml(str) {
    return str
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/&/g, "&amp;")
        .replace(/'/g, "&apos;")
        .replace(/"/g, "&quot;");
}

/**
 * @param {str} data
 * @param {boolean} require_exist
 */
function write_fonts_conf(data, require_exist) {
    var exist = u.file_exist(fonts_conf);
    // 做一些检查，避免无用的重复写入。
    if (require_exist && !exist) {
        return;
    }
    if (exist && utils.read_file(fonts_conf) === data) {
        return;
    }
    utils.write_file('file://' + fonts_conf, data);
}

(function () {
    if (!options.enable || mp.get_property_native('sub-font-provider') !== 'fontconfig') {
        return;
    }
    mp.add_hook('on_load', 99, function () {
        var path = mp.get_property_native('path');
        var spaths = utils.split_path(path);
        var fonts_dir = u.absolute_path(utils.join_path(spaths[0], 'fonts'));
        if (!u.dir_exist(spaths[0]) || !u.dir_exist(fonts_dir)) {
            return;
        }
        var xml = FONTCONFIG_DIR_XML.replace('%FONTS_DIR%', escape_xml(fonts_dir));
        xml = FONTCONFIG_XML.replace('%XML%', xml);
        write_fonts_conf(xml);
        msg.info('Set fonts dir: ' + fonts_dir);
    });

    mp.add_hook('on_unload', 99, function () {
        write_fonts_conf(FONTCONFIG_XML.replace('%XML%', ''), true);
    });
})();
