# Make rebase vs master for all branches and force push them with lease
#
# Example usage:
#   git_pull_rebase_origin_master_all_and_force_push_with_lease branch-1 branch-2 branch-3
function git_pull_rebase_origin_master_all_and_force_push_with_lease() {
  local git_pull_rebase_origin_master_all_and_force_push_with_lease_BRANCH
  for git_pull_rebase_origin_master_all_and_force_push_with_lease_BRANCH in $@
  do
    git checkout "$git_pull_rebase_origin_master_all_and_force_push_with_lease_BRANCH"
    if [ $? -eq 0 ]; then
      git_pull_rebase_origin_master
      if [ $? -eq 0 ]; then
        git push --force-with-lease
      else
        git_rebase_undo
      fi
    fi
  done
}
