# Load nvm when necessary
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm "$@"
  }
  node() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; node "$@"; }
  npm() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; npm "$@"; }
  npx() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; npx "$@"; }
fi

# load autopair-init
autopair-init

# load fastfetch if not neovim
if [ -z "$NVIM" ]; then
    fastfetch
fi

if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then
    tmux new-session
fi
