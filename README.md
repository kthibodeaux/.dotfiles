# dotfiles

Built to run on top of [Fedora Sway Atomic](https://fedoraproject.org/atomic-desktops/sway/) (rpm-ostree, image-based, Sway as the desktop). The `config` packages below are not tied to that image specifically, but the `host` bootstrap scripts assume it.

## setup

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

```bash
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
```

### host (Fedora Atomic)

`host/` holds one-off bootstrap scripts specific to a Fedora Sway Atomic install.

### distrobox

`distrobox/` has scripts for creating a development container and a general utils container.

### config

`./stow_all` symlinks the packages it lists into `$HOME` with [GNU Stow](https://www.gnu.org/software/stow/).

```bash
./stow_all
```
