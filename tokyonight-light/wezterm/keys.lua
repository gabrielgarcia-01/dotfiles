local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

function module.apply_to_config(config)
	config.keys = {
		-- Split horizonal and vertical
		{ key = '"', mods = "CTRL|SHIFT", action = act.SplitVertical },
		{ key = "|", mods = "CTRL|SHIFT", action = act.SplitHorizontal },

		-- Scrollback
		{ key = "k", mods = "CTRL", action = act.ScrollByLine(-1) },
		{ key = "j", mods = "CTRL", action = act.ScrollByLine(1) },

		-- Switch between panes
		{ key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },

		-- Adjust the size of panes
		{ key = "h", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "j", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "k", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "l", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Right", 5 }) },
	}
end

return module
