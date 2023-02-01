function git_diff_in_branch() {
  git diff $(git merge-base origin/$(git_default_branch) HEAD) --diff-filter=AM || return $?
}
