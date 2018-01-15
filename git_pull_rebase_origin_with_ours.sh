function git_pull_rebase_origin_with_ours() {
  echorun git pull --rebase -Xours origin "$@" || return $?
}
