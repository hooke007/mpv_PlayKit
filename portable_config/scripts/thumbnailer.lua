--[[
SOURCE_ https://github.com/deus0ww/mpv-conf/blob/master/scripts/Thumbnailer.lua
COMMIT_ 20211005 62fa158

搭配osc_lazy的缩略图脚本(1)/(2)
]]--

local ipairs,loadfile,pairs,pcall,tonumber,tostring = ipairs,loadfile,pairs,pcall,tonumber,tostring
local debug,io,math,os,string,table,utf8 = debug,io,math,os,string,table,utf8
local min,max,floor,ceil,huge = math.min,math.max,math.floor,math.ceil,math.huge
local mp      = require 'mp'
local msg     = require 'mp.msg'
local opt     = require 'mp.options'
local utils   = require 'mp.utils'

local script_name = mp.get_script_name()

local message = {
	worker = {
		registration  = 'tn_worker_registration',
		reset         = 'tn_worker_reset',
		queue         = 'tn_worker_queue',
		start         = 'tn_worker_start',
		progress      = 'tn_worker_progress',
		finish        = 'tn_worker_finish',
	},
	osc = {
		registration  = 'tn_osc_registration',
		reset         = 'tn_osc_reset',
		update        = 'tn_osc_update',
		finish        = 'tn_osc_finish',
	},
	debug = 'Thumbnailer-debug',

	manual_start = script_name .. '-start',
	manual_stop  = script_name .. '-stop',
	manual_show  = script_name .. '-show',
	manual_hide  = script_name .. '-hide',
	toggle_gen   = script_name .. '-toggle-gen',
	toggle_osc   = script_name .. '-toggle-osc',
	double       = script_name .. '-double',
	shrink       = script_name .. '-shrink',
	enlarge      = script_name .. '-enlarge',
	auto_delete  = script_name .. '-toggle-auto-delete',

	queued     = 1,
	processing = 2,
	ready      = 3,
	failed     = 4,
}


-----------
-- Utils --
-----------
local OS_MAC, OS_WIN, OS_NIX = 'MAC', 'WIN', 'NIX'
local function get_os()
	if jit and jit.os then
		if jit.os == 'Windows' then return OS_WIN
		elseif jit.os == 'OSX' then return OS_MAC
		else return OS_NIX end
	end
	if (package.config:sub(1,1) ~= '/') then return OS_WIN end
	local res = mp.command_native({ name = 'subprocess', args = {'uname', '-s'}, playback_only = false, capture_stdout = true, capture_stderr = true, })
	return (res and res.stdout and res.stdout:lower():find('darwin') ~= nil) and OS_MAC or OS_NIX
end
local OPERATING_SYSTEM = get_os()

local function format_json(tab)
	local json, err = utils.format_json(tab)
	if err then msg.error('Formatting JSON failed:', err) end
	if json then return json else return '' end
end

local function parse_json(json)
	local tab, err = utils.parse_json(json, true)
	if err then msg.error('Parsing JSON failed:', err) end
	if tab then return tab else return {} end
end

local function is_empty(...) -- Not for tables
	if ... == nil then return true end
	for _, v in ipairs({...}) do
		if (v == nil) or (v == '') or (v == 0) then return true end
	end
	return false
end


-------------------------------------
-- External Process and Filesystem --
-------------------------------------
local function subprocess_result(sub_success, result, mpv_error, subprocess_name, start_time)
	local cmd_status, cmd_stdout, cmd_stderr, cmd_error, cmd_killed
	if result then cmd_status, cmd_stdout, cmd_stderr, cmd_error, cmd_killed = result.status, result.stdout, result.stderr, result.error_string, result.killed_by_us end
	local cmd_status_success, cmd_status_string, cmd_err_success, cmd_err_string, success
	
	if     cmd_status == 0      then cmd_status_success, cmd_status_string = true,  'ok'
	elseif is_empty(cmd_status) then cmd_status_success, cmd_status_string = true,  '_'
	elseif cmd_status == 124 or cmd_status == 137 or cmd_status == 143 then -- timer: timed-out(124), killed(128+9), or terminated(128+15)
	                                 cmd_status_success, cmd_status_string = false, 'timed out'
	else                             cmd_status_success, cmd_status_string = false, ('%d'):format(cmd_status) end
	
	if     is_empty(cmd_error)   then cmd_err_success, cmd_err_string = true,  '_'
	elseif cmd_error == 'init'   then cmd_err_success, cmd_err_string = false, 'failed to initialize'
	elseif cmd_error == 'killed' then cmd_err_success, cmd_err_string = false, cmd_killed and 'killed by us' or 'killed, but not by us'
	else                              cmd_err_success, cmd_err_string = false, cmd_error end
	
	if is_empty(cmd_stdout) then cmd_stdout = '_' end
	if is_empty(cmd_stderr) then cmd_stderr = '_' end
	subprocess_name = subprocess_name or '_'
	start_time = start_time or os.time()
	success = (sub_success == nil or sub_success) and is_empty(mpv_error) and cmd_status_success and cmd_err_success

	if success then msg.debug('Subprocess', subprocess_name, 'succeeded. | Status:', cmd_status_string, '| Time:', ('%ds'):format(os.difftime(os.time(), start_time)))
	else            msg.error('Subprocess', subprocess_name, 'failed. | Status:', cmd_status_string, '| MPV Error:', mpv_error or 'n/a', 
	                          '| Subprocess Error:', cmd_err_string, '| Stdout:', cmd_stdout, '| Stderr:', cmd_stderr) end
	return success, cmd_status_string, cmd_err_string, cmd_stdout, cmd_stderr
