-- Adapted from a combo of
-- https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup()
    require("mason").setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        "lua_ls",
        "basedpyright",
        "ruff",
        "cssls",
      },
      automatic_installation = true,
      handlers = {
        function(server_name)
-- Lua Setup
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
          })
        end,
        lua_ls = function()
          require('lspconfig').lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim", "love" } },
                workspace = { library = { vim.env.VIMRUNTIME } },
              },
            },
          })
        end,
-- Python Setup
        basedpyright = function()
              require('lspconfig').basedpyright.setup({
                capabilities = capabilities,
                settings = {
                  basedpyright = {
                    analysis = {
                      ignore = { "*" },
                      typeCheckingMode = "off",
                      diagnosticMode = "openFilesOnly",
                      autoImportCompletions = true,
                    },
                  },
                },
              })
          end,
        cssls = function()
            require('lspconfig').cssls.setup({
                capabilities = capabilities,
                filetypes = { "css", "tcss" }, -- Add support for both css and tcss files
            })
        end,
        }
    })
end
}
