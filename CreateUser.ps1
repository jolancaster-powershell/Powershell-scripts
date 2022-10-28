$username = Read-host "what is the account username?" # -samaccountname or -name#
$first = read-host "What is the users first name?" # -givenname? #
$last = read-host "what is the users last name?" # -surname #
$display = read-host "what is the users display name?" #-displayname #
$server = read-host "what domain would you like to connect to?" # -server #
$pass = ConvertTo-SecureString -string "County1*" -AsPlainText -force
# Ill use -accountpassword to set the password to a generic login #
# Ill use -changepasswordatlogon $true to make the user change password at logon #
# Ill use -enabled to make sure the account is enabled #
New-ADuser -name $username -givenname $first -surname $last -displayname $display -server $server -accountpassword $pass -changepasswordatlogon $true -enabled $true -whatif
Read-Host = "The account for $first $last has been created.  Username is $username and they are connected to $server.  They will need to change thier username when they login"