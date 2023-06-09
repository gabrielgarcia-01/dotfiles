local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"
	config.font = wezterm.font("Iosevka")
	config.window_close_confirmation = "NeverPrompt"
	config.hide_tab_bar_if_only_one_tab = true
	config.detect_password_input = true
	config.window_background_opacity = 0.85
end

return module
