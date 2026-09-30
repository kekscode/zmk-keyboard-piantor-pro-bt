#!/bin/bash
set -euo pipefail

# Render one image per layer of the Piantor Pro BT keymap.
# Uses the real column-stagger geometry from the board layout file.

OUT_DIR="blog/images"
LAYOUT="boards/arm/piantor_pro_bt/piantor_pro_bt-layouts.dtsi"
KEYMAP="config/piantor_pro_bt.keymap"

mkdir -p "$OUT_DIR"

uvx --from keymap-drawer keymap parse -z "$KEYMAP" > /tmp/keymap.yaml

# "Layer name:file suffix" pairs
layers=(
  "BASE:base"
  "CHAR:char"
  "NAVI NUM:navi-num"
  "FKEY:fkey"
  "BLUE:blue"
)

for pair in "${layers[@]}"; do
  name="${pair%%:*}"
  suffix="${pair##*:}"
  svg="$OUT_DIR/piantor-pro-bt-${suffix}.svg"
  uvx --from keymap-drawer keymap draw \
    -d "$LAYOUT" -l default_layout \
    -s "$name" -o "$svg" /tmp/keymap.yaml
  rsvg-convert -b white -z 2 "$svg" > "$OUT_DIR/piantor-pro-bt-${suffix}.png"
  echo "wrote $OUT_DIR/piantor-pro-bt-${suffix}.{svg,png}"
done
