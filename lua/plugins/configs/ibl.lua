return {
    "lukas-reineke/indent-blankline.nvim",

    config = function()
        -- hiển thị dấu chấm cho space/tab
        vim.opt.list = true
        vim.opt.listchars:append "lead:·"
        vim.opt.listchars:append "tab:··"
        vim.opt.listchars:append "trail:·"

        -- setup indent guides
        require("ibl").setup({
            indent = {
                char = "┆", -- mảnh hơn │
            },
            whitespace = {
                highlight = { "IblWhitespace" },
                remove_blankline_trail = false,
            },
        })

        -- highlight mờ
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#444444", nocombine = true })
        vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#444444", nocombine = true })
    end,
}
