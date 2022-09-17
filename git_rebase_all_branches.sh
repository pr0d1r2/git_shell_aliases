function git_rebase_all_branches() {
  git_pull_rebase_origin_master_all_and_force_push_with_lease $(git br | cut -b3- | grep -v "^master$")
}
