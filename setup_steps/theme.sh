mkdir $HOME/.local/share/themes

cd $HOME/src/
git clone git@github.com:vinceliuice/Fluent-gtk-theme.git fluent
cd fluent
./install.sh -t grey -c dark -i arch -d $HOME/.local/share/themes --tweaks solid

cd $HOME/src
git clone git@github.com:vinceliuice/Fluent-icon-theme.git fluent-icons
cd fluent-icons
./install.sh -n green

gsettings set org.gnome.desktop.interface icon-theme 'grey-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'breeze_cursors'
