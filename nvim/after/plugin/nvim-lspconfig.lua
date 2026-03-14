require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })

vim.lsp.config('*', {
    capabilities = capabilities,
    root_markers = { '.git' },
})


vim.lsp.config('gopls', {
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

vim.lsp.config('templ', {
  cmd = { 'templ', 'lsp' },
  filetypes = { 'templ' },
})



vim.lsp.enable('templ')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('ts_ls')

vim.lsp.enable('bashls')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('jdtls')

