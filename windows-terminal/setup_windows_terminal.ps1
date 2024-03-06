# Setup Windows Terminal

# Define the source and destination paths
$confirmwt = Read-Host "In the following Windows-Terminal will be setup, do you want to continue? (Y/N)"
if ($confirmwt -eq "N") {
  Write-Host "Windows-Terminal setup aborted" -Foregroundcolor Red
  Exit
  }

$repoSettingsPath = "$PSScriptRoot\settings.json"  # Update with the path to the settings.json file in your repository
$wtSettingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# Check if the source file exists
if (Test-Path $repoSettingsPath) {
    # Move the settings.json file to the appropriate location
    Get-Content -Path $repoSettingsPath | Set-Content -Path $wtSettingsPath -Force
    Write-Host "settings.json moved to the Windows Terminal settings directory." -ForegroundColor Green
} else {
    Write-Host "settings.json file not found in the repository path." -ForegroundColor Red
}