end

local function run_subprocess(command, name)
	if not command then return false end
	local subprocess_name, start_time = name or command[1], os.time()
	-- msg.debug('Subprocess', subprocess_name, 'Starting...')
	local result, mpv_error = mp.command_native( {name='subprocess', args=command, playback_only = false, capture_stdout = true, capture_stderr = true} )
	local success, _, _, _ = subprocess_result(nil, result, mpv_error, subprocess_name, start_time)
	return success
end

local function run_subprocess_async(command, name)
	if not command then return false end
	local subprocess_name, start_time = name or command[1], os.time()
	-- msg.debug('Subprocess', subprocess_name, 'Starting (async)...')
	mp.command_native_async( {name='subprocess', args=command, playback_only = false, capture_stdout = true, capture_stderr = true}, function(s, r, e) subprocess_result(s, r, e, subprocess_name, start_time) end )
	return nil
end

local function join_paths(...)
	local sep = OPERATING_SYSTEM == OS_WIN and '\\' or '/'
	local result = ''
	for _, p in ipairs({...}) do
		result = (result == '') and p or result .. sep .. p
	end
	return result
end

local function file_exists(path)
	local file = io.open(path, 'rb')
	if not file then return false end
	local _, _, code = file:read(1)
	file:close()
	return code == nil
end

local function exec_exist(name, exec_path)
	local delim = ':'
	if OPERATING_SYSTEM == OS_WIN then delim, name = ';', name .. '.exe' end
	local env_path = exec_path ~= '' and exec_path or ((os.getenv('PWD') or mp.get_property('working-directory')) .. delim .. os.getenv('PATH'))
	msg.debug('PATH: ' .. env_path)
	for path_dir in env_path:gmatch('[^'..delim..']+') do
		if file_exists(join_paths(path_dir, name)) then return true end
	end
	msg.debug(name .. 'not found.')
	return false
end

local function dir_exist(path)
	local ok, _, _ = os.rename(path .. '/', path .. '/')
	if not ok then return false end
	local file = io.open(join_paths(path, 'test'), 'w')
	if file then 
		file:close()
		return os.remove(join_paths(path, 'test'))
	end
	return false
end

local function create_dir(path)
	return dir_exist(path) or run_subprocess( OPERATING_SYSTEM == OS_WIN and {'cmd', '/e:on', '/c', 'mkdir', path} or {'mkdir', '-p', path} )
end

local function delete_dir(path)
	if is_empty(path) then return end
	msg.warn('Deleting Dir:', path)
	return run_subprocess( OPERATING_SYSTEM == OS_WIN and {'cmd', '/e:on', '/c', 'rd', '/s', '/q', path} or {'rm', '-r', path} )
end

local function delete_file(path)
	if not file_exists(path) then return end
	msg.warn('Deleting File:', path)
	return os.remove(path)
end

local function add_lock(path)
	msg.debug('Add file lock to:', path)
	local file = io.open(join_paths(path, tostring(utils.getpid())), 'w')
	if file then 
		file:close()
		return true
	end
	return false
end

local function remove_lock(path)
	msg.debug('Remove file lock from:', path)
	return delete_file(join_paths(path, tostring(utils.getpid())))
end

local function is_locked(path)
	return #utils.readdir(path,'files') ~= 0
end


--------------------
-- Data Structure --
--------------------
local initialized        = false
local default_cache_dir  = join_paths(OPERATING_SYSTEM == OS_WIN and os.getenv('TEMP') or '/tmp/', script_name)
local saved_state, state

