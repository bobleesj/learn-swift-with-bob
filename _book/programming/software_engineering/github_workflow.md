# Github Workflow

## Creating a Fork

# Clone your fork to your local machine
```
git clone git@github.com:USERNAME/FORKED-PROJECT.git
```

## Keeping Your Fork Up to Date
```
# Add 'upstream' repo to list of remotes
git remote add upstream https://github.com/UPSTREAM-USER/ORIGINAL-PROJECT.git

# Verify the new remote named 'upstream'
git remote -v
```

Whenever you want to update your fork

```
# Fetch from upstream remote
git fetch upstream
```

```
# View all branches, including those from upstream
git branch -va
```

Checkout your own master branch and merge the upstream repo's master branch:
```
# Checkout your master branch and merge upstream
git checkout master
git merge upstream/master
```


## Work
```
# Checkout the master branch - you want your new branch to come from master
git checkout master

# Create a new branch named newfeature (give your branch its own simple informative name)
git branch newfeature

# Switch to your new branch
git checkout newfeature
```

## Pull Request
If any commits have been made to the upstream master branch,
```
# Fetch upstream master and merge with your repo's master branch
git fetch upstream
git checkout master
git merge upstream/master
```

```
# If there were any new commits, rebase your development branch
git checkout newfeature
git rebase master
```

The git rebase command allows you to easily change a series of commits, modifying the history of your repository. You can reorder, edit, or squash commits together.

 - Edit previous commit messages
 - Combine multiple commits into one
 - Delete or revert commits that are no longer necessary

### Reference
http://jaimeiniesta.github.io/learn.github.com/p/rebasing.html


# Team Collaboration with Github
https://code.tutsplus.com/articles/team-collaboration-with-github--net-29876

 1. Jira combine with Github for Developers
 2. Kanban for Designers and Helpers
 3.

 Communication: Slack 사용
