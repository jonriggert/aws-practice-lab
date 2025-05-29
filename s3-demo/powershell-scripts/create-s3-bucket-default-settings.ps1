# Welcome - I honestly just find that doing this makes it feel more fun 
Write-Host "==============================="
Write-Host "Welcome to the Basic Bucket Creator!"
Write-Host "==============================="

# Prompt for bucket name
$bucketName = Read-Host "Enter the bucket name"

# Prompt for AWS Region
$region = Read-Host "Enter the AWS region (e.g. us-east-2)"

# Confirm Details
Write-Host "`nCreating bucket '$bucketname' in region '$region'..."

# Run AWS CLI command
aws s3api create-bucket --bucket $bucketName --region $region --create-bucket-configuration LocationConstraint=$region

Write-Host "Bucket creation attempt complete. Have a nice day!"