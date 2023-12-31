﻿<# 
CTS2382c Server 2022 Interactive Lab Setup Script,This Script will set up the enviroment for a SVR01 Server
#>


# Set the DNS IP adress
$index = Get-NetAdapter -Name Ethernet | Select-Object -ExpandProperty ifindex
Set-DnsClientServerAddress -InterfaceIndex $index -ServerAddresses ("10.0.0.10")

#Set the IP address for the SVR01 server  
Set-NetIPInterface -InterfaceIndex $index -Dhcp Disabled
$IPv4 = "10.0.0.11"
$GateWay = "10.0.0.1"
New-NetIPAddress -IPAddress $IPv4 -PrefixLength 24 -DefaultGateway $GateWay -InterfaceIndex $index

#Server Rename Command
Rename-Computer -NewName ACE-SVR01

#Run Server Updated
Install-module PSWindowsUpdate
Get-WindowsUpdate -MicrosoftUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot

