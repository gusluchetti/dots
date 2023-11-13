oh-my-posh init pwsh --config "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/zash.omp.json" | Invoke-Expression

Set-Alias -Name cz -Value chezmoi
Set-Alias -Name ls -Value eza

Function longAll {eza -la}
Set-Alias -Name l -Value longAll