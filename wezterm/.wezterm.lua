local wezterm = require("wezterm")
local config = {}

-- Only with WSL
-- config.wsl_domains = {
-- 	{
-- 		name = "WSL:Ubuntu",
-- 		distribution = "Ubuntu",
--         default_cwd = '/home/brenno'
-- 	},
-- }
-- config.default_domain = "WSL:Ubuntu"

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.colors = {
	foreground = "#BBC3D4",
	background = "#181616",
	cursor_bg = "#5E81AC",
	cursor_border = "#5E81AC",
	cursor_fg = "#E5E9F0",
	selection_bg = "#434C5E",
	selection_fg = "#D8DEE9",
	ansi = { "#191D24", "#BF616A", "#A3BE8C", "#EBCB8B", "#5E81AC", "#B48EAD", "#8FBCBB", "#D8DEE9" },
	brights = { "#1E222A", "#C5727A", "#B1C89D", "#EFD49F", "#81A1C1", "#BE9DB8", "#9FC6C5", "#ECEFF4" },
}

config.window_background_opacity = 0.97
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13
config.enable_tab_bar = false
config.enable_wayland = true

config.max_fps = 75
config.animation_fps = 75

return config
