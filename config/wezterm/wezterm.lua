-- Pull in the wezterm API
local wezterm = require("wezterm")
local ui = require("ui")
local keys = require("keys")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { "/bin/zsh" }
ui.apply_to_config(config)
keys.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
