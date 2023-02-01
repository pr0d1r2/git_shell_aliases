function git_default_branch() {
  if [ -d .git ]; then
    echo "Not in git directory!"
    return 1
  fi
  if [ -f .git/refs/heads/main ]; then
    echo main
  else
    echo master
  fi
}
