-- Map leader key to <Space>
vim.g.mapleader = ' '
vim.g.maplocalledar = ' '

vim.keymap.set({'n','v'}, '<Space>', '<Nop>', {silent = true})

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true})

-- Easier escape mappings, jk instead of <Esc>
vim.keymap.set('i', 'jk', '<Esc>l', {silent = true})
vim.keymap.set('v', 'jk', '<Esc>lk', {silent = true})
vim.keymap.set('i', 'kj', '<Esc>l', {silent = true})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Telescope maps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


