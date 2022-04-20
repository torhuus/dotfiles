require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "html", "css", "scss", "javascript", "tsx", "typescript", "python", "yaml", "dockerfile", "vim" },

	  highlight = {
    enable = true,
  }
}
