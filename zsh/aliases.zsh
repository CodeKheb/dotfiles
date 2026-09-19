#
# esp-idf
alias esp="source ~/esp-idf/export.sh"
alias sdkmanager="$HOME/Android/Sdk/cmdline-tools/bin/sdkmanager"

alias cls="clear"

alias so="source"
alias c="clear"

# configs
alias czsh="nvim ~/.config/zsh/aliases.zsh"
alias csway="nvim ~/.config/sway/config"
alias ckitty="nvim ~/.config/kitty/kitty.conf"

# reloading
alias reload-sway="swaymsg reload"
alias reload-zsh="source ~/.zshrc"


alias arduino="/opt/arduino/arduino-ide > /dev/null 2>&1 &"
alias arduino-8266-compile="arduino-cli compile --fqbn esp8266:esp8266:nodemcuv2 -u -p /dev/ttyUSB0"
alias arduino-8266-check="arduino-cli compile --fqbn esp8266:esp8266:nodemcuv2"
alias arduino-8266-monitor="arduino-cli monitor -p /dev/ttyUSB0 -b esp8266:esp8266:nodemcuv2"


# nvim
alias vim="nvim ."

# java 
alias java25="sudo archlinux-java set java-25-openjdk"
alias java21="sudo archlinux-java set java-21-openjdk"
alias java17="sudo archlinux-java set java-17-openjdk"


# ESPresso
alias espresso="$HOME/projects/ESPresso/app/ESPresso/src-tauri/target/debug/espresso"
