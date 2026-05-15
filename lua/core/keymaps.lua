local keymap = vim.keymap.set

keymap('n', '<Space>', '<Nop>')

keymap('i', '<C-ц>', '<C-W>') -- TODO: make such keymaps automapped
keymap('i', '<C-Backspace>', '<C-W>')
keymap('i', '<C-Del>', '<C-o>dw')

-- Split navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

keymap('n', '<Esc>', '<cmd>noh<cr>')

-- Nvim-Tree
keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file tree' })

-- Buffers
keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
keymap('n', '<leader>bd', close_buffer, { desc = 'Kill buffer' })
