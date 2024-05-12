-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "phpactor", "gopls"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.phpactor.setup {
 root_dir = function(_) return vim.loop.cwd() end,
  init_options = {
    ["language_server.diagnostics_on_update"] = true,
    ["language_server.diagnostics_on_open"] = true,
    ["language_server.diagnostics_on_save"] = true,
    ["language_server_phpstan.enabled"] = true,
    ["language_server_psalm.enabled"] = true,
  }
}

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    client.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
      }
    )
  end,
}

