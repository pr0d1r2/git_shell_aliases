function github_clone() {
  local github_clone_PARAM
  for github_clone_PARAM in $@
  do
    case $github_clone_PARAM in
      */*)
        local github_clone_USER=`echo $github_clone_PARAM | cut -f 1 -d /`
        local github_clone_REPO=`echo $github_clone_PARAM | cut -f 2 -d /`
        echorun git clone \
          git@github.com:$github_clone_USER/$github_clone_REPO.git \
          $HOME/projects/$github_clone_USER-$github_clone_REPO/
        ;;
      *)
        github_clone_USER=`github_username`
        echorun git clone \
          git@github.com:$github_clone_USER/$github_clone_PARAM.git \
          $HOME/projects/$github_clone_PARAM/
        ;;
    esac
  done
}
