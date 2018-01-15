function git_pull_rebase_origin() {
  echorun overcommit_disable git pull --rebase origin "$@" || return $?
}
