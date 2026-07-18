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
    ["LeetCode"]="https://leetcode.com"
    ["MonkeyType"]="https://monkeytype.com/"
)

choice=$(printf "%s\n" "${!sites[@]}" | sort | \
    rofi -dmenu -i \
    -p "Search" \
    -theme ~/projects/dotfiles/website-picker/website-picker.rasi "Open")

[ -z "$choice"] && exit

if [[ -n "${sites[$choice]}" ]]; then
    firefox "${sites[$choice]}"
else
    firefox "https://www.google.com/search?q=${choice// /+}"
fi
