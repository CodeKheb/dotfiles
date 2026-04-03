vim.g.mapleader = " "
vim.keymap.set("n", "<leader>t", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>so", vim.cmd.so)

-- Buffers
vim.keymap.set("n", "<leader>l", vim.cmd.BufferNext)
vim.keymap.set("n", "<leader>h", vim.cmd.BufferPrevious)

-- Open Terminal
vim.keymap.set("n", "<leader>t", vim.cmd.terminal)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set('n', '<leader>Z', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', '<leader>z', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local buf = args.buf
        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, noremap = true, silent = true })
        end

        map('n', 'gd', vim.lsp.buf.definition)
        map('n', 'gr', vim.lsp.buf.references)
        map('n', 'K', vim.lsp.buf.hover)
        map('n', '<leader>rn', vim.lsp.buf.rename)
        map('n', '<leader>ca', vim.lsp.buf.code_action)
        map('n', '<leader>f', vim.lsp.buf.format)
    end,
})
