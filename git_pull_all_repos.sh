# Fetch and pull all git repos in subdirectories
#
# Example usage:
#   git_pull_all_repos
# Or selectively:
#   git_pull_all_repos pr0d1r2
function git_pull_all_repos() {
  case $1 in
    "")
      find . -name ".git" | parallel dirname | \
        parallel -j "$GIT_THREADS" "cd {} && git fetch && git pull ; sleep $GIT_SLEEP"
      ;;
    *)
      parallel "find {} -name '.git'" ::: "$@" | parallel dirname | \
        parallel -j "$GIT_THREADS" "cd {} && git fetch && git pull ; sleep $GIT_SLEEP"
      ;;
  esac
}
