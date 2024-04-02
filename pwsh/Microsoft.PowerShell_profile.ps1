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
$env:EDITOR = "nvim"


####### Functions
# New Prompt
function prompt {

    #$dateTime = get-date -Format "dd.MM.yyyy HH:mm:ss"
    $gh_name = "Zaloog"
    $regex = [regex]::Escape($HOME) + "(\\.*)*$"
    $new_home =$executionContext.SessionState.Path.CurrentLocation.Path -replace $regex, '~$1' 
    $venv = if ($env:VIRTUAL_ENV) {"$( Split-Path $env:VIRTUAL_ENV -Leaf)"} else {''}

    Write-Host $gh_name -NoNewline -ForegroundColor DarkRed
    Write-Host " at "  -NoNewline -ForegroundColor Yellow
    Write-Host $env:USERNAME -NoNewline -ForegroundColor Blue
    Write-Host " in "  -NoNewline -ForegroundColor Yellow
    Write-Host $new_home -NoNewline -ForegroundColor Green
    #Write-Host "[$dateTime] " -NoNewline -ForegroundColor DarkRed
    if ($env:VIRTUAL_ENV) {
      Write-Host " using "  -NoNewline -ForegroundColor Yellow
      Write-Host $venv -NoNewline -ForegroundColor DarkBlue
    }

    if ($env:HTTP_PROXY) {
      Write-Host " under "  -NoNewline -ForegroundColor Yellow
      Write-Host $env:HTTP_PROXY -NoNewline -ForegroundColor White
    }
 
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
# set proxy
function setproxy{
      $proxy = ""
      $env:HTTP_PROXY = $proxy
      $env:HTTPS_PROXY = $proxy
      echo "Set Proxy to $proxy"
      }

function unsetproxy{
      $proxy = ""
      $env:HTTP_PROXY = $proxy
      $env:HTTPS_PROXY = $proxy
      echo "Unset Proxy"
      }
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

##### Rye Stuff
# Start new Rye project
function rye_start_project($project_name){
  if ($project_name) {
    #Write-Host "Creating new Rye Project $project_name..." -ForegroundColor Green
  } else {
    Write-Host "Please provide a new project_name" -ForegroundColor Red
    return
  }
  # create new rye projects folders
  $project_folder_name = "rye_projects"
  $rye_home = "$HOME\$project_folder_name"
  $rye_desktop = "$HOME\Desktop\$project_folder_name"

  # for Home
  if (-not (Test-Path -Path $rye_home)) {
    $home_sink= mkdir $rye_home
    Write-Host "Created Rye Projects Folder under $home_sink" -ForegroundColor Green
    } else { }

  # On Desktop
  if (-not (Test-Path -Path $rye_desktop)) {
    $desktop_sink = mkdir $rye_desktop
    Write-Host "Created Rye Projects Folder under $desktop_sink" -ForegroundColor Green
    } else { }

  # Create project folders
  $rye_home_project =  "$rye_home\$project_name"
  $rye_desktop_project =  "$rye_desktop\$project_name"
  if (-not (Test-Path -Path $rye_home_project)) {
    Write-Host "Creating new Rye Project $project_name..." -ForegroundColor White
    & rye init $rye_home_project
    & cd $rye_home_project
    $desktop_project_sink = mkdir $rye_desktop_project
  } else {
    Write-Host "Project $project_name already exists" -ForegroundColor Red
  }

}

# rye delete project
function rye_delete_project($project_name){
  if ($project_name) {
  } else {
    Write-Host "Please enter a Project Name to delete" -ForegroundColor Red
    return
  }

  $project_folder_name = "rye_projects"
  $rye_home = "$HOME\$project_folder_name"
  $rye_desktop = "$HOME\Desktop\$project_folder_name"
  $rye_home_project =  "$rye_home\$project_name"
  $rye_desktop_project =  "$rye_desktop\$project_name"

  # Delete Project from Home Folder
  if (Test-Path -Path $rye_home_project) {
    Write-Host "Deleting Rye Project $project_name from Home..." -ForegroundColor White
    & rm $rye_home_project -r -fo
  } else {
    Write-Host "Project $project_name does not exist under Home" -ForegroundColor Red
  }
  # Delete Project from Desktop Folder
  if (Test-Path -Path $rye_desktop_project) {
    Write-Host "Deleting Rye Project $project_name from Desktop..." -ForegroundColor White
    & rm $rye_desktop_project -r -fo
  } else {
    Write-Host "Project $project_name does not exist under Desktop" -ForegroundColor Red
  }

  Write-Host "Deleting Rye Project $project_name successful." -ForegroundColor Green

}

# rye list projects
function rye_list_projects(){
  $project_folder_name = "rye_projects"
  $rye_home = "$HOME\$project_folder_name"
  $rye_projects = Get-ChildItem $rye_home
  Write-Host "------------------ Rye Projects -----------------" -ForegroundColor Green
  Write-Host "----- Location: $rye_home -----" -ForegroundColor Yellow
  foreach ($project_path in $rye_projects) {
    $project_name = $project_path.Name
    $padding_length = (48 - $project_name.Length) / 2
    $padding = " " * $padding_length
    Write-Host $padding -ForegroundColor Blue -NoNewline
    Write-Host " $project_name " -ForegroundColor DarkBlue -NoNewline
    Write-Host $padding -ForegroundColor Blue
    }

}

# Go to Rye Project and activate
function rye_goto_project($project_name){
  if ($project_name) {
  } else {
    Write-Host "Please enter a Project Name to workon" -ForegroundColor Red
    return
  }

  $project_folder_name = "rye_projects"
  $rye_home = "$HOME\$project_folder_name"
  $rye_home_project =  "$rye_home\$project_name"

  & cd $rye_home_project
  if (Test-Path -Path "$rye_home_project/.venv") {
    & ".venv/Scripts/activate.ps1"
    }

  }
# open rye config
function rye_open_conf(){
  vim $(rye config --show-path)
}

# rye sync
function rye_sync(){
  rye sync
}

# rye list
function rye_list(){
  rye list
}


# rye add
function rye_add(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$packages) {
    & rye add $packages
}

# rye run
function rye_run(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$command) {
    & rye run $command
}

##### Manage Environments
# activate env
function actenv($env){
    & "$HOME\Envs\$env\Scripts\activate.ps1"
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
Set-Alias wi switch_nvim

# Rye Stuff
Set-Alias r rye
Set-Alias rinit rye_start_project
Set-Alias rdel rye_delete_project
Set-Alias rs rye_sync
Set-Alias ra rye_add
Set-Alias rr rye_run
Set-Alias rl rye_list
Set-Alias rrr rye_list_projects
Set-Alias rconf rye_open_conf
Set-Alias rgo rye_goto_project

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
