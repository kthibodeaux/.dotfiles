# dotfiles

## setup

These instructions are for a fresh Endeavour i3 edition install.

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
