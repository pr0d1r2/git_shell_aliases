function git_squash_branch() {
  git_forbidden "$(git_default_branch)" || return $?
  git_clean || return $?
  git rebase -i "HEAD~$(git_number_of_commits_in_branch)" || return $?
}
