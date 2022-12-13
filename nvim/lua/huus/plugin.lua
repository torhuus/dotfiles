vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Ayu colortheme
use 'ayu-theme/ayu-vim'

-- Telescope plugin for searching fuzzy finding
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- LSP
use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

use { -- Autocompletion
	'hrsh7th/nvim-cmp',
	requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	}

use 'nvim-lualine/lualine.nvim' -- Fancier statusline

use "lukas-reineke/indent-blankline.nvim"

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ':TSUpdate',
    }

end)
