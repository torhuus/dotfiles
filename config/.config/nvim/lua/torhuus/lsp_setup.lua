-- LSP Server config

-- CSS Language server setup
require("lspconfig").cssls.setup({
  cmd = { machineCmd, "--stdio" },
  settings = {
    scss = {
      lint = {
        idSelector = "warning",
        zeroUnits = "warning",
        duplicateProperties = "warning",
      },
      completion = {
        completePropertyWithSemicolon = true,
        triggerPropertyValueCompletion = true,
      },
    },
  },
  -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})

-- TS Language server setup
require("lspconfig").tsserver.setup({
  -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})


-- HTML Language server setup
require("lspconfig").html.setup({
  -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})


-- Python language server setup
require("lspconfig").pyright.setup({
  -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})

-- Prevent inline buffer annotations.
vim.diagnostic.open_float()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,{
  virtual_text = false,
  signs = true,
  underline = true,
  update_on_insert = false
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

vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]])
