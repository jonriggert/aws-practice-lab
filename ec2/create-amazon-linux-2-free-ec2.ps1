$keyName = Read-Host "Please enter keyname (ec2-test-key-us-east-2)"
$region = Read-host "Please enter region (us-east-2)"
$instanceName = Read-host "Please enter instance name (ec2-test-instance-01)"
$ownerName = Read-host "Please enter owner name (Jon)"

$tagSpec = "ResourceType=instance,Tags=[{Key=Name,Value=$instanceName},{Key=Owner,Value=$ownerName}]"

aws ec2 run-instances `
    --image-id ami-0c55b159cbfafe1f0 `
    --count 1 `
    --instance-type t2.micro `
    --key-name $keyName `
    --region $region `
    --tag-specifications $tagSpec