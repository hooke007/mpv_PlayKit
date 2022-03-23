--[[
*****************************************************************
** Context menu for mpv.                                       **
** Origin_ Avi Halachmi https://github.com/avih                **
** Extension_ Thomas Carmichael https://gitlab.com/carmanaught **
*****************************************************************
mpv的tcl图形菜单的核心脚本

建议在 input.conf 中绑定右键以支持唤起菜单
MOUSE_BTN2   script-message-to contextmenu_gui contextmenu_tk
--]]

local langcodes = require "contextmenu_gui_lang"
local function mpdebug(x) mp.msg.info(x) end
local propNative = mp.get_property_native

-- Set options
local options = require "mp.options"
local opt = {
    filter01B = "", filter01C = "", filter01D = "", filter01G = false,
    filter02B = "", filter02C = "", filter02D = "", filter02G = false,
    filter03B = "", filter03C = "", filter03D = "", filter03G = false,
    filter04B = "", filter04C = "", filter04D = "", filter04G = false,
    filter05B = "", filter05C = "", filter05D = "", filter05G = false,
    filter06B = "", filter06C = "", filter06D = "", filter06G = false,
    filter07B = "", filter07C = "", filter07D = "", filter07G = false,
    filter08B = "", filter08C = "", filter08D = "", filter08G = false,
    filter09B = "", filter09C = "", filter09D = "", filter09G = false,
    filter10B = "", filter10C = "", filter10D = "", filter10G = false,

    shader01B = "", shader01C = "", shader01D = "", shader01G = false,
    shader02B = "", shader02C = "", shader02D = "", shader02G = false,
    shader03B = "", shader03C = "", shader03D = "", shader03G = false,
    shader04B = "", shader04C = "", shader04D = "", shader04G = false,
    shader05B = "", shader05C = "", shader05D = "", shader05G = false,
    shader06B = "", shader06C = "", shader06D = "", shader06G = false,
    shader07B = "", shader07C = "", shader07D = "", shader07G = false,
    shader08B = "", shader08C = "", shader08D = "", shader08G = false,
    shader09B = "", shader09C = "", shader09D = "", shader09G = false,
    shader10B = "", shader10C = "", shader10D = "", shader10G = false,
}
options.read_options(opt)

-- Set some constant values
local SEP = "separator"
local CASCADE = "cascade"
local COMMAND = "command"
local CHECK = "checkbutton"
local RADIO = "radiobutton"
local AB = "ab-button"

local function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

-- 版本（Edition）子菜单
local function inspectEdition()
    local editionDisable = false
    if (propNative("edition-list/count") ~= nil and propNative("edition-list/count") < 1) then editionDisable = true end
    return editionDisable
end

local function checkEdition(editionNum)
    local editionState, editionCur = false, propNative("current-edition")
    if (editionNum == editionCur) then editionState = true end
    return editionState
end

local function editionMenu()
    local editionCount = propNative("edition-list/count")
    local editionMenuVal = {}

    if not (editionCount == 0) then
        for editionNum=0, (editionCount - 1), 1 do
            local editionTitle = propNative("edition-list/" .. editionNum .. "/title")
            if not (editionTitle) then editionTitle = "Edition " .. (editionNum + 1) end

            local editionCommand = "set edition " .. editionNum
            table.insert(editionMenuVal, {RADIO, editionTitle, "", editionCommand, function() return checkEdition(editionNum) end, false})
        end
    else
        table.insert(editionMenuVal, {COMMAND, "No Editions", "", "", "", true})
    end

    return editionMenuVal
end

-- 章节子菜单
local function inspectChapter()
    local chapterDisable = false
    if (propNative("chapter-list/count") ~= nil and propNative("chapter-list/count") < 1) then chapterDisable = true end
    return chapterDisable
end

local function checkChapter(chapterNum)
    local chapterState, chapterCur = false, propNative("chapter")
    if (chapterNum == chapterCur) then chapterState = true end
    return chapterState
end

local function chapterMenu()
    local chapterCount = propNative("chapter-list/count")
    local chapterMenuVal = {}

    chapterMenuVal = {
        {COMMAND, "上一章节", "", "add chapter -1", "", false, true},
        {COMMAND, "下一章节", "", "add chapter 1", "", false, true},
    }
    if not (chapterCount == 0) then
        for chapterNum=0, (chapterCount - 1), 1 do
            local chapterTitle = propNative("chapter-list/" .. chapterNum .. "/title")
            if not (chapterTitle) then chapterTitle = "章节 " .. (chapterNum + 1) end

            local chapterCommand = "set chapter " .. chapterNum
            if (chapterNum == 0) then table.insert(chapterMenuVal, {SEP}) end
            table.insert(chapterMenuVal, {RADIO, chapterTitle, "", chapterCommand, function() return checkChapter(chapterNum) end, false, true})
        end
    end

    return chapterMenuVal
end

-- Track type count function to iterate through the track-list and get the number of
-- tracks of the type specified. Types are:  video / audio / sub. This actually
-- returns a table of track numbers of the given type so that the track-list/N/
-- properties can be obtained.

local function trackCount(checkType)
    local tracksCount = propNative("track-list/count")
    local trackCountVal = {}

    if not (tracksCount < 1) then
        for i = 0, (tracksCount - 1), 1 do
            local trackType = propNative("track-list/" .. i .. "/type")
            if (trackType == checkType) then table.insert(trackCountVal, i) end
        end
    end

    return trackCountVal
