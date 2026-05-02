vim.g.mapleader = " "
vim.keymap.set("n", "<leader>t", vim.cmd.Ex)
vim.keymap.set("n", "<leader><Esc>", vim.cmd.qa)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>so", vim.cmd.so)

-- Splits
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>sl", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>sj", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>sq", "<cmd>close<CR>")

vim.keymap.set("n", "<C-Up>",    "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>",  "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Left>",  "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<leader>se", "<C-w>=")

-- Buffers
vim.keymap.set("n", "<leader>l", vim.cmd.BufferNext)
vim.keymap.set("n", "<leader>h", vim.cmd.BufferPrevious)
vim.keymap.set("n", "<leader>q", vim.cmd.BufferClose)

-- Open Terminal
vim.keymap.set("n", "<leader>t", vim.cmd.terminal)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
-- gen.nvim OLLAMA AI
vim.keymap.set("n", "<leader>aa", vim.cmd.Gen)

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
