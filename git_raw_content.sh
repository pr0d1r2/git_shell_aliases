# Show raw content of files in the git changeset
#
# Example usage:
#   git_raw_content
function git_raw_content() {
  git status -sb | grep -v "master...origin/master" | cut -b4- | parallel cat
}
