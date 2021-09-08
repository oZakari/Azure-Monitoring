param deploymentInfo object
param stage object

var alInfo = deploymentInfo.alInfo

module AL 'AL-resourcehealthalerts.bicep' = [for (al, index) in alInfo: {
  name: 'dp-${al.name}'
  params: {
    resourceHealthAlertsInfo: al
  }
}]


