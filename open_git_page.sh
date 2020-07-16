# Open git page of the current repo both on GitHub and GitLab
#
# Example usage:
#   open_git_page
function open_git_page() {
  echorun test -d .git || return $?
  open "$(git remote -v | grep origin | grep fetch | cut -f 2 -d @ | cut -f 1 -d '(' | sed -e 's/\.git $//' -e 's|github.com:|https://github.com/|' -e 's|gitlab.com:|https://gitlab.com/|')"
  return $?
}
