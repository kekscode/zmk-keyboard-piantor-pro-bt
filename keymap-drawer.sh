#!/bin/bash

uvx --from keymap-drawer keymap parse -z config/piantor_pro_bt.keymap > /tmp/keymap.yaml
uvx --from keymap-drawer keymap draw \
  --ortho-layout '{split: true, rows: 3, columns: 6, thumbs: 3}' \
  -o piantor-pro-bt-keymap.svg /tmp/keymap.yaml
