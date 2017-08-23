function git_go_to_master() {
  case $(git_current_branch) in
    master)
      ;;
    *)
      git_clean || return $?
      OVERCOMMIT_DISABLE=1 git checkout master || return $?
      ;;
  esac
  OVERCOMMIT_DISABLE=1 git pull || return $?
}
