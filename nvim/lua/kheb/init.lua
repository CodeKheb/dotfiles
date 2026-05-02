vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

require("kheb.remap")
require("kheb.packer")

print("PLEASE WORK")

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 4

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"

-- YANK CLIPBOARD
vim.opt.clipboard = "unnamedplus"


-- Undo SAVES
vim.opt.undofile = true

-- SWAP FILE NO !!
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.updatetime = 50
vim.opt.cursorline = true