local user_opts = {
	-- General
	auto_gen              = true,               -- Auto generate thumbnails
	auto_show             = true,               -- Show thumbnails by default
	auto_delete           = 0,                  -- Delete the thumbnail cache. Use at your own risk. 0=No, 1=On file close, 2=When quiting
	start_delay           = 2,                  -- Delay the start of the thumbnailer (seconds)

	-- Paths
	cache_dir             = default_cache_dir,  -- Note: Files are not cleaned afterward, by default
	worker_script_path    = '',                 -- Only needed if the script can't auto-locate the file to load more workers
	exec_path             = '',                 -- This is appended to PATH to search for mpv, ffmpeg, and other executables.

	-- Thumbnail
	dimension             = 320,                -- Max width and height before scaling
	thumbnail_count       = 120,                -- Try to create this many thumbnails within the delta limits below
	min_delta             = 5,                  -- Minimum time between thumbnails (seconds)
	max_delta             = 60,                 -- Maximum time between thumbnails (seconds)
	remote_delta_factor   = 2,                  -- Multiply delta by this for remote sources
	stream_delta_factor   = 2,                  -- Multiply delta by this for streams (youtube, etc)
	bitrate_delta_factor  = 2,                  -- Multiply delta by this for high bitrate sources
	bitrate_threshold     = 8,                  -- The threshold to consider a source to be high bitrate (Mbps)
	
	-- OSC
	spacer                = 2,                  -- Size of borders and spacings
	show_progress         = 1,                  -- Display the thumbnail-ing progress. (0=never, 1=while generating, 2=always)
	centered              = false,              -- Center the thumbnail on screen
	update_time           = 0.5,                -- Fastest time interval between updating the OSC with new thumbnails

	-- Worker
	max_workers           = 3,                  -- Number of active workers. Must have at least one copy of the worker script alongside this script.
	worker_remote_factor  = 0.5,                -- Multiply max_workers by this for remote streams or when MPV enables cache
	worker_bitrate_factor = 0.5,                -- Multiply max_workers by this for high bitrate sources. Set threshold with bitrate_threshold
	worker_delay          = 0.5,                -- Delay between starting workers (seconds)
	worker_timeout        = 4,                  -- Timeout before killing encoder. 0=No Timeout (Linux or Mac w/ coreutils installed only). Standardized at 720p and linearly scaled with resolution.
	accurate_seek         = false,              -- Use accurate timing instead of closest keyframe for thumbnails. (Slower)
	use_ffmpeg            = false,              -- Use FFMPEG when appropriate. FFMPEG must be in PATH or in the MPV directory
	prefer_ffmpeg         = false,              -- Use FFMPEG when available
	ffmpeg_threads        = 8,                  -- Limit FFMPEG/MPV LAVC threads per worker. Also limits filter and output threads for FFMPEG.
	ffmpeg_scaler         = 'bilinear',         -- ffmpeg软件缩放算法 https://ffmpeg.org/ffmpeg-scaler.html
	mpv_scaler            = 'bilinear',         -- mpv软件缩放算法
	mpv_hwdec             = 'no',               -- mpv硬解码
	ffmpeg_hwaccel        = 'none',             -- ffmpeg硬解码
	ffmpeg_hwaccel_device = '0',                -- ffmpeg硬解码设备
}

local thumbnails, thumbnails_new,thumbnails_new_count

local function reset_thumbnails()
	thumbnails           = {}
	thumbnails_new       = {}
	thumbnails_new_count = 0
end

------------
-- Worker --
------------
local workers, workers_indexed, workers_timers = {}, {}, {}
local workers_started, workers_finished, workers_finished_indexed, timer_start, timer_total

local function workers_reset()
	for _, timer in ipairs(workers_timers) do timer:kill() end
	workers_timers           = {}
	workers_started          = false
	workers_finished         = {}
	workers_finished_indexed = {}
	timer_start              = 0
	timer_total              = 0
	for _, worker in ipairs(workers_indexed) do
		mp.command_native({'script-message-to', worker, message.worker.reset})
	end
end

local function worker_set_options()
	return {
		encoder               = (not state.is_remote and user_opts.use_ffmpeg and exec_exist('ffmpeg', user_opts.exec_path)) and 'ffmpeg' or 'mpv',
		exec_path             = user_opts.exec_path,
		worker_timeout        = state.worker_timeout,
		accurate_seek         = user_opts.accurate_seek,
		use_ffmpeg            = user_opts.use_ffmpeg,
		ffmpeg_threads        = user_opts.ffmpeg_threads,
		ffmpeg_scaler         = user_opts.ffmpeg_scaler,
		mpv_scaler            = user_opts.mpv_scaler,
		mpv_hwdec             = user_opts.mpv_hwdec,
		ffmpeg_hwaccel        = user_opts.ffmpeg_hwaccel,
		ffmpeg_hwaccel_device = user_opts.ffmpeg_hwaccel_device,
	}
end

local function workers_queue()
	local worker_data = {
		state          = state,
		worker_options = worker_set_options(),
	}
	local start_time_index = 0
	for i, worker in ipairs(workers_indexed) do
		if i > state.max_workers then break end
		worker_data.start_time_index = start_time_index
		mp.command_native_async({'script-message-to', worker, message.worker.queue, format_json(worker_data)}, function() end)
		start_time_index = ceil(i * state.tn_per_worker)
	end
end

local function workers_start()
	timer_start = os.time()
	if state.cache_dir and state.cache_dir ~= '' then os.remove(join_paths(state.cache_dir, 'stop')) end
	for i, worker in ipairs(workers_indexed) do
		if i > state.max_workers then break end
		table.insert(workers_timers, mp.add_timeout( user_opts.worker_delay * i^0.8, function() mp.command_native({'script-message-to', worker, message.worker.start}) end))
	end
	workers_started = true
