-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "windwp/nvim-ts-autotag",
    'windwp/nvim-autopairs',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'brianhuster/live-preview.nvim',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    { "rose-pine/neovim", name = "rose-pine" },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    {
        "Zeioth/compiler.nvim",
        dependencies = {
            "stevearc/overseer.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        config = function()
            require("compiler").setup({})
        end,
    },
    {
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
    },
})
