# dotfiles

## setup

These instructions are for a fresh Endeavour i3 edition install.

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

```bash
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
bash setup
```

## keyboard

For international character support, add `Option "XkbVariant" "intl"` to the options in `/etc/X11/xorg.conf.d/00-keybord.conf`

## rspec

To run `rspec` with more or less cores, override `RSPEC_CORES` in `~/.zshenv.local`
