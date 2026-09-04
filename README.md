# Kheb's Dotfiles

Personal Linux configuration files, built around an Arch-based setup with **Neovim as the primary editor**, a Sway (Wayland) desktop, and a set of rofi-powered launcher scripts.

The repository is expected to live at `~/projects/dotfiles` — several configs and scripts reference that path directly.

---

## Repository Structure

```
dotfiles/
├── nvim/                    # Neovim configuration (the centerpiece)
│   ├── init.lua             # Entry point → loads lua/kheb
│   ├── lazy-lock.json       # Locked plugin versions
│   ├── lua/kheb/            # Options, plugin manager, keymaps
│   ├── after/plugin/        # Per-plugin setup files
│   └── after/snippets/      # Custom LuaSnip snippets (html, java)
├── sway/                    # Sway window manager config
├── sxhkrc/                  # sxhkd hotkey daemon config (X11)
├── waybar/                  # Waybar status bar
├── rofi/                    # Launcher themes + scripts
│   ├── projects.sh          # Project picker (rofi + kitty + nvim)
│   ├── config.rasi          # Base rofi config (adi1090x style)
│   ├── project-picker.rasi  # Theme for the project picker
│   ├── new-project.rasi     # Theme for the "New Project" prompt
│   ├── launchers/           # App launcher theme variants
│   ├── applets/             # Applet themes
│   ├── powermenu/           # Power menu themes
│   ├── scripts/             # Launcher scripts
│   └── colors/              # Color scheme themes
├── kitty/                   # Kitty terminal emulator
├── tmux/                    # Tmux config
├── zsh/                     # Zsh config (aliases, plugins, paths)
├── qutebrowser/             # Qutebrowser config
├── website-picker/          # Rofi website launcher script
├── sddm-minimal/            # Minimal SDDM login theme
├── fastfetch/               # Fastfetch system info
├── xdg-desktop-portal/      # Portal backend preferences
├── keyd/                    # keyd keyboard remapping (Caps Lock → Esc)
├── .ideavimrc               # IdeaVim config (IntelliJ)
└── .luarc.json              # Lua language server config
```

---

## Launcher Scripts

### `rofi/projects.sh` — Project Picker
Opens a rofi menu listing all folders in `~/projects` (plus a **New Project** option). Selecting an entry opens it in **kitty** running **nvim**, dropping to a shell on exit. Bound to `$mod+v` in Sway.

### `website-picker/website-picker.sh` — Website Launcher
Rofi menu of frequently visited sites (GitHub, Classroom, Drive, YouTube, ChatGPT, …). Opens the selection in **Firefox**. Special cases:

- **LocalHost** — prompts for a port and opens `http://localhost:<port>`
- **CodeChum** — opens in Chrome instead of Firefox
- Any other text — treated as a search, opened as a Google query (URL-encoded)

---

## Neovim

Requires **Neovim 0.11+** (native LSP support) and uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager (auto-bootstrapped on first run).

```
nvim/
├── init.lua                # Entry point
├── lua/kheb/
│   ├── init.lua            # Filetypes + editor options
│   ├── lazy.lua            # Plugin manager bootstrap + plugin list
│   └── remap.lua           # Leader keymaps, LSP + DAP bindings
├── after/plugin/           # One file per plugin: mason, cmp, telescope,
│                           # treesitter, lspconfig, oil, colors, luasnip,
│                           # livepreview, autopairs…
└── after/snippets/         # Custom snippets: html.lua, java.lua
```

