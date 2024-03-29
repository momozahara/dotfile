local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "volar",
  "clangd",
  "prismals",
  "eslint",
  "emmet_ls",
  "jsonls",
  "rust_analyzer",
  "gopls",
  "csharp_ls",
  "jedi_language_server",
  "tailwindcss",
  "dockerls",
  "docker_compose_language_service",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

lspconfig.eslint.setup {
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = buffer,
      command = "EslintFixAll",
    })
  end,
  capabilities = capabilities,
}

--
-- lspconfig.pyright.setup { blabla}
