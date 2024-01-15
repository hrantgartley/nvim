-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}
local act = wezterm.action

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.default_domain = "WSL:Debian"
-- config.default_prog = { "powershell.exe" }
-- For example, changing the color scheme:
config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.color_scheme = "Blue Matrix" -- possible change to "Blue Matrix"
config.color_scheme = "cyberpunk"

-- config.font = wezterm.font("Monaspace Argon")
config.font_size = 13
config.window_background_image = "g:/Wallpapers/1a1b26.png"
-- config.color_scheme = "tokyonight_night"
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 800
config.window_background_opacity = 0.999
config.text_background_opacity = 1
config.harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "calt", "dlig" }
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- sets cursor to white
config.colors = {
	cursor_border = "#e1e2e7",
	cursor_bg = "#e1e2e7",
}
config.keys = {
	-- This will create a new split and run your default program inside it
	{
		key = "%",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "ALT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "j",
		mods = "ALT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "ALT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "l",
		mods = "ALT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

-- and finally, return the configuration to wezterm
return config
