-- 导入上游 intl.lua 的部分函数
local locale = {}
local cache = {}
function get_languages()
	local languages = {}

	for _, lang in ipairs(comma_split(options.languages)) do
		if (lang == 'slang') then
			local slang = mp.get_property_native('slang')
			if slang then
				itable_append(languages, slang)
			end
		else
			languages[#languages +1] = lang
		end
	end

	return languages
end
---@param path string
function get_locale_from_json(path)
	local expand_path = mp.command_native({'expand-path', path})

	local meta, meta_error = utils.file_info(expand_path)
	if not meta or not meta.is_file then
		return nil
	end

	local json_file = io.open(expand_path, 'r')
	if not json_file then
		return nil
	end

	local json = json_file:read('*all')
	json_file:close()

	local json_table = utils.parse_json(json)
	return json_table
end
---@param text string
function t(text, a)
	if not text then return '' end
	local key = text
	if a then key = key .. '|' .. a end
	if cache[key] then return cache[key] end
	cache[key] = string.format(locale[text] or text, a or '')
	return cache[key]
end


ulang = {

	-- context_menu_default
	_cm_load = '加载',
	_cm_file_browser = '※ 文件浏览器',
	_cm_import_sid = '※ 导入 字幕轨',
	_cm_navigation = '导航',
	_cm_playlist = '※ 播放列表',
	_cm_edition_list = '※ 版本列表',
	_cm_chapter_list = '※ 章节列表',
	_cm_vid_list = '※ 视频轨列表',
	_cm_aid_list = '※ 音频轨列表',
	_cm_sid_list = '※ 字幕轨列表',
	_cm_playlist_shuffle = '播放列表乱序重排',
	_cm_ushot = '※ 截屏',
	_cm_video = '视频',
	_cm_decoding_api = '切换 解码模式',
	_cm_deband_toggle = '切换 去色带状态',
	_cm_deint_toggle = '切换 去隔行状态',
	_cm_icc_toggle = '切换 自动校色',
	_cm_corpts_toggle = '切换 时间码解析模式',
	_cm_tools = '工具',
	_cm_keybinding = '※ 按键绑定列表',
	_cm_stats_toggle = '开关 常驻统计信息',
	_cm_console_on = '显示控制台',
	_cm_border_toggle = '切换 窗口边框',
	_cm_ontop_toggle = '切换 窗口置顶',
	_cm_audio_device = '※ 音频输出设备列表',
	_cm_stream_quality = '※ 流式传输品质',
	_cm_show_file_dir = '※ 打开 当前文件所在路径',
	_cm_show_config_dir = '※ 打开 设置目录',
	_cm_stop = '停止',
	_cm_quit = '退出mpv',

	-- no-border-title
	_border_title= '未加载文件',

	-- track_loaders sub_menu menu_data
	_sid_menu = '字幕轨',
	_aid_menu = '音频轨',
	_vid_menu = '视频轨',
	_import_id_menu = '导入 ',

	-- _menu_item_empty_title = '空',
	_menu_search = '输入并按 Ctrl+ENTER 进行搜索',
	_menu_search2 = '输入以搜索',

	_input_empty = 'input-bindings 为空',

	_sid_submenu_title = '字幕轨列表',
	_sid_sec_submenu_title = '次字幕轨列表',
	_aid_submenu_title = '音频轨列表',
	_vid_submenu_title = '视频轨列表',
	_playlist_submenu_title = '播放列表',
	_chapter_list_submenu_title = '章节列表',
	_chapter_list_submenu_item_title = '未命名章节 ',
	_edition_list_submenu_title = '版本列表',
	_edition_list_submenu_item_title = '版本',
	_stream_quality_submenu_title = '流式传输品质',
	_audio_device_submenu_title = '音频输出设备列表',
	_audio_device_submenu_item_title = '自动',

	_dlsub_download = '下载',
	_dlsub_searchol = '在线搜索',
	_dlsub_invalid_response = '无效的JSON响应',
	_dlsub_process_exit = '进程退出代码',
	_dlsub_unknown_err = '未知错误',
	_dlsub_err = '错误',
	_dlsub_fin = '下载完成且已加载',
	_dlsub_remain = '今日剩余下载量',
	_dlsub_reset = '重置',
	_dlsub_foreign = '仅外语部分',
	_dlsub_hearing = '听力障碍',
	_dlsub_result0 = '无结果',
	_dlsub_page_prev = '上一页',
	_dlsub_page_next = '下一页',
	_dlsub_2search = 'Ctrl+ENTER 搜索',
	_dlsub_enter_query = '输入查询',

	_submenu_import = '导入',
	_submenu_load_file = '打开文件',
	_submenu_id_disabled = '禁用',
	_submenu_id_hint = '声道',
	_submenu_id_forced = '强制',
	_submenu_id_default = '默认',
	_submenu_id_external = '外挂',
	_submenu_id_title = '轨道 ',
	_submenu_file_browser_item_hint = '驱动器列表',
	_submenu_file_browser_item_hint2 = '上级目录',
	_submenu_file_browser_item2_hint = '盘符',
	_submenu_file_browser_title = '驱动器列表',

	-- built-in_shortcut
	_button01 = '菜单',
	_button02 = '字幕轨',
	_button03 = '音频轨',
	_button04 = '音频设备',
	_button05 = '视频轨',
	_button06 = '播放列表',
	_button07 = '章节',
	_button08 = '版本',
	_button09 = '流品质',
	_button10 = '加载文件',
	_button11 = '播放列表/文件浏览器',
	_button12 = '上一个',
	_button13 = '下一个',
	_button14 = '首位',
	_button15 = '末位',
	_button16 = '列表循环',
	_button17 = '单曲循环',
	_button18 = '乱序播放',
	_button19 = '切换全屏',

	_button_ext01 = '播放/暂停',
	_button_ext02 = '播放/暂停',
	_button_ext03 = '上一个',
	_button_ext04 = '下一个',
	_button_ext05 = '窗口边框',
	_button_ext06 = '置顶',
	_button_ext07 = '硬解',
	_button_ext08 = '原始尺寸',
	_button_ext09 = '去色带',
	_button_ext10 = '反交错',
	_button_ext11 = '截屏',
	_button_ext12 = '统计数据',
	_button_ext13 = '时间轴预览',

}

opt.read_options(ulang, "uosc_lang")
