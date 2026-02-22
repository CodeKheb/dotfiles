--return {
--{
	--"neovim/nvim-lspconfig",
	--config = function()
	--	require("lspconfig").lua_ls.setup {}
-- 	end,
  --   	}
-- }
vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = { multilineTokenSupport = true },
        }
    },
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
