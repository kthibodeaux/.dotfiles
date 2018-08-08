add_apt_source() {
  if [ -f $1 ]; then
    echo "skipping $1: already exists"
  else
    echo $2 | sudo tee -a $1
  fi
}

sudo apt-get update
sudo apt-get install apt-transport-https curl

add_apt_source "/etc/apt/sources.list.d/enpass.list" "deb http://repo.sinew.in/ stable main"
curl -fsSL https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
add_apt_source "/etc/apt/sources.list.d/docker.list" "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo apt-get update

sudo apt-get install \
  automake \
  autotools-dev \
  avr-libc \
  avrdude \
  awscli \
  build-essential \
  ca-certificates \
  cifs-utils \
  cmake \
  dfu-programmer \
  docker-ce \
  ecryptfs-utils \
  enpass \
  evince \
  exuberant-ctags \
  feh \
  fonts-hack-otf \
  fonts-hack-ttf \
  fonts-hack-web \
  gettext \
  git-flow \
  glances \
  gnupg2 \
  gtk2-engines-murrine \
  gtk2-engines-pixbuf \
  htop \
  i3 \
  i3blocks \
  isync \
  kazam \
  libappindicator1 \
  libevent-dev \
  libncurses5-dev \
  libpq-dev \
  libssl-dev \
  libtool-bin \
  mpv \
  msmtp \
  mutt \
  pandoc \
  pavucontrol \
  pgcli \
  pkg-config \
  python-pip \
  python3-pip \
  ranger \
  redshift-gtk \
  rofi \
  rofi \
  scrot \
  sddm \
  silversearcher-ag \
  software-properties-common \
  sshfs \
  suckless-tools \
  thunar \
  tig \
  tree \
  urlview \
  vlc \
  weechat \
  x11-xserver-utils \
  xclip \
  zsh
