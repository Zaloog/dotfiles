return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'rebelot/kanagawa.nvim',
  },
  config = function()
    vim.cmd.colorscheme("kanagawa")
    vim.opt.termguicolors = true
    require('bufferline').setup {}
  end
}
