Set-Location .\Demos\04_Intro_To_Bicep\

# Lets switch to Jess subscription for the Website

$Subscriptionid = '6d8f994c-9051-4cef-ba61-528bab27d213'
Set-AzContext -SubscriptionId $Subscriptionid


# take a look at the bicep file
code .\StorageV2simple.bicep

# Deploy the Bicep file with whatif
New-AzResourceGroupDeployment -ResourceGroupName $rgNamePowerShell  -TemplateFile StorageV2simple.bicep -WhatIf

# But thats not very duplicatable

# take a look at the bicep file
code .\deployModule.bicep

New-AzResourceGroupDeployment -ResourceGroupName $rgNamePowerShell  -TemplateFile deployModule.bicep -WhatIf


# Lets switch to Jess subscription for the Website

$Subscriptionid = 'bbd50fd8-6a3e-4d6f-8d20-cf6f43c9c461'
Set-AzContext -SubscriptionId $Subscriptionid
$resourceGroup = 'SCSWorkshop'
$keyVaultName = 'SCSKeyVault07'
$githubTokenSecretName = 'SCSWorkshopGitToken'

$githubTokenSecret = Get-AzKeyVaultSecret -VaultName $keyVaultName -Name $githubTokenSecretName -AsPlainText

# take a look at the bicep file
code myWebsite.bicep

# Deploy the Bicep file with whatif
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile myWebsite.bicep -NameFromTemplate SCSWorkshop -repositoryToken $githubTokenSecret -WhatIf
