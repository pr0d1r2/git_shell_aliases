function git_files_have_changes() {
  git diff $@ | wc -l | grep -q " 0" || return 0
}
