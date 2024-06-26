# Step 1: Install scoop
# Check if Scoop is installed
$confirmscoop = Read-Host "In the following scoop will be setup, do you want to continue? (Y/N)"
if ($confirmscoop -eq "N") {
  Write-Host "Scoop setup aborted" -Foregroundcolor Red
  Exit
  }

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Scoop is not installed. Installing Scoop..." -ForegroundColor Blue
    # Install Scoop
    Invoke-RestMethod -Uri "https://get.scoop.sh" | Invoke-Expression
    }
else {
    Write-Host "Scoop already installed"  -ForegroundColor Green
}

# Step 2: Install Packages

function Setup-ScoopPackages {
    param (
        [string]$packagesFile
    )

    # Check if the packages file exists
    if (Test-Path $packagesFile) {
        # Read the list of Scoop packages from the text file
        $scoopPackages = Get-Content $packagesFile

        # Install or update Scoop packages
        foreach ($package in $scoopPackages) {
            Write-Host "Checking package $package..." -Foregroundcolor Yellow
            if (scoop list $package -q) {
                Write-Host "Updating Scoop package: $package..."
                scoop update $package
            } else {
                Write-Host "Installing Scoop package: $package..."
                scoop install $package
            }
        }

        Write-Host "Scoop packages setup completed." -ForegroundColor Green
    } else {
        Write-Host "Scoop packages file not found: $packagesFile" -ForegroundColor Red
    }
}

# Add the extra bucket
Write-Host "Adding bucket 'nerd-fonts' to Scoop..." -ForegroundColor Blue
scoop bucket add nerd-fonts
Write-Host "Adding bucket 'extras' to Scoop..." -ForegroundColor Blue
scoop bucket add extras

# Call the function with the path to the Scoop packages file
Setup-ScoopPackages -packagesFile "$PSScriptRoot\packages"
