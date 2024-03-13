# Encoding to UTF8Encoding
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding


# Beautiful Icons and colored Names
Import-Module Terminal-Icons
Import-Module PSReadLine

# Command Line Tweaks
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineOption -PredictionViewStyle InlineView
Set-PSReadlineOption -Color @{InlinePrediction="`e[48;5;238m"}
Set-PSReadlineKeyHandler -Chord Ctrl+j -Function AcceptSuggestion
Set-PSReadlineOption -BellStyle None
Set-PSReadLineOption -colors @{ Command = "Blue"}

# Setting for fuzzy finder
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f'

####### Environment Variables for nvim config and venv prompt
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1
$env:NVIM_APPNAME = "nvim"


####### Functions
# New Prompt
function prompt {

    $dateTime = get-date -Format "dd.MM.yyyy HH:mm:ss"
    $regex = [regex]::Escape($HOME) + "(\\.*)*$"
    $new_home =$executionContext.SessionState.Path.CurrentLocation.Path -replace $regex, '~$1' 
    $venv = if ($env:VIRTUAL_ENV) {"($( Split-Path $env:VIRTUAL_ENV -Leaf)) "} else {''}

    Write-Host "[$dateTime] " -NoNewline -ForegroundColor DarkRed
    Write-Host $venv -NoNewline -ForegroundColor DarkBlue
    Write-Host "$env:USERNAME" -NoNewline -ForegroundColor Green
    Write-Host " @ "  -NoNewline -ForegroundColor DarkBlue
    Write-Host "$new_home" -NoNewline -ForegroundColor Green
 
    return "`n$ "
}
# close current Session
function ex{exit}

##### AWS
# set aws profile
function setaws{
      $env:AWS_PROFILE = "$args"
      echo "Set AWS_PROFILE to $env:AWS_PROFILE"
      }
#
# aws profiles
function awsprofiles() {
    vim "$HOME\.aws\credentials"
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

# git pull shortcut
function gitpull{
      git pull
      }

# git commit shortcut
function gitcommit(){
      git commit -m "$args"
      }

##### Manage Environments
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

# Change nvim config
function switch_nvim ($args) {
  if (not $env:NVIM_APPNAME) {
    $env:NVIM_APPNAME = "nvim"}
  else {$env:NVIM_APPNAME = $args}
}


##### Alias
# utils
Set-Alias grep findstr
Set-Alias ll ls
Set-Alias ddd todesktop
Set-Alias ":q" ex
Set-Alias vim nvim
Set-Alias g git
Set-Alias r rye
Set-Alias s rye
Set-Alias wi switch_nvim

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
Set-Alias gg gitpull
Set-Alias ga gitadd
Set-Alias cm gitcommit

#### Autocompletions
$completionPath = "$PROFILE\..\Completions\"
if (Test-Path $completionPath) {
    Get-ChildItem  -Path $completionPath | ForEach-Object {
    . $_.FullName}
}
