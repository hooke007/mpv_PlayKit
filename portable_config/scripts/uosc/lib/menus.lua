---@param data MenuData
---@param opts? {submenu?: string; mouse_nav?: boolean; on_close?: string | string[]}
function open_command_menu(data, opts)
	local function run_command(command)
		if type(command) == 'string' then
			mp.command(command)
		else
			---@diagnostic disable-next-line: deprecated
			mp.commandv(unpack(command))
		end
	end
	---@type MenuOptions
	local menu_opts = {}
	if opts then
		menu_opts.mouse_nav = opts.mouse_nav
		if opts.on_close then menu_opts.on_close = function() run_command(opts.on_close) end end
	end
	local menu = Menu:open(data, run_command, menu_opts)
	if opts and opts.submenu then menu:activate_submenu(opts.submenu) end
	return menu
end

---@param opts? {submenu?: string; mouse_nav?: boolean; on_close?: string | string[]}
function toggle_menu_with_items(opts)
	if Menu:is_open('menu') then Menu:close()
	else open_command_menu({type = 'menu', items = config.menu_items}, opts) end
end

---@param options {type: string; title: string; list_prop: string; active_prop?: string; serializer: fun(list: any, active: any): MenuDataItem[]; on_select: fun(value: any); on_move_item?: fun(from_index: integer, to_index: integer, submenu_path: integer[]); on_delete_item?: fun(index: integer, submenu_path: integer[])}
function create_self_updating_menu_opener(options)
	return function()
		if Menu:is_open(options.type) then Menu:close() return end
		local list = mp.get_property_native(options.list_prop)
		local active = options.active_prop and mp.get_property_native(options.active_prop) or nil
		local menu

		local function update() menu:update_items(options.serializer(list, active)) end

		local ignore_initial_list = true
		local function handle_list_prop_change(name, value)
			if ignore_initial_list then ignore_initial_list = false
			else list = value update() end
		end

		local ignore_initial_active = true
		local function handle_active_prop_change(name, value)
			if ignore_initial_active then ignore_initial_active = false
			else active = value update() end
		end

		local initial_items, selected_index = options.serializer(list, active)

		-- Items and active_index are set in the handle_prop_change callback, since adding
		-- a property observer triggers its handler immediately, we just let that initialize the items.
		menu = Menu:open(
			{type = options.type, title = options.title, items = initial_items, selected_index = selected_index},
			options.on_select, {
			on_open = function()
				mp.observe_property(options.list_prop, 'native', handle_list_prop_change)
				if options.active_prop then
					mp.observe_property(options.active_prop, 'native', handle_active_prop_change)
				end
			end,
			on_close = function()
				mp.unobserve_property(handle_list_prop_change)
				mp.unobserve_property(handle_active_prop_change)
			end,
			on_move_item = options.on_move_item,
			on_delete_item = options.on_delete_item,
		})
	end
end

