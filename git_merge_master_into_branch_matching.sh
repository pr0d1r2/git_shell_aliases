function git_merge_master_into_branch_matching() {
  local git_merge_master_into_branch_matching_BRANCH
  for git_merge_master_into_branch_matching_BRANCH in $@
  do
    git checkout $(git_default_branch) || return $?
    git pull || return $?
    git_checkout_matching $git_merge_master_into_branch_matching_BRANCH || $?
    git_merge " $(git_default_branch)" || return $?
    git push || return $?
    # to check changes / copy to trello card
    git log | less
  done
}
