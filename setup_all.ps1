# Reads and executes the modular setup scripts

# Load and execute the setup scripts
Write-Host "Starting all setups..." -Foregroundcolor Cyan

# Run setup_scoop.ps1
Write-Host "Running setup for Scoop..." -Foregroundcolor Cyan
. "$PSScriptRoot\scoop\setup_scoop.ps1"

# Run setup_pwsh.ps1
Write-Host "Running setup for PowerShell..." -Foregroundcolor Cyan
pwsh -Command {& Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm:$false}
pwsh -noprofile "$PSScriptRoot\pwsh\setup_pwsh.ps1"

# Run setup_scoop.ps1
Write-Host "Running setup for Windows-Terminal..." -Foregroundcolor Cyan
pwsh "$PSScriptRoot\windows-terminal\setup_windows_terminal.ps1"


# Run setup_git.ps1
Write-Host "Running setup for Git..." -Foregroundcolor Cyan
pwsh "$PSScriptRoot\git\setup_git.ps1"

# Run setup_nvim.ps1
Write-Host "Running setup for Neovim..." -Foregroundcolor Cyan
pwsh "$PSScriptRoot\nvim\setup_nvim.ps1"

Write-Host "All setups completed." -Foregroundcolor Green
