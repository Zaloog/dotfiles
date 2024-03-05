# Encoding to UTF8Encoding
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Beautiful Icons and colored Names
Import-Module Terminal-Icons

# Command Line Tweaks
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineOption -PredictionViewStyle InlineView
Set-PSReadlineOption -Color @{InlinePrediction="`e[48;5;238m"}
Set-PSReadlineKeyHandler -Chord Ctrl+j -Function AcceptSuggestion
Set-PSReadlineOption -BellStyle None
Set-PSReadLineOption -colors @{ Command = "Blue"}
#Set-PSReadLineOption -colors @{ Default = "Blue"}

# Setting for fuzzy finder
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f'

# Nice Command prompt
#oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/bayer.omp.json | Invoke-Expression

$env:VIRTUAL_ENV_DISABLE_PROMPT = 1
#$env:PY_PYTHON = "3.11"

# Other Themes
# takuya
# half-life
# jv_sitecorian


####### Functions
# New Prompt
function prompt {

    $dateTime = get-date -Format "dd.MM.yyyy HH:mms"
    $regex = [regex]::Escape($HOME) + "(\\.*)*$"
    $new_home =$executionContext.SessionState.Path.CurrentLocation.Path -replace $regex, '~$1' 
    $venv = if ($env:VIRTUAL_ENV) {"($( Split-Path $env:VIRTUAL_ENV -Leaf)) "} else {''}

    Write-Host "[$dateTime] " -NoNewline -ForegroundColor DarkRed
    Write-Host $venv -NoNewline -ForegroundColor DarkBlue
    Write-Host "$env:USERNAME" -NoNewline -ForegroundColor Green
    Write-Host " @ "  -NoNewline -ForegroundColor DarkBlue
    Write-Host "$new_home" -ForegroundColor Green
 
    return "$ "
}
# close current Session
function ex{exit}

# set aws profile
function setaws{
      $env:AWS_PROFILE = "$args"
      echo "Set AWS_PROFILE to $env:AWS_PROFILE"
      }

###### GIT Shortcuts
# git status shortcut
function gitstatus{
      git status
      }

# git add all shortcut
function gitadd{
      git add .
      }

# git commit shortcut
function gitcommit(){
      git commit -m "$args"
      }

###### Manage Environments
# activate env
function actenv(){
    & "$HOME\Envs\$($args[0])\Scripts\activate.ps1"
    }

# list envs
function showenv(){
    ls "$HOME\Envs"
    }

# piplist shortcut
function pipli(){
    py -m pip list
    }

##### Navigation
# desktop shortcut
function todesktop{
      cd "$HOME\Desktop\"
      }

# nvim mappings
function nvimmaps() {
    vim "$HOME\Appdata\local\nvim\lua\slydragonn\maps.lua"
}


# nvim settings
function nvimsets() {
    vim "$HOME\Appdata\local\nvim\lua\slydragonn\settings.lua"
}

# nvim plugins
function nvimplug() {
    vim "$HOME\Appdata\local\nvim\lua\slydragonn\plugins.lua"
}

# aws profiles
function awsprofiles() {
    vim "$HOME\.aws\credentials"
}
##### Alias

# vim proxys
Set-Alias vim nvim
Set-Alias vimmaps nvimmaps
Set-Alias vimsets nvimsets
Set-Alias vimplugs nvimplug

# utils
Set-Alias grep findstr
Set-Alias tf terraform
Set-Alias ll ls
Set-Alias ddd todesktop
Set-Alias ":q" ex
Set-Alias todo open2vims
Set-Alias list openoverview

# python env stuff
Set-Alias act actenv
Set-Alias envs showenv
Set-Alias pl pipli

# set proxy
Set-Alias prox setproxy
Set-Alias noprox unsetproxy

# set aws profile
Set-Alias use setaws  
Set-Alias prof awsprofiles  

# git stuff
Set-Alias gs gitstatus
Set-Alias ga gitadd
Set-Alias cm gitcommit

##### Autocompletions
Get-ChildItem "$PROFILE\..\Completions\" | ForEach-Object {
    . $_.FullName
}
