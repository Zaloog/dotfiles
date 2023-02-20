# profile for PS in VS Code
# git visuals
#Import-Module posh-git
#Set-PoshPrompt -Theme M365Princess
Import-Module PSColor


# Unix like Tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete

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

# move to desktop
function movedesktop(){
        cd "C:\Users\gnczd\OneDrive - Bayer\Desktop"
        }
Set-Alias ddd movedesktop

# jupyter lab shortcut
#function jupyter{
#      start jupyter lab
#      }
#Set-Alias jlab jupyter

# activate env
function actenv(){
        & "C:\Users\gnczd\Envs\$($args[0])\Scripts\activate.ps1"
        }
Set-Alias act actenv

# list envs
function showenv(){
        lsvirtualenv
        }
Set-Alias envs showenv
