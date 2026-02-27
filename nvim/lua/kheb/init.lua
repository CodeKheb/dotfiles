require("kheb.remap")
print("PLEASE WORK")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 12

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- YANK CLIPBOARD
vim.opt.clipboard = "unnamedplus"


-- Undo SAVES
vim.opt.undofile = true

-- TRAIL
vim.opt.list = true
vim.opt.listchars = {
  trail = "·",
}

vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.cursorline = true
