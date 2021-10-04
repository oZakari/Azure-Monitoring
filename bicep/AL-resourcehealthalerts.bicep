param resourceHealthAlertsInfo object
var scope = subscription().id

resource AG 'microsoft.insights/actionGroups@2019-06-01' existing = {
  name: 'AG-${resourceHealthAlertsInfo.ag}'
}

resource activityLogAlert 'Microsoft.Insights/activityLogAlerts@2020-10-01' = {
  name: 'AL-${resourceHealthAlertsInfo.name}'
  location: 'Global'
  properties: {
    actions: {
      actionGroups: [
        {
          actionGroupId: AG.id
        }
      ]
    }
    scopes:[
      scope
    ]
    enabled: resourceHealthAlertsInfo.status
    description: 'Azure resource health alert for Northwell Health PaaS Resources'
    condition: {
      allOf: [
        {
          field: 'category'
          equals: 'ResourceHealth'
        }
        //Resource Types
        {
          anyOf: [
            {
              field: 'resourceType'
              equals: 'Microsoft.Web/serverFarms'
            }
            {
              field: 'resourceType'
              equals: 'Microsoft.EventHub/namespaces'
            }
            {
              field: 'resourceType'
              equals: 'Microsoft.Web/sites'
            }
            {
              field: 'resourceType'
              equals: 'Microsoft.Sql/servers/databases'
            }
          ]
        }
        //Current Resource Status
        {
          anyOf: [
            {
              field: 'properties.currentHealthStatus'
              equals: 'Degraded'
            }
            {
              field: 'properties.currentHealthStatus'
              equals: 'Unavailable'
            }
            {
              field: 'properties.currentHealthStatus'
              equals: 'Unknown'
            }
          ]
        }
        //Previous Resource Status
        {
          anyOf: [
            {
              field: 'properties.previousHealthStatus'
              equals: 'Available'
            }
          ]
        }
        //Event Status
        {
          anyOf: [
            {
              field: 'status'
              equals: 'Active'
            }
            {
              field: 'status'
              equals: 'Resolved'
            }
          ]
        }
        //Reason type
        {
          anyOf: [
            {
              field: 'properties.cause'
              equals: 'Unknown'
            }
            {
              field: 'properties.cause'
              equals: 'PlatformInitiated'
            }
          ]
        }
      ]
    }
  }
}
