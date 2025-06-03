$keyName = Read-Host "Please specify key name (ec2-test-key-us-east-2)"
$filePath = "$keyName.pem"

if (Test-Path $filePath) {
    $overwrite = Read-Host "File $filePath exists. Overwrite? (y/n)"
    if ($overwrite -notin @('Y', 'y')) {
        Write-Host "Aborted."
        exit
    }
}

try {
    aws ec2 create-key-pair `
        --key-name $keyName `
        --query 'KeyMaterial' `
        --output text > "$keyName.pem"
        Write-Host "Key created and saved to $keyName.pem"
} catch {
    Write-Host "Failed to create key pair: $_"
}
