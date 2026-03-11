require('livepreview.config').set({
    port = 5500,
    browser = 'default',
    dynamic_root = false,
    sync_scroll = true,
    picker = "",
    address = '127.0.0.1',
})

vim.o.autowriteall = true
vim.api.nvim_create_autocmd({ 'InsertLeavePre', 'TextChanged', 'TextChangedP' }, {
    pattern = '*', callback = function()
        vim.cmd('silent! write')
    end
})


vim.keymap.set("n", "<leader>`", "<cmd>LivePreview start<CR>")

