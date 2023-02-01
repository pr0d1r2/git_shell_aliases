function git_go_to_master() {
  case $(git_current_branch) in
    "$(git_default_branch)")
      ;;
    *)
      git_clean || return $?
      OVERCOMMIT_DISABLE=1 git checkout $(git_default_branch) || return $?
      ;;
  esac
  OVERCOMMIT_DISABLE=1 git pull || return $?
}
