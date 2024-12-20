return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
	    "html",
	    "python",
	    "rust",
	--"vim",
	--"vimdoc",
	--"elixir",
	--"javascript",
	--"typescript"
      },
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      fold = {enable = true}
    })
  end
}
