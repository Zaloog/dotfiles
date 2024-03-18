# Step 1: Set the content of your repo profile as the content of the $PROFILE file
function Update-Profile-File{
  $repoProfilePath = "$PSScriptRoot\Microsoft.PowerShell_profile.ps1"
  if (Test-Path -Path $repoProfilePath) {
      Write-Host "Setting up your repo profile as the content of your profile file..."
      Get-Content -Path $repoProfilePath | Set-Content -Path $PROFILE -Force
      Write-Host "Powershell Profile setup completed." -ForegroundColor Green
  
  } else {
      Write-Host "Repo profile file not found. Make sure the path is correct: $repoProfilePath" 
  }
}

# Step 2: Check if the profile file exists and Update

Write-Host "Setting new Powershell Profile" -ForegroundColor Blue
if (-not (Test-Path -Path $PROFILE)) {
    $createProfile = Read-Host "Profile file doesn't exist. Do you want to create it? (Y/N)"
    if ($createProfile -eq "Y") {
        New-Item -ItemType File -Path $PROFILE -Force | Out-Null
        Update-Profile-File
    } else {
        Write-Host "Powershell Profile setup aborted." -ForegroundColor Red
        
    }
} else {
    $overwriteProfile = Read-Host "Profile file already exists. Do you want to overwrite it? (Y/N)"
    if ($overwriteProfile -eq "N") {
        Write-Host "Powershell Profile setup aborted." -ForegroundColor Red
        
    } else {
      Update-Profile-File
    }
}



# Function to install or update PowerShell modules
function Install-OrUpdateModule {
    param(
        [string]$moduleName
    )

    Write-Host "Checking module $moduleName..." -ForegroundColor Yellow

    if (-not (Get-Module -Name $moduleName -ListAvailable)) {
        Write-Host "Installing module $moduleName..."
        Install-Module -Name $moduleName -Scope CurrentUser -Force -AllowClobber
    } else {
        Write-Host "Module $moduleName is already installed. Checking for updates..."
        $installedVersion = (Get-Module -Name $moduleName).Version
        $latestVersion = (Find-Module -Name $moduleName).Version

        if ($installedVersion -lt $latestVersion) {
            Write-Host "Updating module $moduleName..."
            Update-Module -Name $moduleName -Force
        } else {
            Write-Host "Module $moduleName is already up-to-date."
        }
    }

}


# Step 4: Install or update modules listed in the file
Write-Host "Installing/Updating Powershell Modules" -ForegroundColor Blue
$modulesFilePath = "$PSScriptRoot\modules"
$modules = Get-Content -Path $modulesFilePath
if (Test-Path -Path $modulesFilePath) {
    Write-Host "The following Modules are about to get installed/updated"
    foreach ($module in $modules) {
        Write-Host "- $module" -ForegroundColor Green
    }
    $installModules = Read-Host "Do you want to install/update Modules? [Y/N]"
    if ($installModules -eq "Y") {
        Write-Host "Reading module list from file: $modulesFilePath"
        Write-Host "Checking and installing or updating required PowerShell modules..."

        foreach ($module in $modules) {
            Install-OrUpdateModule -moduleName $module
        }

        Write-Host "Required Powershell modules setup completed." -ForegroundColor Green
    } else {
        Write-Host "Powershell Module Installation/Updating aborted." -ForegroundColor Red
        
    }

} else {
    Write-Host "Module list file not found. Make sure the path is correct: $modulesFilePath"
}



## Create a folder named "Completions" at the location of the PowerShell profile and its parent directory
Write-Host "Creating Completions folder..." -ForegroundColor Blue
$profileDirectory = Split-Path $profile -Parent
$completionsDirectory = Join-Path -Path $profileDirectory -ChildPath "Completions"

# Check if the Completions directory exists, and create it if it doesn't
if (-not (Test-Path $completionsDirectory -PathType Container)) {
    New-Item -Path $completionsDirectory -ItemType Directory -Force
    Write-Host "Completions folder created at: $completionsDirectory" -ForegroundColor Green
} else {
    Write-Host "Completions folder already exists at: $completionsDirectory" -ForegroundColor Yellow
}
