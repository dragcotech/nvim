return {
    "lukas-reineke/indent-blankline.nvim",

    config = function()
        vim.opt.list = true
        -- vim.opt.listchars:append "lead:·"
        -- vim.opt.listchars:append "tab:··"
        -- vim.opt.listchars:append "trail:·"

        -- setup indent guides
        require("ibl").setup({
            indent = {
                char = "┆",
            },
            whitespace = {
                highlight = { "IblWhitespace" },
                remove_blankline_trail = false,
            },
        })

        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#777777", nocombine = true })
        vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#777777", nocombine = true })
    end,
}
