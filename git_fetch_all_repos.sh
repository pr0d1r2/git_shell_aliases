# Fetch all git repos in subdirectories
#
# Example usage:
#   git_fetch_all_repos
# Or selectively:
#   git_fetch_all_repos pr0d1r2
function git_fetch_all_repos() {
  case $1 in
    "")
      find . -name ".git" | parallel dirname | parallel "cd {} && git fetch"
      ;;
    *)
      parallel "find {} -name '.git'" ::: "$@" | parallel dirname | parallel "cd {} && git fetch"
      ;;
  esac
}
