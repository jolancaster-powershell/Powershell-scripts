Import-Module ActiveDirectory

$DaysInactive = 90
$InactiveDate = (Get-Date).Adddays(-($DaysInactive))

$Computers = Get-ADComputer -Filter { LastLogonDate -lt $InactiveDate -and Enabled -eq $true } -Properties LastLogonDate | Select-Object Name, LastLogonDate, DistinguishedName

ForEach ($Item in $Computers){
    Remove-ADComputer -Identity $Item.DistinguishedName -Confirm:$false
    Write-Output "$($Item.Name) - Deleted"
}