### Features
- **Native LSP** via `nvim-lspconfig` + **mason.nvim** for server installs
- **LSP servers enabled:** `clangd`, `rust_analyzer`, `gopls`, `ts_ls`, `pyright`, `bashls`, `lua_ls`, `templ`, `tailwindcss`, `html`, `cssls`, `kotlin_language_server`, `yamlls`, `jdtls`, `roslyn`
- **Autocompletion** — nvim-cmp (LSP, buffer, path sources) with **LuaSnip** snippets + friendly-snippets
- **Treesitter** — parsers for templ, html, css, javascript, lua, go, java, python, rust
- **Debugging** — nvim-dap with `codelldb` (C/C++/Rust) and python, auto-opening dap-ui
- **Telescope** finder, **Harpoon** quick navigation, **undotree**, **fugitive** (Git), **oil.nvim** file explorer with git status
- **Live preview** for web dev (`live-preview.nvim`)
- **Rose-pine** color scheme with transparent background
- Compile & run with `compiler.nvim` + `overseer.nvim` (e.g. `gcc` via `makeprg`)
- **SQL** support with vim-dadbod + dadbod-ui + completion
- Auto-pairing (nvim-autopairs) and auto-tagging (nvim-ts-autotag)
- Visual settings: relative line numbers, clipboard = system, undo files, no swap/backup, smart case search

### Keybindings (`<leader>` = `Space`)

