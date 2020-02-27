# dotfiles

## setup

These instructions are for a fresh Manjaro i3 edition install.

This will not install any proprietary drivers.

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

```bash
git clone git@github.com:kthibodeaux/.dotfiles.git
cd .dotfiles
bash setup
```

To run `rspec` with more cores, override `RSPEC_CORES` in `~/.zshenv.local`

## crontab
```
*/5 * * * * killall mbsync &>/dev/null; /usr/bin/mbsync -a -V 2>&1 > ~/.mbsync_log
```

## vim
Install coc extensions (need to automate this)

```
:CocInstall coc-css coc-eslint coc-html coc-json coc-snippets coc-solargraph coc-tsserver coc-vetur coc-yaml
```
