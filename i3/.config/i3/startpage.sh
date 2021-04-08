if [ -d "$HOME/.startpage" ]; then
  ruby -run -e httpd $HOME/.startpage/dist -p 8081
fi
