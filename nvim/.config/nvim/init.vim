let mapleader = " "

call plug#begin()
    " Appearance
    Plug 'rakr/vim-one'
    Plug 'itchyny/lightline.vim'

    " Telescope/find files
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

    " LSP
    Plug 'neovim/nvim-lspconfig'

    " Autocompletion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'onsails/lspkind-nvim'

    " Syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " Convenience
    Plug 'windwp/nvim-autopairs'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'lewis6991/gitsigns.nvim'

call plug#end()

lua require('torhuus')

lua << EOF
require('nvim-autopairs').setup{}

vim.g.lightline = {
    active = {
        left = {
            { 'mode', 'past' },
            { 'gitbranch', 'filename', 'modified' }
        }
    },
    component_function = {
        gitbranch = 'fugitive#head'
    }
}


require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = 'right_align'
    }
  }

local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  ensure_installed = "all",
    highlight = {
        enable = true
    }
}
EOF

syntax on
set noshowmode
set nowrap
set signcolumn=number
set autoindent
set termguicolors
set tabstop=2
set softtabstop=2
set expandtab
set smartindent
set shiftwidth=2
set number relativenumber
set numberwidth=2
set incsearch
set splitbelow
set splitright
set hidden
set scrolloff=12
set undofile
set mouse=r
set ignorecase
set smartcase
colorscheme one
set background=dark

nnoremap <silent> <leader>h :nohls<CR>
inoremap <silent> jk <esc>

nnoremap ;ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap ;fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap ;fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap ;fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gb :Git status<cr>
nnoremap <leader>ga :Git status<cr>
nnoremap <leader>gc :Git status<cr>
nnoremap <leader>gp :Git status<cr>









