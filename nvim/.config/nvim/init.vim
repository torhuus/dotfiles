" Tor Einar Huus' NVIM config

" ~~~ [GENERAL]

let mapleader = " "

set completeopt=menuone,noinsert,noselect
set mouse=a
set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set scrolloff=999
set number relativenumber
set ignorecase
set numberwidth=1
set noswapfile
set splitbelow
set splitright
set smartcase
set incsearch
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
set signcolumn=yes
set updatetime=250
set encoding=UTF-8


" ~~~ [PLUGINS]

call plug#begin('~/.config/nvim/plugged')
	" [Look & feel]
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'akinsho/bufferline.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'Yggdroot/indentLine'
	" [Navigation & search]
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
	Plug 'airblade/vim-rooter'
	" [Focused writing]
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/limelight.vim'
	" [LSP & Autocompletion]
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'jose-elias-alvarez/null-ls.nvim'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'onsails/lspkind-nvim'
	" [Git management]
	Plug 'lewis6991/gitsigns.nvim'	
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	" [Disabled plugins]
	"Plug 'dense-analysis/ale'
	"Plug 'vimwiki/vimwiki' "Create a personal wiki/diary/documentation
call plug#end()

lua require('torhuus')
packadd nvim-treesitter

" ~~~ [COLORSCHEME AND COLORS] 

colorscheme tokyonight
set background=dark

if (has("termguicolors"))
	set termguicolors
endif


" ~~~ [KEYMAPPING]
inoremap jk <Esc> 
nnoremap <silent> <leader>h :nohls<CR>

" FZF
nnoremap <silent> <leader>f :Telescope find_files<CR>
nnoremap <silent> <leader>b :Telescope buffers<CR>
nnoremap <silent> <leader>g :Telescope live_grep<CR>

" Goyo maps
nnoremap <leader>! :Goyo<CR>
" Limelight for goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Git stuff
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
