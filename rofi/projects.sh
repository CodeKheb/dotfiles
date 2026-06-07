#!/bin/bash

project=$(
    find "$HOME/projects" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' |
    rofi -dmenu -i -p "Kheb NVIM" \
         -theme "$HOME/projects/dotfiles/rofi/project-picker.rasi"
)

if [[ -n "$project" ]]; then
    kitty --working-directory "$HOME/projects/$project" \
        bash -c "nvim .; exec zsh"
fi
