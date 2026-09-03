local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ hidden = true }) end, {})
vim.keymap.set("n", "<leader>fg", function() builtin.live_grep({ hidden = true }) end, {})
vim.keymap.set("n", "<leader>fb", function() builtin.buffers({ hidden = true }) end, {})
vim.keymap.set("n", "<leader>fh", function() builtin.help_tags({ hidden = true }) end, {})

require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "%.png", "%.jpg", "%.jpeg", "%.gif", "%.webp",
      "%.pdf", "%.zip", "%.tar", "%.gz", "%.rar",
      "%.exe", "%.dll", "%.so", "%.o", "%.a",
      "%.bin", "%.mp4", "%.mp3", "%.wav"
    },
  },
})
