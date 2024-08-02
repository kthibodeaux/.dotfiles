# dotfiles

## setup

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

### linux

These instructions are for a fresh Endeavour i3 edition install.

```bash
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
bash setup
```

### macos

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH="/opt/homebrew/bin:$PATH"
brew install stow
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
sh stow_all
brew bundle
ruby-install <version>
```

## rspec

To run `rspec` with more or less cores, override `RSPEC_CORES` in `~/.zshenv.local`
