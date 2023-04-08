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

# Setting for fuzzy finder
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f'

# Nice Command prompt
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/bayer.omp.json | Invoke-Expression
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

# Other Themes
# takuya
# half-life
# jv_sitecorian


####### Functions
function ex{exit}

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
    & "C:\Users\$env:UserName\Envs\$($args[0])\Scripts\activate.ps1"
    }

# list envs
function showenv(){
    ls "C:\Users\$env:UserName\Envs"
    }

# piplist shortcut
function pipli(){
    py -m pip list
    }

##### Navigation
# desktop shortcut
function todesktop{
      cd "C:\Users\$env:UserName\OneDrive - Bayer\Desktop\"
      }

# open TODO and overview
function open2vims() {
    todesktop
    vim -O "me@bayer.md" "TODO.md"
}

# nvim mappings
function nvimmaps() {
    vim "C:\Users\$env:UserName\Appdata\local\nvim\lua\slydragonn\maps.lua"
}


# nvim settings
function nvimsets() {
    vim "C:\Users\$env:UserName\Appdata\local\nvim\lua\slydragonn\settings.lua"
}

# nvim plugins
function nvimplug() {
    vim "C:\Users\$env:UserName\Appdata\local\nvim\lua\slydragonn\plugins.lua"
}
##### Alias

Set-Alias vim nvim
Set-Alias vimmaps nvimmaps
Set-Alias vimsets nvimsets
Set-Alias vimplugs nvimplug

Set-Alias grep findstr
Set-Alias ll ls
Set-Alias ddd todesktop

Set-Alias act actenv
Set-Alias envs showenv
Set-Alias pl pipli

Set-Alias gs gitstatus
Set-Alias ga gitadd
Set-Alias cm gitcommit

Set-Alias ":q" ex
Set-Alias todo open2vims
