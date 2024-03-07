# Reads and executes the modular setup scripts

# Load and execute the setup scripts
Write-Host "Starting all setups..." -Foregroundcolor Cyan

# Run setup_scoop.ps1
Write-Host "Running setup for Scoop..." -Foregroundcolor Cyan
. "$PSScriptRoot\scoop\setup_scoop.ps1"

# Run setup_pwsh.ps1
Write-Host "Running setup for PowerShell..." -Foregroundcolor Cyan
pwsh -Command {& Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm:$false}
pwsh "$PSScriptRoot\pwsh\setup_pwsh.ps1"

# Run setup_scoop.ps1
Write-Host "Running setup for Scoop..." -Foregroundcolor Cyan
. "$PSScriptRoot\windows-terminal\setup_windows_terminal.ps1"

# Run setup_nvim.ps1
Write-Host "Running setup for Neovim..." -Foregroundcolor Cyan
. "$PSScriptRoot\nvim\setup_nvim.ps1"

Write-Host "All setups completed." -Foregroundcolor Green
