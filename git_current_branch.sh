function git_current_branch() {
  git status | egrep '^(On branch|Na gałęzi)' | cut -f 3- -d ' '
}
