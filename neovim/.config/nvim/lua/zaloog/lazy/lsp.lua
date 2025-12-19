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

    -- Global capabilities for nvim-cmp (applied to EVERY server)
    vim.lsp.config("*", {
      capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      ),
    })

    -- UI feedback
    require("fidget").setup({})

    -- Mason
    require("mason").setup()

    -- Mason -> LSP bridge (ensures servers are installed)
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ty",
        -- "basedpyright",
        "ruff",
        "rust_analyzer",
      },
      automatic_installation = true,
    })


    -- Lua
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim", "love" } },
          workspace = { library = vim.env.VIMRUNTIME },
          telemetry = { enable = false },
        },
      },
    })

    -- Rust
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = false,
        },
      },
    })

    -- Enable all the servers
    vim.lsp.enable({
      "lua_ls",
      "ty",
      -- "basedpyright",
      "ruff",
      "rust_analyzer",
    })
  end,
}
