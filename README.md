# dotfiles

Built to run on top of [Fedora Kinoite](https://fedoraproject.org/atomic-desktops/kinoite/) (rpm-ostree, image-based, KDE Plasma as the desktop). The `config` packages below are not tied to that image specifically, but the `host` and `kde` scripts assume it.

## setup

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

```bash
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
```

### host (Fedora Atomic)

`host/` holds one-off bootstrap scripts specific to a Fedora Kinoite install.

### kde

`kde/setup.sh` configures Plasma: krohnkite tiling, global shortcuts, focus follows mouse, region screenshots and the panel. Run it from inside a Plasma session, then log out and back in.

```bash
sh kde/setup.sh
```

### distrobox

`distrobox/` has scripts for creating a development container and a general utils container.

### config

`./stow_all` symlinks the packages it lists into `$HOME` with [GNU Stow](https://www.gnu.org/software/stow/).

```bash
./stow_all
```
