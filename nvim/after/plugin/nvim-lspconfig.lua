local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
  end,
})



vim.lsp.config('*', {
    capabilities = capabilities,
    root_markers = { '.git' },
})

vim.lsp.config('tailwindcss', {
  filetypes = { 'html', 'css', 'templ', 'javascript', 'typescript' },
  settings = {
    tailwindCSS = {
      includeLanguages = {
        templ = "html",
      },
    },
  },
})

vim.lsp.config('ts_ls', {
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'templ' },
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


vim.lsp.enable('tailwindcss')
vim.lsp.enable('templ')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('ts_ls')

vim.lsp.enable('bashls')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('jdtls')

