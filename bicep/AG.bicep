param deploymentInfo object
param stage object

var agInfo = deploymentInfo.agInfo

module AG 'AG-actiongroup.bicep' = [for (ag, index) in agInfo: {
  name: 'dp-ag-${ag.name}'
  params: {
    actionGroupInfo: ag
  }
}]
