function git_upstream() {
  local git_upstream_BRANCH
  git_upstream_BRANCH=$(git_current_branch)
  git branch \
    --set-upstream-to="origin/$git_upstream_BRANCH" \
    "$git_upstream_BRANCH"
  return $?
}
