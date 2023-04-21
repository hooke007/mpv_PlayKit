local Element = require('elements/Element')
local Button = require('elements/Button')
local CycleButton = require('elements/CycleButton')
local Speed = require('elements/Speed')

-- `scale` - `options.controls_size` scale factor.
-- `ratio` - Width/height ratio of a static or dynamic element.
-- `ratio_min` Min ratio for 'dynamic' sized element.
---@alias ControlItem {element?: Element; kind: string; sizing: 'space' | 'static' | 'dynamic'; scale: number; ratio?: number; ratio_min?: number; hide: boolean; dispositions?: table<string, boolean>}

---@class Controls : Element
local Controls = class(Element)

function Controls:new() return Class.new(self) --[[@as Controls]] end
function Controls:init()
	Element.init(self, 'controls')
	---@type ControlItem[] All control elements serialized from `options.controls`.
	self.controls = {}
	---@type ControlItem[] Only controls that match current dispositions.
	self.layout = {}

	-- Serialize control elements
	local shorthands = {
		menu               = 'command:menu:script-binding uosc/menu-blurred?' .. lang._button01,
		subtitles          = 'command:subtitles:script-binding uosc/subtitles#sub>0?' .. lang._button02,
		audio              = 'command:graphic_eq:script-binding uosc/audio#audio>1?' .. lang._button03,
		['audio-device']   = 'command:speaker:script-binding uosc/audio-device?' .. lang._button04,
		video              = 'command:theaters:script-binding uosc/video#video>1?' .. lang._button05,
		playlist           = 'command:list_alt:script-binding uosc/playlist?' .. lang._button06,
		chapters           = 'command:bookmark:script-binding uosc/chapters#chapters>0?' .. lang._button07,
		editions           = 'command:bookmarks:script-binding uosc/editions#editions>1?' .. lang._button08,
		['stream-quality'] = 'command:high_quality:script-binding uosc/stream-quality?' .. lang._button09,
		['open-file']      = 'command:file_open:script-binding uosc/open-file?' .. lang._button10,
		items              = 'command:list_alt:script-binding uosc/items?' .. lang._button11,
		prev               = 'command:arrow_back_ios:script-binding uosc/prev?' .. lang._button12,
		['next']           = 'command:arrow_forward_ios:script-binding uosc/next?' .. lang._button13,
		first              = 'command:first_page:script-binding uosc/first?' .. lang._button14,
		last               = 'command:last_page:script-binding uosc/last?' .. lang._button15,
		['loop-playlist']  = 'cycle:repeat:loop-playlist:no/inf!?' .. lang._button16,
		['loop-file']      = 'cycle:repeat_one:loop-file:no/inf!?' .. lang._button17,
		shuffle            = 'toggle:shuffle:shuffle?' .. lang._button18,
		fullscreen         = 'cycle:crop_free:fullscreen:no/yes=fullscreen_exit!?' .. lang._button19,

		-- 自定义的捷径
		['play_pause']     = 'cycle:not_started:pause:no=play_circle/yes=pause_circle?' .. lang._button_ext01,
		['pause_play']     = 'cycle:not_started:pause:no=pause_circle/yes=play_circle?' .. lang._button_ext02,
		['pl-prev']        = 'command:navigate_before:playlist-prev?' .. lang._button_ext03,
		['pl-next']        = 'command:navigate_next:playlist-next?' .. lang._button_ext04,
		border             = 'toggle:border_style:border?' .. lang._button_ext05,
		ontop              = 'cycle:move_up:ontop:no/yes!?' .. lang._button_ext06,
		hwdec              = 'cycle:developer_board_off:hwdec:no=developer_board_off/yes=memory/auto-copy=developer_board?' .. lang._button_ext07,
		unscaled           = 'cycle:fit_screen:video-unscaled:no/yes!?' .. lang._button_ext08,
		deband             = 'cycle:texture:deband:no/yes!?' .. lang._button_ext09,
		deint              = 'cycle:clear_all:deinterlace:no/yes!?' .. lang._button_ext10,
		['shot-vid']       = 'command:screenshot:screenshot video?' .. lang._button_ext11,

		['ST-stats_tog']   = 'command:info_outline:script-binding display-stats-toggle?' .. lang._button_ext12,
		['ST-thumb_tog']   = 'command:panorama:script-binding thumb_toggle?' .. lang._button_ext13,

	}

	-- Parse out disposition/config pairs
	local items = {}
	local in_disposition = false
	local current_item = nil
	for c in options.controls:gmatch('.') do
		if not current_item then current_item = {disposition = '', config = ''} end
		if c == '<' and #current_item.config == 0 then in_disposition = true
		elseif c == '>' and #current_item.config == 0 then in_disposition = false
		elseif c == ',' and not in_disposition then
			items[#items + 1] = current_item
			current_item = nil
		else
			local prop = in_disposition and 'disposition' or 'config'
			current_item[prop] = current_item[prop] .. c
		end
	end
	items[#items + 1] = current_item

	-- Create controls
	self.controls = {}
	for i, item in ipairs(items) do
		local config = shorthands[item.config] and shorthands[item.config] or item.config
		local config_tooltip = split(config, ' *%? *')
		local tooltip = config_tooltip[2]
		config = shorthands[config_tooltip[1]]
			and split(shorthands[config_tooltip[1]], ' *%? *')[1] or config_tooltip[1]
		local config_badge = split(config, ' *# *')
		config = config_badge[1]
		local badge = config_badge[2]
		local parts = split(config, ' *: *')
		local kind, params = parts[1], itable_slice(parts, 2)

		-- Serialize dispositions
		local dispositions = {}
		for _, definition in ipairs(split(item.disposition, ' *, *')) do
			if #definition > 0 then
				local value = definition:sub(1, 1) ~= '!'
				local name = not value and definition:sub(2) or definition
				local prop = name:sub(1, 4) == 'has_' and name or 'is_' .. name
				dispositions[prop] = value
			end
		end

		-- Convert toggles into cycles
		if kind == 'toggle' then
			kind = 'cycle'
			params[#params + 1] = 'no/yes!'
		end

		-- Create a control element
		local control = {dispositions = dispositions, kind = kind}

		if kind == 'space' then
			control.sizing = 'space'
		elseif kind == 'gap' then
			table_assign(control, {sizing = 'dynamic', scale = 1, ratio = params[1] or 0.3, ratio_min = 0})
		elseif kind == 'command' then
			if #params ~= 2 then
				mp.error(string.format(
					'command button needs 2 parameters, %d received: %s', #params, table.concat(params, '/')
				))
			else
				local element = Button:new('control_' .. i, {
					icon = params[1],
					anchor_id = 'controls',
					on_click = function() mp.command(params[2]) end,
					tooltip = tooltip,
					count_prop = 'sub',
				})
				table_assign(control, {element = element, sizing = 'static', scale = 1, ratio = 1})
				if badge then self:register_badge_updater(badge, element) end
			end
		elseif kind == 'cycle' then
			if #params ~= 3 then
				mp.error(string.format(
					'cycle button needs 3 parameters, %d received: %s',
					#params, table.concat(params, '/')
				))
			else
				local state_configs = split(params[3], ' */ *')
				local states = {}

				for _, state_config in ipairs(state_configs) do
					local active = false
					if state_config:sub(-1) == '!' then
						active = true
						state_config = state_config:sub(1, -2)
					end
					local state_params = split(state_config, ' *= *')
					local value, icon = state_params[1], state_params[2] or params[1]
					states[#states + 1] = {value = value, icon = icon, active = active}
				end

				local element = CycleButton:new('control_' .. i, {
					prop = params[2], anchor_id = 'controls', states = states, tooltip = tooltip,
				})
				table_assign(control, {element = element, sizing = 'static', scale = 1, ratio = 1})
				if badge then self:register_badge_updater(badge, element) end
			end
		elseif kind == 'speed' then
			if not Elements.speed then
				local element = Speed:new({anchor_id = 'controls'})
				table_assign(control, {
					element = element, sizing = 'dynamic', scale = params[1] or 1.3, ratio = 3.5, ratio_min = 2,
				})
			else
				msg.error('there can only be 1 speed slider')
			end
		else
			msg.error('unknown element kind "' .. kind .. '"')
			break
		end

		self.controls[#self.controls + 1] = control
	end

	self:reflow()
end

function Controls:reflow()
	-- Populate the layout only with items that match current disposition
	self.layout = {}
	for _, control in ipairs(self.controls) do
		local matches = true
		for prop, value in pairs(control.dispositions) do
			if state[prop] ~= value then
				matches = false
				break
			end
		end
		if control.element then control.element.enabled = matches end
		if matches then self.layout[#self.layout + 1] = control end
	end

	self:update_dimensions()
	Elements:trigger('controls_reflow')
end

---@param badge string
---@param element Element An element that supports `badge` property.
function Controls:register_badge_updater(badge, element)
	local prop_and_limit = split(badge, ' *> *')
	local prop, limit = prop_and_limit[1], tonumber(prop_and_limit[2] or -1)
	local observable_name, serializer, is_external_prop = prop, nil, false

	if itable_index_of({'sub', 'audio', 'video'}, prop) then
		observable_name = 'track-list'
		serializer = function(value)
			local count = 0
			for _, track in ipairs(value) do if track.type == prop then count = count + 1 end end
			return count
		end
	else
		local parts = split(prop, '@')
		-- Support both new `prop@owner` and old `@prop` syntaxes
		if #parts > 1 then prop, is_external_prop = parts[1] ~= '' and parts[1] or parts[2], true end
		serializer = function(value) return value and (type(value) == 'table' and #value or tostring(value)) or nil end
	end

	local function handler(_, value)
		local new_value = serializer(value) --[[@as nil|string|integer]]
		local value_number = tonumber(new_value)
		if value_number then new_value = value_number > limit and value_number or nil end
		element.badge = new_value
		request_render()
	end

	if is_external_prop then element['on_external_prop_' .. prop] = function(_, value) handler(prop, value) end
	else mp.observe_property(observable_name, 'native', handler) end
end

function Controls:get_visibility()
	return (Elements.speed and Elements.speed.dragging) and 1 or Elements.timeline:get_is_hovered()
		and -1 or Element.get_visibility(self)
end

function Controls:update_dimensions()
	local window_border = Elements.window_border.size
	local size = state.fullormaxed and options.controls_size_fullscreen or options.controls_size
	local spacing = options.controls_spacing
	local margin = options.controls_margin

	-- Disable when not enough space
	local available_space = display.height - Elements.window_border.size * 2
	if Elements.top_bar.enabled then available_space = available_space - Elements.top_bar.size end
	if Elements.timeline.enabled then available_space = available_space - Elements.timeline.size_max end
	self.enabled = available_space > size + 10

	-- Reset hide/enabled flags
	for c, control in ipairs(self.layout) do
		control.hide = false
		if control.element then control.element.enabled = self.enabled end
	end

	if not self.enabled then return end

	-- Container
	self.bx = display.width - window_border - margin
	self.by = (Elements.timeline.enabled and Elements.timeline.ay or display.height - window_border) - margin
	self.ax, self.ay = window_border + margin, self.by - size

	-- Controls
	local available_width = self.bx - self.ax
	local statics_width = (#self.layout - 1) * spacing
	local min_content_width = statics_width
	local max_dynamics_width, dynamic_units, spaces = 0, 0, 0

	-- Calculate statics_width, min_content_width, and count spaces
	for c, control in ipairs(self.layout) do
		if control.sizing == 'space' then
			spaces = spaces + 1
		elseif control.sizing == 'static' then
			local width = size * control.scale * control.ratio
			statics_width = statics_width + width
			min_content_width = min_content_width + width
		elseif control.sizing == 'dynamic' then
			min_content_width = min_content_width + size * control.scale * control.ratio_min
			max_dynamics_width = max_dynamics_width + size * control.scale * control.ratio
			dynamic_units = dynamic_units + control.scale * control.ratio
		end
	end

	-- Hide & disable elements in the middle until we fit into available width
	if min_content_width > available_width then
		local i = math.ceil(#self.layout / 2 + 0.1)
		for a = 0, #self.layout - 1, 1 do
			i = i + (a * (a % 2 == 0 and 1 or -1))
			local control = self.layout[i]

			if control.kind ~= 'gap' and control.kind ~= 'space' then
				control.hide = true
				if control.element then control.element.enabled = false end
				if control.sizing == 'static' then
					local width = size * control.scale * control.ratio
					min_content_width = min_content_width - width - spacing
					statics_width = statics_width - width - spacing
				elseif control.sizing == 'dynamic' then
					min_content_width = min_content_width - size * control.scale * control.ratio_min - spacing
					max_dynamics_width = max_dynamics_width - size * control.scale * control.ratio
					dynamic_units = dynamic_units - control.scale * control.ratio
				end

				if min_content_width < available_width then break end
			end
		end
	end

	-- Lay out the elements
	local current_x = self.ax
	local width_for_dynamics = available_width - statics_width
	local space_width = (width_for_dynamics - max_dynamics_width) / spaces

	for c, control in ipairs(self.layout) do
		if not control.hide then
			local sizing, element, scale, ratio = control.sizing, control.element, control.scale, control.ratio
			local width, height = 0, 0

			if sizing == 'space' then
				if space_width > 0 then width = space_width end
			elseif sizing == 'static' then
				height = size * scale
				width = height * ratio
			elseif sizing == 'dynamic' then
				height = size * scale
				width = max_dynamics_width < width_for_dynamics
					and height * ratio or width_for_dynamics * ((scale * ratio) / dynamic_units)
			end

			local bx = current_x + width
			if element then element:set_coordinates(round(current_x), round(self.by - height), bx, self.by) end
			current_x = bx + spacing
		end
	end

	Elements:update_proximities()
	request_render()
end

function Controls:on_dispositions() self:reflow() end
function Controls:on_display() self:update_dimensions() end
function Controls:on_prop_border() self:update_dimensions() end
function Controls:on_prop_fullormaxed() self:update_dimensions() end
function Controls:on_timeline_enabled() self:update_dimensions() end

return Controls
