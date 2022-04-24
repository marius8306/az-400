# Azure Board 

Create two PAT tokens. One for Azure DevOps and on for GitHub and store them as secrets:

- `ADO_PERSONAL_ACCESS_TOKEN` (repo permissions)
  - Azure DevOps | User settings | Security | Personal access tokens
- `GH_PERSONAL_ACCESS_TOKEN` (read / write)
  - GitHub | Personal settings | Developer settings | Personal access tokens

Add the following workflow in GitHub:

```yaml
name: Export Issues to Azure DevOps Boards
on:
  issues:
    types:
      [opened, edited, deleted, closed, reopened, labeled, unlabeled, assigned]
jobs:
  alert:
    runs-on: ubuntu-latest
    steps:
      - name: GitHub Issues to Azure DevOps
        # You may pin to the exact commit or the version.
        # uses: danhellem/github-actions-issue-to-work-item@b82f03709b7cc669a689261658f2fabb0586f0ed
        uses: danhellem/github-actions-issue-to-work-item@v2.0
        env:
          ado_token: "${{ secrets.ADO_PERSONAL_ACCESS_TOKEN }}"
          github_token: "${{ secrets.GH_PERSONAL_ACCESS_TOKEN }}"
          ado_organization: "integrations-training"
          ado_project: "Classes"
          ado_wit: "Issue"
          ado_new_state: "New"
          ado_active_state: "Active"
          ado_close_state: "Closed"
          ado_bypassrules: true
          log_level: 100
```