param storageAccounts_foodpics25312_name string

resource storageAccounts_foodpics25312_name_resource 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  kind: 'StorageV2'
  location: 'westeurope'
  name: storageAccounts_foodpics25312_name
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: true
    encryption: {
      keySource: 'Microsoft.Storage'
      services: {
        blob: {
          enabled: true
          keyType: 'Account'
        }
        file: {
          enabled: true
          keyType: 'Account'
        }
      }
    }
    minimumTlsVersion: 'TLS1_0'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: []
    }
    supportsHttpsTrafficOnly: true
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

resource storageAccounts_foodpics25312_name_default 'Microsoft.Storage/storageAccounts/blobServices@2021-08-01' = {
  parent: storageAccounts_foodpics25312_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      enabled: false
    }
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_foodpics25312_name_default 'Microsoft.Storage/storageAccounts/fileServices@2021-08-01' = {
  parent: storageAccounts_foodpics25312_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
    protocolSettings: {
      smb: {}
    }
    shareDeleteRetentionPolicy: {
      days: 7
      enabled: true
    }
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_foodpics25312_name_default 'Microsoft.Storage/storageAccounts/queueServices@2021-08-01' = {
  parent: storageAccounts_foodpics25312_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_foodpics25312_name_default 'Microsoft.Storage/storageAccounts/tableServices@2021-08-01' = {
  parent: storageAccounts_foodpics25312_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource storageAccounts_foodpics25312_name_default_food 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-08-01' = {
  parent: storageAccounts_foodpics25312_name_default
  name: 'food'
  properties: {
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    immutableStorageWithVersioning: {
      enabled: false
    }
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_foodpics25312_name_resource
  ]
}