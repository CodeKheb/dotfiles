#!/bin/bash

declare -A sites=(
    ["Facebook"]="https://facebook.com"
    ["GitHub"]="https://github.com"
    ["Google Classroom"]="https://classroom.google.com"
    ["Gmail"]="https://mail.google.com"
    ["YouTube"]="https://youtube.com"
)

choice=$(printf "%s\n" "${!sites[@]}" | sort | rofi -dmenu -i -theme ~/projects/dotfiles/website-picker/website-picker.rasi "Open")

[ -n "$choice" ] && firefox "${sites[$choice]}"
