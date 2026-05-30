local Element = require('elements/Element')

---@alias TopBarButtonProps {icon: string; hover_fg?: string; hover_bg?: string; command: (fun():string)}

---@class TopBar : Element
local TopBar = class(Element)

function TopBar:new() return Class.new(self) --[[@as TopBar]] end
function TopBar:init()
	Element.init(self, 'top_bar', {render_order = 4})
	self.size = 0
	self.alt_title_size = 0
	self.chapter_size = 0
	self.titles_spacing = 1
	self.icon_size, self.font_size, self.title_by = 1, 1, 1
	self.show_alt_as_main = false
	self.main_title, self.alt_title = nil, nil
	---@type table<string, string|nil>
	self.render_titles = {}
	---@type {index: number; title: string}|nil
	self.current_chapter = nil

	local function maximized_command()
		if state.platform == 'windows' then
			mp.command(state.border
				and (state.fullscreen and 'set fullscreen no;cycle window-maximized' or 'cycle window-maximized')
				or 'set window-maximized no;cycle fullscreen')
		else
			mp.command(state.fullormaxed and 'set fullscreen no;set window-maximized no' or 'set window-maximized yes')
		end
	end

	local close = {icon = 'close', hover_bg = '2311e8', hover_fg = 'ffffff', command = function() mp.command('quit') end}
	local max = {icon = 'crop_square', command = maximized_command}
	local min = {icon = 'minimize', command = function() mp.command('cycle window-minimized') end}
	self.buttons = options.top_bar_controls == 'left' and {close, max, min} or {min, max, close}

	self:register_observers()
	self:decide_enabled()
	self:update_dimensions()
end

---@return string|nil
local function expand_template(template)
	-- escape ASS, and strip newlines and trailing slashes and trim whitespace
	local tmp = mp.command_native({'expand-text', template}):gsub('\\n', ' '):gsub('[\\%s]+$', ''):gsub('^%s+', '')
	return tmp and tmp ~= '' and ass_escape(tmp) or nil
end

function TopBar:add_template_listener(template, callback)
	local props = get_expansion_props(template)
	for prop, _ in pairs(props) do
		self:observe_mp_property(prop, 'native', callback)
	end
	if not next(props) then callback() end
end

function TopBar:register_observers()
	-- Main title
	if #options.top_bar_title > 0 and options.top_bar_title ~= 'no' then
		if options.top_bar_title == 'yes' then
			local template = nil
			local function update_main_title()
				self.main_title = expand_template(template)
				self:update_render_titles()
			end
			local function remove_template_listener(callback) mp.unobserve_property(callback) end

			self:observe_mp_property('title', 'string', function(_, title)
				remove_template_listener(update_main_title)
				template = title
				if template then
					if template:sub(-6) == ' - mpv' then template = template:sub(1, -7) end
					self:add_template_listener(template, update_main_title)
				end
			end)
		elseif type(options.top_bar_title) == 'string' then
			self:add_template_listener(options.top_bar_title, function()
				self.main_title = expand_template(options.top_bar_title)
				self:update_render_titles()
			end)
		end
	end

	-- Alt title
	if #options.top_bar_alt_title > 0 and options.top_bar_alt_title ~= 'no' then
		self:add_template_listener(options.top_bar_alt_title, function()
			self.alt_title = expand_template(options.top_bar_alt_title)
			self:update_render_titles()
		end)
	end
end

function TopBar:decide_enabled()
	if options.top_bar == 'no-border' then
		self.enabled = not state.border or state.title_bar == false or state.fullscreen
	else
		self.enabled = options.top_bar == 'always'
	end
	self.enabled = self.enabled and (options.top_bar_controls or options.top_bar_title ~= 'no' or state.has_playlist)
end

