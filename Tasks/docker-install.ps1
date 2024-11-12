#Install Docker Destop
# Check if the script is run as an administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Host "Please run this script with administrator privileges!"
    exit
}
 
# Settings
$dockerInstallerUrl = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
$installerPath = "$env:TEMP\DockerDesktopInstaller.exe"

# WhoamItest
$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$whoamiOutput = whoami
$whoamiOutput | Out-File -FilePath "$desktopPath\whoami.txt"
 
# Download Docker Desktop installer
Write-Host "Downloading Docker Desktop..."
Invoke-WebRequest -Uri $dockerInstallerUrl -OutFile $installerPath
 
# Install Docker Desktop
Write-Host "Installing Docker Desktop..."
Start-Process -FilePath $installerPath -ArgumentList "install --quiet" -Wait
 
# Clean up installer after completion
Write-Host "Cleaning up..."
Remove-Item $installerPath
 
Write-Host "Docker Desktop installation complete."
