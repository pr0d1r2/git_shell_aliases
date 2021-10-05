function git_files_removed_in_branch() {
  git diff --name-only $(git merge-base origin/master HEAD) --diff-filter=D
}
