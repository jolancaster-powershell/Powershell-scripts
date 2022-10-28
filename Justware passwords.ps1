Import-Module ActiveDirectory
$Resetpassword = Import-Csv "C:\test\Justware Passwords.csv"
 #Store CSV file into $Resetpassword variable
 
foreach ($User in $Resetpassword) {
    #For each name or account in the CSV file $Resetpassword, reset the password with the Set-ADAccountPassword string below
    $User.sAMAccountName
    $User.Password
        Set-ADAccountPassword -WhatIf -Identity $User.sAMAccountName -Reset -NewPassword (ConvertTo-SecureString $User.Password -AsPlainText -force)
}
Clear-Host
 Write-Host " Passwords changed "
 $total = ($Resetpassword).count
 $total
 Write-Host "Accounts passwords have been reset..."