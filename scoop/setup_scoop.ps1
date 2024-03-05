# Step 1: Install scoop
# Check if Scoop is installed
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Scoop is not installed. Installing Scoop..." -ForegroundColor Blue
    # Install Scoop
    Invoke-RestMethod -Uri "https://get.scoop.sh" | Invoke-Expression
    Write-Host "Scoop installed successfully. Please restart your shell." -ForegroundColor Yellow
    Exit
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
Write-Host "Adding extra bucket 'nerd-fonts' to Scoop..." -ForegroundColor Blue
scoop bucket add nerd-fonts

# Call the function with the path to the Scoop packages file
Setup-ScoopPackages -packagesFile "$PSScriptRoot\packages"

# Function to copy Hack-NF font from Scoop to local font folder
#function Copy-HackNFFontToLocal {
#    $scoopFontPath = scoop prefix Hack-NF
#    $localFontPath = "%LOCALAPPDATA%\Microsoft\Windows\Fonts\Hack-NF.ttf"  # Destination path in the local font folder
#
#    # Check if Hack-NF font is installed
#    if (-not (Test-Path $localFontPath)) {
#        # Copy font file from Scoop to local font folder
#        Copy-Item -Path "$scoopFontPath" -Destination $localFontPath -Force
#        Write-Host "Hack-NF font copied to the local font folder." -ForegroundColor Green
#    } else {
#        Write-Host "Hack-NF font is already installed in the local font folder." -ForegroundColor Yellow
#    }
#}
#
## Example usage:
#Copy-HackNFFontToLocal
