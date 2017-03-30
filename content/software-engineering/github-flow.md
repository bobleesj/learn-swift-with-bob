> Currently draft. March 22nd, 2017.

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

### Shortcuts
 - git checkout -b new-branch

```
 git remote -v
 origin	https://github.com/bobleesj/Bob_Learning_Journey (fetch)
 origin	https://github.com/bobleesj/Bob_Learning_Journey (push)
```

```
git remote add upstream https://github.com/octocat/Spoon-Knife.git
```

https://gist.github.com/Chaser324/ce0505fbed06b947d962

### Rebase
```
$ git clone https://github.com/my-username/edx-platform.git
$ cd edx-platform
$ git checkout -b my-branch
```






https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control
https://github.com/edx/edx-platform/wiki/How-to-Rebase-a-Pull-Request



### Fork a repo
https://help.github.com/articles/fork-a-repo/


## Git Pull
`pull` is a combination command, `fetch` followed by `merge`

git pull, in contrast, is used with a different goal in mind: to update your current HEAD branch with the latest changes from the remote server. This means that pull not only downloads new data; it also directly integrates it into your current working copy files. This has a couple of consequences:

Since "git pull" tries to merge remote changes with your local ones, a so-called "merge conflict" can occur. Check out our in-depth tutorial on How to deal with merge conflicts for more information.

A git pull is what you would do to bring a local branch up-to-date with its remote version, while also updating your other remote-tracking branches.

### Git Fetch
git fetch really only downloads new data from a remote repository - but it doesn't integrate any of this new data into your working files.

When you fetch, Git gathers any commits from the target branch that do not exist in your current branch and stores them in your local repository. However, it does not merge them with your current branch. This is particularly useful if you need to keep your repository up to date, but are working on something that might break if you update your files. To integrate the commits into your master branch,


`git clone `clones a repo.

`git rebase` saves stuff from your current branch that isn't in the upstream branch to a temporary area. Your branch is now the same as before you started your changes. So, git pull -rebase will pull down the remote changes, rewind your local branch, replay your changes over the top of your current branch one by one until you're up-to-date.

Also, git branch -a will show you exactly what’s going on with all your branches - local and remote.



![Image](https://i.stack.imgur.com/XwVzT.png)

### Reference
http://jaimeiniesta.github.io/learn.github.com/p/rebasing.html

https://www.digitalocean.com/community/tutorials/how-to-create-a-pull-request-on-github

# Study Git
https://git-scm.com/
There is one for Korean as well.

https://www.atlassian.com/git/tutorials/merging-vs-rebasing

Rule of Thumb
1. When pulling changes from origin/develop onto your local develop use rebase.
2. When finishing a feature branch merge the changes back to develop.

Rebases are how changes should pass from the top of hierarchy downwards and merges are how they flow back upwards.




https://www.derekgourlay.com/blog/git-when-to-merge-vs-when-to-rebase/


## About Version Control
What is "version control", and why should you care? Version control is a system that records changes to a file or set of files over time so that you can recall specific versions later.

If you are a graphic or web designer and want to keep every version of an image or layout (which you would most certainly want to), a Version Control System (VCS) is a very wise thing to use. It allows you to revert files back to a previous state, revert the entire project back to a previous state, compare changes over time, see who last modified something that might be causing a problem, who introduced an issue and when, and more. Using a VCS also generally means that if you screw things up or lose files, you can easily recover. In addition, you get all this for very little overhead.



## A Short History of Git
The Linux kernel is an open source software project of fairly large scope. For most of the lifetime of the Linux kernel maintenance (1991–2002), changes to the software were passed around as patches and archived files. In 2002, the Linux kernel project began using a proprietary DVCS called BitKeeper.

In 2005, the relationship between the community that developed the Linux kernel and the commercial company that developed BitKeeper broke down, and the tool’s free-of-charge status was revoked. This prompted the Linux development community (and in particular Linus Torvalds, the creator of Linux) to develop their own tool based on some of the lessons they learned while using BitKeeper. Some of the goals of the new system were as follows:
