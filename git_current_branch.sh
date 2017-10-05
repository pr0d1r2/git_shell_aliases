function git_current_branch() {
  git status | grep '^On branch' | cut -f 3- -d ' '
}
