# Welcome message - Script Focus - Delete ISAM User + Group
Write-Host "==============================="
Write-Host "Welcome to the AWS IAM Deleter!"
Write-Host "==============================="

# Prompt for group and user
$groupName = Read-Host "Enter the IAM group name to delete"
$userName = Read-Host "Enter the IAM user name to delete"

# Confirm deletion -ne = not equal to
$confirm = Read-Host "Are you sure you want to delete user '$userName' and group '$groupName'? (y/n)"
if ($confirm -ne "y") {
    Write-Host "Action cancelled."
    exit
}

# Remove user from group dollar sign underline will add the object caught into the written host
# 2>&1 used when logging output - Send error output (stream 2) to the same place as standard output (stream 1) successes goe to stream 1 and errors go to stream 2
try {
    Write-Host "Removing user from group..."
    $removeUserOutput = aws iam remove-user-from-group --user-name $userName --group-name $groupName 2>&1
    Write-Host $removeUserOutput
} catch {
    Write-Host "Could not remove user from group: $_"
}

# Delete the user - catch runs when there is an error
try {
    Write-Host "Delete IAM user..."
    $userDeleteOutput = aws iam delete-user --user-name $userName 2>&1
    Write-Host $userDeleteOutput
} catch {
    Write-Host "Could not delete user: $_"
}

# Detach policy from group - you can't delete a group that has policies attached
# ARN - Amazon Resource Name arn:partition:service:region:account-id:resource
try {
    Write-Host "Detaching ReadOnlyAccess policy from group..."
    $policyArn = 'arn:aws:iam::aws:policy/ReadOnlyAccess'
    $detachPolicyOutput = aws iam detach-group-policy --group-name $groupName --policy-arn $policyArn 2>&1
    Write-Host $detachPolicyOutput
} catch {
    Write-Host "Could not detach policy: $_"
}

# Delete the group - cannot delete if users or policies still in it
try {
    Write-Host "Deleting IAM group..."
    $groupDeleteOutput = aws iam delete-group --group-name $groupName 2>&1
    Write Host $groupDeleteOutput
} catch {
    Write-Host "Could not delete group: $_"
}

# Logging block (after deletes)
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logPath = "./iam_deletion.log"
$logEntry = @"
[$timestamp] Deleted user '$userName' and group '$groupName'
Remove from group: $removeUserOutput
User delete: $userDeleteOutput
Policy detach: $detachPolicyOutput
Group delete: $groupDeleteOutput
"@

Add-Content -Path $logPath -Value $logEntry

