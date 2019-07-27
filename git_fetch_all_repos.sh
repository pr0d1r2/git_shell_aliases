# Fetch all git repos in subdirectories
#
# Example usage:
#   git_fetch_all_repos
# Or selectively:
#   git_fetch_all_repos pr0d1r2
function git_fetch_all_repos() {
  case $1 in
    "")
      find . -name ".git" | parallel dirname | parallel -j "$GIT_THREADS" "cd {} && git fetch"
      ;;
    *)
      parallel "find {} -name '.git'" ::: "$@" | parallel dirname | parallel -j "$GIT_THREADS" "cd {} && git fetch"
      ;;
  esac
}
