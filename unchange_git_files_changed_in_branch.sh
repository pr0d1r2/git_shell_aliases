function unchange_git_files_changed_in_branch() {
  local unchange_git_files_changed_in_branch_FILE
  for unchange_git_files_changed_in_branch_FILE in `git_files_changed_in_branch`
  do
    cat $unchange_git_files_changed_in_branch_FILE | \
      grep -v "^# TODO: remove me$" > $unchange_git_files_changed_in_branch_FILE.tmp || return $?
    mv $unchange_git_files_changed_in_branch_FILE.tmp $unchange_git_files_changed_in_branch_FILE || return $?
  done
}
