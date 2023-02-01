function git_files_removed_in_branch() {
  git diff --name-only $(git merge-base origin/$(git_default_branch) HEAD) --diff-filter=D
}
