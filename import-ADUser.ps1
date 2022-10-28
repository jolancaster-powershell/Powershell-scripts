$import = Import-Csv C:\test\Importuser.xlsx
#new-ADOrganizationalUnit -name "Enterprise"
#new-ADgroup -name "Bridge" -GroupScope DomainLocal -Groupcategory Security -path "OU=Enterprise"
foreach ($user in $import){
    $user.lastname
    $user.firstname
    $user.username
    $user.description
    $pass = (ConvertTo-SecureString "County1*" -AsPlainText -Force)
    new.aduser -name $user.username -surname $user.lastname -givenname $user.firstname -description $user.description -enabled $true -accountpassword $pass -changepasswordatlogon $true -path "OU=Enterprise"
}