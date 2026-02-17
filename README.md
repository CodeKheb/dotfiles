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

# Intellij Ideavimrc
Vim motions config for intelliJ, temporary for I will use neovim
