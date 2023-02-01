# Show raw content of files in the git changeset
#
# Example usage:
#   git_raw_content
function git_raw_content() {
  git status -sb | grep -v "$(git_default_branch)...origin/$(git_default_branch)" | cut -b4- | parallel cat
}
