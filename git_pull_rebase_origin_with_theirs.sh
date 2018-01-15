function git_pull_rebase_origin_with_theirs() {
  echorun overcommit_disable git pull --rebase -Xtheirs origin "$@" || return $?
}
