<# 
CTS2382c Server 2022 Interactive Lab Setup Script,This Script will set up the enviroment for a DC Server
#>


# Set the DNS IP adress
$index = Get-NetAdapter -Name Ethernet | Select-Object -ExpandProperty ifindex
Set-DnsClientServerAddress -InterfaceIndex $index -ServerAddresses ("10.0.0.10" , "1.1.1.1")

#Set the IP address for the DC server  
Set-NetIPInterface -InterfaceIndex $index -Dhcp Disabled
$IPv4 = "10.0.0.10"
$GateWay = "10.0.0.1"
New-NetIPAddress -IPAddress $IPv4 -PrefixLength 24 -DefaultGateway $GateWay -InterfaceIndex $index

#Server Rename Command
Rename-Computer -NewName ACE-DC01

#Run Server Updated
Install-module PSWindowsUpdate
Get-WindowsUpdate -MicrosoftUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot

