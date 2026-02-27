require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
	capabilities = capabilities,
	root_markers = { '.git' },
})
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')

vim.filetype.add({
		extension = {
			gowork = "gowork",
			gotmpl = "gotmpl",
		},
})