| Category | Keybind | Action |
|---|---|---|
| General | `<leader>w` | Save file |
| | `<leader>fq` / `<leader><Esc>` | Force quit / quit all |
| | `<leader>so` | Source current file |
| Splits | `<leader>sl` / `<leader>sj` | Vertical / horizontal split |
| | `<C-h/j/k/l>` | Navigate splits |
| | `<A-h/j/k/l>` | Resize splits |
| | `<leader>sq` / `<leader>se` | Close split / equalize |
| Buffers | `<leader>l` / `<leader>h` | Next / previous buffer |
| | `<leader>q` | Close buffer |
| Terminal | `<leader>t` | Open terminal in current directory (oil-aware) |
| | `<Esc><Esc>` (term) | Exit terminal mode |
| LSP | `gd` / `gr` / `K` | Definition / references / hover |
| | `<leader>rn` / `<leader>ca` / `<leader>f` | Rename / code action / format |
| | `<leader>z` / `<leader>Z` | Next / previous diagnostic |
| Debug | `<leader>dc` / `dn` / `di` / `do` | Continue / over / into / out |
| | `<leader>b` / `<leader>B` | Toggle / conditional breakpoint |
| | `<leader>dr` / `dl` / `du` / `dq` | REPL / run last / toggle UI / terminate |
| Find | `<leader>ff` / `fg` / `fb` / `fh` | Telescope files / grep / buffers / help |
| Tools | `<leader>e` / `-` | Toggle oil.nvim |
| | `<leader>u` | Toggle undotree |
| | `<leader>gs` | Git status (fugitive) |
| | `<leader>`\` | Start live preview |
| Snippets | `<C-v>` (insert/select) | Expand / jump (LuaSnip) |
| Completion | `<Tab>` / `<S-Tab>` / `<CR>` | Select / confirm (nvim-cmp) |

Custom snippets live in `after/snippets/` and are loaded via LuaSnip's Lua loader.

---

## Desktop Environment

### Sway (`sway/config`)
Wayland tiling window manager config. `$mod` = **Super**.

| Keybind | Action |
|---|---|
| `$mod+Return` | Launch kitty |
| `$mod+v` | Project picker (`rofi/projects.sh`) |
| `$mod+b` | Website picker |
| `$mod+Space` | App launcher (rofi) |
| `$mod+i` | nmtui (network) |
| `$mod+m` | btop (system monitor) |
| `$mod+e` | yazi (file manager) |
| `$mod+t` | Toggle waybar |
| `$mod+q` | Kill focused window |
| `$mod+h/j/k/l` | Focus left/down/up/right |
| `$mod+Shift+h/j/k/l` | Move window |
| `$mod+1..4` | Named workspaces (main, second, third, fourth) |
| `$mod+Ctrl+h/l` | Previous / next workspace |
| `Print` | Screenshot region → clipboard (grim + slurp) |
| `F2/F3`, `F5/F6` | Volume / brightness |
| `$mod+Delete` / `$mod+End` / `$mod+Home` | Power off / reboot / suspend |

### sxhkd (`sxhkrc/sxhkdrc`)
X11 hotkey daemon config with similar bindings (launchers, workspaces, window management, media/volume/brightness keys, screenshots via flameshot, and power controls).

### Waybar (`waybar/`)
Top status bar with sway workspaces, CPU/memory stats drawer, volume, battery, and clock.

### SDDM (`sddm-minimal/`)
Minimal black login screen theme (password field centered, auto-login as user `me`).

---

## Terminal & Shell

### Kitty (`kitty/kitty.conf`)
- JetBrains Mono, 18pt, borderless window
- `ctrl+enter` → nvim overlay, `ctrl+e` → yazi overlay (current dir), `ctrl+f` → freebuff
- `alt+hjkl` word movement, `alt+j/k` scroll, `ctrl+±` font zoom
- `alt+t` new tab, `alt+1..n` jump to tab

### Tmux (`tmux/tmux.conf`)
- Prefix changed to **`Alt+a`**
- `alt+t` new window, `alt+1..n` jump to window, windows start at index 1

### Zsh (`zsh/`)
- Plugins: git, zsh-autopair, zsh-syntax-highlighting; **vi-mode** (`bindkey -v`)
- Lazy-loaded nvm
- Aliases for esp-idf, Android SDK/NDK, Java version switching (`java17/21/25`), config editing (`czsh`, `csway`, `ckitty`), sway/zsh reloads
- PATH additions: rofi scripts, `~/.local/bin`, Go, Android platform-tools

---

## Qutebrowser (`qutebrowser/`)
Minimal config: ` h` / ` l` (space-prefixed) for previous / next tab.

---

## Other Configs

| File | Purpose |
|---|---|
| `fastfetch/config.jsonc` | System info display modules |
| `xdg-desktop-portal/portals.conf` | Prefer `wlr` portal backend on Wayland |
| `keyd/default.conf` | Remap Caps Lock to Escape |
| `.ideavimrc` | IdeaVim setup for IntelliJ (leader `Space`, IDE action mappings) |
| `.luarc.json` | Lua language server globals (`vim`) for editing the nvim config |

---

## Installation

Dotfiles are meant to be **symlinked** into their config locations. The repo is expected at `~/projects/dotfiles`:

```bash
sudo ln -sf ~/projects/dotfiles/nvim            ~/.config/nvim
sudo ln -sf ~/projects/dotfiles/kitty           ~/.config/kitty
sudo ln -sf ~/projects/dotfiles/sway            ~/.config/sway
sudo ln -sf ~/projects/dotfiles/waybar          ~/.config/waybar
sudo ln -sf ~/projects/dotfiles/rofi            ~/.config/rofi
sudo ln -sf ~/projects/dotfiles/tmux/tmux.conf  ~/.tmux.conf
sudo ln -sf ~/projects/dotfiles/.ideavimrc      ~/.ideavimrc
```

### Neovim
Neovim 0.11+ is required. On first launch, lazy.nvim bootstraps itself and installs all plugins automatically:

```bash
nvim
```

Install language servers and debuggers with:

```vim
:Mason
```

---

## Plugin List

| Plugin | Purpose |
|---|---|
| lazy.nvim | Plugin manager |
| nvim-lspconfig, mason.nvim, mason-lspconfig.nvim | LSP setup & server installs |
| nvim-cmp + cmp-* sources | Autocompletion |
| LuaSnip, friendly-snippets | Snippets |
| nvim-treesitter, nvim-ts-autotag | Syntax highlighting & auto-tags |
| telescope.nvim, plenary.nvim | Fuzzy finding |
| harpoon | Quick file switching |
| undotree | Persistent undo history |
| vim-fugitive | Git integration |
| oil.nvim, oil-git-status.nvim | File explorer with git status |
| gitsigns.nvim | Git signs in the gutter |
| nvim-autopairs | Auto-close pairs |
| live-preview.nvim | Live HTML/CSS preview |
| compiler.nvim, overseer.nvim | Compile & run tasks |
| nvim-dap, nvim-dap-ui, nvim-dap-virtual-text, mason-nvim-dap | Debugging |
| vim-dadbod, vim-dadbod-ui, vim-dadbod-completion | SQL database client |
| rose-pine | Color scheme |
| nui.nvim, dressing.nvim, nvim-web-devicons | UI helpers & icons |
