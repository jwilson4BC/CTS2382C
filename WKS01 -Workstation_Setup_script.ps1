<#

get windows 10 configation scripts

#>

# Set ExecutionPolicy First
Set-ExecutionPolicy RemoteSigned

#Rename windows 10 (Restart is required)
Rename-Computer -NewName WKS01-Win10

# Install all of Remote Access Tool Set or RSAT Apps
Get-WindowsCapability -Online -Name Rsat* | Add-WindowsCapability -online 

#Run Windows Updated
Install-module PSWindowsUpdate
Get-WindowsUpdate -MicrosoftUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot