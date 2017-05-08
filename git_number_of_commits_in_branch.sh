function git_number_of_commits_in_branch() {
  git rev-list master..`git rev-parse $1` --count || return $?
}
