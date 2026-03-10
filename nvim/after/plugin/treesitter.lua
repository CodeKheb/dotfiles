require'nvim-treesitter'.setup({
    ensure_installed = {'lua', 'go', 'java', 'python' },
    auto_install = false,

    highlight = {
        enable = true
    },

    indent = {
        enable = true
    },
})


vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})


