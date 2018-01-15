function git_pull_rebase_origin_master() {
  echorun git pull --rebase origin master || return $?
}
