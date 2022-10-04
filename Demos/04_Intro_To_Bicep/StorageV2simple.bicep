targetScope = 'resourceGroup'

param utc string = utcNow()
var name = 'jessstorage${uniqueString(utc)}'

resource storage 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: name
  location: 'uksouth'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    isHnsEnabled: false
    supportsHttpsTrafficOnly: false
    allowBlobPublicAccess: true
    allowSharedKeyAccess: false
    minimumTlsVersion: 'TLS1_2'

    networkAcls: {
      defaultAction: 'Allow'
    }
    accessTier: 'Hot'
  }
  tags: {
    role: 'Storing Data as Blobs'
    owner: 'Beardy McBeardFace'
    budget: 'Ben Weissman personal account'
    bicep: 'true'
    WhichConference: 'South Coast Summit'
  }
}

output storageID string = storage.id
output storagePrimaryEndpoints object = storage.properties.primaryEndpoints
