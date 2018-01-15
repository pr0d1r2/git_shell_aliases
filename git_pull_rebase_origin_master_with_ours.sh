function git_pull_rebase_origin_master_with_ours() {
  echorun git pull --rebase -Xours origin master || return $?
}
