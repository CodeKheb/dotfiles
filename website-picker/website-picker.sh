#!/bin/bash

declare -A sites=(
    ["Facebook"]="https://facebook.com"
    ["GitHub"]="https://github.com/CodeKheb"
    ["Classroom"]="https://classroom.google.com"
    ["Drive"]="https://drive.google.com"
    ["Gmail"]="https://mail.google.com"
    ["YouTube"]="https://youtube.com"
    ["Canva"]="https://canva.com"
    ["Claude"]="https://claude.ai"
    ["ChatGPT"]="https://chatgpt.com"
    ["Gemini"]="https://gemini.google.com"
)

choice=$(printf "%s\n" "${!sites[@]}" | sort | rofi -dmenu -i -theme ~/projects/dotfiles/website-picker/website-picker.rasi "Open")

[ -n "$choice" ] && firefox "${sites[$choice]}"
