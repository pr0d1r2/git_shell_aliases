# Fetch and pull all git repos in subdirectories
#
# Example usage:
#   git_pull_all_repos
# Or selectively:
#   git_pull_all_repos pr0d1r2
function git_pull_all_repos() {
  case $1 in
    "")
      find . -name ".git" | parallel dirname | parallel "cd {} && git fetch && git pull"
      ;;
    *)
      parallel "find {} -name '.git'" ::: "$@" | parallel dirname | parallel "cd {} && git fetch && git pull"
      ;;
  esac
}
