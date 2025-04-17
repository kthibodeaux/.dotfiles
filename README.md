# dotfiles

## setup

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

### endeavour

These instructions are for a fresh Endeavour i3 edition install.

```bash
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
bash setup
```

## rspec

To run `rspec` with more or less cores, override `RSPEC_CORES` in `~/.zshenv.local`
