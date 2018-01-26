# Mark current SHA as bad, set good and run git bisect with command
#
# Example usage:
#   git_bisect_bad d8472ae bin/test
function git_bisect_bad() {
  echorun silently git bisect reset || return $?
  echorun silently git bisect start || return $?
  echorun silently git bisect bad || return $?
  echorun silently git bisect good "$1" || return $?
  echorun silently git bisect run "$2" || return $?
}
