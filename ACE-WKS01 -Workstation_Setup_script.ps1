<#

This script will set up windows 10 for the CTS2382c Insteractive Lab 

#>

# Set ExecutionPolicy First
Set-ExecutionPolicy RemoteSigned

#Rename windows 10 (Restart is required)
Rename-Computer -NewName ACE-WKS01

# Install all of Remote Access Tool Set or RSAT Apps
Get-WindowsCapability -Online -Name Rsat* | Add-WindowsCapability -online 

#Run Windows Updated
Install-module PSWindowsUpdate
Get-WindowsUpdate -MicrosoftUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
