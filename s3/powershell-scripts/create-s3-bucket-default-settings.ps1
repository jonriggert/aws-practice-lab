# Welcome - I honestly just find that doing this makes it feel more fun 
Write-Host "==============================="
Write-Host "Welcome to the Basic S3 Bucket Creator!"
Write-Host "==============================="

# Real-world loop formatting: PROMPT -> VALIDATE -> CONFIRM -> CREATE -> LOG!

# Prompt for bucket name
$bucketName = Read-Host "Enter the bucket name"

# Validate bucket name
if ($bucketName -notmatch '^[a-z0-9.-]{3,63}$') {
    Write-Host "Invalid bucket name. Must be 3-63 chars, lowercase, and only letters, numbers, hyphens or periods."
    exit
}

# Prompt for AWS Region
$region = Read-Host "Enter the AWS region (e.g. us-east-2)"

# Simple region validation
$validRegions = @("us-east-1", "us-east-2", "us-west-1", "us-west-2", "eu-west-1", "eu-central-1")
if ($region -notin $validRegions) {
    Write-Host "Invalid region."
    exit
}

# Confirm bucket creation
$confirmation = Read-Host "Create bucket '$bucketName' in region '$region'? (y/n)"
if ($confirmation -ne 'y') {
    Write-Host "Bucket creation cancelled."
    exit
}

# Working Details `n is for writing a new line
Write-Host "`nCreating bucket '$bucketname' in region '$region'..."

# Run AWS CLI command - it will give back a JSON result output for logging
$output = aws s3api create-bucket --bucket $bucketName --region $region --create-bucket-configuration LocationConstraint=$region

# Logging
$action = "create"
$logPath = "./s3_bucket_manager.log"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logEntry = "$timestamp [$action] bucket '$bucketName' in '$region' => $output"

Add-Content -Path $logPath -Value $logEntry

# Check exit code and report result
if ($LASTEXITCODE -eq 0) {
    Write-Host "Bucket '$bucketName' created successfully! See log: $logPath"
} else {
    Write-Host "Failed to create bucket."
}




