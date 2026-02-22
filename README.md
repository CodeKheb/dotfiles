# Neovim configs
Writing neovim from scratch


## Added


``` packer.lua ``` Directory 

### Rose Pine Theme
``` lua
use {
    "rose-pine/neovim",
    name = "rosepine",
    config = function()
            vim.cmd("colorscheme rose-pine"}
    end
    }
```

### Treesitter
``` lua 
use {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate'
}
```

### Harpoon (theprimeagen)
``` lua
use {
    'theprimeagen/harpoon`
    }
```
### Undo Tree
``` lua 
use { 
    'mbbill/undotree
    }
```
### Neovim-lspconfig
``` lua
  use 'neovim/nvim-lspconfig'
```
#### Current LSP installed
Global Default Config
``` lua
vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = { multilineTokenSupport = true },
        }
    },
    root_markers = { '.git' },
})
```
Lua
``` lua
vim.lsp.enable('lua_ls')
```
golang
``` lua
vim.lsp.enable('gopls')

-- recognize gowork and gotmpl files
vim.filetype.add({
  extension = {
        gowork = "gowork",
        gotmpl = "gotmpl",
    },
 })
```
Python
``` lua
vim.lsp.enable('pyright')
```


# Intellij Ideavimrc
Vim motions config for intelliJ, temporary for I will use neovim
> For java, I'm still figuring out how to move out of the intellij comfort
