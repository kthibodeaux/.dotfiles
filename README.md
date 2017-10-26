# dotfiles

Made to work for Xubuntu with i3

Uses [GNU Stow](https://www.gnu.org/software/stow/) for management.

# setup

These instructions will turn an Xubuntu install into a configured i3 system

Manually install any proprietary drivers.

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git stow
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
sh stow_all
bash setup
```

# theme

Install gtk theme: https://github.com/nana-4/Flat-Plat#installation

Icons:
```bash
git clone https://github.com/GreenRaccoon23/archdroid-icon-theme.git ~/opt/archdroid && cd ~/opt/archdroid && chmod +x INSTALL && ./INSTALL
````

# postgres

see https://github.com/kthibodeaux/unsafe-postgres

# todo

* be able to compile qmk
* theme install should be automatic
* skype, slack, whatsapp (nativier?)
* universal ctags
* googletalk plugin
* gitflow?
* fzf/docker scripts to quickly switch database servers
