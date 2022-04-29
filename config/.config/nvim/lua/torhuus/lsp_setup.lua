local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = {buffer=0, silent=true, noremap=true}

-- Configuring TS language server
require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
  on_attach = function(client)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) -- hover doc
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- go to def
    vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, {buffer=0}) -- go to def
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- implementations
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer=0}) --rename
    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {buffer=0}) -- code actions
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0}) -- code actions
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0}) -- code actions
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", {buffer=0}) -- code actions
  end,
}

vim.opt.completeopt={"menu","menuone","noselect"}

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i','c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i','c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i','c'}),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({select=true}),
    },
  sources= cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },{
    {name='buffer'},
  })
})


local signs = {
  Error = "ﰸ",
  Warn = "",
  Hint = "",
  Info = "",
}

for type, icon in pairs(signs) do
  local h1 = "DiagnosticSign" .. type
  vim.fn.sign_define(h1, {text = icon, texth1 = h1, nuhl = nil})
end

--vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]])


