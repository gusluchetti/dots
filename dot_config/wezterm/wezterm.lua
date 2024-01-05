-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = {}

local launch_menu = {}
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })
end

config.launch_menu = launch_menu

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_size = 17.0
config.font = wezterm.font {
  family = 'BerkeleyMono Nerd Font',
}
config.color_scheme = 'Gruvbox dark, hard (base16)'

-- and finally, return the configuration to wezterm
return config
