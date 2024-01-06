local wezterm = require 'wezterm'
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'pwsh' }
    config.window_background_image = "anime.png"
    config.window_background_image_hsb = {
        brightness = 0.5,
        hue = 1.0,
        saturation = 1.0,
    }
else
    config.window_background_opacity = 0.9
end

config.font_size = 15.0
config.font = wezterm.font {
    family = 'BerkeleyMono Nerd Font',
}
config.color_scheme = 'Gruvbox dark, hard (base16)'

return config