function create_select_tracklist_type_menu_opener(menu_title, track_type, track_prop, load_command)
	local function serialize_tracklist(tracklist)
		local items = {}

		if load_command then
			items[#items + 1] = {
				title = lang._submenu_import, bold = true, italic = true, hint = lang._submenu_load_file, value = '{load}', separator = true,
			}
		end

		local first_item_index = #items + 1
		local active_index = nil
		local disabled_item = nil

		-- Add option to disable a subtitle track. This works for all tracks,
		-- but why would anyone want to disable audio or video? Better to not
		-- let people mistakenly select what is unwanted 99.999% of the time.
		-- If I'm mistaken and there is an active need for this, feel free to
		-- open an issue.
		if track_type == 'sub' or track_type == 'audio' or track_type == 'video' then
			disabled_item = {title = lang._submenu_id_disabled, italic = true, muted = true, hint = '—', value = nil, active = true}
			items[#items + 1] = disabled_item
		end

		for _, track in ipairs(tracklist) do
			if track.type == track_type then
				local hint_values = {}
				local function h(value) hint_values[#hint_values + 1] = value end

				if track.lang then h(track.lang:upper()) end
				if track['demux-h'] then
					h(track['demux-w'] and (track['demux-w'] .. 'x' .. track['demux-h']) or (track['demux-h'] .. 'p'))
				end
				if track['demux-fps'] then h(string.format('%.5gfps', track['demux-fps'])) end
				h(track.codec)
				if track['audio-channels'] then h(track['audio-channels'] .. ' channels') end
				if track['demux-samplerate'] then h(string.format('%.3gkHz', track['demux-samplerate'] / 1000)) end
				if track.forced then h(lang._submenu_id_forced) end
				if track.default then h(lang._submenu_id_default) end
				if track.external then h(lang._submenu_id_external) end

				items[#items + 1] = {
					title = (track.title and track.title or lang._submenu_id_title .. track.id),
					hint = table.concat(hint_values, ', '),
					value = track.id,
					active = track.selected,
				}

				if track.selected then
					if disabled_item then disabled_item.active = false end
					active_index = #items
				end
			end
		end

		return items, active_index or first_item_index
	end

	local function selection_handler(value)
		if value == '{load}' then
			mp.command(load_command)
		else
			mp.commandv('set', track_prop, value and value or 'no')

			-- If subtitle track was selected, assume user also wants to see it
			--if value and track_type == 'sub' then
				--mp.commandv('set', 'sub-visibility', 'yes')
			--end
		end
	end

	return create_self_updating_menu_opener({
		title = menu_title,
		type = track_type,
		list_prop = 'track-list',
		serializer = serialize_tracklist,
		on_select = selection_handler,
	})
end

---@alias NavigationMenuOptions {type: string, title?: string, allowed_types?: string[], active_path?: string, selected_path?: string; on_open?: fun(); on_close?: fun()}

-- Opens a file navigation menu with items inside `directory_path`.
---@param directory_path string
---@param handle_select fun(path: string): nil
---@param opts NavigationMenuOptions
function open_file_navigation_menu(directory_path, handle_select, opts)
	directory = serialize_path(normalize_path(directory_path))
	opts = opts or {}

	if not directory then
		msg.error('Couldn\'t serialize path "' .. directory_path .. '.')
		return
	end

	local files, directories = read_directory(directory.path, opts.allowed_types)
	local is_root = not directory.dirname
	local path_separator = path_separator(directory.path)

	if not files or not directories then return end

	sort_filenames(directories)
	sort_filenames(files)

	-- Pre-populate items with parent directory selector if not at root
	-- Each item value is a serialized path table it points to.
	local items = {}

	if is_root then
		if state.platform == 'windows' then
			items[#items + 1] = {title = '..', hint = lang._submenu_file_browser_title, value = '{drives}', separator = true}
		end
	else
		items[#items + 1] = {title = '..', hint = lang._submenu_file_browser_item_title, value = directory.dirname, separator = true}
	end

	local back_path = items[#items] and items[#items].value
	local selected_index = #items + 1

	for _, dir in ipairs(directories) do
		items[#items + 1] = {title = dir, value = join_path(directory.path, dir), hint = path_separator}
	end

	for _, file in ipairs(files) do
		items[#items + 1] = {title = file, value = join_path(directory.path, file)}
	end

	for index, item in ipairs(items) do
		if not item.value.is_to_parent and opts.active_path == item.value then
			item.active = true
			if not opts.selected_path then selected_index = index end
		end

		if opts.selected_path == item.value then selected_index = index end
	end

	---@type MenuCallback
	local function open_path(path, meta)
		local is_drives = path == '{drives}'
		local is_to_parent = is_drives or #path < #directory_path
		local inheritable_options = {
			type = opts.type, title = opts.title, allowed_types = opts.allowed_types, active_path = opts.active_path,
		}

		if is_drives then
			open_drives_menu(function(drive_path)
				open_file_navigation_menu(drive_path, handle_select, inheritable_options)
			end, {
				type = inheritable_options.type, title = inheritable_options.title, selected_path = directory.path,
				on_open = opts.on_open, on_close = opts.on_close,
			})
			return
		end

		local info, error = utils.file_info(path)

		if not info then
			msg.error('Can\'t retrieve path info for "' .. path .. '". Error: ' .. (error or ''))
			return
		end

		if info.is_dir and not meta.modifiers.ctrl then
			--  Preselect directory we are coming from
			if is_to_parent then
				inheritable_options.selected_path = directory.path
			end

			open_file_navigation_menu(path, handle_select, inheritable_options)
		else
			handle_select(path)
		end
	end

	local function handle_back()
		if back_path then open_path(back_path, {modifiers = {}}) end
	end

	local menu_data = {
		type = opts.type, title = opts.title or directory.basename .. path_separator, items = items,
		selected_index = selected_index,
	}
	local menu_options = {on_open = opts.on_open, on_close = opts.on_close, on_back = handle_back}

	return Menu:open(menu_data, open_path, menu_options)
end

-- Opens a file navigation menu with Windows drives as items.
---@param handle_select fun(path: string): nil
---@param opts? NavigationMenuOptions
function open_drives_menu(handle_select, opts)
	opts = opts or {}
	local process = mp.command_native({
		name = 'subprocess',
		capture_stdout = true,
		playback_only = false,
		args = {'wmic', 'logicaldisk', 'get', 'name', '/value'},
	})
	local items, selected_index = {}, 1

	if process.status == 0 then
		for _, value in ipairs(split(process.stdout, '\n')) do
			local drive = string.match(value, 'Name=([A-Z]:)')
			if drive then
				local drive_path = normalize_path(drive)
				items[#items + 1] = {
					title = drive, hint = lang._submenu_file_browser_item2_title, value = drive_path, active = opts.active_path == drive_path,
				}
				if opts.selected_path == drive_path then selected_index = #items end
			end
		end
	else
		msg.error(process.stderr)
	end

	return Menu:open(
		{type = opts.type, title = opts.title or lang._submenu_file_browser_item3_title, items = items, selected_index = selected_index},
		handle_select
	)
end
