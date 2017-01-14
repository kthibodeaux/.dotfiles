# dotfiles

Made to work for Antergos with i3-gaps

Uses [GNU Stow](https://www.gnu.org/software/stow/) for management.

# setup

These instructions will turn an Antergos MATE install into a configured i3 system

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

```
sudo pacman -S stow vte3-ng
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
sh stow_all
bash setup
```

# fix crappy audio

See: https://lampjs.wordpress.com/2015/10/13/enhance-audio-with-equalizer-on-arch-linux/

Still need to find out how that can apply to bluetooth headphones.

# imac / macbook temp

`yaourt -S mbpfan-git && sudo systemctl enable mbpfan.service && sudo systemctl start mbpfan.service`

Source: https://loicpefferkorn.net/2015/01/arch-linux-on-macbook-pro-retina-2014-with-dm-crypt-lvm-and-suspend-to-disk/#fan-control

# i3bar system tray

The system tray outputs on the primary display.  It can be set with `xrandr --output <output> --primary`

# fonts

This setup depents on the following fonts

1. fontawesome-webfont.ttf
1. Meslo LG S Regular for Powerline.otf
1. MesloLGS-Regular.ttf
1. System San Francisco Display Bold.ttf
1. System San Francisco Display Regular.ttf
1. System San Francisco Display Thin.ttf
1. System San Francisco Display Ultralight.ttf
