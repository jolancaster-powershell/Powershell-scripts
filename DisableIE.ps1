$name = Read-Host "Disable Internet explorer on (enter computer name)"
Invoke-Command -computername $Name -ScriptBlock { Disable-WindowsOptionalFeature -FeatureName Internet-Explorer-Optional-amd64 –Online}