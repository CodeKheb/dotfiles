# path
export PATH="$HOME/projects/dotfiles/rofi:$PATH"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export NDK_HOME=$HOME/Android/Sdk/ndk/30.0.14904198

alias sdkmanager="/home/me/Android/Sdk/cmdline-tools/bin/sdkmanager"

# source esp-idf
alias esp="source ~/esp-idf/export.sh"

alias so="source"
alias c="clear"

# configs
alias czsh="nvim ~/.config/zsh/aliases.zsh"
alias csway="nvim ~/.config/sway/config"
alias ckitty="nvim ~/.config/kitty/kitty.conf"

# reloading
alias reload-sway="swaymsg reload"
alias reload-zsh="source ~/.zshrc"


# nvim
alias vim="nvim ."

# java 
alias java25="sudo archlinux-java set java-25-openjdk"
alias java21="sudo archlinux-java set java-21-openjdk"

fastfetch
