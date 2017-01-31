function git_clean() {
  local git_clean_STATUS=`echo $(git_files_changed | wc -l)`
  if [ $git_clean_STATUS -gt 0 ]; then
    echo "Git repo not clean (have pending changes) !!!"
    return 8472
  fi
}
