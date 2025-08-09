return {
    'akinsho/toggleterm.nvim',
    version = "*",

    config = function()
        -- Mapping trong terminal mode để gửi Ctrl+C
        vim.api.nvim_set_keymap('t', '<C-x>', [[<C-\><C-n>:call chansend(b:terminal_job_id, "\x03")<CR>i]],
            { noremap = true, silent = true })

        require('toggleterm').setup({
            -- shell = vim.fn.executable("zsh") and "zsh" or vim.o.shell,
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 10
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                else
                    return 20 -- Default size
                end
            end,
            open_mapping = [[<M-t>]],
            on_create = function(t) end,
            on_open = function(t) end,
            on_close = function(t) end,
            on_stdout = function(t, job, data, name) end,
            on_stderr = function(t, job, data, name) end,
            on_exit = function(t, job, exit_code, name) end,
            hide_numbers = true,
            shade_filetypes = {},
            autochdir = false,
            highlights = {
                Normal = {
                    guibg = "#1e1e2e",
                },
                NormalFloat = {
                    link = 'Normal'
                },
                FloatBorder = {
                    guifg = "#cdd6f4",
                    guibg = "#1e1e2e",
                },
            },
            shade_terminals = true,   -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
            shading_factor = -30,     -- the percentage by which to lighten dark terminal background, default: -30
            shading_ratio = -3,       -- the ratio of shading factor for light/dark terminal background, default: -3
            start_in_insert = true,
            insert_mappings = true,   -- whether or not the open mapping applies in insert mode
            terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
            persist_size = true,
            persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
            direction = 'horizontal',
            close_on_exit = true,     -- close the terminal window when the process exits
            clear_env = false,        -- use only environmental variables from `env`, passed to jobstart()
            -- Change the default shell. Can be a string or a function returning a string
            -- shell = "zsh",
            shell = "pwsh",
            auto_scroll = true, -- automatically scroll to the bottom on terminal output
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'shadow',
                -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
                width = 10,
                height = 10,
                row = 10,
                col = 10,
                winblend = 3,
                zindex = 10,
                title_pos = 'center',
            },
            winbar = {
                enabled = false,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end
            },
            responsiveness = {
                -- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
                -- instead of next to each other
                -- default = 0 which means the feature is turned off
                horizontal_breakpoint = 135,
            }
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
}
