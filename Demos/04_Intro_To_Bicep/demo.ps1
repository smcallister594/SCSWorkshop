# We know how to deploy Azure Resources

# Portal

# need to log in first of course - We need the -UseDeviceAuthentication switch because we are in a container here.

Connect-AzAccount -UseDeviceAuthentication

cls

Get-AzSubscription

# And choose the correct subscription
$SubscriptionName = 'Beard Microsoft Azure Sponsorship' 

Set-AzContext -SubscriptionName $SubscriptionName

# Create a Resource Group

$rgNamePowerShell = 'JessandRob{0}' -f (Get-Random -Minimum 1 -Maximum 10000)


$location = 'uksouth'
$tags = @{
    session     = 'South Coast Summit'
    presenter   = 'Jess'
    owner       = 'Ben'
    budget      = 'Ben Weissman - personal account'
    environment = 'demo'
}

New-AzResourceGroup -Name $rgNamePowerShell -Location $location -Tag $tags 

# so what happens if I run it again ?

New-AzResourceGroup -Name $rgNamePowerShell -Location $location -Tag $tags 

# so I have to do some work to do it programmatically

New-AzResourceGroup -Name $rgNamePowerShell -Location $location -Tag $tags -Force

# Add some resources

$storageAccountName = 'southcoastsum{0}' -f (Get-Random -Minimum 1 -Maximum 10000)

New-AzStorageAccount -ResourceGroupName $rgNamePowerShell -Name $storageAccountName -SkuName Standard_LRS -Location $location -Kind StorageV2 -Tag $tags

# Now what happens if we run this again?

New-AzStorageAccount -ResourceGroupName $rgNamePowerShell -Name $storageAccountName -SkuName Standard_LRS -Location $location -Kind StorageV2 -Tag $tags

# So we need to do some coding

if (-not (Get-AzStorageAccount -ResourceGroupName $rgNamePowerShell -Name $storageAccountName)) {
    New-AzStorageAccount -ResourceGroupName $rgNamePowerShell -Name $storageAccountName -SkuName Standard_LRS -Location $location -Kind StorageV2 -Tag $tags
}

# Awesome - so if we want to create another storage account, we can do

$newStorageAccountName = 'southcoastsum{0}' -f (Get-Random -Minimum 1 -Maximum 10000)

if (-not (Get-AzStorageAccount -ResourceGroupName $rgNamePowerShell -Name $newStorageAccountName)) {
    New-AzStorageAccount -ResourceGroupName $rgNamePowerShell -Name $newStorageAccountName -SkuName Standard_LRS -Location $location -Kind StorageV2 -Tag $tags
}

# sigh - we have to do evcen more work here

$anotherNewStorageAccountName = 'southcoastsum{0}'  -f (Get-Random -Minimum 1 -Maximum 10000)

if (-not (Get-AzStorageAccount -ResourceGroupName $rgNamePowerShell -Name $anotherNewStorageAccountName -ErrorAction SilentlyContinue)) {
    New-AzStorageAccount -ResourceGroupName $rgNamePowerShell -Name $anotherNewStorageAccountName -SkuName Standard_LRS -Location $location -Kind StorageV2 -Tag $tags
}

# What about if I want to update say the tags ?

# well .......

# Now you need to do even more coding and if you need to update 10 storage accounts then ....


$tags = @{
    session     = 'South Coast Summit'
    presenter   = 'Jess'
    owner       = 'Ben'
    budget      = 'Ben Weissman - personal account'
    bankaccount = 'Not the Glasses fund'
    environment = 'demo'
}

Get-AzResource -ResourceGroupName $rgNamePowerShell | ForEach-Object {
    $Message = 'I Will try to update the tags on the {0} resource in the {1} ResourceGroups ' -f $_.Name, $rgNamePowerShell
    Write-PSFMessage $Message -Level Significant
    try {
        $_ | Set-AzResource  -Tag $tags -ErrorAction Stop -Force
        $Message = 'Happy Beard updated the tags on the {0} resource in the {1} ResourceGroups ' -f $_.Name, $rgNamePowerShell
        Write-PSFMessage $Message -Level Significant
    } catch {
        $Message = 'OH NO - The Beard is sad - We failed to update the tags on the {0} resource in the {1} ResourceGroups ' -f $_.Name, $rgNamePowerShell
        Write-PSFMessage $Message -Level Significant -ErrorRecord $_ 
    }
}

# Side note - because we used PsFramework module we not only have the output on the screen but also in a file (you can do all sorts)

$latestogfile = Get-ChildItem (Get-PSFConfig -Name Logging.FileSystem.LogPath).Value | Sort-Object LastWriteTime -Descending | Select-Object -First 1

code $latestogfile.FullName

    # If we are using az cli then

    # we still need to login

    az login

    $azrgName = 'JessandRob{0}' -f (Get-Random -Minimum 1 -Maximum 10000)

    az group create --location uksouth --name $azrgName 

    # Now we do it again

    az group create --location uksouth --name $azrgName

    # awesome - and if we change it

    az group create --location uksouth --name $azrgName --tags session='South Coast Summit' presenter='Jess' owner='Ben' budget='Ben W - personal account' environment='demo'

    # it's all good

    # Same with creating storage accounts

    $storageAccountName = 'southcoastsum{0}' -f (Get-Random -Minimum 1 -Maximum 10000)


    az storage account create --name $storageAccountName --resource-group $azrgName --kind StorageV2 --sku Standard_LRS --tags session='South Coast Summit' presenter='Jess' owner='Ben' budget='Ben W - personal account' environment='demo'

    # and if we change it

    az storage account create --name $storageAccountName --resource-group $azrgName --kind StorageV2 --sku Standard_LRS --tags session='South Coast Summit' presenter='Jess' owner='Ben' budget='Ben W - personal account NOT THE GLASSES' environment='demo'

