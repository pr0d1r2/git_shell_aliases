function change_git_files_changed_in_branch() {
  local change_git_files_changed_in_branch_FILE
  for change_git_files_changed_in_branch_FILE in `git_files_changed_in_branch`
  do
    echo '# TODO: remove me' >> $change_git_files_changed_in_branch_FILE || return $?
  done
}
