#select user name or ID that you want to delete
$username = Read-Host "Enter the username or user ID to delete"

#checking if acc exist
$user = Get-ADUser -Identity $username

if ($user) {
    #deletion confirmation
    $confirmDelete = Read-Host "Are you sure you want to delete user '$username'? (Y/N)"

    if ($confirmDelete -eq "Y") {
        #delete user acc
        Remove-ADUser -Identity $username -Confirm:$false
        Write-Host "User account '$username' deleted successfully."
    } else {
        Write-Host "User deletion operation canceled."
    }
} else {
    Write-Host "User account '$username' not found."
}
