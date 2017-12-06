# Adaptable GIt, work with git in bad conditions (no connection, interrupting connection).
# All operations are performed until_success.
#
# Example usage:
#   agi pull
function agi() {
  until_success git $* || return $?
}
