confirm () {
    # call with a prompt string or use a default
    read "response?Are you sure? [y/N]"
    case $response in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}
