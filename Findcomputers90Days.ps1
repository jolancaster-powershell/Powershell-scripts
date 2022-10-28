#Finds all computers in AD that haven't been logged into in 90 days

Import-Module ActiveDirectory

$DaysInactive = 90
$InactiveDate = (Get-Date).Adddays(-($DaysInactive))

$Computers = Get-ADComputer -Filter { LastLogonDate -lt $InactiveDate -and Enabled -eq $true } -Properties LastLogonDate | Select-Object Name, LastLogonDate, DistinguishedName | Export-Csv -path C:\test\90days.csv