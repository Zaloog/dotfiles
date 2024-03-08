# Setup Git

# Define the source and destination paths
$confirmgit = Read-Host "In the following Git will be setup, do you want to continue? (Y/N)"
if ($confirmgit -eq "N") {
  Write-Host "Git setup aborted" -Foregroundcolor Red
  Exit
  }

$repoConfigPath = "$PSScriptRoot\.gitconfig"  
$gitConfigPath = "$HOME\.gitconfig"

# Check if the source file exists
if (Test-Path $repoConfigPath) {
    # Move the .gitconfig file to the appropriate location
    Get-Content -Path $repoConfigPath | Set-Content -Path $gitConfigPath -Force
    Write-Host ".gitconfig moved to the git config directory." -ForegroundColor Green
} else {
    Write-Host ".gitconfig file not found in the repository path." -ForegroundColor Red
}
