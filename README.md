# dotfiles

Built to run on top of [Fedora Sway Atomic](https://fedoraproject.org/atomic-desktops/sway/) (rpm-ostree, image-based, Sway as the desktop). The `config` packages below are not tied to that image specifically, but the `host` bootstrap scripts assume it.

## setup

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

```bash
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
```

### host (Fedora Atomic)

`host/` holds one-off bootstrap scripts specific to a Fedora Atomic (Silverblue/kinoite-style, rpm-ostree) install, since packages there can't just be `dnf install`ed. Run whichever of these apply to the machine:

```bash
bash host/homebrew.sh    # bootstrap homebrew (used for packages not layered via rpm-ostree)
bash host/distrobox.sh   # install distrobox
bash host/flatpak.sh     # add flathub and install flatpak apps
bash host/fonts.sh       # install Hack Nerd Font
bash host/gtk-theme.sh   # install catppuccin gtk theme
bash host/qemu.sh        # qemu/kvm via homebrew (requires host/homebrew.sh first)
bash host/colima.sh      # colima + lima
bash host/ssh.sh         # enable sshd
bash host/steam.sh       # steam via rpmfusion
```

### distrobox

`distrobox/` has scripts for creating dev containers (e.g. `dev.sh`, `dev-neovim.sh`, `dev-ruby.sh`, `dev-tmux.sh`) and a general `utils.sh` container.

### config

`./stow_all` symlinks the packages it lists (sway, waybar, foot, zsh, neovim, etc.) into `$HOME` with [GNU Stow](https://www.gnu.org/software/stow/). These configs are plain Linux/Wayland configs, not tied to any particular distro:

```bash
./stow_all
```
