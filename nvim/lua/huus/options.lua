-- [[ Setting options ]]
vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.title = true
vim.opt.wildmode = 'longest:full,full'
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.mouse = 'a'
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.termguicolors = true
vim.cmd [[let ayucolor='dark']]
vim.cmd [[colorscheme ayu]]
vim.o.completeopt = 'menuone,noselect'
vim.o.list = true
vim.opt.listchars = { tab = '↦ ', trail = '▬' }
vim.opt.fillchars:append({eob = ' '})
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true
vim.opt.scrolloff = 20
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir:remove('.')
