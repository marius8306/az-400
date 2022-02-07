# Deployment - Getting started

[Provision deployment groups](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/deployment-jobs?view=azure-devops)


## Demos

- Execute `create-api-webapp.azcli`
- Execute `api-build-deploy.yml` from [FoodApp](https://github.com/arambazamba/food-app/blob/master/az-pipelines/api-build-deploy.yml)

Ensure that IIS is installed. To install all feature use an elevated PowerShell prompt and execute:

```
Get-WindowsOptionalFeature -Online | where FeatureName -like 'IIS-*'
```

Create a deployment group. Copy Script and execute in an elevated PowerShell prompt:

![create-deployment-grp](_images/create-deployment-grp.png)