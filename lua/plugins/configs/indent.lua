return {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "BufReadPre", -- hoặc "VeryLazy"
    config = function()
        require("mini.indentscope").setup()
    end,
}
