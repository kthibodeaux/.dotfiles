# vi: set ft=sh :

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub org.freecad.FreeCAD
flatpak install -y flathub org.kicad.KiCad
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.slack.Slack
flatpak install -y flathub org.signal.Signal
flatpak install -y flathub org.libreoffice.LibreOffice
