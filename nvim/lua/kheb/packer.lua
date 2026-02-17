-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'           
  use 'nvim-telescope/telescope.nvim'   

  -- lua/plugins/rose-pine.lua
use {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
}
use {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate'
}
use {
	'theprimeagen/harpoon'
}
use {
	'mbbill/undotree'
}

  end)
