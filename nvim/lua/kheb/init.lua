vim.filetype.add({
  extension = {
    templ = "templ",
    js = "javascript",
    ts = "typescript",
    jsx = "javascriptreact",
    tsx = "typescriptreact",
  },
})

require("kheb.remap")
require("kheb.packer")

print("PLEASE WORK")

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.sidescroll = 8
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 4

vim.opt.tabstop = 4
vim.opt.timeoutlen = 300
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
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50
vim.opt.cursorline = true

