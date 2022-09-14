# Load the variables
. ./CleanUp/resourcelist.ps1

$resourceGroupNames = $azrgName, $rgNamePowerShell

# Check if this session is connected to Azure

if (-not (Get-AzContext -ErrorAction SilentlyContinue)) {
    Connect-AzAccount
    Select-AzSubscription -SubscriptionName $SubscriptionName
}

# Remove all of the Resource Groups

foreach ($resourceGroupName in $resourceGroupNames) {

    try {
        $Message = 'I Will try to remove {0} ResourceGroup ' -f $resourceGroupName
        Write-PSFMessage $Message -Level Significant
        Remove-AzResourceGroup -Name $resourceGroupName -Force -ErrorAction Stop
    } catch {
        $Message = 'AH DRAT - I failed to remove {0} ResourceGroup ' -f $resourceGroupName
        Write-PSFMessage $Message -Level Significant -ErrorRecord $_
    }

}