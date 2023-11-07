{{ if eq .chezmoi.os "darwin" }}
    {{ template "mac_install-pkgs.sh" }}
{{ else if eq .chezmoi.os "linux" }}
    {{ template "linux-fedora_install-pkgs.sh" }}
{{ else if eq .chezmoi.os "windows" }}
    {{ template "win_install-pkgs.ps1" }}
{{ end }}
