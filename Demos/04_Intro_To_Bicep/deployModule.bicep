// This is my module for deploying my Jess and Rob Resource group at South Coast Summit with modules 
targetScope = 'resourceGroup'

param name string = 'jessstorage'
param utc string = utcNow()
var storagename = '${name}${uniqueString(utc)}'
param location string = resourceGroup().location

module storage 'StorageV2.bicep' = {
  name: 'deploying-${name}'
  params: {
    name: storagename
    networkAclsBypass: 'AzureServices'
    rgVirtualNetworksSubnets: []
    skuName: 'Premium_LRS'
    location: location
  }
}
