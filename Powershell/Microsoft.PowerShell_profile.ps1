# Encoding to UTF8Encoding
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding


# Beautiful Icons and colored Names
Import-Module Terminal-Icons

# Command Line Tweaks
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineOption -PredictionViewStyle InlineView
Set-PSReadlineKeyHandler -Chord Ctrl+j -Function AcceptSuggestion

# Setting for fuzzy finder
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f'

#Import-Module PSColor
oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/pure.omp.json | Invoke-Expression

# Alias
Set-Alias vim nvim
Set-Alias grep findstr

###### GIT Shortcuts
# git status shortcut
function gitstatus{
      git status
      }
Set-Alias gs gitstatus

# git add all shortcut
function gitadd{
      git add .
      }
Set-Alias ga gitadd

# git commit shortcut
function gitcommit(){
      git commit -m "$args"
      }
Set-Alias cm gitcommit

###### Manage Environments
# activate env
function actenv(){
    & "C:\Users\$env:UserName\Envs\$($args[0])\Scripts\activate.ps1"
    }
Set-Alias act actenv

# list envs
function showenv(){
    lsvirtualenv
    }
Set-Alias envs showenv

# piplist shortcut
function pipli(){
    py -m pip list
    }
Set-Alias pl pipli

# start in same folder when duplicating Terminal Window
function prompt {
    $loc = $executionContext.SessionState.Path.CurrentLocation;
    $out = "$loc$('>' * ($nestedPromptLevel + 1)) ";
    if ($loc.Provider.Name -eq "FileSystem") {
        $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }
    return $out
}

##### Navigation
# desktop shortcut
function todesktop{
      cd "C:\Users\$env:UserName\Desktop\"
      }
Set-Alias ddd todesktop

