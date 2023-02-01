function git_pull_master() {
  local git_pull_master_NOT_CLEAN
  if ! git_clean; then
    git_pull_master_NOT_CLEAN=1
    overcommit_disable git stash || return $?
  else
    git_pull_master_NOT_CLEAN=0
  fi
  local git_pull_master_BRANCH
  git_pull_master_BRANCH="$(git_current_branch)"
  case "$git_pull_master_BRANCH" in
    "$(git_default_branch)");;
    *)
      overcommit_disable git checkout $(git_default_branch) || return $?
      ;;
  esac
  overcommit_disable git pull || return $?
  # shellcheck disable=SC2048
  $* || return $?
  case "$git_pull_master_BRANCH" in
    "" | "$(git_default_branch)");;
    *)
      overcommit_disable git checkout "$git_pull_master_BRANCH" || return $?
      ;;
  esac
  if [ $git_pull_master_NOT_CLEAN -eq 1 ]; then
    overcommit_disable git stash pop || return $?
  fi
}
