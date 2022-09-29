# Lesson 5 - Rebasing your branch

## New Terms

- **Rebase** - Changing the base of your branch

## Prerequisites

- Completed through lesson 4
- Admin has merged PR in

## Lesson

### Stage 1 - Make a change

1. Navigate to your repo if you're not already there

    ``` PowerShell
    Set-Location C:\GitHub\SCSWorkshop
    ```

2. Check status to see where you are

    ```bash
    git status
    ```

3. Create a branch to work in

    ```bash
    git checkout -b rebaseWork
    ```

4. Add a file work.ps1 with the following contents:

    ``` PowerShell
    Get-Content .\todo.txt
    ```

5. Add, Commit & Push to your fork on GitHub

    ```bash
    git push --set-upstream origin rebaseWork

6. Check your branch on GitHub

    ```bash
    This branch is 1 commit ahead, 2 commits behind jpomfret:main
    ```

    This development process took a while, and now it's time to merge in but the upstream codebase has newer changes than you have in your clone.

## Stage 2 - Get main branch on your clone up to date

1. Checkout your main branch

    ```bash
    git checkout main
    ```

2. Pull down the changes to main

    ```bash
    git pull upstream main
    ```

3. Push changes to your repo on GitHub

    ```bash
    git push
    ```

## Stage 3 - Rebase your branch from the now up to date main

1. Checkout work branch

    ```bash
    git checkout rebaseWork
    ```

2. Rebase branch from main

    ```bash
    git rebase origin/main
    ```

    ```bash
    First, rewinding head to replay your work on top of it...
    Fast-forwarded rebaseWork to origin/main.
    ```

3. Force push your changes to your clone

    ```bash
    git push --force
    ```

4. Check GitHub

    ```bash
    This branch is even with jpomfret:main
    ```

## Next Up

- [Lesson 6](../Lessons/Lesson6.md)
