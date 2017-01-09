# dotfiles

Made to work for Antergos with i3-gaps

Uses [GNU Stow](https://www.gnu.org/software/stow/) for management.

# setup

These instructions will turn an Antergor MATE install into a configured i3 system

`sudo pacman -S stow`

`# get and stow dotfiles`

`yaourt -S i3-gaps`

`sudo pacman -S i3lock i3status tmux zsh neovim python3 the_silver_searcher termite feh redshift scrot htop blueman pavucontrol redis ruby tree pgadmin3`

`yaourt -S thunderbird skype google-talkplugin yakyak-git slack-desktop rofi`

`yaourt -S teensy-loader-cli dfu-programmer avr-gcc`

`yaourt -S ttf-meslo polybar compton flatplat-theme archdroid-icon-theme`

`wget https://bootstrap.pypa.io/get-pip.py`

`sudo python get-pip.py`

`rm get-pip.py`

`sudo pip3 install neovim`

`sh ~/.dotfiles/setup/fzf`

`sh ~/.dotfiles/setup/rvm`
