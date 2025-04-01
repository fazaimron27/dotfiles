local wezterm = require("wezterm")
local mux = wezterm.mux

---@diagnostic disable-next-line: unused-local
wezterm.on("gui-attached", function(domain)
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)
local config = wezterm.config_builder()
local opacity = 0.95

config.color_scheme = "Monokai Dark (Gogh)"
config.colors = {
	background = "#222222",
}
config.font = wezterm.font("JetBrainsMono NF")
config.font_size = 12
config.line_height = 1.2

-- Window
config.window_background_opacity = opacity
-- config.initial_rows = 40
-- config.initial_cols = 115
config.enable_scroll_bar = false
config.window_decorations = "NONE"

-- Tabs
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.keys = {
	{
		key = "f",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "'",
		mods = "CTRL",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
}

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.window_padding = {
	left = 13,
	right = 10,
	top = 13,
	bottom = 10,
}

return config
