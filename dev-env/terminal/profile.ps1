# Prompt
Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionViewStyle ListView 

# Variables
$github = "C:\Users\$env:USERNAME\Documents\GitHub"
$theme_name = "cramro"
$theme_path = "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\${theme_name}.omp.json"
$history = "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"

# Alias
Set-Alias c clear
Set-Alias whereami gl
Set-Alias gcm gcmm -Force

# Git Alias
function g { & git $args }
function ga { git add $args }
function gb { git branch $args }
function gcl { git clone $args }
function gcmm { git commit -am $args }
function gf { git fetch $args }
function gpl { git pull }
function gpush { git push origin  $args }
function gs { & git status -sb $args }
function gt { & git log --graph --oneline --decorate $args }

# Winget Alias
function wi { & winget install $args -e -h --accept-package-agreements --accept-source-agreements }
function wl { & winget list -q $args }
function ws { & winget search $args }

oh-my-posh --init --shell pwsh --config $theme_path | Invoke-Expression