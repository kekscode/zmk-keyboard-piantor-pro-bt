#!/bin/bash
uvx --from keymap-drawer keymap parse -z config/toucan.keymap | \
  sed 's/layout: {zmk_keyboard: toucan}/layout:\n  ortho_layout: {split: true, rows: 3, columns: 6, thumbs: 3}/' | \
  uvx --from keymap-drawer keymap draw -o toucan-keymap.svg -
