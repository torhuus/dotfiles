local fn = vim.fn

-- Install packer automatically
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close, and reopen Neovim after..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocmd that reloads neovim whenever plugins file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Use protctd call as to not error out before plugins are installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Packer didnt work..")
  return
end

-- Packer popup window! [ ]
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded"}
    end
  }
}

return packer.startup(function(use)

-- Plugins time
use "wbthomason/packer.nvim" -- let packer manage itself
use "neovim/nvim-lspconfig"

-- Treesitter
use {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate'}

-- Telescope/file system management
use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}

-- Theme
use "folke/tokyonight.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
