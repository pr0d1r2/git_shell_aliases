function git_pull_rebase_origin_master_with_ours() {
  echorun overcommit_disable git pull --rebase -Xours origin $(git_default_branch) || return $?
}
