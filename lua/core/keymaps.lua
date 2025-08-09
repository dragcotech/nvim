-- Diagnostic
vim.keymap.set('n', '<leader>d', ':lua vim.diagnostic.setloclist()')
vim.keymap.set('n', '<leader>da', ':set expandtab tabstop=4 shiftwidth=4')

-- Navigate vim panes better
vim.keymap.set('n', '<M-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<M-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<M-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<M-l>', ':wincmd l<CR>')

-- copy, pass from clipboard
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- split
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })

-- bufferline
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>', { silent = true })
vim.keymap.set('n', '<leader>bb', ':BufferLinePick<CR>', { silent = true })

-- open folder tree
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFile<CR>')

-- multiple replace
vim.keymap.set('n', '<leader>mr', ':MurenToggle<CR>')

-- prettier, formatter code .min.js
vim.api.nvim_set_keymap(
    'n',
    '<leader>fm',
    ':!prettier --write %<CR>',
    { noremap = true, silent = true }
)

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.js",
    callback = function()
        vim.cmd("silent! !prettier --write " .. vim.fn.expand("%"))
    end,
})

--
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    command = "checktime",
})
