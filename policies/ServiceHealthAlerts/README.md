# Deploy Service Health Alerts with an Action Group

This policy automatically deploys a resource group, a service health alert covering all resources types and all regions, and an action group with an email address.

## Try with CLI

````cli

az policy definition create --name 'deploy-service-health-alerts-with-an-action-group' --display-name 'Deploy Service Health Alerts with an Action Group' --description 'This policy automatically deploys a resource group, a service health alert covering all resources types and all regions, and an action group with an email address.' --rules 'https://raw.githubusercontent.com/oZakari/Azure-Monitoring/main/policies/ServiceHealthAlerts/azurepolicy.rules.json' --params 'https://raw.githubusercontent.com/oZakari/Azure-Monitoring/main/policies/ServiceHealthAlerts/azurepolicy.parameters.json' --mode Indexed
