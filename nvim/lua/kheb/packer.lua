-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself

    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use "brianhuster/live-preview.nvim"

    use { "rose-pine/neovim", as = "rose-pine" }

    use {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate'
    }

    use {
        'theprimeagen/harpoon',
        'mbbill/undotree',
        'tpope/vim-fugitive'
    }

    use {
        "Zeioth/compiler.nvim",
        requires = {
            "stevearc/overseer.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        config = function()
            require("compiler").setup({})
        end,
    }

    use {
        "stevearc/overseer.nvim",
        commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
        cmd = { "CompilerOpen", "CompilerStop", "CompilerToggleResults", "CompilerRedo" },
        config = function()
            require("overseer").setup({
                task_list = {
                    direction = "bottom",
                    min_height = 25,
                    max_height = 25,
                    default_detail = 1,
                },
            })
        end,
    }

end)
