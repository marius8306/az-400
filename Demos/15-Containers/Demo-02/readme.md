# Azure Container Registry

[Azure Container Registry](https://docs.microsoft.com/en-us/azure/container-registry/)

## Demo

Execute `create-container-reg` and upload img manually:

```bash
...
docker tag foodui $acr.azurecr.io/foodui
docker push $acr.azurecr.io/foodui
```
