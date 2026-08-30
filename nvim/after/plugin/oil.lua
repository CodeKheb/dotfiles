require("oil").setup({
    default_file_explorer = true,

    columns = {
        "icon",
    },

    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
    desc = "Open Oil",
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", {
    desc = "Open Oil",
})
