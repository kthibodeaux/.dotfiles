# dotfiles

Made to work for Xubuntu with i3-gaps

Uses [GNU Stow](https://www.gnu.org/software/stow/) for management.

# setup

These instructions will turn an Xubuntu install into a configured i3 system

Manually install any proprietary drivers.

Before running the below commands make sure you can clone from GitHub by adding your SSH key to your profile.

```
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
Icons: `git clone https://github.com/GreenRaccoon23/archdroid-icon-theme.git ~/opt/archdroid && cd ~/opt/archdroid && chmod +x INSTALL && ./INSTALL`

# postgres

Modify the postgresql config file and set local connections to trust.

Assuming `/dev/sda4` is a blank ext4 partition, these steps will let you store your postgres data there (encrypted):

```
sudo cryptsetup luksFormat /dev/sda4
sudo cryptsetup open /dev/sda4 pgdata
sudo mkfs.ext4 /dev/mapper/pgdata
echo 'pgdata /dev/sda4' | sudo tee -a /etc/crypttab
echo '/dev/mapper/pgdata /var/lib/postgresql/9.5/main ext4 defaults 0 0' | sudo tee -a /etc/fstab
sudo mount /dev/mapper/pgdata
sudo rm -rf /var/lib/postgres/9.5/main/*
sudo chown -R postgres:postgres /var/lib/postgresql/9.5/main
sudo -u postgres initdb --locale en_US.UTF-8 -D '/var/lib/postgresql/9.5/main'
```

Performance can be significantly improved by modifying `/var/lib/postgres/data/postgresql.conf` and turning `fsync` and `synchronous_commit` both off.
