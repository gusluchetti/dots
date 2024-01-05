local wezterm = require 'wezterm'
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.launch_menu = {
    {
        label = 'Powershell 7',
        args = { 'pwsh.exe' }
    }
}

config.font_size = 15.0
config.font = wezterm.font {
    family = 'BerkeleyMono Nerd Font',
}
config.color_scheme = 'Gruvbox dark, hard (base16)'

return config
