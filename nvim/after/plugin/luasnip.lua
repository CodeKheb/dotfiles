local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

require("luasnip.loaders.from_lua").load({
    paths = "~/projects/dotfiles/nvim/after/snippets"
})


