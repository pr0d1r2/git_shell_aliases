function git_pull_rebase_origin_master_with_theirs() {
  echorun git pull --rebase -Xtheirs origin master || return $?
}
