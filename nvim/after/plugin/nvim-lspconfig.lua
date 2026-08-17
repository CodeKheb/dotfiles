vim.filetype.add({ extension = { gotmpl = "gotmpl" } })
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
  end,
})

-- global lsp
vim.lsp.config('*', {
  capabilities = capabilities,
  root_markers = { '.git' },
})

-- golang
vim.lsp.config('gopls', {
  cmd = { vim.fn.expand("$HOME/go/bin/gopls") },
  settings = {
    gopls = {
      gofumpt = true,
      analyses = { unusedparams = true },
    },
  },
})

-- tailwind
vim.lsp.config('tailwindcss', {
  filetypes = { 'html', 'css', 'templ', 'javascript', 'typescript' },
  settings = {
    tailwindCSS = {
      includeLanguages = { templ = "html" },
    },
  },
})

-- typescript
vim.lsp.config('ts_ls', {
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'templ' },
})

-- c#
vim.lsp.config('roslyn', {
  cmd = { vim.fn.expand("$HOME") .. "/.dotnet/tools/roslyn-language-server", "--stdio", "--autoLoadProjects" },
  filetypes = { "cs" },
  root_markers = { "*.sln", "*.csproj", ".git" }
})

-- kotlin
vim.lsp.config('kotlin_language_server', {
  root_markers = { 'gradlew', 'build.gradle', 'build.gradle.kts', 'settings.gradle.kts' },
})

-- rust 
vim.lsp.config('rust_analyzer', {
  root_markers = { 'Cargo.toml', '.git' },
})

-- java ragebait larp
vim.lsp.config('jdtls', {
  settings = {
    java = {
      import = {
        gradle = { offline = { enabled = true } },
        maven = { offline = { enabled = true } }
      }
    }
  }
})

-- servers
local servers = {
  'clangd', 'rust_analyzer', 'kotlin_language_server', 'yaml-language-server',
  'tailwindcss', 'templ', 'html', 'cssls', 'ts_ls', 'bashls', 'gopls', 
  'lua_ls', 'pyright', 'roslyn', 'jdtls'
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

