local capabilities = vim.lsp.protocol.make_client_capabilities()

require("lvim.lsp.manager").setup("tsserver", {
  settings = {
    diagnostics = { ignoredCodes = { 6133 } }
  },
})

require("lvim.lsp.manager").setup("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      lens = {
        run = {
          enable = false
        },
        debug = {
          enable = false
        }
      }
    }
  }
})

require("lvim.lsp.manager").setup("emmet_ls", {
  cmd = { "emmet-ls", "--stdio" },
  capabilities = capabilities,
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  }
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "eslint_d",
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact"
    }
  }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact"
    }
  }
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    exe = "eslint_d",
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact"
    },
  },
}
