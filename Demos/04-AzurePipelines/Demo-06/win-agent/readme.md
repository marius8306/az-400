# Implement & Use a Self-hosted Docker Windows Agent

Enable Windows Container Feature:

```Powershell
Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All
```

Build Windows Agent:

```powershell
$agent="devopsagentwindows"
$dockerhubuser="arambazamba"
docker build -t $agent .
docker tag $agent $dockerhubuser/$agent
docker push $dockerhubuser/$agent
```