end

local function workers_stop()
	if state and state.cache_dir and state.cache_dir ~= '' then
		local file = io.open(join_paths(state.cache_dir, 'stop'), 'w')
		if file then file:close() end
	end
	if timer_total and timer_start then timer_total = timer_total + os.difftime(os.time(), timer_start) end
	timer_start = 0
end

local function workers_are_stopped()
	if not initialized or not workers_started then return true end
	local file = io.open(join_paths(state.cache_dir, 'stop'), 'r')
	if not file then return false end
	file:close()
	return true
end


---------
-- OSC --
---------
local osc_name, osc_opts, osc_stats, osc_visible, osc_last_update

local function osc_reset_stats()
	osc_stats = {
		queued         = 0,
		processing     = 0,
		ready          = 0,
		failed         = 0,
		total          = 0,
		total_expected = 0,
		percent        = 0,
		timer          = 0,
	}
end

local function osc_reset()
	osc_reset_stats()
	osc_last_update = 0
	osc_visible = nil
	if osc_name then mp.command_native({'script-message-to', osc_name, message.osc.reset}) end
end

local function osc_set_options(is_visible)
	osc_visible = (is_visible == nil) and user_opts.auto_show or is_visible
	return {
		spacer        = user_opts.spacer,
		show_progress = user_opts.show_progress,
		scale         = state.scale,
		centered      = user_opts.centered,
		visible       = osc_visible,
	}
end

local function osc_update(ustate, uoptions, uthumbnails)
	if is_empty(osc_name) then return end
	local osc_data  = {
		state       = ustate,
		osc_options = uoptions,
		thumbnails  = uthumbnails,
	}
	if osc_data.thumbnails then
		osc_stats.timer          = timer_start == 0 and timer_total or (timer_total + os.difftime(os.time(), timer_start))
		osc_stats.total_expected = floor(state.duration / state.delta) + 1
		osc_data.osc_stats       = osc_stats
	else
		osc_data.osc_stats = nil
	end
	mp.command_native_async({'script-message-to', osc_name, message.osc.update, format_json(osc_data)}, function() end)
end

local function osc_delta_update(flush)
	local time_since_last_update = os.clock() - osc_last_update
	if thumbnails_new_count <= 0 then return end
	if (time_since_last_update >= (4.00 * user_opts.update_time)) or 
	   (time_since_last_update >= (2.00 * user_opts.update_time) and thumbnails_new_count >= state.worker_buffer) or
	   (time_since_last_update >= (1.00 * user_opts.update_time) and thumbnails_new_count >= state.osc_buffer) or
	   thumbnails_new_count >= floor(state.tn_per_worker - 1) or
	   flush
	then
		osc_update(nil, nil, thumbnails_new)
		thumbnails_new = {}
		thumbnails_new_count = 0
		osc_last_update = os.clock()
	end
end

local osc_full_update_timer  = mp.add_periodic_timer((4.00 * user_opts.update_time), function() osc_update(nil, nil, thumbnails) end)
osc_full_update_timer:kill()
local osc_delta_update_timer = mp.add_periodic_timer((0.25 * user_opts.update_time), function() osc_delta_update() end)
osc_delta_update_timer:kill()

local count_existing = {
	[message.queued]     = function() osc_stats.queued     = osc_stats.queued     - 1 end,
	[message.processing] = function() osc_stats.processing = osc_stats.processing - 1 end,
	[message.failed]     = function() osc_stats.failed     = osc_stats.failed     - 1 end,
	[message.ready]      = function() osc_stats.ready      = osc_stats.ready      - 1 end,
}
local count_new = {
	[message.queued]     = function() osc_stats.queued     = osc_stats.queued     + 1 end,
	[message.processing] = function() osc_stats.processing = osc_stats.processing + 1 end,
	[message.failed]     = function() osc_stats.failed     = osc_stats.failed     + 1 end,
	[message.ready]      = function() osc_stats.ready      = osc_stats.ready      + 1 end,
}

local function osc_update_count(time_string, status)
	local osc_stats, existing = osc_stats, thumbnails[time_string]
	if existing then count_existing[existing]() else osc_stats.total = osc_stats.total + 1 end
	if status   then count_new[status]()        else osc_stats.total = osc_stats.total - 1 end
	osc_stats.percent = osc_stats.total > 0 and (osc_stats.failed + osc_stats.ready) / osc_stats.total or 0
end


----------------
-- Core Logic --
----------------
local stop_conditions

local worker_script_path
local auto_delete = nil

