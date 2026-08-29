#!/bin/bash

PROJECTS_DIR="$HOME/projects"

selection=$(
{
    echo "New Project"
    find "$PROJECTS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n'
} | rofi -dmenu -i -p "Kheb NVIM" \
        -theme "$HOME/projects/dotfiles/rofi/project-picker.rasi"
)

[[ -z "$selection" ]] && exit

if [[ "$selection" == "New Project" ]]; then
    project_name=$(rofi -dmenu -p "Project Name" \
         -theme "$HOME/projects/dotfiles/rofi/new-project.rasi"
)

    [[ -z "$project_name" ]] && exit

    mkdir -p "$PROJECTS_DIR/$project_name"

    kitty --working-directory "$PROJECTS_DIR/$project_name" \
        bash -c "nvim .; exec zsh"
else
    kitty --working-directory "$PROJECTS_DIR/$selection" \
        bash -c "nvim .; exec zsh"
fi
