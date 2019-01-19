# Show specific git origin
#
# Example usage:
#   git_origin fetch
function git_origin() {
  git remote -v | grep "^origin\s" | grep "\($1\)" | cut -f 2 | cut -f 1 -d ' '
  return $?
}
