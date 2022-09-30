# Lesson 4 - Oh G*T - I'm on the wrong branch

## New Terms

- **Stash** - saves your changed files off to a temporary shelf.
  - **Stash Pop** - get those changes back and apply on top of current branch.

## Prerequisites

- Make sure your repo is in sync - [Lesson 2](../Lessons/Lesson2.md)
- Admin merge in PR to upstream - so that repo is ahead

## Lesson

### Stage 1 - Make a change in the wrong branch

1. Navigate to your repo if you're not already there

    ``` PowerShell
    Set-Location C:\GitHub\SCSWorkshop
    ```

2. Check status to see where you are

    ```bash
    git status
    ```

3. If you're not still on the addFriends branch, check it out

    ```bash
    git checkout addFriends
    ```

4. Make a change

    ``` PowerShell
    notepad .\README.md
    ```

5. Check status to see where you are

    ```bash
    git status
    ```

    ```bash
    On branch addFriends
    Your branch is up to date with 'origin/addFriends'.

    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git restore <file>..." to discard changes in working directory)
            modified:   README.md

    no changes added to commit (use "git add" and/or "git commit -a")
    ```

6. Oh no - I'm still on the old branch - addFriends. Checkout main so we can create a new branch

    ```bash
    git checkout main
    ```

    ```bash
    PS C:\GitHub\SCSWorkshop> git checkout main
    error: Your local changes to the following files would be overwritten by checkout:
    README.md
    Please commit your changes or stash them before you switch branches.
    Aborting
    ```

    That didn't work as the checkout would overwrite my changes.

### Stage 2 - Stash changes so you can switch branches

1. Stash the changes

    ```bash
    git stash
    ```

2. Now checkout main

    ```bash
    git checkout main
    ```

3. Update main from upstream

    ```bash
    git pull upstream main
    ```

4. Update your fork on Github (origin).

    ```bash
    git push
    ```

5. Create a branch for your new work

    ```bash
    git checkout -b newIdea
    ```

6. Un-stash your changes

    ```bash
    git stash pop
    ```

7. Now you've made your changes against the most up to date copy of the main branch.
8. Add, Commit and Push.

## Next Up

- [Lesson 5](../Lessons/Lesson5.md)
