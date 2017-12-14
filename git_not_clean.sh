function git_not_clean() {
  if [ $(git_files_changed | wc -l | tr -cd "[0-9]") -eq 0 ]; then
    echo "Git repo clean (have no changes) !!!"
    return 101
  fi
}
