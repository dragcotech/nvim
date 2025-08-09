-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)


-- Lazy Setup
require("lazy").setup({
    require("plugins.configs.alpha"),
    require("plugins.configs.bufferline"),
    require("plugins.configs.completions"),
    require("plugins.configs.gitsigns"),
    require("plugins.configs.lsp"),
    require("plugins.configs.lualine"),
    require("plugins.configs.nvimtree"),
    require("plugins.configs.telescope"),
    require("plugins.configs.terminal"),
    require("plugins.configs.treesitter"),
    require("plugins.configs.comment"),
    require("plugins.configs.multiple_search"),
    require("plugins.configs.indent"),
    require("plugins.configs.escape"),
    -- require("plugins.configs.rust_tools"),
    -- require("plugins.configs.lsp_saga"),
    -- Themes
    require("plugins.themes.gruvbox"),
    require("plugins.themes.darkvoid"),
    require("plugins.themes.nordic"),
    require("plugins.themes.everforest"),
    require("plugins.themes.andromeda"),
    require("plugins.themes.cyberdream"),
    require("plugins.themes.rosepine"),
    require("plugins.themes.onedark"),
    require("plugins.themes.github"),
    require("plugins.themes.everviolet"),
    require("plugins.themes.neofusion")
})

-- default theme
vim.cmd.colorscheme "onedark"
-- vim.opt.background = "dark"
-- vim.cmd("highlight Normal guibg=none")
-- vim.cmd("highlight NormalNC guibg=none")
