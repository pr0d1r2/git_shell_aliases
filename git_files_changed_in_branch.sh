function git_files_changed_in_branch() {
  git diff --name-only $(git merge-base origin/master HEAD) --diff-filter=AM
}
