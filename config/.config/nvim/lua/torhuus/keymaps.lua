local opts = {noremap=true, silent=true}
local term_opts = {silent=true}

kmFn = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = ";"

kmFn("i", "jk", "<esc>", opts) -- escape from insert mode ;)
kmFn("n", "<leader>hh", ":nohls <CR>", opts) -- remove highlights

-- Move text up and down
kmFn('n', '<A-j>', ":m +1<CR>==", opts)
kmFn("n", "<A-k>", ":m .-2<CR>==", opts)
kmFn('i', '<A-j>', "<esc>:m +1<CR>==", opts)
kmFn("i", "<A-k>", "<esc>:m .-2<CR>==", opts)
kmFn('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
kmFn("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Good indent behaviour (stays in V)
kmFn("v", "<", "<gv", opts)
kmFn("v", ">", ">gv", opts)

-- Move through file system and buffers
kmFn("n","<localleader>f","<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
kmFn("n","<localleader>g","<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
kmFn("n","<localleader>b","<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
