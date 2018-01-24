function git_stash_pull_pop() {
  overcommit_disable git stash || return $?
  overcommit_disable git pull || return $?
  overcommit_disable git stash pop || return $?
}
