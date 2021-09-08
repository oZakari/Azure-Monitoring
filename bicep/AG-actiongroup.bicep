param actionGroupInfo object

resource actionGroup 'microsoft.insights/actionGroups@2019-06-01' = {
  name: 'AG-${actionGroupInfo.name}'
  location: 'Global'
  properties: {
    enabled: actionGroupInfo.status
    groupShortName: actionGroupInfo.shortName
    emailReceivers: [
      {
        name: actionGroupInfo.group
        emailAddress: actionGroupInfo.email
      }
    ]
  }
}
