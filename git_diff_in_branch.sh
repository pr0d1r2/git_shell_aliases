function git_diff_in_branch() {
  git diff $(git merge-base origin/master HEAD) --diff-filter=AM || return $?
}
