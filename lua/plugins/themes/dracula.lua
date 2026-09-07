return {
    'Mofiqul/dracula.nvim',
    name = 'dracula',
    lazy = false,
    priority = 1000,

    config = function()
        require('dracula').setup({
            -- Dracula options
        })
    end,
}