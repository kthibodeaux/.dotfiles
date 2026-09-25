# vi: set ft=sh :

# catppuccin theming for the kicad flatpak on the sway host (see
# host/gtk-theme.sh) - not needed on desktops that theme kicad themselves.

# kicad (wxwidgets) derives panel colours from a bare button style context.
# catppuccin gives buttons a translucent white tint, which wx reads as opaque
# near-white - leaving light-grey panels. patch just that probe in kicad's
# sandboxed gtk.css (real buttons are never direct children of the toplevel).
mkdir -p ~/.var/app/org.kicad.KiCad/config/gtk-3.0
cat > ~/.var/app/org.kicad.KiCad/config/gtk-3.0/gtk.css <<'EOF'
window.background > button {
  background-color: #1e1e2e;
  background-image: none;
}
EOF

# catppuccin colour theme for kicad's canvases - pick "Catppuccin Mocha" under
# Preferences > Colors in each editor (schematic/symbol/pcb/footprint)
kicad_colors=~/.var/app/org.kicad.KiCad/config/kicad/10.0/colors
mkdir -p "$kicad_colors"
curl -fLo "$kicad_colors/catppuccin-mocha.json" https://raw.githubusercontent.com/catppuccin/kicad/main/colors/catppuccin-mocha.json
