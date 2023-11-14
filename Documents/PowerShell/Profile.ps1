$theme = "https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/di4am0nd.omp.json"
oh-my-posh init pwsh --config $theme | Invoke-Expression

Set-Alias -Name cz -Value chezmoi
Set-Alias -Name ls -Value eza

Function longAll {eza -la}
Set-Alias -Name l -Value longAll
