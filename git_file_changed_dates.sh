# Returns dates when git file was changed
#
# Example usage:
#   git_file_changed_dates spec/my_spec.rb
# Returns:
#   2019-06-04
#   2019-06-07
#   2019-09-09
#   2019-09-13
#   2019-11-28
#   2020-01-27
#   2020-03-23
#   2020-03-26
#   2020-04-08
#   2020-05-11
#   2020-06-04
#   2020-06-08
function git_file_changed_dates() {
  git blame $1 | \
    cut -f 1  -d ' ' | \
    sort -u | \
    grep -v "^000000000000$" | \
    parallel "git s {} | head -n 3 | tail -n 1" | \
    cut -b9- | \
    parallel "ruby -e 'require \"date\" ; puts Date.parse(\"{=uq()=}\").to_s'" | \
    sort -u
  return $?
}
