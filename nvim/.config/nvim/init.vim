" Tor Einar Huus' NVIM config
call plug#begin('~/.vim/plugged')
	Plug 'gruvbox-community/gruvbox'
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/vim-gitbranch'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'kassio/neoterm'
	Plug 'junegunn/goyo.vim'
	Plug 'Yggdroot/indentLine'
	Plug 'airblade/vim-rooter'
	Plug 'airblade/vim-gitgutter'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
	Plug 'junegunn/limelight.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	" Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	Plug 'onsails/lspkind-nvim'
	"Plug 'dense-analysis/ale'
	"Plug 'vimwiki/vimwiki' "Create a personal wiki/diary/documentation
call plug#end()

" Default sets
set completeopt=menuone,noinsert,noselect
set mouse=a
set splitright
set nocompatible
set splitbelow
set tabstop=2
set shiftwidth=2
set scrolloff=8
set number relativenumber
set ignorecase
set smartcase
set incsearch
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
set signcolumn=yes
"set updatetime=750 commented out due to coc sets this to 300
filetype plugin indent on
let mapleader = " "
if (has("termguicolors"))
	set termguicolors
endif
let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript','js=javascript', 'json=javascript']
nnoremap <leader>v :e $MYVIMRC<CR>

" Colorscheme
colorscheme gruvbox

" Command line config
let g:lightline = {
	\ 'active': {
	\		'left': [['mode', 'paste'],
	\						['gitbranch','readonly','filename','modified']]
	\},
	\'component_function': {
	\		'gitbranch': 'gitbranch#name'
	\},
	\'colorscheme': 'wombat',
	\}

" COC Setup
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Keymaps
inoremap jk <Esc>
nnoremap <silent><leader>h :nohls<CR>

" Neoterm terminal emulator settings
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 60
let g:neoterm_autoinsert = 1
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <Esc>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>

" FZF
nnoremap <silent> <leader>f :Telescope find_files<CR>
nnoremap <silent> <leader>b :Telescope buffers<CR>
nnoremap <silent> <leader>g :Telescope live_grep<CR>

" Git stuff
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1

" Goyo maps
nnoremap <leader>! :Goyo<CR>
" Limelight for goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

lua require('torhuus')
packadd nvim-treesitter
