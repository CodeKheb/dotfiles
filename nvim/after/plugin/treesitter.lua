require("nvim-treesitter").install({ "templ", "html", "css", "javascript", "lua", "go", "java", "python" })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
  end,
})

vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "templ",
  callback = function()
    vim.treesitter.start()
  end,
})

local cmp = require'cmp'
cmp.setup {
  sources = {
    { name = 'nvim_lsp' }
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
}
