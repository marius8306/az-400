$personalToken = "6kvwmrhbsbnjrduc3ozmabq3odkecv44ygnizol44nurunnfcseq"
$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalToken)"))
$header = @{authorization = "Basic $token"}
 
$organization = "integrations-training"
$project = "M10-ReleaseStrategy"
 
#all build definitions
$url = "https://dev.azure.com/$organization/$project/_apis/build/definitions?api-version=6.0-preview.7"
$builddefinitions = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json" -Headers $header
 
$builddefinitions.value | Where-Object {$_.name -eq "reatined"}|Sort-Object id|ForEach-Object {
    Write-Host $_.id $_.name $_.queueStatus
}
#all builds for a definition
$url = "https://dev.azure.com/$organization/$project/_apis/build/builds?definitions=" + $_.id + "&api-version=6.0-preview.5"
$builds = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json" -Headers $header
 
$builds.value | Sort-Object id|ForEach-Object {
    #report on retain status
    Write-Host " BuildId" $_.id "- retainedByRelease:" $_.retainedByRelease

    #api call for a build
    $url = "https://dev.azure.com/$organization/$project/_apis/build/builds/" + $_.id + "?api-version=6.0-preview.5"
    
    #set retainedByRelease property to false
    Invoke-RestMethod -Uri $url -Method Patch -Body (ConvertTo-Json @{"retainedByRelease"='false,'}) -ContentType "application/json" -Headers $header
    Invoke-RestMethod -Uri $url -Method Patch -Body (ConvertTo-Json @{"keepForever"='false'}) -ContentType "application/json" -Headers $header
}
Write-Host "all builds released"
