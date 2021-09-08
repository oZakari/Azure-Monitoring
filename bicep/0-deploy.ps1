$rgname = 'Monitoring'
$region = 'EastUS'
$subscription = "ES-CE-LR-INT-ZTROCINSKI"
$MyParametersDeployALL = @{
    ResourceGroupName     = $rgname
    TemplateParameterFile = ".\bicep\0-param-env1.json"
    Verbose               = $true
    WhatIf                = $false
}

Set-AzContext -SubscriptionName $subscription

Write-Warning -Message "RG is: [$rgname] in Region: [$region] in Subscription [$subscription]"

break

New-AzResourceGroup -Name $rgname -Location $region -Force

# Orchestrate the deployment of all resources - All resources
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\ALL.bicep

# Deploy Single layer, inner dev loop - Action Group
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\AG.bicep

# Deploy Single layer, inner dev loop - Activity Log Resource Alert
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\AL.bicep
