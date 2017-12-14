function git_clean() {
  if [ $(git_files_changed | wc -l | tr -cd "[0-9]") -gt 0 ]; then
    echo "Git repo not clean (have pending changes) !!!"
    return 101
  fi
}
