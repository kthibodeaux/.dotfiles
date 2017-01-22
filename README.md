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

# postgres

Assuming `/dev/sda4` is a blank ext4 partition, these steps will let you store your postgres data there (encrypted):

```
sudo cryptsetup luksFormat /dev/sda4
sudo cryptsetup open /dev/sda4 pgdata
sudo mkfs.ext4 /dev/mapper/pgdata
echo 'pgdata /dev/sda4 | sudo tee -a /etc/crypttab'
echo '/dev/mapper/pgdata /var/lib/postgres/data ext4 defaults 0 0' | sudo tee -a /etc/fstab
sudo mount /dev/mapper/pgdata
sudo rm -rf /var/lib/postgres/data/*
sudo chown -R postgres:postgres /var/lib/postgres/data
sudo -u postgres initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'
```

Performance can be significantly improved by modifying `/var/lib/postgres/data/postgresql.conf` and turning `fsync` and `synchronous_commit` both off.

# fix crappy audio

See: https://lampjs.wordpress.com/2015/10/13/enhance-audio-with-equalizer-on-arch-linux/

# imac / macbook temp

`yaourt -S mbpfan-git && sudo systemctl enable mbpfan.service && sudo systemctl start mbpfan.service`

Source: https://loicpefferkorn.net/2015/01/arch-linux-on-macbook-pro-retina-2014-with-dm-crypt-lvm-and-suspend-to-disk/#fan-control
