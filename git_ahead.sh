# Allows to check how much your local branch is ahead the remote
#
# It shows the 38 from "TR-10683-benefits-module...origin/TR-10683-benefits-module [ahead 38, behind 70]"
function git_ahead() {
  git rev-list "HEAD...$(git merge-base origin/$(git_default_branch) HEAD)" --count
}
