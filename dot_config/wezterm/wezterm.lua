local wezterm = require 'wezterm'
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.launch_menu = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'pwsh' }
    table.insert(config.launch_menu,
        {
            label = 'SSH Homeserver',
            args = { 'pwsh', '-c', 'ssh sushii@192.168.0.173' },
        }
    )
end

config.keys = {
    { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
}

config.window_background_opacity = 0.925
config.font_size = 15.0
config.font = wezterm.font {
    family = 'BerkeleyMono Nerd Font',
}
config.color_scheme = 'Gruvbox dark, hard (base16)'

return config
