function gitlab_username() {
  case $GITLAB_USERNAME in
    "")
      whoami
      ;;
    *)
      echo $GITLAB_USERNAME
      ;;
  esac
}
