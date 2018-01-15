function git_pull_rebase_origin_with_theirs() {
  echorun git pull --rebase -Xtheirs origin "$@" || return $?
}
