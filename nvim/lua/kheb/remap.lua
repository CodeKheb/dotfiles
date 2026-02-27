vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", ":wq<CR>")

-- Open compiler
vim.api.nvim_set_keymap('n', '<leader><leader>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap('n', '<S-F6>',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<S-F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

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
