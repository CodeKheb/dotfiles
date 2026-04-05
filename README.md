# Neovim configs
Kheb's neovim configs

## Features
    - Rofi Custom Bash Script for quick launch
    - Neovim **0.11+** for native nvim lsp support
    - Lazy plugin manager
    - Keybinds for my own comfort

## Configurations 
    - nvim-lsp
    - nvim-autotag
    - nvim-autopairs
    - mason
    - plenary-nvim
    - telescope
    - live-preview
    - harpoon
    - undotree
    - rose-pine theme 
    - barbar nvim

## Rofi Bash Script
 ```Bash
#!/bin/bash

project=$(find ~/projects -maxdepth 1 -type d ! -path ~/projects | \
        while read -r dir; do
            echo "$(basename "$dir)"
        done | \ 
        rofi -dmenu -i -p "Kheb NVIM" -theme ~/projects/rofi/project-picker.rasi)

if [[ -n "$project" ]]; then
    kitty --working-directory "~/projects/$project" bash -c "nvim .; exec zsh"
fi

 ```



