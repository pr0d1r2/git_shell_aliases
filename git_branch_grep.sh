function git_branch_grep() {
  todo WIP
  git branch -r | cut -b3- | \
    parallel \
      --halt-on-error now,fail=1 \
      "SHA=\`git rev-parse {}\` && git diff \$SHA \$(git merge-base origin/master \$SHA) | grep '^+'"
}
