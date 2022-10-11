# set the repo to be trusted
Set-PSRepository -Name PsGallery -InstallationPolicy Trusted
# install the required PowerShell modules
$modules =  'Az.Accounts', 'Az.Resources', 'Az.Storage', 'Az.KeyVault'
foreach($module in $modules){
    Install-Module $module
}
$oldFile = '/workspaces/SCSWorkshop/CleanUp/oldresourcelist.txt'
$resourcesFile = '/workspaces/SCSWorkshop/CleanUp/resourcelist.ps1'
$message = '
# previous resources {0}
' -f (Get-Date).ToLongDateString()

$message | Out-File -FilePath $oldFile -Append

Get-Content $resourcesFile | Out-File -FilePath $oldFile -Append

$message = '# resources created - {0}' -f (Get-Date).ToLongDateString()

$message |Out-File -FilePath $resourcesFile

# mark this as a safe directory for git to play nice
git config --global --add safe.directory /workspaces/SCSWorkshop