local function create_workers()
	local workers_requested = (state and state.max_workers) and state.max_workers or user_opts.max_workers
	msg.debug('Workers Available:', #workers_indexed)
	msg.debug('Workers Requested:', workers_requested)
	msg.debug('worker_script_path:', worker_script_path)
	local missing_workers = workers_requested - #workers_indexed
	if missing_workers > 0 and worker_script_path ~= nil and worker_script_path ~= '' then
		for _ = 1, missing_workers do
			-- msg.debug('Recruiting Worker...')
			mp.command_native({'load-script', worker_script_path})
		end
	end
end

local function hash_string(filepath, filename)
	if OPERATING_SYSTEM == OS_WIN then return filename end
	local command
	if     exec_exist('shasum', user_opts.exec_path)     then command = {user_opts.exec_path .. 'shasum', '-a', '256', filepath}
	elseif exec_exist('gsha256sum', user_opts.exec_path) then command = {user_opts.exec_path .. 'gsha256sum', filepath}
	elseif exec_exist('sha256sum', user_opts.exec_path)  then command = {user_opts.exec_path .. 'sha256sum', filepath} end
	if not command then return filename end -- checksum command unavailable
	local res = mp.command_native({name = 'subprocess', args = command, playback_only = false, capture_stdout = true, capture_stderr = true,})
	return (res and res.stdout) and res.stdout or filename
end

local function create_ouput_dir(filepath, filename, dimension, rotate)
	local name, basepath, success, max_char = '', '', false, 64

	-- Try path without two-bytes UTF-8 char and only alphanumerics
	name = filename:gsub('[\192-\255][\128-\191]*', ''):gsub('[^%w]+', ''):sub(1, max_char)
	msg.debug('Creating Output Dir: Trying', name)
	if not is_empty(name) then
		basepath = join_paths(user_opts.cache_dir, name)
		success = create_dir(basepath)
	end
	
	if not success then  -- Try hashed path
		name = hash_string(filepath, filename):sub(1, max_char)
		msg.debug('Creating Output Dir: Trying', name)
		basepath = join_paths(user_opts.cache_dir, name)
		success = create_dir(basepath)
	end
	
	if not success then  -- Failed
		msg.error('Creating Output Dir: Failed', name)
		return {basepath = nil, fullpath = nil}
	end
	msg.debug('Creating Output Dir: Using ', name)
	
	if auto_delete == nil then auto_delete = user_opts.auto_delete end
	if auto_delete > 0 then 
		add_lock(user_opts.cache_dir)
		add_lock(basepath)
	end
	
	local fullpath = join_paths(basepath, dimension, rotate)
	if not create_dir(fullpath) then return { basepath = nil, fullpath = nil } end
	return {basepath = basepath, fullpath = fullpath}
end

local function calculate_timing(is_remote)
	local duration, file_size  = mp.get_property_native('duration', 0), mp.get_property_native('file-size', 0)
	if duration == 0 then return { duration = 0, delta = huge, high_bitrate = false } end
	local delta_target   = duration / (user_opts.thumbnail_count - 1)
	local saved_factor   = saved_state.delta_factor or 1
	local remote_factor  = is_remote and user_opts.remote_delta_factor or 1
	local stream_factor  = file_size == 0 and user_opts.stream_delta_factor or 1
	local high_bitrate   = (file_size / duration) >= (user_opts.bitrate_threshold * 131072)
	local bitrate_factor = high_bitrate and user_opts.bitrate_delta_factor or 1
	local delta = max(user_opts.min_delta, min(user_opts.max_delta, delta_target)) * saved_factor * remote_factor * stream_factor * bitrate_factor
	return { duration = duration, delta = delta, high_bitrate = high_bitrate }
end

local function calculate_scale()
	local hidpi_scale = mp.get_property_native('display-hidpi-scale', 1.0)
	if osc_opts then
		local scale = (saved_state.fullscreen ~= nil and saved_state.fullscreen) and osc_opts.scalefullscreen or osc_opts.scalewindowed
		return scale * hidpi_scale
	else
		return hidpi_scale
	end
end

local function calculate_geometry(scale)
	local geometry = { dimension = 0, width = 0, height = 0, scale = 0, rotate = 0, is_rotated = false }
	local video_params = saved_state.video_params
	local dimension = floor(saved_state.size_factor * user_opts.dimension * scale + 0.5)
	if not video_params or is_empty(video_params.dw, video_params.dh) or dimension <= 0 then return geometry end
	local width, height = dimension, dimension
	if video_params.dw > video_params.dh then
		height = floor(width  * video_params.dh / video_params.dw + 0.5)
	else
		width  = floor(height * video_params.dw / video_params.dh + 0.5)
	end
	geometry.dimension, geometry.width, geometry.height, geometry.dw, geometry.dh = dimension, width, height, video_params.dw, video_params.dh
	if not video_params.rotate then return geometry end
	geometry.rotate     = (video_params.rotate - saved_state.initial_rotate) % 360
	geometry.is_rotated = not ((((video_params.rotate - saved_state.initial_rotate) % 180) ~= 0) == saved_state.meta_rotated) --xor
	return geometry
end

local function calculate_worker_limit(duration, delta, is_remote, is_high_bitrate)
	local remote_factor  = is_remote and user_opts.worker_remote_factor or 1
	local bitrate_factor = is_high_bitrate and user_opts.worker_bitrate_factor or 1
	return max(floor(min(user_opts.max_workers, duration / delta) * remote_factor * bitrate_factor), 1)
end

local function calculate_worker_timeout(width, height, is_remote, is_high_bitrate)
	if user_opts.worker_timeout == 0 then return 0 end
	local worker_timeout = ((width * height) / 921600) * user_opts.worker_timeout
	if is_remote       then worker_timeout = worker_timeout * 2 end
	if is_high_bitrate then worker_timeout = worker_timeout * 2 end
	return ceil(worker_timeout)
end

local function has_video()
	local track_list = mp.get_property_native('track-list', {})
	if is_empty(track_list) then return false end
	for _, track in ipairs(track_list) do
		if track.type == 'video' and not track.external and not track.albumart then return true end
	end
	return false
end

local function state_init()
	local input_fullpath  = saved_state.input_fullpath
	local input_filename  = saved_state.input_filename
	local cache_format    = '%.5d'
	local cache_extension = '.bgra'
    local is_remote       = (input_fullpath:find('://') ~= nil) and mp.get_property_native('demuxer-via-network', false)
	local timing          = calculate_timing(is_remote)
	local scale           = calculate_scale()
	local geometry        = calculate_geometry(scale)
	local meta_rotated    = saved_state.meta_rotated
	local cache_dir       = create_ouput_dir(input_fullpath, input_filename, geometry.dimension, geometry.rotate)
	local worker_timeout  = calculate_worker_timeout(geometry.width, geometry.height, is_remote, timing.is_high_bitrate)
	local max_workers     = calculate_worker_limit(timing.duration, timing.delta, is_remote, timing.is_high_bitrate)
	local tn_max          = floor(timing.duration / timing.delta) + 1
	local tn_per_worker   = tn_max / max_workers
	local worker_buffer   = 2
	local osc_buffer      = worker_buffer * max_workers

	-- Global State
	state = {
		cache_dir       = cache_dir.fullpath,
		cache_dir_base  = cache_dir.basepath,
		cache_format    = cache_format,
		cache_extension = cache_extension,
		input_fullpath  = input_fullpath,
		input_filename  = input_filename,
		duration        = timing.duration,
		delta           = timing.delta,
		width           = geometry.width,
		height          = geometry.height,
		dw              = geometry.dw,
		dh              = geometry.dh,
		scale           = scale,
		rotate          = geometry.rotate,
		meta_rotated    = meta_rotated,
		is_rotated      = geometry.is_rotated,
		is_remote       = is_remote,
		tn_max          = tn_max,
		tn_per_worker   = tn_per_worker,
		max_workers     = max_workers,
		worker_timeout  = worker_timeout,
		worker_buffer   = worker_buffer,
		osc_buffer      = osc_buffer,
	}
	stop_conditions = {
		is_seekable = mp.get_property_native('seekable', true),
		has_video   = has_video(),
	}

	if is_empty(worker_script_path) then worker_script_path = user_opts.worker_script_path end
	create_workers()
	initialized = true
end

local function saved_state_init()
	local rotate = mp.get_property_native('video-params/rotate', 0)
	saved_state = {
		input_fullpath = mp.get_property_native('path', ''),
		input_filename = mp.get_property_native('filename/no-ext', ''):gsub('watch%?v=', ''),
		meta_rotated   = ((rotate % 180) ~= 0),
		initial_rotate = rotate % 360,
		delta_factor   = 1.0,
		size_factor    = 1.0,
		fullscreen     = mp.get_property_native("fullscreen", false)
	}
end

local function is_thumbnailable()
	-- Must catch all cases that's not thumbnail-able and anything else that may crash the OSC.
	if not (state and stop_conditions) then return false end
	for key, value in pairs(state) do
		if key == 'rotate'         and value then goto continue end
		if key == 'worker_buffer'  and value then goto continue end
		if key == 'osc_buffer'     and value then goto continue end
		if key == 'worker_timeout' and value then goto continue end
		if is_empty(value) then
			msg.warn('Stopping - State Incomplete:', key, value)
			return false
		end
		::continue::
	end
	for condition, value in pairs(stop_conditions) do		
		if not value then 
			msg.warn('Stopping:', condition, value)
			return false 
		end
	end
	return true
end

local function delete_cache_dir()
	if auto_delete == nil then auto_delete = user_opts.auto_delete end
	local path = user_opts.cache_dir
	remove_lock(path)
	if auto_delete > 0 then 
		if not is_locked(path) then 
			msg.debug('Clearing Cache on Shutdown:', path)
			if path:len() < 16 then return end
			delete_dir(path)
		else
			msg.debug('Clearing Cache on Shutdown:ignore ', path, '- Locked')
		end
	end
end

local function delete_cache_subdir()
	if not state then return end
	if auto_delete == nil then auto_delete = user_opts.auto_delete end
	local path = state.cache_dir_base
	remove_lock(path)
	if auto_delete == 1 then
		if not is_locked(path) then 
			msg.debug('Clearing Cache for File:', path)
			if path:len() < 16 then return end
			delete_dir(path)
		else
			msg.debug('Clearing Cache for File:ignore ', path, '- Locked')
		end
	end
end

local function reset_all(keep_saved, keep_osc_data)
	initialized = false
	osc_full_update_timer:kill()
	osc_delta_update_timer:kill()
	workers_stop()
	workers_reset()
	reset_thumbnails()
	opt.read_options(user_opts, script_name)
	if not keep_saved or not saved_state then saved_state_init() end
	if not keep_osc_data then osc_reset() else osc_reset_stats() end
	msg.debug('Reset (' .. (keep_saved and 'Soft' or 'Hard') .. ', ' .. (keep_osc_data and 'OSC-Partial' or 'OSC-All') .. ')')
end

local function run_generation(paused)
	if not initialized or not is_thumbnailable() then return end
	if #workers_indexed < state.max_workers or not osc_name or not osc_opts then
		mp.add_timeout(0.1, function() run_generation(paused) end)
	else
		workers_queue()
		if not paused then
			workers_start()
			osc_delta_update_timer:resume()
		end
	end
end

local function stop() 
	workers_stop()
	osc_delta_update_timer:kill()
	osc_delta_update(true)
end

local function start(paused)
	if not initialized then mp.add_timeout(user_opts.start_delay, function() 
			state_init()
			start(paused)
		end)
	end
	if is_thumbnailable() then
		osc_update(state, osc_set_options(osc_visible), nil)
		run_generation(paused)
	end
end

local function osc_set_visibility(is_visible)
	if is_visible and not initialized then start(true) end
	if osc_name then osc_update(nil, osc_set_options(is_visible), nil) end
end


--------------
-- Bindings --
--------------
-- Binding - Manual Start
mp.register_script_message(message.manual_start, start)

-- Binding - Manual Stop
mp.register_script_message(message.manual_stop, stop)

-- Binding - Toggle Generation
mp.register_script_message(message.toggle_gen, function() if workers_are_stopped() then start() else stop() end end)

-- Binding - Manual Show OSC
mp.register_script_message(message.manual_show, function() osc_set_visibility(true) end)

-- Binding - Manual Hide OSC
mp.register_script_message(message.manual_hide, function() osc_set_visibility(false) end)

-- Binding - Toggle Visibility
mp.register_script_message(message.toggle_osc,  function() osc_set_visibility(not osc_visible) end)

-- Binding - Double Frequency
mp.register_script_message(message.double, function()
	if not initialized or not saved_state or not saved_state.delta_factor then return end
	local target = max(0.25, saved_state.delta_factor * 0.5)
	if tostring(saved_state.delta_factor) ~= tostring(target) then
		saved_state.delta_factor = target
		reset_all(true, true)
		start()
	end
end)

local function resize(target)
	if tostring(saved_state.size_factor) ~= tostring(target) then
		saved_state.size_factor = target
		reset_all(true)
		start()
	end
end

-- Binding - Shrink
mp.register_script_message(message.shrink, function()
	if initialized and saved_state and saved_state.size_factor then resize(max(0.2, saved_state.size_factor - 0.2)) end
end)

-- Binding - Enlarge
mp.register_script_message(message.enlarge, function()
	if initialized and saved_state and saved_state.size_factor then resize(min(2.0, saved_state.size_factor + 0.2)) end
end)

-- Binding - Toggle Auto Delete
local auto_delete_message = { [0] = '', [1] = ' (on file close)', [2] = ' (on quit)' }
mp.register_script_message(message.auto_delete, function()
	if auto_delete == nil then auto_delete = user_opts.auto_delete end
	auto_delete = (auto_delete + 1) % 3
	mp.osd_message( (auto_delete > 0 and '■' or '□') .. ' Thumbnail Auto Delete' .. auto_delete_message[auto_delete])
end)


------------
-- Events --
------------
-- On Video Params Change
mp.observe_property('video-params', 'native', function(_, video_params)
	if not video_params or is_empty(video_params.dw, video_params.dh) then return end
	if not saved_state or (saved_state.input_fullpath ~= mp.get_property_native('path', '')) then
		delete_cache_subdir()
		reset_all()
		saved_state.video_params = video_params
		start(not user_opts.auto_gen)
		return
	end
	if initialized and saved_state and saved_state.video_params and saved_state.video_params.rotate and video_params.rotate and tostring(saved_state.video_params.rotate) ~= tostring(video_params.rotate) then
		reset_all(true)
		saved_state.video_params = video_params
		start()
		return
	end
end)

-- On Fullscreen Change
mp.observe_property('fullscreen', 'native', function(_, fullscreen)
	if (fullscreen == nil) or (not osc_opts or osc_opts.scalewindowed == osc_opts.scalefullscreen) then return end
	if initialized and saved_state then
		reset_all(true)
		saved_state.fullscreen = fullscreen
		start()
		return
	end
end)

-- On file close
mp.register_event('end-file', delete_cache_subdir)

-- On Shutdown
mp.register_event('shutdown', delete_cache_dir)


-------------------
-- Workers & OSC --
-------------------
-- Listen for OSC Registration
mp.register_script_message(message.osc.registration, function(json)
	local osc_reg = parse_json(json)
	if osc_reg and osc_reg.script_name and osc_reg.osc_opts and not (osc_name and osc_opts) then
		osc_name = osc_reg.script_name
		osc_opts = osc_reg.osc_opts
		msg.debug('OSC Registered:', utils.to_string(osc_reg))
	else
		msg.warn('OSC Not Registered:', utils.to_string(osc_reg))
	end
end)

-- Listen for OSC Finish
mp.register_script_message(message.osc.finish, function()
	msg.debug('OSC: Finished.')
	osc_delta_update_timer:kill()
	osc_full_update_timer:kill()
end)

-- Listen for Worker Registration
mp.register_script_message(message.worker.registration, function(new_reg)
	local worker_reg = parse_json(new_reg)
	if worker_reg.name and not workers[worker_reg.name] then
		workers[worker_reg.name] = true
		workers_indexed[#workers_indexed + 1] = worker_reg.name
		if (is_empty(worker_script_path)) and not is_empty(worker_reg.script_path) then
			worker_script_path = worker_reg.script_path
			create_workers()
			msg.debug('Worker Script Path Recieved:', worker_script_path)
		end
		msg.debug('Worker Registered:', worker_reg.name)
	else
		msg.warn('Worker Not Registered:', worker_reg.name)
	end
end)

-- Listen for Worker Progress Report
mp.register_script_message(message.worker.progress, function(json)
	local new_progress = parse_json(json)
	if new_progress.input_filename ~= state.input_filename then return end
	for time_string, new_status in pairs(new_progress.thumbnail_map) do
		if thumbnails_new[time_string] ~= new_status then
			thumbnails_new[time_string] = new_status
			thumbnails_new_count = thumbnails_new_count + 1
		end
		osc_update_count(time_string, new_status)
		thumbnails[time_string] = new_status
	end
end)

-- Listen for Worker Finish
mp.register_script_message(message.worker.finish, function(json)
	local worker_stats = parse_json(json)
	if worker_stats.name and worker_stats.queued == 0 and not workers_finished[worker_stats.name] then
		workers_finished[worker_stats.name] = true
		workers_finished_indexed[#workers_finished_indexed + 1] = worker_stats.name
		msg.debug('Worker Finished:', worker_stats.name, json)
	else
		msg.warn('Worker Finished (uncounted):', worker_stats.name, json)
	end
	if #workers_finished_indexed >= state.max_workers then
		msg.debug('All Workers: Finished.')
		osc_delta_update_timer:kill()
		osc_delta_update(true)
		osc_full_update_timer:resume()
	end
end)


-----------
-- Debug --
-----------
mp.register_script_message(message.debug, function()
	msg.info('============')
	msg.info('Video Stats:')
	msg.info('============')
	msg.info('video-params', utils.to_string(mp.get_property_native('video-params', {})))
	msg.info('video-dec-params', utils.to_string(mp.get_property_native('video-dec-params', {})))
	msg.info('video-out-params', utils.to_string(mp.get_property_native('video-out-params', {})))
	msg.info('track-list', utils.to_string(mp.get_property_native('track-list', {})))
	msg.info('duration', mp.get_property_native('duration', 0))
	msg.info('file-size', mp.get_property_native('file-size', 0))
	msg.info('auto_delete', auto_delete)
	
	msg.info('============================')
	msg.info('Thumbnailer Internal States:')
	msg.info('============================')
	msg.info('saved_state:', state and utils.to_string(saved_state) or 'nil')
	msg.info('state:', state and utils.to_string(state) or 'nil')
	msg.info('stop_conditions:', stop_conditions and utils.to_string(stop_conditions) or 'nil')
	msg.info('user_opts:', user_opts and utils.to_string(user_opts) or 'nil')
	msg.info('worker_script_path:', worker_script_path and worker_script_path or 'nil')
	msg.info('osc_name:', osc_name and osc_name or 'nil')
	msg.info('osc_stats:', osc_stats and utils.to_string(osc_stats) or 'nil')
	msg.info('thumbnails:', thumbnails and utils.to_string(thumbnails) or 'nil')
	msg.info('thumbnails_new:', thumbnails_new and utils.to_string(thumbnails_new) or 'nil')
	msg.info('workers:', workers and utils.to_string(workers) or 'nil')
	msg.info('workers_indexed:', workers_indexed and utils.to_string(workers_indexed) or 'nil')
	msg.info('workers_finished:', workers_finished and utils.to_string(workers_finished) or 'nil')
	msg.info('workers_finished_indexed:', workers_finished_indexed and utils.to_string(workers_finished_indexed) or 'nil')
end)
