function github_clone() {
  local github_clone_PARAM
  for github_clone_PARAM in $@
  do
    case $github_clone_PARAM in
      */*)
        local github_clone_USER=`echo $github_clone_PARAM | cut -f 1 -d /`
        local github_clone_REPO=`echo $github_clone_PARAM | cut -f 2 -d /`
        if [ ! -d $HOME/projects/$github_clone_USER-$github_clone_REPO/ ]; then
          echorun git clone \
            git@github.com:$github_clone_USER/$github_clone_REPO.git \
            $HOME/projects/$github_clone_USER-$github_clone_REPO/
        fi
        echorun cd $HOME/projects/$github_clone_USER-$github_clone_REPO/ || return $?
        echorun git pull --rebase
        ;;
      *)
        github_clone_USER=`github_username`
        if [ ! -d $HOME/projects/$github_clone_PARAM/ ]; then
          echorun git clone \
            git@github.com:$github_clone_USER/$github_clone_PARAM.git \
            $HOME/projects/$github_clone_PARAM/
        fi
        echorun cd $HOME/projects/$github_clone_PARAM/ || return $?
        echorun git pull --rebase
        ;;
    esac
  done
  return 0
}
