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
    'stevearc/dressing.nvim',
    "MunifTanjim/nui.nvim",
    { "rose-pine/neovim", name = "rose-pine" },

    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            default_file_explorer = true,

            win_options = {
                signcolumn = "yes:2",
            },

            columns = {},

            view_options = {
                show_hidden = true,
            },
        },
    },

    {
        "refractalize/oil-git-status.nvim",
        lazy = false,
        dependencies = {
            "stevearc/oil.nvim",
        },
        opts = {},
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
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
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "jay-babu/mason-nvim-dap.nvim",
            "williamboman/mason.nvim",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("mason").setup()

            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb", "python" },
                handlers = {},
            })

            dapui.setup()
            require("nvim-dap-virtual-text").setup()

            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
            vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn" })

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = vim.fn.exepath("codelldb"),
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.c = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    runInTerminal = true,
                },
            }

            dap.configurations.cpp = dap.configurations.c
            dap.configurations.rust = dap.configurations.c

            vim.keymap.set("n", "<leader>dc", dap.continue)
            vim.keymap.set("n", "<leader>dn", dap.step_over)
            vim.keymap.set("n", "<leader>di", dap.step_into)
            vim.keymap.set("n", "<leader>do", dap.step_out)
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>B", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end)
            vim.keymap.set("n", "<leader>dr", dap.repl.open)
            vim.keymap.set("n", "<leader>dl", dap.run_last)
            vim.keymap.set("n", "<leader>du", dapui.toggle)
            vim.keymap.set("n", "<leader>dq", dap.terminate)
        end,
    },
    {
        "tpope/vim-dadbod",
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            "tpope/vim-dadbod",
        },
    },
    {
        "kristijanhusak/vim-dadbod-completion",
        dependencies = {
            "tpope/vim-dadbod",
        },
    },
})
