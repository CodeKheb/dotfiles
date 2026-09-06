#!/bin/sh
# ~/.local/bin/rofi-emoji
rofi -show emoji -modi emoji \
    -theme ~/projects/dotfiles/rofi/emoji-picker.rasi \
    -emoji-mode insert \
    -emoji-format '{emoji}  <span size="10000">{name}</span>'
