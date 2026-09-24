# vi: set ft=sh :

flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y --user flathub org.freecad.FreeCAD
flatpak install -y --user flathub org.kicad.KiCad
flatpak install -y --user flathub com.discordapp.Discord
flatpak install -y --user flathub com.slack.Slack
flatpak install -y --user flathub org.signal.Signal
flatpak install -y --user flathub org.libreoffice.LibreOffice
