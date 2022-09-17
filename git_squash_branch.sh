function git_squash_branch() {
  git_forbidden master || return $?
  git_clean || return $?
  git rebase -i "HEAD~$(git_number_of_commits_in_branch)" || return $?
}