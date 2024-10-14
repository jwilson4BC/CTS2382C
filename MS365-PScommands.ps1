#these command are to be used with M365 Adminitrsator Tenant
#download M365 Module
Install-Module -name MSonline
#Add M365 Module to the Poewershell Commands
Import-Module -name MSonline
#show all M365 Commands
get-command -module MSonline
#connect you to your M365 tenant
Connect-MSolservice
#show Users
get-MSonluser