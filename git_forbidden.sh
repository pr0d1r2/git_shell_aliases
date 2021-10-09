function git_forbidden() {
  local git_forbidden_BRANCH
  for git_forbidden_BRANCH in $@
  do
    case $(git_current_branch) in
      $git_forbidden_BRANCH)
        echo "$0: $git_forbidden_BRANCH"
        return 1
        ;;
    esac
  done
}
