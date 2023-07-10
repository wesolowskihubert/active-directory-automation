#select username or ID
$username = Read-Host "Enter the username or user ID"

#select group name
$groupName = Read-Host "Enter the group name"

#checking if user AND group exist
$user = Get-ADUser -Identity $username
$group = Get-ADGroup -Identity $groupName

if ($user -and $group) {
    #select ation add/remove
    $action = Read-Host "Do you want to add or remove the user from the group? (Add/Remove)"

    #check action input
    switch ($action.ToLower()) {
        "add" {
            #add user to group
            Add-ADGroupMember -Identity $groupName -Members $username
            Write-Host "User '$username' added to the group '$groupName'."
        }
        "remove" {
            #remove user from group
            Remove-ADGroupMember -Identity $groupName -Members $username -Confirm:$false
            Write-Host "User '$username' removed from the group '$groupName'."
        }
        default {
            Write-Host "Invalid action. Please choose either 'Add' or 'Remove'."
        }
    }
} else {
    Write-Host "User or group not found. Please check the provided username and group name."
}