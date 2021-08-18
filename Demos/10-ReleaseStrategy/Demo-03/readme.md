# Environments

- Import `environment-checks.yml`
- Explain checks

    ![checks](_images/checks.png)

- Show Invoke Azure Function using `az-funct-check`    

    ![configure-check](_images/configure-check.png)

    ![outcome](_images/outcome.png)

## Snippets

Incoming Webhook:

```
https://integrationsonline.webhook.office.com/webhookb2/0de6d64d-350d-4352-93f6-084123d68b48@d92b247e-90e0-4469-a129-6a32866c0d0a/IncomingWebhook/2086a60b83074528848ce30f3b09cbaa/25853297-1418-4fc4-96ec-22f8bc83a64b
```

https://docs.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/connectors-using?tabs=cURL#example-connector-message

Test Webhook:

```
$json='<CARD BODY HERE>'

Invoke-RestMethod -Method post -ContentType 'Application/Json' -Body $json   -Uri  <URL of the webhook you copied> 
```

https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/utility/azure-function?view=azure-devops