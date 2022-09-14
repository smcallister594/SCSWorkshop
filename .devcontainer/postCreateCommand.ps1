# set the repo to be trusted
Set-PSRepository -Name PsGallery -InstallationPolicy Trusted
# install the required PowerShell modules
$modules =  'Az.Accounts', 'Az.Resources', 'Az.Storage'
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
