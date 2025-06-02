# Day 5 – IAM Deletion & PowerShell Error Handling  
**Date:** 2025-06-03  
**Focus:** Deleting IAM users and groups safely using PowerShell and AWS CLI. Learning deeper error handling, `$?`, `$LASTEXITCODE`, and `$_`.

## What I accomplished:
- Created a PowerShell script that:
  - Prompts for an IAM user and group name
  - Confirms deletion
  - Removes user from group
  - Detaches managed policy from group
  - Deletes the user and group safely
  - Logs all actions (success and errors) to a `.log` file
- Learned:
  - `try {}` and `catch {}` blocks in PowerShell
  - How `$_` captures the error object in a catch block
  - That `2>&1` merges standard and error output into one stream so I can log everything
- Reinforced best practices for AWS IAM resource deletion:
  - You can’t delete a group if users or policies are still attached
  - Order matters: Remove user ➝ detach policy ➝ delete user ➝ delete group

## Reflections:
- Seeing the script catch errors and report them clearly gave me a new sense of control.
- Logging and exception handling make the script feel "real" — like something that would hold up in production.
- I noticed how the repetition of building + refining = better retention. I’m not just memorizing — I’m shaping tools.
- I’m starting to *think* like someone who automates things for clarity and safety.

## What’s next:
- Create a **menu-driven script** that lets me choose:
  - Create user/group
  - Delete user/group
  - Exit
- Add `ErrorActionPreference = "Stop"` to enforce clean catching
- Start drawing AWS environment diagrams for these tools (IAM + S3 so far)
- Possibly script out a “list users” function that dumps current IAM state to a log