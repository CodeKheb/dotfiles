require("nvim-tree").setup()

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")


vim.keymap.set('n', 'nf', function()
    require("nvim-tree.api").tree.toggle({ path = vim.fn.expand('%:p:h')
})
  local file_to_open = vim.fn.input('Enter file name: ', current_file .. '/', 'file')
  vim.cmd('edit ' .. file_to_open)
end, { desc = 'Create and open new file' })

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Apply default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Remap 'l' to open files/folders
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
end

require("nvim-tree").setup({
  on_attach = on_attach,
})
