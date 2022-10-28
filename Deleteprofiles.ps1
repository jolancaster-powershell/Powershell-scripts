Set-Location C:\test\
$computername = Read-host "Please enter the computer name you want profile's deleted on"
Write-host
.\DelProf2 /c:$computername /d:1 /i /ed:homer
