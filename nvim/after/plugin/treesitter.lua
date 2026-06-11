require("nvim-treesitter").install({ "templ", "html", "css", "javascript", "lua", "go", "java", "python", "rust" })

require("nvim-ts-autotag").setup()
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

