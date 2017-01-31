function git_submodule_pull() {
  echorun git submodule update --recursive --remote $@ || return $?
}
