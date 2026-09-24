# vi: set ft=sh :

flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y --user flathub org.freecad.FreeCAD
flatpak install -y --user flathub org.kicad.KiCad
flatpak install -y --user flathub com.discordapp.Discord
flatpak install -y --user flathub com.slack.Slack
flatpak install -y --user flathub org.signal.Signal
flatpak install -y --user flathub org.libreoffice.LibreOffice

# let sandboxed apps load the gtk/icon/cursor themes installed in $HOME
# (see host/gtk-theme.sh)
flatpak override --user --filesystem=xdg-data/themes:ro --filesystem=xdg-data/icons:ro

# kicad's canvas/widgets look bad with a dark gtk theme - keep it light
flatpak override --user --env=GTK_THEME=Adwaita:light org.kicad.KiCad
