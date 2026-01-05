#!/usr/bin/env zsh
set -euo pipefail

if [[ -z "${HASS_URL:-}" || -z "${HASS_TOKEN:-}" ]]; then
  exit 0
fi

ENTITY_ID="sensor.outdoor_temp_temperature"

json="$(curl -s \
  -H "Authorization: Bearer $HASS_TOKEN" \
  -H "Content-Type: application/json" \
  "$HASS_URL/api/states/$ENTITY_ID" \
  2>/dev/null || true)"

temp="$(printf '%s' "$json" | jq -r '.state // empty' | cut -d'.' -f1 2>/dev/null || true)"

if [[ -z "$temp" || "$temp" == "unknown" || "$temp" == "unavailable" ]]; then
  echo "--"
else
  echo "${temp}°"
fi
