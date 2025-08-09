return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",

    config = function()
        -- If It run on windows, set clang compiler
        if vim.loop.os_uname().sysname == "Windows_NT" then
            require('nvim-treesitter.install').compilers = { "clang" }
            -- require('nvim-treesitter.install').prefer_git = true
        end

        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                "lua",
                "html",
                "pug",
                "css",
                "scss",
                "tsx",
                "javascript",
                "typescript",
                "svelte",
                "rust",
                "python",
                "java",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end
}
