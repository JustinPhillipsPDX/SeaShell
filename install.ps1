# Main PowerShell script for Windows
# Detect OS and architecture
Write-Host "Detecting system..."
$OS = "Windows"
$ARCH = (Get-WmiObject Win32_Processor).Architecture
Write-Host "Operating System: $OS"
Write-Host "Architecture: $ARCH"

# Check for required tools
Write-Host "Checking dependencies..."

function Check-Tool {
    param (
        [string]$tool,
        [string]$installCommand
    )
    if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
        Write-Host "$tool not found. Installing..."
        Invoke-Expression $installCommand
    } else {
        Write-Host "$tool is already installed."
    }
}

# Ensure Chocolatey is installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Installing..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install CMake and a C++ compiler
Check-Tool "cmake" "choco install cmake -y"
Check-Tool "cl" "choco install visualstudio2019buildtools -y"

# Configure, build, and install the example project
Write-Host "Configuring and building the project..."
if (-not (Test-Path build)) {
    New-Item -ItemType Directory -Path build
}
Set-Location build
cmake ..
cmake --build .
Write-Host "Installation complete! The binary is in the 'build' directory."
