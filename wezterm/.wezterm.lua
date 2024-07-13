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
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#706b4e",
	selection_fg = "#f3d9c4",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.window_background_opacity = 0.5
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config

