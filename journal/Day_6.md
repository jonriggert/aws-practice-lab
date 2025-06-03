# Day 6 – Console Exploration: EC2 & IAM  
**Date:** 2025-06-03  
**Focus:** Shifted from scripting to hands-on AWS Console learning. Created and explored EC2 and IAM resources manually.

## What I accomplished:
- Launched an EC2 instance using the AWS Console:
  - Selected Amazon Linux 2 AMI (free-tier)
  - Used `t2.micro` instance type
  - Created and downloaded a new key pair
  - Tagged the instance (`Name=ec2-console-test`)
  - Terminated the instance manually to avoid charges
- Created a new IAM user and group:
  - Created `test-user-console` and `Console-Test-Group`
  - Added the user to the group via Console UI
  - Attached a managed policy to the group (`AmazonS3ReadOnlyAccess`)
- Reinforced understanding of:
  - EC2 instance lifecycle (`Running` → `Terminated`)
  - IAM group/user structure and permissions flow
  - Tagging, key pair management, and safe shutdown practices

## Reflections:
- Navigating the AWS Console helped me visually connect the resources I’d been scripting.
- Console made it easier to explore metadata and service relationships.
- I feel more confident switching between CLI and Console now, depending on the task.
- Having created an instance and user both ways (CLI + Console) reinforces everything.

## What’s next:
- Start a new session (Day 7) with a clean outline and a reminder of what we’re building
- Add EC2 launching to my PowerShell menu script
- Begin drawing AWS architecture diagrams
- Revisit IAM group structure + bulk user imports from CSV