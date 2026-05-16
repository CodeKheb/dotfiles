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
    'nvim-tree/nvim-web-devicons',
    "MunifTanjim/nui.nvim",
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
    {'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
},

{
    "David-Kunz/gen.nvim",
    opts = {
        model = "qwen2.5-coder:1.5b",
        host = "localhost",
        port = "11434",
        display_mode = "float",
        show_prompt = true,
        show_model = true,
        no_auto_close = false,
    },
},

{
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
}




})

return {
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
            ensure_installed = {
                "codelldb",
                "python",
            },
	    handlers = {},
        })

        dapui.setup()
        require("nvim-dap-virtual-text").setup()

        -- UI auto open/close
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Debug signs
        vim.fn.sign_define(
            "DapBreakpoint",
            { text = "●", texthl = "DiagnosticError" }
        )

        vim.fn.sign_define(
            "DapStopped",
            { text = "▶", texthl = "DiagnosticWarn" }
        )

        -- C / C++ / Rust
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
                    return vim.fn.input(
                        "Executable: ",
                        vim.fn.getcwd() .. "/",
                        "file"
                    )
                end,

                cwd = "${workspaceFolder}",
                stopOnEntry = false,

                runInTerminal = true,
            },
        }

        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = dap.configurations.c

        -- Keymaps
        vim.keymap.set("n", "<leader>db", dap.continue)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<F12>", dap.step_out)

        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>B", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end)

        vim.keymap.set("n", "<leader>dr", dap.repl.open)
        vim.keymap.set("n", "<leader>dl", dap.run_last)
        vim.keymap.set("n", "<leader>du", dapui.toggle)
    end,
}
