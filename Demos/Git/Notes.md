# Git

## Checkout folder\files from one branch to another

```PowerShell
Git checkout -b newfolder
New-Item -Type Directory -Name Tests
New-Item -Type File -Path Tests\demo.tests.ps1
git add ..
git commit...

git checkout main
git checkout newfolder -- ./Tests/*
```
