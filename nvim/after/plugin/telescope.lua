local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>pf', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });

    vim.cmd [[
    highlight! link TelescopePrompt Normal
    highlight! link TelescopeResults Normal
    highlight! link TelescopeSelection Visual
    ]]
end)

