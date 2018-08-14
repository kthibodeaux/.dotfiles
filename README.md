# dotfiles

Debian stable with i3

Uses [GNU Stow](https://www.gnu.org/software/stow/) for management.

## config included for:

* ctags
* rubygems
* git
* gtk2
* gtk3
* i3
* less
* mailcap
* mbsync
* msmtp
* mutt
* neovim
* ranger
* readline
* redshift
* reek
* rofi
* rspec
* rtv
* tig
* tmate
* tmux
* urlview
* vim
* w3m
* x
* zsh

## setup

These instructions will turn a fresh Debian net install into a configured i3 system

Manually install any proprietary drivers.

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

```bash
# as su
apt install sudo git stow
usermod -aG sudo kthibodeaux
# as kthibodeaux
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
bash setup
```
