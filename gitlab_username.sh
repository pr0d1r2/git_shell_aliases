function gitlab_username() {
  case $gitlab_USERNAME in
    "")
      whoami
      ;;
    *)
      echo $gitlab_USERNAME
      ;;
  esac
}
