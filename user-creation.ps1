#user info prompts
$firstName = Read-Host "Enter first name"
$lastName = Read-Host "Enter last name"
$username = Read-Host "Enter username"
$password = Read-Host "Enter password" -AsSecureString

#select OU and create user
$ouPath = "OU=Users,DC=example,DC=com" 
$newUser = New-ADUser -SamAccountName $username -GivenName $firstName -Surname $lastName -UserPrincipalName "$username@example.com" -Name "$firstName $lastName" -Enabled $true -AccountPassword $password -ChangePasswordAtLogon $true -Path $ouPath

if ($newUser) {
    Write-Host "User account created successfully."
} else {
    Write-Host "Failed to create user account."
}