-- Set titles. Both have to be passed at the same time so that they can be normalized & deduplicated.
function TopBar:update_render_titles()
	local main, alt = self.main_title, self.alt_title

	if main == 'No file' then
		main = ulang._border_title
	end

	-- Fall back to alt title if main is empty
	if not main or main == '' then
		main, alt = alt, nil
	end

	-- Deduplicate the main and alt titles by checking if one completely
	-- contains the other, and using only the longer one.
	if main and alt and not self.show_alt_as_main then
		local longer_title, shorter_title
		if #main < #alt then
			longer_title, shorter_title = alt, main
		else
			longer_title, shorter_title = main, alt
		end

		local escaped_shorter_title = regexp_escape(shorter_title --[[@as string]])
		if string.match(longer_title --[[@as string]], escaped_shorter_title) then
			main, alt = longer_title, nil
		end
	end

	if self.show_alt_as_main and alt and alt ~= '' then
		main, alt = alt, nil
	end

	self.render_titles.main, self.render_titles.alt = main, alt
	self:update_dimensions()
	request_render()
end

function TopBar:select_current_chapter()
	local current_chapter_index = self.current_chapter and self.current_chapter.index
	local current_chapter
	if state.time and state.chapters then
		_, current_chapter = itable_find(state.chapters, function(c) return state.time >= c.time end, #state.chapters, 1)
	end
	local new_chapter_index = current_chapter and current_chapter.index
	if current_chapter_index ~= new_chapter_index then
		self.current_chapter = current_chapter
		if itable_has(config.top_bar_flash_on, 'chapter') then
			self:flash()
		end
		self:update_dimensions()
	end
end

function TopBar:update_dimensions()
	self.size = round(options.top_bar_size * state.scale)
	self.title_spacing = round(1 * state.scale)
	self.icon_size = round(self.size * 0.5)
	self.font_size = math.floor((self.size - (math.ceil(self.size * 0.25) * 2)) * options.font_scale)
	self.alt_title_size = round(self.font_size * 1.2)
	self.chapter_size = round(self.font_size * 1.1)
	local window_border_size = Elements:v('window_border', 'size', 0)
	local min_hitbox_height = self.size
	if self.render_titles.alt and options.top_bar_alt_title_place == 'below' then
		min_hitbox_height = min_hitbox_height + self.title_spacing + self.alt_title_size
	end
	if self.current_chapter then
		min_hitbox_height = min_hitbox_height + self.title_spacing + self.chapter_size
	end
	self.ax = window_border_size
	self.ay = window_border_size
	self.bx = display.width - window_border_size
	-- We extend the hitbox so that people with low proximity options can still click on chapter button
	self.by = math.max(self.size + window_border_size, min_hitbox_height - options.proximity_in)
end

function TopBar:toggle_title()
	if options.top_bar_alt_title_place ~= 'toggle' then return end
	self.show_alt_as_main = not self.show_alt_as_main
	self:update_render_titles()
end

function TopBar:on_prop_time()
	self:select_current_chapter()
end

function TopBar:on_prop_chapters()
	self:select_current_chapter()
end

function TopBar:on_prop_border()
	self:decide_enabled()
	self:update_dimensions()
end

function TopBar:on_prop_title_bar()
	self:decide_enabled()
	self:update_dimensions()
end

function TopBar:on_prop_fullscreen()
	self:decide_enabled()
	self:update_dimensions()
end

function TopBar:on_prop_maximized()
	self:decide_enabled()
	self:update_dimensions()
end

function TopBar:on_prop_has_playlist()
	self:decide_enabled()
	self:update_dimensions()
end

function TopBar:on_display() self:update_dimensions() end

function TopBar:on_options()
	self:decide_enabled()
	self:update_dimensions()
end

function TopBar:render()
	local visibility = self:get_visibility()
	if visibility <= 0 then return end
	local ass = assdraw.ass_new()
	-- `by` might be artificially extended so people with low proximity options
	-- can still click on chapter button, so we can't use it for rendering.
	local ax, ay, bx, by = self.ax, self.ay, self.bx, self.ay + self.size
	local margin = math.floor((self.size - self.font_size) / 4)

	-- Window controls
	if options.top_bar_controls then
		local is_left, button_ax = options.top_bar_controls == 'left', 0
		if is_left then
			button_ax = ax
			ax = self.size * #self.buttons
		else
			button_ax = bx - self.size * #self.buttons
			bx = button_ax
		end

		for _, button in ipairs(self.buttons) do
			local rect = {ax = button_ax, ay = ay, bx = button_ax + self.size, by = by}
			local is_hover = get_point_to_rectangle_proximity(cursor, rect) <= 0
			local opacity = is_hover and 1 or config.opacity.controls
			local button_fg = is_hover and (button.hover_fg or bg) or fg
			local button_bg = is_hover and (button.hover_bg or fg) or bg

			cursor:zone('primary_click', rect, button.command)

			local bg_size = self.size - margin
			local bg_ax, bg_ay = rect.ax + (is_left and margin or 0), rect.ay + margin
			local bg_bx, bg_by = bg_ax + bg_size, bg_ay + bg_size

			ass:rect(bg_ax, bg_ay, bg_bx, bg_by, {
				color = button_bg, opacity = visibility * opacity, radius = state.radius,
			})

			ass:icon(bg_ax + bg_size / 2, bg_ay + bg_size / 2, bg_size * 0.5, button.icon, {
				color = button_fg,
				border_color = button_bg,
				opacity = visibility,
				border = options.text_border * state.scale,
			})

			button_ax = button_ax + self.size
		end
	end

	-- Window title
	local main_title, alt_title = self.render_titles.main, self.render_titles.alt
	if main_title or state.has_playlist then
		local padding = round(self.font_size / 2)
		local left_aligned = options.top_bar_controls == 'left'
		local title_ax, title_bx, title_ay = ax + margin, bx - margin, self.ay + margin

		-- Playlist position
		if state.has_playlist then
			local text = state.playlist_pos .. '' .. state.playlist_count
			local formatted_text = '{\\b1}' .. state.playlist_pos .. '{\\b0\\fs' .. self.font_size * 0.9 .. '}/'
				.. state.playlist_count
			local opts = {size = self.font_size, wrap = 2, color = fgt, opacity = visibility}
			local rect_width = round(text_width(text, opts) + padding * 2)
			local ax = left_aligned and title_bx - rect_width or title_ax
			local rect = {
				ax = ax,
				ay = title_ay,
				bx = ax + rect_width,
				by = by - margin,
			}
			local opacity = get_point_to_rectangle_proximity(cursor, rect) <= 0
				and 1 or config.opacity.playlist_position
			if opacity > 0 then
				ass:rect(rect.ax, rect.ay, rect.bx, rect.by, {
					color = fg, opacity = visibility * opacity, radius = state.radius,
				})
			end
			ass:txt(rect.ax + (rect.bx - rect.ax) / 2, rect.ay + (rect.by - rect.ay) / 2, 5, formatted_text, opts)
			if left_aligned then title_bx = rect.ax - margin else title_ax = rect.bx + margin end

			-- Click action
			cursor:zone('primary_click', rect, function() mp.command('script-binding uosc/playlist') end)
		end

		-- Skip rendering titles if there's not enough horizontal space
		if title_bx - title_ax > self.font_size * 3 and options.top_bar_title ~= 'no' then
			-- Main title
			if main_title then
				local opts = {
					size = self.font_size,
					wrap = 2,
					color = bgt,
					opacity = visibility,
					border = options.text_border * state.scale,
					border_color = bg,
					clip = string.format('\\clip(%d, %d, %d, %d)', self.ax, ay, title_bx, by),
				}
				local rect_ideal_width = round(text_width(main_title, opts) + padding * 2)
				local rect_width = math.min(rect_ideal_width, title_bx - title_ax)
				local ax = left_aligned and title_bx - rect_width or title_ax
				local by = by - margin
				local title_rect = {ax = ax, ay = title_ay, bx = ax + rect_width, by = by}

				if options.top_bar_alt_title_place == 'toggle' then
					cursor:zone('primary_click', title_rect, function() self:toggle_title() end)
				end

				ass:rect(title_rect.ax, title_rect.ay, title_rect.bx, title_rect.by, {
					color = bg, opacity = visibility * config.opacity.title, radius = state.radius,
				})
				local align = left_aligned and rect_ideal_width == rect_width and 6 or 4
				local x = align == 6 and title_rect.bx - padding or ax + padding
				ass:txt(x, ay + (self.size / 2), align, main_title, opts)
				title_ay = by + self.title_spacing
			end

			-- Alt title
			if alt_title and options.top_bar_alt_title_place == 'below' then
				local by = title_ay + self.alt_title_size
				local opts = {
					size = round(self.alt_title_size * 0.77),
					wrap = 2,
					color = bgt,
					border = options.text_border * state.scale,
					border_color = bg,
					opacity = visibility,
				}
				local rect_ideal_width = round(text_width(alt_title, opts) + padding * 2)
				local rect_width = math.min(rect_ideal_width, title_bx - title_ax)
				local ax = left_aligned and title_bx - rect_width or title_ax
				local bx = ax + rect_width
				opts.clip = string.format('\\clip(%d, %d, %d, %d)', title_ax, title_ay, bx, by)
				ass:rect(ax, title_ay, bx, by, {
					color = bg, opacity = visibility * config.opacity.title, radius = state.radius,
				})
				local align = left_aligned and rect_ideal_width == rect_width and 6 or 4
				local x = align == 6 and bx - padding or ax + padding
				ass:txt(x, title_ay + self.alt_title_size / 2, align, alt_title, opts)
				title_ay = by + self.title_spacing
			end

			-- Current chapter
			if self.current_chapter then
				local padding_half = round(padding / 2)
				local prefix, postfix = left_aligned and '' or '└ ', left_aligned and ' ┘' or ''
				local text = prefix .. self.current_chapter.index .. ': ' .. self.current_chapter.title .. postfix
				local next_chapter = state.chapters[self.current_chapter.index + 1]
				local chapter_end = next_chapter and next_chapter.time or state.duration or 0
				local remaining_time = ((state.time or 0) - chapter_end) /
					(options.destination_time == 'time-remaining' and 1 or state.speed)
				local remaining_human = format_time(remaining_time, math.abs(remaining_time))
				local opts = {
					size = round(self.chapter_size * 0.77),
					italic = true,
					wrap = 2,
					color = bgt,
					border = options.text_border * state.scale,
					border_color = bg,
					opacity = visibility * 0.8,
				}
				local remaining_width = timestamp_width(remaining_human, opts)
				local remaining_box_width = remaining_width + padding_half * 2

				-- Title
				local max_bx = title_bx - remaining_box_width - self.title_spacing
				local rect_ideal_width = round(text_width(text, opts) + padding * 2)
				local rect_width = math.min(rect_ideal_width, max_bx - title_ax)
				local ax = left_aligned and title_bx - rect_width or title_ax
				local rect = {
					ax = ax,
					ay = title_ay,
					bx = ax + rect_width,
					by = title_ay + self.chapter_size,
				}
				opts.clip = string.format('\\clip(%d, %d, %d, %d)', title_ax, title_ay, rect.bx, rect.by)
				ass:rect(rect.ax, rect.ay, rect.bx, rect.by, {
					color = bg, opacity = visibility * config.opacity.title, radius = state.radius,
				})
				local align = left_aligned and rect_ideal_width == rect_width and 6 or 4
				local x = align == 6 and rect.bx - padding or rect.ax + padding
				ass:txt(x, rect.ay + self.chapter_size / 2, align, text, opts)

				-- Time
				local time_ax = left_aligned
					and rect.ax - self.title_spacing - remaining_box_width or rect.bx + self.title_spacing
				local time_bx = time_ax + remaining_box_width
				opts.clip = nil
				ass:rect(time_ax, rect.ay, time_bx, rect.by, {
					color = bg, opacity = visibility * config.opacity.title, radius = state.radius,
				})
				ass:txt(time_ax + padding_half, rect.ay + self.chapter_size / 2, 4, remaining_human, opts)

				-- Click action
				rect.bx = time_bx
				cursor:zone('primary_click', rect, function() mp.command('script-binding uosc/chapters') end)

				title_ay = rect.by + self.title_spacing
			end
		end
		self.title_by = title_ay - 1
	else
		self.title_by = ay
	end

	return ass
end

return TopBar
