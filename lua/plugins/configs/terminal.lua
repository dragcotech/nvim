return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",

        keys = {
            {
                "<M-t>",
                "<cmd>ToggleTerm<CR>",
                desc = "Toggle Terminal",
            },
        },

        config = function()
            require('toggleterm').setup({
                size = 10,
                direction = "horizontal",

                start_in_insert = true,
                insert_mappings = true,
                terminal_mappings = true,

                shell = "pwsh",

                close_on_exit = true,
                auto_scroll = true,
                persist_size = true,
                persist_mode = true,
            })
        end,
    },
}