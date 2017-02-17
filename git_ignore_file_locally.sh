function git_ignore_file_locally() {
  if [ ! -d .git ]; then
    echo "git_ignore_file_locally: not in a git repo !!!"
    return 1001
  fi
  local git_ignore_file_locally_FILE
  for git_ignore_file_locally_FILE in $@
  do
    cat .git/info/exclude | grep -q "^$git_ignore_file_locally_FILE$"
    if [ $? -gt 0 ]; then
      echo "$git_ignore_file_locally_FILE" >> .git/info/exclude
    fi
  done
}
