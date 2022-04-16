--[[
SOURCE_ https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/autoload.lua
COMMIT_ 20210624 ee27629
SOURCE_ https://github.com/rossy/mpv-open-file-dialog
COMMIT_ 20160310 04fe818

功能集一：
  列表文件为1时自动填充同目录下的其它文件，可使用对应的 load_plus.conf 管理脚本设置。

功能集二：
  自定义快捷键 在mpv中唤起一个打开文件的窗口用于快速加载文件/网址
示例：在 input.conf 中另起写入下列内容
w        script-binding    load_plus/import_files   # 打开文件
W        script-binding    load_plus/import_url     # 打开地址
CTRL+w   script-binding    load_plus/append_aid     # 追加其它音轨（不切换）
ALT+w    script-binding    load_plus/append_sid     # 追加其它字幕（切换）
e        script-binding    load_plus/append_vfSub   # 装载次字幕（滤镜型）
E        script-binding    load_plus/toggle_vfSub   # 隐藏/显示 当前的次字幕（滤镜型）
CTRL+e   script-binding    load_plus/remove_vfSub   # 移除次字幕（滤镜型）
]]--

local msg = require 'mp.msg'
local options = require 'mp.options'
local utils = require 'mp.utils'

opt = {
    level = -1,          -- <-1/0/1> 自动填充的等级，分别对应 按预设条件/始终阻止/仅近似名文件
    video = true,        -- <yes/no> 是否填充视频
    audio = false,       -- <yes/no> 是否填充音频
    image = false,       -- <yes/no> 是否填充图片
    skip_hidden = true,  -- <yes/no> 跳过隐藏文件（当资源管理器内勾选“显示隐藏的文件”时无效）
    max_entries = 150    -- <大于0的整数> 当前条目前后各追加的文件数 
}
options.read_options(opt)

--
-- 单文件时自动补充队列
--

function Set (t)
    local set = {}
    for _, v in pairs(t) do set[v] = true end
    return set
end

function SetUnion (a,b)
    local res = {}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end

EXTENSIONS_VIDEO = Set {
    '3gp',
    'amv','asf','avi',
    'f4v','flv',
    'm2ts','m4v','mkv','mov','mp4','mpeg','mpg',
    'ogv',
    'rm','rmvb',
    'ts',
    'vob',
    'webm','wmv',
}

EXTENSIONS_AUDIO = Set {
    'aac','aiff','alac','ape',
    'dsf',
    'flac',
    'm4a','mp3',
    'ogg','opus',
    'tak','tta',
    'wav','wma','wv',
}

EXTENSIONS_IMAGE = Set {
    'apng','avif',
    'bmp',
    'gif',
    'heic','heif',
    'jfif','jpeg','jpg',
    'png',
    'svg',
    'tif','tiff',
    'webp',
}

EXTENSIONS = Set {}
if opt.video then EXTENSIONS = SetUnion(EXTENSIONS, EXTENSIONS_VIDEO) end
if opt.audio then EXTENSIONS = SetUnion(EXTENSIONS, EXTENSIONS_AUDIO) end
if opt.image then EXTENSIONS = SetUnion(EXTENSIONS, EXTENSIONS_IMAGE) end

function add_files_at(index, files)
    index = index - 1
    local oldcount = mp.get_property_number("playlist-count", 1)
    for i = 1, #files do
        mp.commandv("loadfile", files[i], "append")
        mp.commandv("playlist-move", oldcount + i - 1, index + i - 1)
    end
end

function get_extension(path)
    match = string.match(path, "%.([^%.]+)$" )
    if match == nil then
        return "nomatch"
    else
        return match
    end
end

table.filter = function(t, iter)
    for i = #t, 1, -1 do
        if not iter(t[i]) then
            table.remove(t, i)
        end
    end
end

-- splitbynum and alnumcomp from alphanum.lua (C) Andre Bogus
-- Released under the MIT License
-- http://www.davekoelle.com/files/alphanum.lua

-- split a string into a table of number and string values
function splitbynum(s)
    local result = {}
    for x, y in (s or ""):gmatch("(%d*)(%D*)") do
        if x ~= "" then table.insert(result, tonumber(x)) end
        if y ~= "" then table.insert(result, y) end
    end
    return result
end

function clean_key(k)
    k = (' '..k..' '):gsub("%s+", " "):sub(2, -2):lower()
    return splitbynum(k)
end

