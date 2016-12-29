function git_pull_rebase_origin_master() {
  git_pull_rebase_origin master || return $?
}
