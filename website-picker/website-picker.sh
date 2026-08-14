#!/bin/bash

declare -A sites=(
    ["Facebook"]="https://facebook.com"
    ["GitHub"]="https://github.com/CodeKheb"
    ["Classroom"]="https://classroom.google.com"
    ["Drive"]="https://drive.google.com"
    ["Docs"]="https://docs.google.com"
    ["Sheets"]="https://docs.google.com/spreadsheets"
    ["Gmail"]="https://mail.google.com"
    ["YouTube"]="https://youtube.com"
    ["Canva"]="https://canva.com"
    ["Claude"]="https://claude.ai"
    ["ChatGPT"]="https://chatgpt.com"
    ["Gemini"]="https://gemini.google.com"
    ["LeetCode"]="https://leetcode.com"
    ["Linkedin"]="https://linkedin.com"
    ["Render"]="https://dashboard.render.com"
    ["CodeChum"]="https://codechum.com"
    ["MonkeyType"]="https://monkeytype.com/"
    ["LocalHost"]="localhost"
)

urlencode() {
    local str="$1"
    local len=${#str}
    local encoded=""
    local c

    for (( i=0; i<len; i++ )); do
        c="${str:i:1}"

        case "$c" in
            [a-zA-Z0-9.~_-])
                encoded+="$c"
                ;;
            *)
                printf -v encoded '%s%%%02X' "$encoded" "'$c"
                ;;
        esac
    done

    printf '%s\n' "$encoded"
}

choice=$(printf "%s\n" "${!sites[@]}" | sort | \
    rofi -dmenu -i \
    -p "Search" \
    -theme ~/projects/dotfiles/website-picker/website-picker.rasi "Open")

[ -z "$choice" ] && exit

if [[ "$choice" == "LocalHost" ]]; then
    port=$(rofi -dmenu -p "Enter Port Number:" -theme ~/projects/dotfiles/website-picker/localhost.rasi)
    
    [ -z "$port" ] && exit
    
    firefox "http://localhost:$port"

elif [[ -n "${sites[$choice]}" ]]; then
    firefox "${sites[$choice]}"

else
    encoded_choice=$(urlencode "$choice")
    firefox "https://www.google.com/search?q=${encoded_choice}"
fi

