local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "phpactor", "gopls", "tsserver", "emmet_ls" }

capabilities.textDocument.completion.completionItem.snippetSupport = true

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

-- lspconfig.gopls.setup {
--   on_attach = function(client, bufnr)
--     -- Call original on_attach
--     on_attach(client, bufnr)
--     -- Additional config for gopls
--     client.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--       vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = true,
--         signs = true,
--         underline = true,
--         update_in_insert = true,
--       }
--     )
--   end,
-- }

local vue_language_server_path = vim.fn.expand('~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server')

lspconfig.tsserver.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false,
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "blade.php", "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
})

