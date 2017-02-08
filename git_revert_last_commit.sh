function git_revert_last_commit() {
  echorun git reset --soft HEAD~1 || return $?
}
