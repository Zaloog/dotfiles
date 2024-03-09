# Setup Rye

# Define the source and destination paths
$confirmwt = Read-Host "In the following Rye will be setup, do you want to continue? (Y/N)"
if ($confirmwt -eq "N") {
  Write-Host "Rye setup aborted" -Foregroundcolor Red
  Exit
  }

$repoConfigPath = "$PSScriptRoot\config.toml"  
$ryeConfigPath = $(rye config --show-path)

# Check if the source file exists
if (Test-Path $repoConfigPath) {
    # Move the config.toml file to the appropriate location
    Get-Content -Path $repoConfigPath | Set-Content -Path $RyeConfigPath -Force
    Write-Host "config.toml moved to the rye config directory." -ForegroundColor Green
} else {
    Write-Host "config.toml file not found in the repository path." -ForegroundColor Red
}

rye self completion -s powershell | Out-File -Encoding utf8 $PROFILE\..\Completions\rye_completion.ps1
