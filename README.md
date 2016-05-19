	A little write up on how to work in here
======

Ok, so how do we work here?
------

### 1. Notice an issue? ###
  - [Create an issue in the issue tracker.](https://www.bitbucket.org/OrderFast/fast-order/issues)
  - Ok, when changing really really small stuff, no need to go through that process,
  but most of the time you should. When changing read me, you can change it directly in this branch.


### 2. Create a branch with the name of the problem. ###
  - Example: `git checkout -b menu-rendering-bug` or `git checkout -b my-new-feature`
  - [Branches are here](https://www.bitbucket.org/OrderFast/fast-order/branches/)


### 3. When you finish implementing the feature/fixing the bug create pull request. ###
  1. Pull and rebase master branch.
  (We should change this to development and leave the master to be stable.)
      1. `git checkout master`
      2. `git pull`
      3. `git checkout my-new-feature-branch`
      4. `git rebase master`
      5. Go through rebase
      6. [More tips on `git rebase` here](http://gsamokovarov.com/git-tips/#/)
  2. [Create a pull request](https://www.bitbucket.org/OrderFast/fast-order/pull-requests/)

### 4. Review pull request. ###
  1. We should do this together, we can learn from each other/see the thought process.
  2. Look for code smells.
  3. What can be improved?
  4. Update accordingly.
  5. Go back to step 2 if something should be changed again.

### 5. Merge pull request and close branch. ###
  * When closing, add link to the issue it solves.

### 6. Close issue. ###
  * Add link to branch that resolves it.
         
         
         