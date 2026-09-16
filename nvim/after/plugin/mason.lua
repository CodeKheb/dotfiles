require("mason").setup()

require("mason-tool-installer").setup({
    ensure_installed = {
        "clangd",
        "rust-analyzer",
        "kotlin-language-server",
        "yaml-language-server",
        "tailwindcss-language-server",
        "templ",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "bash-language-server",
        "gopls",
        "lua-language-server",
        "pyright",
        "roslyn-language-server",
        "terraform-ls",
    },
})
