#!/bin/bash
external=$(hyprctl monitors -j | jq '[.[] | select(.name != "eDP-1")] | length')

if [ "$external" -gt 0 ]; then
    # Move all workspaces off eDP-1 before disabling it
    external_name=$(hyprctl monitors -j | jq -r '[.[] | select(.name != "eDP-1")][0].name')
    hyprctl monitors -j | jq -r '.[] | select(.name == "eDP-1") | .activeWorkspace.id' | \
        xargs -I{} hyprctl dispatch moveworkspacetomonitor {} "$external_name"
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl dispatch focusmonitor "$external_name"
else
    hyprctl keyword monitor "eDP-1,preferred,auto,auto"
fi

systemctl --user restart waybar
