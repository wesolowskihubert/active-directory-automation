#select user to modify
$username = Read-Host "Enter the username of the account to modify"

#get user acc
$user = Get-ADUser -Identity $username

if ($user) {
    Write-Host "User account found. Please specify the properties to modify:"

    #prompt for new properties
    $newFirstName = Read-Host "New First Name"
    $newLastName = Read-Host "New Last Name"
    $newEmail = Read-Host "New Email Address"
    $newPhoneNumber = Read-Host "New Phone Number"

    #modify user
    Set-ADUser -Identity $username -GivenName $newFirstName -Surname $newLastName -EmailAddress $newEmail -OfficePhone $newPhoneNumber

    Write-Host "User account modified successfully."
} else {
    Write-Host "User account not found."
}