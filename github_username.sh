function github_username() {
  case $GITHUB_USERNAME in
    "")
      whoami
      ;;
    *)
      echo $GITHUB_USERNAME
      ;;
  esac
}
