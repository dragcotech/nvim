return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,

    config = function()
        require("nvim-treesitter").install({
            "c",
            "cpp",
            "lua",
            "html",
            "css",
            "tsx",
            "javascript",
            "typescript",
            "rust",
            "python",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "c",
                "cpp",
                "lua",
                "html",
                "css",
                "javascript",
                "typescript",
                "typescriptreact",
                "rust",
                "python",
            },

            callback = function(args)
                vim.treesitter.start(args.buf)
            end,
        })
    end,
}
