$name = Read-host "Please enter the username of the account that needs to be unlocked"
Unlock-ADAccount $name -WhatIf
$pass = ConvertTo-SecureString -string "County1*" -AsPlainText -force
Set-ADAccountPassword $name -newpassword $pass -Reset -WhatIf
Set-ADuser -Identity $name -ChangePasswordAtLogon $true -WhatIf