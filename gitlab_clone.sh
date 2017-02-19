function gitlab_clone() {
  local gitlab_clone_PARAM
  for gitlab_clone_PARAM in $@
  do
    case $gitlab_clone_PARAM in
      */*)
        local gitlab_clone_USER=`echo $gitlab_clone_PARAM | cut -f 1 -d /`
        local gitlab_clone_REPO=`echo $gitlab_clone_PARAM | cut -f 2 -d /`
        echorun git clone \
          git@gitlab.com:$gitlab_clone_USER/$gitlab_clone_REPO.git \
          $HOME/projects/$gitlab_clone_USER-$gitlab_clone_REPO/
        echorun cd $HOME/projects/$gitlab_clone_USER-$gitlab_clone_REPO/ || return $?
        ;;
      *)
        gitlab_clone_USER=`gitlab_username`
        echorun git clone \
          git@gitlab.com:$gitlab_clone_USER/$gitlab_clone_PARAM.git \
          $HOME/projects/$gitlab_clone_PARAM/
        echorun cd $HOME/projects/$gitlab_clone_PARAM/ || return $?
        ;;
    esac
  done
}
