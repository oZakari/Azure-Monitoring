param deploymentInfo object
param stage object

module AG 'AG.bicep' = if (stage.AG == 1) {
  name: 'dp-AG'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
  }
}

module AL 'AL.bicep' = if (stage.AL == 1) {
  name: 'dp-AL'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
  }
  dependsOn: [
    AG
  ]
}
