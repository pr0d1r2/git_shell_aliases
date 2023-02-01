function git_pull_rebase_origin_master() {
  echorun overcommit_disable git pull --rebase origin $(git_default_branch) || return $?
}
