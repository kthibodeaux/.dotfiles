# dotfiles

Editor is NeoVim

More attention needs to be given to fully convert to NeoVim configuration.  In the mean time:

For configuration to work, run this command: `mkdir -p ~/.config/nvim/ && echo 'source ~/.nvimrc' > ~/.config/nvim/init.vim`

1. Install [Homebrew](http://brew.sh)
2. `rake brews` to install common packages
3. `rake install` to symlink all files
4. `rake vundle` to install [Vundle](https://github.com/gmarik/Vundle.vim)
5. `rake fzf` to install [FZF](https://github.com/junegunn/fzf#using-git-recommended)
6. `vu` to install Vim plugins using Vundle