end

-- Track check function, to check if a track is selected. This isn't specific to a set
-- track type and can be used for the video/audio/sub tracks, since they're all part
-- of the track-list.

local function checkTrack(trackNum)
    local trackState, trackCur = false, propNative("track-list/" .. trackNum .. "/selected")
    if (trackCur == true) then trackState = true end
    return trackState
end

-- 视频轨子菜单
local function inspectVidTrack()
    local vidTrackDisable, vidTracks = false, trackCount("video")
    if (#vidTracks < 1) then vidTrackDisable = true end
    return vidTrackDisable
end

local function vidTrackMenu()
    local vidTrackMenuVal, vidTrackCount = {}, trackCount("video")

    if not (#vidTrackCount == 0) then
        for i = 1, #vidTrackCount, 1 do
            local vidTrackNum = vidTrackCount[i]
            local vidTrackID = propNative("track-list/" .. vidTrackNum .. "/id")
            local vidTrackTitle = propNative("track-list/" .. vidTrackNum .. "/title")
            if not (vidTrackTitle) then vidTrackTitle = "视频轨 " .. i end

            local vidTrackCommand = "set vid " .. vidTrackID
            table.insert(vidTrackMenuVal, {RADIO, vidTrackTitle, "", vidTrackCommand, function() return checkTrack(vidTrackNum) end, false, true})
        end
    else
        table.insert(vidTrackMenuVal, {RADIO, "无视频轨", "", "", "", true})
    end

    return vidTrackMenuVal
end

-- Convert ISO 639-1/639-2 codes to be full length language names. The full length names
-- are obtained by using the property accessor with the iso639_1/_2 tables stored in
-- the contextmenu_gui_lang.lua file (require "langcodes" above).
function getLang(trackLang)
    trackLang = string.upper(trackLang)
    if (string.len(trackLang) == 2) then trackLang = langcodes.iso639_1(trackLang)
    elseif (string.len(trackLang) == 3) then trackLang = langcodes.iso639_2(trackLang) end
    return trackLang
end

function noneCheck(checkType)
    local checkVal, trackID = false, propNative(checkType)
    if (type(trackID) == "boolean") then
        if (trackID == false) then checkVal = true end
    end
    return checkVal
end

-- 音频轨子菜单
local function audTrackMenu()
    local audTrackMenuVal, audTrackCount = {}, trackCount("audio")

    audTrackMenuVal = {
         {COMMAND, "重载当前音频轨（限外挂）", "", "audio-reload", "", false},
         {COMMAND, "移除当前音频轨（限外挂）", "", "audio-remove", "", false},
    }
    if not (#audTrackCount == 0) then
        for i = 1, (#audTrackCount), 1 do
            local audTrackNum = audTrackCount[i]
            local audTrackID = propNative("track-list/" .. audTrackNum .. "/id")
            local audTrackTitle = propNative("track-list/" .. audTrackNum .. "/title")
            local audTrackLang = propNative("track-list/" .. audTrackNum .. "/lang")
            -- Convert ISO 639-1/2 codes
            if not (audTrackLang == nil) then audTrackLang = getLang(audTrackLang) and getLang(audTrackLang) or audTrackLang end

            if (audTrackTitle) then audTrackTitle = audTrackTitle .. ((audTrackLang ~= nil) and " (" .. audTrackLang .. ")" or "")
            elseif (audTrackLang) then audTrackTitle = audTrackLang
            else audTrackTitle = "Audio Track " .. i end

            local audTrackCommand = "set aid " .. audTrackID
            if (i == 1) then
                table.insert(audTrackMenuVal, {RADIO, "不渲染音频", "", "set aid 0", function() return noneCheck("aid") end, false, true})
                table.insert(audTrackMenuVal, {SEP})
            end
            table.insert(audTrackMenuVal, {RADIO, audTrackTitle, "", audTrackCommand, function() return checkTrack(audTrackNum) end, false, true})
        end
    end

    return audTrackMenuVal
end

-- Subtitle label
local function subVisLabel() return propNative("sub-visibility") and "隐藏" or "取消隐藏" end

-- 字幕轨子菜单
local function subTrackMenu()
    local subTrackMenuVal, subTrackCount = {}, trackCount("sub")

    subTrackMenuVal = {
        {COMMAND, "重载当前字幕轨（限外挂）", "", "sub-reload", "", false},
        {COMMAND, "移除当前字幕轨（限外挂）", "", "sub-remove", "", false},
        {CHECK, function() return subVisLabel() end, "", "cycle sub-visibility", function() return not propNative("sub-visibility") end, false, true},
    }
    if not (#subTrackCount == 0) then
        for i = 1, (#subTrackCount), 1 do
            local subTrackNum = subTrackCount[i]
            local subTrackID = propNative("track-list/" .. subTrackNum .. "/id")
            local subTrackTitle = propNative("track-list/" .. subTrackNum .. "/title")
            local subTrackLang = propNative("track-list/" .. subTrackNum .. "/lang")
            -- Convert ISO 639-1/2 codes
            if not (subTrackLang == nil) then subTrackLang = getLang(subTrackLang) and getLang(subTrackLang) or subTrackLang end

            if (subTrackTitle) then subTrackTitle = subTrackTitle .. ((subTrackLang ~= nil) and " (" .. subTrackLang .. ")" or "")
            elseif (subTrackLang) then subTrackTitle = subTrackLang
            else subTrackTitle = "Subtitle Track " .. i end

            local subTrackCommand = "set sid " .. subTrackID
            if (i == 1) then
                table.insert(subTrackMenuVal, {RADIO, "不渲染字幕", "", "set sid 0", function() return noneCheck("sid") end, false, true})
                table.insert(subTrackMenuVal, {SEP})
            end
            table.insert(subTrackMenuVal, {RADIO, subTrackTitle, "", subTrackCommand, function() return checkTrack(subTrackNum) end, false, true})
        end
    end

    return subTrackMenuVal
end

local function stateABLoop()
    local abLoopState = ""
    local abLoopA, abLoopB = propNative("ab-loop-a"), propNative("ab-loop-b")

    if (abLoopA == "no") and (abLoopB == "no") then abLoopState =  "off"
    elseif not (abLoopA == "no") and (abLoopB == "no") then abLoopState = "a"
    elseif not (abLoopA == "no") and not (abLoopB == "no") then abLoopState = "b" end

    return abLoopState
end

local function stateFileLoop()
    local loopState, loopval = false, propNative("loop-file")
    if (loopval == "inf") then loopState = true end
    return loopState
end

-- 长宽比子菜单
local function stateRatio(ratioVal)
    -- Ratios and Decimal equivalents
    -- Ratios:    "4:3" "16:10"  "16:9" "1.85:1" "2.35:1"
    -- Decimal: "1.333" "1.600" "1.778"  "1.850"  "2.350"
    local ratioState = false
    local ratioCur = round(propNative("video-aspect-override"), 3)

    if (ratioVal == "4:3") and (ratioCur == round(4/3, 3)) then ratioState = true
    elseif (ratioVal == "16:10") and (ratioCur == round(16/10, 3)) then ratioState = true
    elseif (ratioVal == "16:9") and (ratioCur == round(16/9, 3)) then ratioState = true
    elseif (ratioVal == "1.85:1") and (ratioCur == round(1.85/1, 3)) then ratioState = true
    elseif (ratioVal == "2.35:1") and (ratioCur == round(2.35/1, 3)) then ratioState = true
    end

    return ratioState
end

-- 解码模式子菜单
local function stateHwdec(hwdecVal)

    local hwdecState = false
    local hwdecCur = propNative("hwdec-current")

    if (hwdecVal == "no") and (hwdecCur == "no" or hwdecCur == "") then hwdecState = true
    elseif (hwdecVal == "dxva2") and (hwdecCur == "dxva2") then hwdecState = true
    elseif (hwdecVal == "dxva2-copy") and (hwdecCur == "dxva2-copy") then hwdecState = true
    elseif (hwdecVal == "d3d11va") and (hwdecCur == "d3d11va") then hwdecState = true
    elseif (hwdecVal == "d3d11va-copy") and (hwdecCur == "d3d11va-copy") then hwdecState = true
    elseif (hwdecVal == "qsv") and (hwdecCur == "qsv") then hwdecState = true
    elseif (hwdecVal == "qsv-copy") and (hwdecCur == "qsv-copy") then hwdecState = true
    elseif (hwdecVal == "cuda") and (hwdecCur == "cuda") then hwdecState = true
    elseif (hwdecVal == "cuda-copy") and (hwdecCur == "cuda-copy") then hwdecState = true
    elseif (hwdecVal == "nvdec") and (hwdecCur == "nvdec") then hwdecState = true
    elseif (hwdecVal == "nvdec-copy") and (hwdecCur == "nvdec-copy") then hwdecState = true

    end

    return hwdecState
end

-- Video Rotate radio item check
local function stateRotate(rotateVal)
    local rotateState, rotateCur = false, propNative("video-rotate")
    if (rotateVal == rotateCur) then rotateState = true end
    return rotateState
end

-- Video Alignment radio item checks
local function stateAlign(alignAxis, alignPos)
    local alignState = false
    local alignValY, alignValX = propNative("video-align-y"), propNative("video-align-x")

    -- This seems a bit unwieldy. Should look at simplifying if possible.
    if (alignAxis == "y") then
        if (alignPos == alignValY) then alignState = true end
    elseif (alignAxis == "x") then
        if (alignPos == alignValX) then alignState = true end
    end

    return alignState
end

-- Deinterlacing radio item check
local function stateDeInt(deIntVal)
    local deIntState, deIntCur = false, propNative("deinterlace")
    if (deIntVal == deIntCur) then deIntState = true end
    return deIntState
end

local function stateFlip(flipVal)
    local vfState, vfVals = false, propNative("vf")
    for i, vf in pairs(vfVals) do
        if (vf["name"] == flipVal) then vfState = true end
    end
    return vfState
end

-- Mute label
local function muteLabel() return propNative("mute") and "取消静音" or "静音" end

-- 输出声道子菜单
local audio_channels = { {"自动（安全）", "auto-safe"}, {"自动", "auto"}, {"无", "empty"}, {"单声道", "mono"}, {"立体声", "stereo"}, {"2.1", "2.1"}, {"5.1（标准）", "5.1"}, {"7.1（标准）", "7.1"} }

-- Create audio key/value pairs to check against the native property
-- e.g. audio_pair["2.1"] = "2.1", etc.
local audio_pair = {}
for i = 1, #audio_channels do
    audio_pair[audio_channels[i][2]] = audio_channels[i][2]
end

-- Audio channel layout radio item check
local function stateAudChannel(audVal)
    local audState, audLayout = false, propNative("audio-channels")

    audState = (audio_pair[audVal] == audLayout) and true or false
    return audState
end

-- Audio channel layout menu creation
local function audLayoutMenu()
    local audLayoutMenuVal = {}

    for i = 1, #audio_channels do
        if (i == 3) then table.insert(audLayoutMenuVal, {SEP}) end
        table.insert(audLayoutMenuVal, {RADIO, audio_channels[i][1], "", "set audio-channels \"" .. audio_channels[i][2] .. "\"", function() return stateAudChannel(audio_channels[i][2]) end, false, true})
    end

    return audLayoutMenuVal
end

-- OSD时间轴检查
local function stateOsdLevel(osdLevelVal)
    local osdLevelState, osdLevelCur = false, propNative("osd-level")
    osdLevelState = (osdLevelVal == osdLevelCur) and true or false
    return osdLevelState
end

-- Subtitle Alignment radio item check
local function stateSubAlign(subAlignVal)
    local subAlignState, subAlignCur = false, propNative("sub-align-y")
    subAlignState = (subAlignVal == subAlignCur) and true or false
    return subAlignState
end

-- Subtitle Position radio item check
local function stateSubPos(subPosVal)
    local subPosState, subPosCur = false, propNative("image-subs-video-resolution")
    subPosState = (subPosVal == subPosCur) and true or false
    return subPosState
end

local function movePlaylist(direction)
    local playlistPos, newPos = propNative("playlist-pos"), 0
    -- We'll remove 1 here to "0 index" the value since we're using it with playlist-pos
    local playlistCount = propNative("playlist-count") - 1

    if (direction == "up") then
        newPos = playlistPos - 1
        if not (playlistPos == 0) then
            mp.commandv("plalist-move", playlistPos, newPos)
        else mp.osd_message("已排最前") end
    elseif (direction == "down") then
        if not (playlistPos == playlistCount) then
            newPos = playlistPos + 2
            mp.commandv("plalist-move", playlistPos, newPos)
        else mp.osd_message("已排最后") end
    end
end

local function statePlayLoop()
    local loopState, loopVal = false, propNative("loop-playlist")
    if not (tostring(loopVal) == "false") then loopState = true end
    return loopState
end

local function stateOnTop(onTopVal)
    local onTopState, onTopCur = false, propNative("ontop")
    onTopState = (onTopVal == onTopCur) and true or false
    return onTopState
end

--[[ ************ 菜单内容 ************ ]]--

local menuList = {}

-- Format for object tables
-- {Item Type, Label, Accelerator, Command, Item State, Item Disable, Repost Menu (Optional)}

-- Item Type - The type of item, e.g. CASCADE, COMMAND, CHECK, RADIO, etc
-- Label - The label for the item
-- Accelerator - The text shortcut/accelerator for the item
-- Command - This is the command to run when the item is clicked
-- Item State - The state of the item (selected/unselected). A/B Repeat is a special case.
-- Item Disable - Whether to disable
-- Repost Menu (Optional) - This is only for use with the Tk menu and is optional (only needed
-- if the intent is for the menu item to cause the menu to repost)

-- Item Type, Label and Accelerator should all evaluate to strings as a result of the return
-- from a function or be strings themselves.
-- Command can be a function or string, this will be handled after a click.
-- Item State and Item Disable should normally be boolean but can be a string for A/B Repeat.
-- Repost Menu (Optional) should only be boolean and is only needed if the value is true.

-- The 'file_loaded_menu' value is used when the table is passed to the menu-engine to handle the
-- behavior of the 'playback_only' (cancellable) argument.

-- This is to be shown when nothing is open yet and is a small subset of the greater menu that
-- will be overwritten when the full menu is created.
menuList = {
    file_loaded_menu = false,

-- 一级菜单（未导入文件时）
    context_menu = {
        {CASCADE, "加载", "open_menu", "", "", false},
        {SEP},
        {CASCADE, "画面", "output_menu", "", "", false},
        {SEP},
        {CASCADE, "其它", "etc_menu", "", "", false},
        {SEP},
        {CASCADE, "关于", "about_menu", "", "", false},
        {COMMAND, "退出 mpv", "", "quit", "", false},
    },

-- 二级菜单 —— 加载
    open_menu = {
        {COMMAND, "【外置脚本】文件", "", "script-binding open_dialog/import_files", "", false},
        {COMMAND, "【外置脚本】地址", "", "script-binding open_dialog/import_url", "", false},
    },

-- 二级菜单 —— 画面
    output_menu = {
        {CHECK, "窗口置顶", "", "cycle ontop", function() return propNative("ontop") end, false},
        {CHECK, "窗口边框", "", "cycle border", function() return not propNative("border") end, false},
        {CHECK, "全屏", "", "cycle fullscreen", function() return propNative("fullscreen") end, false},
    },

-- 二级菜单 —— 其它
    etc_menu = {
        {COMMAND, "【内部脚本】状态信息（开/关）", "", "script-binding stats/display-stats-toggle", "", false},
        {COMMAND, "【内部脚本】状态信息-概览", "", "script-binding stats/display-page-1", "", false},
        {COMMAND, "【内部脚本】状态信息-帧计时（可翻页）", "", "script-binding stats/display-page-2", "", false},
        {COMMAND, "【内部脚本】状态信息-输入缓存", "", "script-binding stats/display-page-3", "", false},
        {COMMAND, "【内部脚本】状态信息-快捷键（可翻页）", "", "script-binding stats/display-page-4", "", false},
        {COMMAND, "【内部脚本】状态信息-内部流（可翻页）", "", "script-binding stats/display-page-0", "", false},
        {COMMAND, "【内部脚本】控制台", "", "script-binding console/enable", "", false},
    },

-- 二级菜单 —— 关于
    about_menu = {
        {COMMAND, mp.get_property("mpv-version"), "", "", "", false},
        {COMMAND, "ffmpeg " .. mp.get_property("ffmpeg-version"), "", "", "", false},
        {COMMAND, "libass " .. mp.get_property("libass-version"), "", "", "", false},
    },

}

-- DO NOT create the "playing" menu tables until AFTER the file has loaded as we're unable to
-- dynamically create some menus if it tries to build the table before the file is loaded.
-- A prime example is the chapter-list or track-list values, which are unavailable until
-- the file has been loaded.

mp.register_event("file-loaded", function()
    menuList = {
        file_loaded_menu = true,

-- 一级菜单（已导入文件后）
        context_menu = {
            {CASCADE, "加载", "open_menu", "", "", false},
            {SEP},
            {CASCADE, "文件", "file_menu", "", "", false},
            {CASCADE, "导航", "navi_menu", "", "", false},
            {CASCADE, "画面", "output_menu", "", "", false},
            {CASCADE, "视频", "video_menu", "", "", false},
            {CASCADE, "音频", "audio_menu", "", "", false},
            {CASCADE, "字幕", "subtitle_menu", "", "", false},
            {SEP},
            {CASCADE, "滤镜", "filter_menu", "", "", false},
            {CASCADE, "着色器", "shader_menu", "", "", false},
            {CASCADE, "其它", "etc_menu", "", "", false},
            {SEP},
            {CASCADE, "关于", "about_menu", "", "", false},
            {COMMAND, "退出并保存当前文件状态", "", "quit-watch-later", "", false},
            {COMMAND, "退出 mpv", "", "quit", "", false},
        },

-- 二级菜单 —— 加载
        open_menu = {
            {COMMAND, "【外置脚本】文件", "", "script-binding open_dialog/import_files", "", false},
            {COMMAND, "【外置脚本】地址", "", "script-binding open_dialog/import_url", "", false},
            {COMMAND, "【外置脚本】追加音轨", "", "script-binding open_dialog/append_aid", "", false},
            {COMMAND, "【外置脚本】追加字幕轨", "", "script-binding open_dialog/append_sid", "", false},
            {COMMAND, "【外置脚本】指定次字幕（滤镜）", "", "script-binding open_dialog/append_vfSub", "", false},
            {COMMAND, "【外置脚本】显示/隐藏次字幕（滤镜）", "", "script-binding open_dialog/toggle_vfSub", "", false},
            {COMMAND, "【外置脚本】移除次字幕（滤镜）", "", "script-binding open_dialog/remove_vfSub", "", false},
            {SEP},
            {COMMAND, "播放列表乱序重排", "", "playlist-shuffle", "", false},
            {CHECK, "列表循环", "", "cycle-values loop-playlist inf no", function() return statePlayLoop() end, false, true},
            {CHECK, "随机播放", "", "cycle shuffle", function() return propNative("shuffle") end, false, true},
            {COMMAND, "上个文件", "", "playlist-prev", "", false, true},
            {COMMAND, "下个文件", "", "playlist-next", "", false, true},
        },

-- 二级菜单 —— 文件
        file_menu = {
            {CHECK, "播放/暂停", "", "cycle pause", function() return propNative("pause") end, false, true},
            {COMMAND, "停止", "", "stop", "", false},
            {SEP},
            {COMMAND, "显示OSD时间轴", "", "no-osd cycle-values osd-level 3 1", "", false},
            {RADIO, "开", "", "set osd-level 3", function() return stateOsdLevel(3) end, false},
            {RADIO, "关", "", "set osd-level 1", function() return stateOsdLevel(1) end, false},  
            {SEP},
            {AB, "A-B循环", "", "ab-loop", function() return stateABLoop() end, false, true},
            {CHECK, "循环播放", "", "cycle-values loop-file inf no", function() return stateFileLoop() end, false},
            {SEP},
            {COMMAND, "速度 -0.1", "", "add speed -0.1", "", false, true},
            {COMMAND, "速度 +0.1", "", "add speed 0.1", "", false, true},
            {COMMAND, "半速", "", "set speed 0.5", "", false, true},
            {COMMAND, "倍速", "", "set speed 2", "", false, true},
            {COMMAND, "重置速度", "", "set speed 1", "", false},
        },

-- 二级菜单 —— 导航
        navi_menu = {
            {COMMAND, "【外置脚本】OSD高级播放列表", "", "script-binding playlistmanager/showplaylist", "", false},
            {COMMAND, "OSD轨道信息", "", "show-text ${track-list} 5000", "", false},
            {COMMAND, "重播", "", "seek 0 absolute", "", false},
            {COMMAND, "上一帧", "", "frame-back-step", "", false, true},
            {COMMAND, "下一帧", "", "frame-step", "", false, true},
            {COMMAND, "后退10秒", "", "seek -10", "", false, true},
            {COMMAND, "前进10秒", "", "seek 10", "", false, true},
            {CASCADE, "版本（Edition）", "edition_menu", "", "", function() return inspectEdition() end},
            {CASCADE, "章节", "chapter_menu", "", "", function() return inspectChapter() end},
        },

        -- Use functions returning tables, since we don't need these menus if there aren't any editions or any chapters to seek through.
        edition_menu = editionMenu(),
        chapter_menu = chapterMenu(),

-- 二级菜单 —— 画面
        output_menu = {
            {CHECK, "窗口置顶", "", "cycle ontop", function() return propNative("ontop") end, false},
--            {COMMAND, "窗口置顶", "", "cycle ontop", "", false, true},
--            {RADIO, "关", "", "set ontop yes", function() return stateOnTop(false) end, false, true},
--            {RADIO, "开", "", "set ontop no", function() return stateOnTop(true) end, false, true},
            {CHECK, "窗口边框", "", "cycle border", function() return not propNative("border") end, false},
            {CHECK, "全屏", "", "cycle fullscreen", function() return propNative("fullscreen") end, false},
            {COMMAND, "裁切填充（无/最大）", "", "cycle-values panscan 0.0 1.0", "", false},
            {CASCADE, "长宽比", "aspect_menu", "", "", false},
            {COMMAND, "左旋转", "", "cycle-values video-rotate 0 270 180 90", "", false, true},
            {COMMAND, "右旋转", "", "cycle-values video-rotate 0 90 180 270", "", false, true},
            {SEP},
            {COMMAND, "缩小", "", "add video-zoom -0.1", "", false, true},
            {COMMAND, "放大", "", "add video-zoom 0.1", "", false, true},
            {COMMAND, "重置大小", "", "set video-zoom 0", "", false},
            {SEP},
            {COMMAND, "窗口缩小", "", "add current-window-scale -0.1", "", false, true},
            {COMMAND, "窗口放大", "", "add current-window-scale 0.1", "", false, true},
            {COMMAND, "重置窗口大小", "", "set current-window-scale 1", "", false},
        },

-- 三级菜单 —— 长宽比
        aspect_menu = {
            {COMMAND, "重置", "", "set video-aspect-override -1", "", false},
            {RADIO, "强制4:3", "", "set video-aspect-override 4:3", function() return stateRatio("4:3") end, false},
            {RADIO, "强制16:9", "", "set video-aspect-override 16:9", function() return stateRatio("16:9") end, false},
            {RADIO, "强制16:10", "", "set video-aspect-override 16:10", function() return stateRatio("16:10") end, false},
            {RADIO, "强制1.85:1", "", "set video-aspect-override 1.85:1", function() return stateRatio("1.85:1") end, false},
            {RADIO, "强制2.35:1", "", "set video-aspect-override 2.35:1", function() return stateRatio("2.35:1") end, false},
        },

-- 二级菜单 —— 视频
        video_menu = {
            {CASCADE, "轨道", "vidtrack_menu", "", "", function() return inspectVidTrack() end},
            {SEP},
            {CASCADE, "解码模式", "hwdec_menu", "", "", false},
            {CHECK, "去色带", "", "cycle deband", function() return propNative("deband") end, false},
            {SEP},
            {COMMAND, "去隔行扫描", "", "cycle deinterlace", "", false},
            {RADIO, "关", "", "set deinterlace no", function() return stateDeInt(false) end, false, true},
            {RADIO, "开", "", "set deinterlace yes", function() return stateDeInt(true) end, false, true},
            {SEP},
            {CHECK, "自动ICC校色", "", "cycle icc-profile-auto", function() return propNative("icc-profile-auto") end, false},
            {CASCADE, "均衡器", "equalizer_menu", "", "", false},
            {CASCADE, "截屏", "screenshot_menu", "", "", false},
        },

        -- Use function to return list of Video Tracks
        vidtrack_menu = vidTrackMenu(),

-- 三级菜单 —— 解码
        hwdec_menu = {
            {COMMAND, "优先 软解", "", "set hwdec no", "", false},
            {COMMAND, "优先 硬解", "", "set hwdec yes", "", false},
            {COMMAND, "优先 硬解（增强）", "", "set hwdec auto-copy", "", false},
            {SEP},
            {RADIO, "SW", "", "set hwdec no", function() return stateHwdec("no") end, false},
            {RADIO, "dxva2", "", "set hwdec dxva2", function() return stateHwdec("dxva2") end, false},
            {RADIO, "dxva2-copy", "", "set hwdec dxva2-copy", function() return stateHwdec("dxva2-copy") end, false},
            {RADIO, "d3d11va", "", "set hwdec d3d11va", function() return stateHwdec("d3d11va") end, false},
            {RADIO, "d3d11va-copy", "", "set hwdec d3d11va-copy", function() return stateHwdec("d3d11va-copy") end, false},
            {RADIO, "qsv", "", "set hwdec qsv", function() return stateHwdec("qsv") end, false},
            {RADIO, "qsv-copy", "", "set hwdec qsv-copy", function() return stateHwdec("qsv-copy") end, false},
            {RADIO, "cuda", "", "set hwdec cuda", function() return stateHwdec("cuda") end, false},
            {RADIO, "cuda-copy", "", "set hwdec cuda-copy", function() return stateHwdec("cuda-copy") end, false},
            {RADIO, "nvdec", "", "set hwdec nvdec", function() return stateHwdec("nvdec") end, false},
            {RADIO, "nvdec-copy", "", "set hwdec nvdec-copy", function() return stateHwdec("nvdec-copy") end, false},

        },

-- 三级菜单 —— 均衡器
        equalizer_menu = {
            {COMMAND, "重置", "", "no-osd set contrast 0; no-osd set brightness 0; no-osd set gamma 0; no-osd set saturation 0; no-osd set hue 0", "", false},
            {COMMAND, "对比 -1", "", "add contrast -1", "", false, true},
            {COMMAND, "对比 +1", "", "add contrast 1 ", "", false, true},
            {COMMAND, "明亮 -1", "", "add brightness -1", "", false, true},
            {COMMAND, "明亮 +1", "", "add brightness 1 ", "", false, true},
            {COMMAND, "伽马 -1", "", "add gamma -1", "", false, true},
            {COMMAND, "伽马 +1", "", "add gamma 1 ", "", false, true},
            {COMMAND, "饱和 -1", "", "add saturation -1", "", false, true},
            {COMMAND, "饱和 +1", "", "add saturation 1 ", "", false, true},
            {COMMAND, "色相 -1", "", "add hue -1", "", false, true},
            {COMMAND, "色相 +1", "", "add hue 1 ", "", false, true},
        },

-- 三级菜单 —— 截屏
        screenshot_menu = {
            {COMMAND, "同源尺寸-有字幕-有OSD-单帧", "", "screenshot subtitles", "", false},
            {COMMAND, "同源尺寸-无字幕-无OSD-单帧", "", "screenshot video", "", false},
            {COMMAND, "实际尺寸-有字幕-有OSD-单帧", "", "screenshot window", "", false},
            {SEP},
            {COMMAND, "同源尺寸-有字幕-有OSD-逐帧", "", "screenshot subtitles+each-frame", "", false, true},
            {COMMAND, "同源尺寸-无字幕-无OSD-逐帧", "", "screenshot video+each-frame", "", false, true},
            {COMMAND, "实际尺寸-有字幕-有OSD-逐帧", "", "screenshot window+each-frame", "", false, true},
        },

-- 二级菜单 —— 音频
        audio_menu = {
            {CASCADE, "轨道", "audtrack_menu", "", "", false},
            {SEP},
            {COMMAND, "音量 -1", "", "add volume -1", "", false, true},
            {COMMAND, "音量 +1", "", "add volume  1", "", false, true},
            {CHECK, function() return muteLabel() end, "", "cycle mute", function() return propNative("mute") end, false},
            {SEP},
            {COMMAND, "延迟 -0.1", "", "add audio-delay -0.1", "", false, true},
            {COMMAND, "延迟 +0.1", "", "add audio-delay +0.1", "", false, true},
            {COMMAND, "重置偏移", "", "set audio-delay 0", "", false},
            {SEP},
            {COMMAND, "上个输出设备", "", "script-binding cycle_adevice/back", "", false, true},
            {COMMAND, "下个输出设备", "", "script-binding cycle_adevice/next", "", false, true},
            {CASCADE, "声道布局", "channel_layout", "", "", false},
        },

        -- Use function to return list of Audio Tracks
        audtrack_menu = audTrackMenu(),
        channel_layout = audLayoutMenu(),

-- 二级菜单 —— 字幕
        subtitle_menu = {
            {CASCADE, "轨道", "subtrack_menu", "", "", false},
            {SEP},
            {COMMAND, "重置", "", "no-osd set sub-delay 0; no-osd set sub-pos 100; no-osd set sub-scale 1.0", "", false},
            {COMMAND, "字号 -0.1", "", "add sub-scale -0.1", "", false, true},
            {COMMAND, "字号 +0.1", "", "add sub-scale  0.1", "", false, true},
            {COMMAND, "延迟 -0.1", "", "add sub-delay -0.1", "", false, true},
            {COMMAND, "延迟 +0.1", "", "add sub-delay  0.1", "", false, true},
            {COMMAND, "上移", "", "add sub-pos -1", "", false, true},
            {COMMAND, "下移", "", "add sub-pos 1", "", false, true},
            {SEP},
            {COMMAND, "字幕纵向位置", "", "cycle-values sub-align-y top bottom", "", false, true},
            {RADIO, "顶部", "", "set sub-align-y top", function() return stateSubAlign("top") end, false},
            {RADIO, "底部", "", "set sub-align-y bottom", function() return stateSubAlign("bottom") end, false},
        },

        -- Use function to return list of Subtitle Tracks
        subtrack_menu = subTrackMenu(),

-- 二级菜单 —— 滤镜
        filter_menu = {
            {COMMAND, "清除全部视频滤镜", "", "vf clr \"\"", "", false},
            {COMMAND, "清除全部音频滤镜", "", "af clr \"\"", "", false},
            {SEP},
            {COMMAND, opt.filter01B, opt.filter01C, opt.filter01D, "", false, opt.filter01G},
            {COMMAND, opt.filter02B, opt.filter02C, opt.filter02D, "", false, opt.filter02G},
            {COMMAND, opt.filter03B, opt.filter03C, opt.filter03D, "", false, opt.filter03G},
            {COMMAND, opt.filter04B, opt.filter04C, opt.filter04D, "", false, opt.filter04G},
            {COMMAND, opt.filter05B, opt.filter05C, opt.filter05D, "", false, opt.filter05G},
            {COMMAND, opt.filter06B, opt.filter06C, opt.filter06D, "", false, opt.filter06G},
            {COMMAND, opt.filter07B, opt.filter07C, opt.filter07D, "", false, opt.filter07G},
            {COMMAND, opt.filter08B, opt.filter08C, opt.filter08D, "", false, opt.filter08G},
            {COMMAND, opt.filter09B, opt.filter09C, opt.filter09D, "", false, opt.filter09G},
            {COMMAND, opt.filter10B, opt.filter10C, opt.filter10D, "", false, opt.filter10G},
        },

-- 二级菜单 —— 着色器
        shader_menu = {
            {COMMAND, "清除全部着色器", "", "change-list glsl-shaders clr \"\"", "", false},
            {SEP},
            {COMMAND, opt.shader01B, opt.shader01C, opt.shader01D, "", false, opt.shader01G},
            {COMMAND, opt.shader02B, opt.shader02C, opt.shader02D, "", false, opt.shader02G},
            {COMMAND, opt.shader03B, opt.shader03C, opt.shader03D, "", false, opt.shader03G},
            {COMMAND, opt.shader04B, opt.shader04C, opt.shader04D, "", false, opt.shader04G},
            {COMMAND, opt.shader05B, opt.shader05C, opt.shader05D, "", false, opt.shader05G},
            {COMMAND, opt.shader06B, opt.shader06C, opt.shader06D, "", false, opt.shader06G},
            {COMMAND, opt.shader07B, opt.shader07C, opt.shader07D, "", false, opt.shader07G},
            {COMMAND, opt.shader08B, opt.shader08C, opt.shader08D, "", false, opt.shader08G},
            {COMMAND, opt.shader09B, opt.shader09C, opt.shader09D, "", false, opt.shader09G},
            {COMMAND, opt.shader10B, opt.shader10C, opt.shader10D, "", false, opt.shader10G},
        },

-- 二级菜单 —— 其它
        etc_menu = {
            {COMMAND, "【内部脚本】状态信息（开/关）", "", "script-binding stats/display-stats-toggle", "", false},
            {COMMAND, "【内部脚本】状态信息-概览", "", "script-binding stats/display-page-1", "", false},
            {COMMAND, "【内部脚本】状态信息-帧计时（可翻页）", "", "script-binding stats/display-page-2", "", false},
            {COMMAND, "【内部脚本】状态信息-输入缓存", "", "script-binding stats/display-page-3", "", false},
            {COMMAND, "【内部脚本】状态信息-快捷键（可翻页）", "", "script-binding stats/display-page-4", "", false},
            {COMMAND, "【内部脚本】状态信息-内部流（可翻页）", "", "script-binding stats/display-page-0", "", false},
            {COMMAND, "【内部脚本】控制台", "", "script-binding console/enable", "", false},
        },

-- 二级菜单 —— 关于
        about_menu = {
            {COMMAND, mp.get_property("mpv-version"), "", "", "", false},
            {COMMAND, "ffmpeg " .. mp.get_property("ffmpeg-version"), "", "", "", false},
            {COMMAND, "libass " .. mp.get_property("libass-version"), "", "", "", false},
        },

--[[
留着备用
            -- Y Values: -1 = Top, 0 = Vertical Center, 1 = Bottom
            -- X Values: -1 = Left, 0 = Horizontal Center, 1 = Right
            {RADIO, "Top", "", "set video-align-y -1", function() return stateAlign("y",-1) end, false, true},
            {RADIO, "Vertical Center", "", "set video-align-y 0", function() return stateAlign("y",0) end, false, true},
            {RADIO, "Bottom", "", "set video-align-y 1", function() return stateAlign("y",1) end, false, true},
            {RADIO, "Left", "", "set video-align-x -1", function() return stateAlign("x",-1) end, false, true},
            {RADIO, "Horizontal Center", "", "set video-align-x 0", function() return stateAlign("x",0) end, false, true},
            {RADIO, "Right", "", "set video-align-x 1", function() return stateAlign("x",1) end, false, true},
            {CHECK, "Flip Vertically", "", "vf toggle vflip", function() return stateFlip("vflip") end, false, true},
            {CHECK, "Flip Horizontally", "", "vf toggle hflip", function() return stateFlip("hflip") end, false, true}

            {RADIO, "Display on Letterbox", "", "set image-subs-video-resolution \"no\"", function() return stateSubPos(false) end, false, true},
            {RADIO, "Display in Video", "", "set image-subs-video-resolution \"yes\"", function() return stateSubPos(true) end, false, true},
            {COMMAND, "Move Up", "", function() movePlaylist("up") end, "", function() return (propNative("playlist-count") < 2) and true or false end, true},
            {COMMAND, "Move Down", "", function() movePlaylist("down") end, "", function() return (propNative("playlist-count") < 2) and true or false end, true},
]]--

    }

    -- This check ensures that all tables of data without SEP in them are 6 or 7 items long.
    for key, value in pairs(menuList) do
        -- Skip the 'file_loaded_menu' key as the following for loop will fail due to an
        -- attempt to get the length of a boolean value.
        if (key == "file_loaded_menu") then goto keyjump end

        for i = 1, #value do
            if (value[i][1] ~= SEP) then
                if (#value[i] < 6 or #value[i] > 7) then mpdebug("Menu item at index of " .. i .. " is " .. #value[i] .. " items long for: " .. key) end
            end
        end
        
        ::keyjump::
    end
end)

--[[ ************ 菜单内容 ************ ]]--

local menuEngine = require "contextmenu_gui_engine"

mp.register_script_message("contextmenu_tk", function()
    menuEngine.createMenu(menuList, "context_menu", -1, -1, "tk")
end)

