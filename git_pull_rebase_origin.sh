function git_pull_rebase_origin() {
  echorun git pull --rebase origin "$@" || return $?
}
