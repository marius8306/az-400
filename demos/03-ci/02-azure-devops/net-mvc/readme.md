# .NET MVC Continous Integration

Samples are included in the .NET MVC repo available at [mvc-devops](https://github.com/arambazamba/mvc-devops)

Install the [.NET SDK](https://dotnet.microsoft.com/download)

Create project:

```
dotnet new mvc -n mvc-hello-world
```

Manual Steps:

```
dotnet restore
dotnet build
dotnet test
dotnet publish
```

Show `az-pipelines/mvc-ci.yml`