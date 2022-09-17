function repos_clean() {
  local repos_clean_GIT
  for repos_clean_GIT in $(find ~/projects -name .git -type d -depth 2)
  do
    echorun cd "$(dirname "$repos_clean_GIT")" || return $?
    git_clean || return $?
    git status -sb || return $?
  done
}
