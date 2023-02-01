function git_default_branch() {
  if [ ! -d .git ]; then
    echo "NOT_IN_A_GIT_DIRECTORY"
    return 1
  fi
  if [ -f .git/refs/heads/main ]; then
    echo main
  else
    echo master
  fi
}
