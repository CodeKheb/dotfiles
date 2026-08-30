require("oil").setup({
    default_file_explorer = true,

    columns = {
        "icon",
    },

    win_options = {
        signcolumn = "yes",
        number = true,
        numberwidth = 3,
    },

    view_options = {
        show_hidden = true,
    },
})

vim.api.nvim_set_hl(0, "OilFile", {
    fg = "#ffffff",
})

vim.api.nvim_set_hl(0, "OilDir", {
    link = "Comment",
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
    desc = "Open Oil",
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", {
    desc = "Open Oil",
})
