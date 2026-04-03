function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal",          { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC",        { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat",     { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "NvimTreeNormal",  { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLine",      { bg = "#26233a" })
        vim.api.nvim_set_hl(0, "CursorLineNC",    { bg = "#26233a" })
    end,
})

ColorMyPencils("rose-pine")
