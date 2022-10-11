# set the repo to be trusted
Set-PSRepository -Name PsGallery -InstallationPolicy Trusted
# install the required PowerShell modules
$modules =  'Az.Accounts', 'Az.Resources', 'Az.Storage', 'Az.KeyVault'
foreach($module in $modules){
    Install-Module $module
}

# mark this as a safe directory for git to play nice
git config --global --add safe.directory /workspaces/SCSWorkshop