function git_pull_rebase_origin() {
  git pull --rebase origin $@ || return $?
}

