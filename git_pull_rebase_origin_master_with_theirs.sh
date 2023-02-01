function git_pull_rebase_origin_master_with_theirs() {
  echorun overcommit_disable git pull --rebase -Xtheirs origin $(git_default_branch) || return $?
}
