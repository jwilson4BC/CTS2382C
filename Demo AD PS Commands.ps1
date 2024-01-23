#make a New OU
New-ADOrganizationalUnit -Name "Coffee Shop" -Path "DC=coffee,DC=com" -ProtectedFromAccidentalDeletion $True -Passthru

New-ADOrganizationalUnit -Name "Security Groups" -Path "OU=Coffee Shop,DC=coffee,DC=com" -Passthru

New-ADOrganizationalUnit -Name "Managers" -Path "OU=Coffee Shop,DC=coffee,DC=com" -Passthru

New-ADOrganizationalUnit -Name "Staff" -Path "OU=Coffee Shop,DC=coffee,DC=com" -Passthru

New-ADOrganizationalUnit -Name "Computers" -Path "OU=Coffee Shop,DC=coffee,DC=com" -Passthru

New-ADOrganizationalUnit -Name "Workstations" -Path "OU=Computers,OU=Coffee Shop,DC=coffee,DC=com" -Passthru

New-ADOrganizationalUnit -Name "Laptops" -Path "OU=Computers,OU=Coffee Shop,DC=coffee,DC=com" -Passthru

New-ADOrganizationalUnit -Name "POS Systems" -Path "OU=Computers,OU=Coffee Shop,DC=coffee,DC=com" -Passthru

#getAD opject
Get-ADOrganizationalUnit -Identity "OU=Coffee Shop,DC=Coffee,DC=com"

#Set your UO Accidental Deletion Protection True = Protection False = no protection
Set-ADObject -Identity "OU=Coffee Shop,DC=coffee,DC=com" -ProtectedFromAccidentalDeletion $False

# Delete UO Command *need to disable deletion protection*
Remove-ADOrganizationalUnit -Identity "OU=Coffee Shop,DC=coffee,DC=com"



New-ADGroup -Name "Key Managers" -SamAccountName "Key_Managers" -Path "OU=Security Groups,OU=Coffee Shop,DC=coffee,DC=com" -GroupCategory Security -GroupScope Global -DisplayName "Key Managers"

New-ADGroup -Name "Barista" -SamAccountName "Barista" -Path "OU=Security Groups,OU=Coffee Shop,DC=coffee,DC=com" -GroupCategory Security -GroupScope Global -DisplayName "Coffee Shop Barista" -Description "Coffee Store Baristas"
Set-ADGroup -Identity "CN=Barista,OU=Security Groups,OU=Coffee Shop,DC=coffee,DC=com" -Description "Coffee Shop Baristas"

#New User Account
New-ADUser -Name "BOB" -GivenName "Robert" -Surname "Smith" -SamAccountName "Bob.Smith" -UserPrincipalName "Bob.smith@coffee.com" -Path "OU=Staff,OU=Coffee Shop,DC=coffee,DC=com" -AccountPassword (ConvertTo-SecureString "Pa11word" -AsPlainText -Force) -PasswordNeverExpires $True -Enabled $True

New-ADUser -Name "Alice" -GivenName "Alice" -Surname "Liddle" -SamAccountName "Alice.Liddle" -UserPrincipalName "Alice.Liddle@coffee.com" -Path "OU=Managers,OU=Coffee Shop,DC=coffee,DC=com" -AccountPassword (ConvertTo-SecureString "Pa11word" -AsPlainText -Force) -PasswordNeverExpires $True -Enabled $True

#add user to a group _identity isthe group, -Member is the SamAccountname
Add-ADGroupMember -Identity "Barista" -Members "Bob.Smith"
Add-ADGroupMember -Identity "Key_Managers" -Members "Alice.liddle"