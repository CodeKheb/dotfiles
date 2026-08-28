local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

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
