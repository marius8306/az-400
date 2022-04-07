# Git-Flow & Forking Workflow

## Git-Flow

[Git-Flow Cheatsheet](https://danielkummer.github.io/git-flow-cheatsheet/)

> Note: Require GIT 2.24.0+ - Check with `git --version` and seperate package installation on Linux `sudo apt-get install -y git-flow`

Initialize repo for gitflow:

```
git flow init
```

Start a new feature:

```
git flow feature start MYFEATURE
```

Finish feature:

```
git flow feature finish MYFEATURE
```

Publish a feature:

```
git flow feature publish  MYFEATURE
```

Start a release:

```
git flow release start RELEASE
```

Finish a release:

```
git flow release finish  RELEASE
```

## Forking Workflow - Getting Updates for Class Demos

![forking-wf](_images/forking-workflow.jpg)

Original Repo could be: `https://github.com/ARambazamba/az-400` where `ARambazamba` is the `original-owner-github-username` and `az-400` is the `reponame`

### Listing the current Remotes

List the current configured remote repository for your fork.

```
git remote -v
> origin  https://github.com/your-github-username/reponame.git (fetch)
> origin  https://github.com/your-github-username/reponame.git (push)
```

Specify a new remote upstream repository that will be synced with the fork.

### Adding the Repo of the original owner as Upstream

```
git remote add upstream https://github.com/original-owner-github-username/reponame.git
```

Verify the new upstream repository you've specified for your fork.

```
git remote -v
> origin    https://github.com/your-github-username/reponame.git (fetch)
> origin    https://github.com/your-github-username/reponame.git (push)
> upstream  https://github.com/original-owner-github-username/reponame.git (fetch)
> upstream  https://github.com/original-owner-github-username/reponame.git (push)
```

### Getting Updates

Fetch from Upstream:

```
 git fetch upstream
 git merge upstream/master
 git push origin master
```

## Fostering Internal Open Source

Forking is done using the Fork Button

![fork](../_images/fork.jpg)

Add the repo your forked from as "upstream":

```
git remote add upstream {upstream_url}
```

Make changes an create a Pull Request

Sync your fork to latest:

```
git fetch upstream master
git rebase upstream/master
git push origin
```