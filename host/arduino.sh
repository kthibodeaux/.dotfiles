# vi: set ft=sh :

# needed for serial access to Arduino/ESP boards (esptool, arduino-cli
# upload/monitor). the distrobox `dev` container is created with
# `--group-add keep-groups`, which passes this membership through as-is
# without user-namespace remapping - but only if the host user already has
# it, so it has to be set up here rather than inside the container.
#
# on Fedora Atomic, "optional" system groups like dialout are defined in
# /usr/lib/group (systemd-sysusers, part of the read-only image) rather than
# /etc/group. getent/ls resolve the name fine since glibc merges both, but
# usermod -aG only understands /etc/group, so plain `usermod -aG dialout`
# silently does nothing until the group is copied in there first.
# see: https://discussion.fedoraproject.org/t/add-groups-to-get-access-to-ttys-and-loopback-devices/155084

if grep -q '^dialout:' /etc/group; then
  echo "skipping copy dialout group definition: already in /etc/group"
else
  grep -E '^dialout:' /usr/lib/group | sudo tee -a /etc/group > /dev/null
fi

if groups "$USER" | grep -qw dialout; then
  echo "skipping dialout group membership: already a member"
else
  sudo usermod -aG dialout "$USER"
  echo "added to dialout group, log out and back in before continuing"
  exit 1
fi
