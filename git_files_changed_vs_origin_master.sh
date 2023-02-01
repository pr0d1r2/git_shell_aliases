function git_files_changed_vs_origin_master() {
  git_current_branch | grep -q "^$(git_default_branch)$"
  if [ $? -eq 0 ]; then
    echo "You are currently in '$(git_default_branch)' branch!"
    return 8472
  fi
  git fetch || return $?
  git diff --name-status "origin/$(git_default_branch)" | grep -v "^D" | cut -f 2
  return $?
}
