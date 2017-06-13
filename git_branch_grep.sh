function git_branch_grep() {
  todo WIP
  git fetch &>/dev/null || git fetch || return $?
  local git_branch_grep_COMMAND='SHA=`git rev-parse {}` && git diff $SHA $(git merge-base origin/master $SHA) | grep "^+"'
  git_branch_grep_COMMAND+=" | grep "$@" ; exit 0"
  git branch -r | cut -b10- | \
    parallel \
      --halt-on-error now,fail=1 \
      $git_branch_grep_COMMAND
}
