<#

get windows 10 configation scripts

#>
# Set ExecutionPolicy First
Set-ExecutionPolicy RemoteSigned

#Rename windows 10 (Restart is required)
Rename-Computer -NewName WKS01-Win10


### set the DNS Ip address
#  Script to fet the Network interface 
Get-NetAdapter | Select-Object InterfaceAlias , InterfaceIndex

#Script at assing the DNS IP to that Interface
Set-DnsClientServerAddress -InterfaceIndex 9 -ServerAddresses ("10.0.0.11" , "8.8.8.8")

## Updating Windows
# Windows Update Module for PowerSHell "Run first for Update"
Install-Module PSWindowsUpdate

# Run Windows Updates Command to see all current updates
Get-WindowsUpdate

#Install Current Update Command
Install-WindowsUpdate

## If Windows Update service is tunned off run the following command to turn it on
Add-WUServiceManager -MicrosoftUpdate

# If you want to Automaically instll Update and Reboot usew the following command
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReBoot

# Install all of Remote Access Tool Set or RSAT Apps
Get-WindowsCapability -Online -Name Rsat* | Add-WindowsCapability -online 

# Join the Domain Command
Add-Computer -ComputerName WSK01-Win10 -DomainName CTS23.EDU -Credential CTS\Administrator -restart -force

# Connect to SVR-Node02 from a PowerShell Terminal
Enter-PSSession -ComputerName SVR-Node02

# to disconnect your PSsession type the following command
Exit-PSsession

# Command to see the windows features
Get-WindowsFeature

# Install a windows Feature or Role 
Install-WindowsFeature -Name WinRM-IIS-Ext -ComputerName SVR-Node02 -Restart 

#open NSLOOKUP from PowerShell
start NSLOOKUP 
