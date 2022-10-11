targetScope = 'resourceGroup'

@description('The name of the website to create.')
param name string = 'SCSWorkshop'

@description('The location where the website will be created.')
param location string = resourceGroup().location

@allowed([
  'Free'
  'Shared'
  'Basic'
  'Standard'
  'Premium'
])

@description('Name of the resource SKU')
param skuName string = 'Free'

@allowed([
  'Free'
])
@description('The name of the sku Tier')
param skuTier string = 'Free'

@description('The provider that submitted the last deployment to the primary environment of the static site')
param provider string = 'GitHub'

@description('The GitHub User Name')
param githubUsername string = 'jpomfret'

@description('The GitHub Repository Name')
param githubRepositoryName string = 'SCSWorkshop'

var repositoryUrl = provider == 'GitHub' ? 'https://github.com/${githubUsername}/${githubRepositoryName}' : ''

@description('The name of the branch to deploy')
param branch string = 'main'

@allowed([
  'Enabled'
  'Disabled'
])
@description(' staging environments are allowed or not allowed for a static web app')
param stagingEnvironmentPolicy string = 'Enabled'

@description('Is updating the config file allowed or not')
param allowConfigFileUpdates bool = true

@description('The GitHub Access Token')
param repositoryToken string

@description('The path to the app code within the repository')
param appLocation string = '/SouthCoastSummit'

@description('The output path of the app after building')
param outputLocation string = 'public'

param enterpriseGradeCdnStatus string = 'Disabled'

resource ourWebsite 'Microsoft.Web/staticSites@2022-03-01' = {
  name: name
  location: location
  sku: {
    name: skuName
    tier: skuTier
  }
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    stagingEnvironmentPolicy: stagingEnvironmentPolicy
    allowConfigFileUpdates: allowConfigFileUpdates
    provider: provider
    enterpriseGradeCdnStatus: enterpriseGradeCdnStatus
    repositoryToken: repositoryToken
    buildProperties: {
      appLocation: appLocation
      outputLocation: outputLocation
    }
  }
}
