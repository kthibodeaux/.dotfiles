apt_install() {
  if dpkg -s $1 > /dev/null; then
    echo "skipping $1: already installed"
  else
    sudo apt -y install $1
  fi
}

add_apt_source() {
  if [ -f $1 ]; then
    echo "skipping $1: already exists"
  else
    echo $2 | sudo tee -a $1
  fi
}


sudo apt-get update

apt_install "apt-transport-https"
apt_install "autotools-dev"
apt_install "automake"
apt_install "avr-libc"
apt_install "avrdude"
apt_install "awscli"
apt_install "build-essential"
apt_install "ca-certificates"
apt_install "cifs-utils"
apt_install "cmake"
apt_install "curl"
apt_install "dfu-programmer"
apt_install "ecryptfs-utils"
apt_install "exuberant-ctags"
apt_install "feh"
apt_install "gettext"
apt_install "git-flow"
apt_install "glances"
apt_install "gnupg2"
apt_install "htop"
apt_install "i3"
apt_install "i3blocks"
apt_install "isync"
apt_install "kazam"
apt_install "libappindicator1"
apt_install "libevent-dev"
apt_install "libncurses5-dev"
apt_install "libpq-dev"
apt_install "libssl-dev"
apt_install "libtool-bin"
apt_install "mpv"
apt_install "msmtp"
apt_install "mutt"
apt_install "pandoc"
apt_install "pavucontrol"
apt_install "pgcli"
apt_install "pkg-config"
apt_install "python-pip"
apt_install "python3-pip"
apt_install "ranger"
apt_install "redshift-gtk"
apt_install "rofi"
apt_install "rofi"
apt_install "scrot"
apt_install "sddm"
apt_install "silversearcher-ag"
apt_install "software-properties-common"
apt_install "sshfs"
apt_install "suckless-tools"
apt_install "thunar"
apt_install "tig"
apt_install "tree"
apt_install "urlview"
apt_install "vlc"
apt_install "weechat"
apt_install "x11-xserver-utils"
apt_install "xclip"
apt_install "zsh"

add_apt_source "/etc/apt/sources.list.d/enpass.list" "deb http://repo.sinew.in/ stable main"
curl -fsSL https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
sudo apt-get update
apt_install "enpass"

add_apt_source "/etc/apt/sources.list.d/docker.list" "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-get update
apt_install "docker-ce"
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# todo: nvim
