if [ -d "$HOME/.startpage" ]; then
  ruby -run -e httpd $HOME/.startpage -p 8081
fi
