local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"
	config.font = wezterm.font("JetBrains Mono")
	config.window_close_confirmation = "NeverPrompt"
	config.hide_tab_bar_if_only_one_tab = true
	config.detect_password_input = true
	config.window_background_opacity = 0.7
end

return module
