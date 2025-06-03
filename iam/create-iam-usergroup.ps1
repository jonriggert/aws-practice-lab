# Welcome message
Write-Host "========================="
Write-Host "Welcome to the IAM Group + User Creator"
Write-Host "========================="

# Prompt for group name - Read-Host user input prompt real-time script interactivity
$groupName = Read-Host "Enter the IAM group name"

# Prompt for the user name
$userName = Read-Host "Enter the IAM user name"

# Confirm action
$confirm = Read-Host "Create group '$groupName' and user '$userName'? (y/n)"
if ($confirm -ne "y") {
    Write Host "Action cancelled."
    exit
}

# Create the group `n creates new line 2>&1 captures CLI output for errors
Write-Host "`n Create IAM group '$groupName'..."
$groupOutput = aws iam create-group --group-name $groupName 2>&1

# Create the user
Write-Host "`n Creating IAM user '$userName'..."
$userOutput = aws iam create-user --user-name $userName 2>&1

# Attach policy to the group
Write-Host "`n Attaching ReadOnlyAccess policy to the group '$groupName'..."
$policyArn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
$policyOutput = aws iam attach-group-policy --group-name $groupName --policy-arn $policyArn 2>&1

# Add user to group
Write-Host "`n Adding user '$userName' to group '$groupName'..."
$addUserOutput = aws iam add-user-to-group --user-name $userName --group-name $groupName

# Logging
$logPath = "./iam_creation.log"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logEntry = @"
- Group Output: $groupOutput
- User Output: $userOutput
- Policy Attachment: $policyOutput
- Add User to Group: $addUserOutput
"@

Add-Content -Path $logPath -Value $logEntry

# Final message
Write-Host "`n IAM group and user creation complete. Log saved to $logPath"