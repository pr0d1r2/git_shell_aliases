function git_branch_grep() {
  git fetch &>/dev/null || git fetch || return $?
  local git_branch_grep_BASE_COMMAND
  git_branch_grep_BASE_COMMAND='SHA=`git rev-parse {}`'
  git_branch_grep_BASE_COMMAND+=" && git diff \$SHA $(git merge-base origin/$(git_default_branch) \$SHA)"
  git_branch_grep_BASE_COMMAND+=' | grep "^+"'
  local git_branch_grep_SEPARATOR_COMMAND
  git_branch_grep_SEPARATOR_COMMAND='echo "=========================================="'
  local git_branch_grep_COMMAND
  git_branch_grep_COMMAND="$git_branch_grep_BASE_COMMAND | grep -q '$@';"
  git_branch_grep_COMMAND+='if [ $? -eq 0 ]; then'
  git_branch_grep_COMMAND+="  $git_branch_grep_SEPARATOR_COMMAND;"
  git_branch_grep_COMMAND+='  echo "{}";'
  git_branch_grep_COMMAND+="  $git_branch_grep_SEPARATOR_COMMAND;"
  git_branch_grep_COMMAND+="  $git_branch_grep_BASE_COMMAND | grep '$@'"
  git_branch_grep_COMMAND+='  | cut -b1-256;'
  git_branch_grep_COMMAND+='  exit 0;'
  git_branch_grep_COMMAND+='else'
  git_branch_grep_COMMAND+='  exit 0;'
  git_branch_grep_COMMAND+='fi'
  git branch -r | cut -b3- | grep -v "^origin/HEAD -> origin/$(git_default_branch)$" | \
    parallel \
      --halt-on-error now,fail=1 \
      $git_branch_grep_COMMAND
}
