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

>Note: You can also use the vm from module 04 or install the agent using choco:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


choco install azure-pipelines-agent --params "'/Directory:c:\agent'" -y
cd \agent
```

-   Complete the agent config:

```PowerShell
.\config.cmd --deploymentgroup --deploymentgroupname "Azure-Webserver" --agent $env:COMPUTERNAME --runasservice --work '_work' --url 'https://dev.azure.com/integrations-training/' --projectname 'M11-ContinousDeployment' --auth PAT --token exaymaqys....
```

![config-agent](_images/config-agent.png)

- Check the agent:

![check-targets](_images/check-targets.png)