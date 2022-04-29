-- Define general options to be set:
local opts = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	incsearch = true,
	mouse = "r",
	pumheight = 10,
	showmode = true,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	autoindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	timeoutlen = 1000,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	wrap = false,
	scrolloff = 999,
	sidescrolloff = 8,
	showcmd = true,
	confirm = true,
	termguicolors = true,
	background = "dark",
}

vim.opt.shortmess:append "c"

for k, v in pairs(opts) do
	vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]]
vim.cmd [[colorscheme tokyonight]]
