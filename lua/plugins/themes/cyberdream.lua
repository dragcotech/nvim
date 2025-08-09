return {
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,    -- Load at startup
        priority = 1000, -- Load before other plugins
        config = function()
            require("cyberdream").setup({
                transparent = true,
            })
        end
    },
}