-- compare two strings
function alnumcomp(x, y)
    local xt, yt = clean_key(x), clean_key(y)
    for i = 1, math.min(#xt, #yt) do
        local xe, ye = xt[i], yt[i]
        if type(xe) == "string" then ye = tostring(ye)
        elseif type(ye) == "string" then xe = tostring(xe) end
        if xe ~= ye then return xe < ye end
    end
    return #xt < #yt
end

function find_and_add_entries()
    local path = mp.get_property("path", "")
    local dir, filename = utils.split_path(path)
    msg.trace(("dir: %s, filename: %s"):format(dir, filename))
    if opt.level == 0 then
        msg.verbose("自动队列中止：功能已禁用")
        return
    elseif #dir == 0 then
        msg.warn("自动队列中止：非本地路径")
        return
    end

    local pl_count = mp.get_property_number("playlist-count", 1)
    if pl_count > 1 then
        msg.warn("自动队列中止：已手动创建/修改播放列表")
        return
    end

    local pl = mp.get_property_native("playlist", {})
    local pl_current = mp.get_property_number("playlist-pos-1", 1)
    msg.trace(("playlist-pos-1: %s, playlist: %s"):format(pl_current,
        utils.to_string(pl)))

    local files = utils.readdir(dir, "files")
    if files == nil then
        msg.info("自动队列：当前目录无其它文件")
        return
    end
    table.filter(files, function (v, k)
        -- The current file could be a hidden file, ignoring it doesn't load other
        -- files from the current directory.
        if (opt.skip_hidden and not (v == filename) and string.match(v, "^%.")) then
            return false
        end
        local ext = get_extension(v)
        if ext == nil then
            return false
        end
    if opt.level == 1 then
        local name = mp.get_property("filename")
        local namepre = string.sub(name, 1, 6)
        local namepre0 = string.gsub(namepre, "%p", "%%%1")
        for ext, _ in pairs(EXTENSIONS) do
            if string.match(name, ext.."$") ~= nil then
                if string.match(v, "^"..namepre0) == nil then
                return false
                end
            end
        end
    end
        return EXTENSIONS[string.lower(ext)]
    end)
    table.sort(files, alnumcomp)

    if dir == "." then
        dir = ""
    end

    -- Find the current pl entry (dir+"/"+filename) in the sorted dir list
    local current
    for i = 1, #files do
        if files[i] == filename then
            current = i
            break
        end
    end
    if current == nil then
        return
    end
    msg.trace("自动队列：当前文件所处序列 "..current)

    local append = {[-1] = {}, [1] = {}}
    for direction = -1, 1, 2 do -- 2 iterations, with direction = -1 and +1
        for i = 1, opt.max_entries do
            local file = files[current + i * direction]
            local pl_e = pl[pl_current + i * direction]
            if file == nil or file[1] == "." then
                break
            end

            local filepath = dir .. file
            if pl_e then
                -- If there's a playlist entry, and it's the same file, stop.
                msg.trace(pl_e.filename.." == "..filepath.." ?")
                if pl_e.filename == filepath then
                    break
                end
            end

            if direction == -1 then
                if pl_current == 1 then -- never add additional entries in the middle
                    msg.info("自动队列 追加（前）" .. file)
                    table.insert(append[-1], 1, filepath)
                end
            else
                msg.info("自动队列 追加（后）" .. file)
                table.insert(append[1], filepath)
            end
        end
    end

    add_files_at(pl_current + 1, append[1])
    add_files_at(pl_current, append[-1])
end


--
-- 弹出对话框加载文件
--

function import_files()
	local was_ontop = mp.get_property_native("ontop")
	if was_ontop then mp.set_property_native("ontop", false) end
	local res = utils.subprocess({
		args = {'powershell', '-NoProfile', '-Command', [[& {
			Trap {
				Write-Error -ErrorRecord $_
				Exit 1
			}
			Add-Type -AssemblyName PresentationFramework
			$u8 = [System.Text.Encoding]::UTF8
			$out = [Console]::OpenStandardOutput()
			$ofd = New-Object -TypeName Microsoft.Win32.OpenFileDialog
			$ofd.Multiselect = $true
			If ($ofd.ShowDialog() -eq $true) {
				ForEach ($filename in $ofd.FileNames) {
					$u8filename = $u8.GetBytes("$filename`n")
					$out.Write($u8filename, 0, $u8filename.Length)
				}
			}
		}]]},
		cancellable = false,
	})
	if was_ontop then mp.set_property_native("ontop", true) end
	if (res.status ~= 0) then return end
	local first_file = true
	for filename in string.gmatch(res.stdout, '[^\n]+') do
		mp.commandv('loadfile', filename, first_file and 'replace' or 'append')
		first_file = false
	end
end

function import_url()
	local was_ontop = mp.get_property_native("ontop")
	if was_ontop then mp.set_property_native("ontop", false) end
	local res = utils.subprocess({
		args = {'powershell', '-NoProfile', '-Command', [[& {
			Trap {
				Write-Error -ErrorRecord $_
				Exit 1
			}
			Add-Type -AssemblyName Microsoft.VisualBasic
			$u8 = [System.Text.Encoding]::UTF8
			$out = [Console]::OpenStandardOutput()
            $urlname = [Microsoft.VisualBasic.Interaction]::InputBox("输入地址", "打开", "https://")
            $u8urlname = $u8.GetBytes("$urlname")
            $out.Write($u8urlname, 0, $u8urlname.Length)
		}]]},
		cancellable = false,
	})
	if was_ontop then mp.set_property_native("ontop", true) end
	if (res.status ~= 0) then return end
	mp.commandv('loadfile', res.stdout)
end

function append_aid()
	local was_ontop = mp.get_property_native("ontop")
	if was_ontop then mp.set_property_native("ontop", false) end
	local res = utils.subprocess({
		args = {'powershell', '-NoProfile', '-Command', [[& {
			Trap {
				Write-Error -ErrorRecord $_
				Exit 1
			}
			Add-Type -AssemblyName PresentationFramework
			$u8 = [System.Text.Encoding]::UTF8
			$out = [Console]::OpenStandardOutput()
			$ofd = New-Object -TypeName Microsoft.Win32.OpenFileDialog
			$ofd.Multiselect = $false
			If ($ofd.ShowDialog() -eq $true) {
				ForEach ($filename in $ofd.FileNames) {
					$u8filename = $u8.GetBytes("$filename")
					$out.Write($u8filename, 0, $u8filename.Length)
				}
			}
		}]]},
		cancellable = false,
	})
	if was_ontop then mp.set_property_native("ontop", true) end
	if (res.status ~= 0) then return end
	for filename in string.gmatch(res.stdout, '[^\n]+') do
		mp.commandv('audio-add', filename, 'auto')
	end
end

function append_sid()
	local was_ontop = mp.get_property_native("ontop")
	if was_ontop then mp.set_property_native("ontop", false) end
	local res = utils.subprocess({
		args = {'powershell', '-NoProfile', '-Command', [[& {
			Trap {
				Write-Error -ErrorRecord $_
				Exit 1
			}
			Add-Type -AssemblyName PresentationFramework
			$u8 = [System.Text.Encoding]::UTF8
			$out = [Console]::OpenStandardOutput()
			$ofd = New-Object -TypeName Microsoft.Win32.OpenFileDialog
			$ofd.Multiselect = $false
			If ($ofd.ShowDialog() -eq $true) {
				ForEach ($filename in $ofd.FileNames) {
					$u8filename = $u8.GetBytes("$filename")
					$out.Write($u8filename, 0, $u8filename.Length)
				}
			}
		}]]},
		cancellable = false,
	})
	if was_ontop then mp.set_property_native("ontop", true) end
	if (res.status ~= 0) then return end
	for filename in string.gmatch(res.stdout, '[^\n]+') do
		mp.commandv('sub-add', filename, 'cached')
	end
end

function append_vfSub()
	local was_ontop = mp.get_property_native("ontop")
	if was_ontop then mp.set_property_native("ontop", false) end
	local res = utils.subprocess({
		args = {'powershell', '-NoProfile', '-Command', [[& {
			Trap {
				Write-Error -ErrorRecord $_
				Exit 1
			}
			Add-Type -AssemblyName PresentationFramework
			$u8 = [System.Text.Encoding]::UTF8
			$out = [Console]::OpenStandardOutput()
			$ofd = New-Object -TypeName Microsoft.Win32.OpenFileDialog
			$ofd.Multiselect = $false
			If ($ofd.ShowDialog() -eq $true) {
				ForEach ($filename in $ofd.FileNames) {
					$u8filename = $u8.GetBytes("$filename")
					$out.Write($u8filename, 0, $u8filename.Length)
				}
			}
		}]]},
		cancellable = false,
	})
	if was_ontop then mp.set_property_native("ontop", true) end
	if (res.status ~= 0) then return end
	for filename in string.gmatch(res.stdout, '[^\n]+') do
		local vfSub = "vf append ``@LUA-load_plus:subtitles=filename=\"" .. res.stdout .. "\"``"
		mp.command(vfSub)
	end
end

local function filter_state(label, key, value)
    local filters = mp.get_property_native("vf")
    for _, filter in pairs(filters) do
        if filter["label"] == label and (not key or key and filter[key] == value) then return true end
    end
    return false
end

function toggle_vfSub()
	local vfSub = "vf toggle @LUA-load_plus"
	if filter_state("LUA-load_plus") then mp.command(vfSub) end
end

function remove_vfSub()
	local vfSub = "vf remove @LUA-load_plus"
	if filter_state("LUA-load_plus") then mp.command(vfSub) end
end

mp.register_event("file-loaded", remove_vfSub)

mp.register_event("start-file", find_and_add_entries)

mp.add_key_binding(nil, 'import_files', import_files)
mp.add_key_binding(nil, 'import_url', import_url)
mp.add_key_binding(nil, 'append_aid', append_aid)
mp.add_key_binding(nil, 'append_sid', append_sid)
mp.add_key_binding(nil, 'append_vfSub', append_vfSub)
mp.add_key_binding(nil, 'toggle_vfSub', toggle_vfSub)
mp.add_key_binding(nil, 'remove_vfSub', remove_vfSub)
