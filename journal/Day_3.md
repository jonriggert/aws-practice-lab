# Day 3 – S3 CLI Bucket Builder  
**Date:** 2025-05-31  
**Focus:** PowerShell scripting, user input, validation, AWS CLI integration, and basic logging.

## What I accomplished:
- Created a PowerShell script that:
  - Prompts the user for a **bucket name** and **AWS region**  
  - Validates the bucket name and region input  
  - Confirms action before execution  
  - Uses AWS CLI to create an S3 bucket from the command line  
  - Logs the results with timestamp to a `.log` file  
- Learned about:
  - `Read-Host`, `Write-Host`, `exit`, and `Add-Content`  
  - `$LASTEXITCODE` for command result checking  
  - Regex validation and using arrays to validate allowed regions  
  - The importance of `.gitignore` to exclude log files  

## Reflections:
- It felt good to see real-world interaction between PowerShell, AWS, and user input.  
- Logging made it feel more like a real tool.  
- Asking questions like “Should this go in the repo?” shows I’m thinking like a dev.  
- Seeing the JSON response come back from AWS CLI was 🔥 — felt powerful and concrete.  

## What’s next (Day 4 plan – next week):
- Add support for **deleting** buckets as an option in the same script.  
- Include more robust error handling with try/catch.  
- Clean up the log format or break it into daily files.  
- Optional stretch: Start a Python version of this to compare.