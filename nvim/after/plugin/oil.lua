require("oil").setup({
    default_file_explorer = true,

    columns = {
        "icon",
    },

    win_options = {
        signcolumn = "yes:2",
    },

    view_options = {
        show_hidden = true,
    },
})

vim.api.nvim_set_hl(0, "OilFile", {
    fg = "#e0def4",
})

vim.api.nvim_set_hl(0, "OilDir", {
    fg = "#c4a7e7",
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
    desc = "Open Oil",
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", {
    desc = "Open Oil",
})
