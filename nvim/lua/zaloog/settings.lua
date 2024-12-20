vim.cmd.colorscheme("kanagawa")

vim.opt.path = vim.opt.path + '**'
vim.opt.wildmenu = true -- display matching files when hitting tab
vim.opt.number = true -- show absolute number in current line
-- vim.opt.relativenumber = true -- show relative numbers 
vim.opt.clipboard = "unnamedplus" -- use clipboard for all operations
vim.opt.syntax = "on" -- syntax highlighting on
vim.opt.autoindent = true -- automatically indents when going to new line
vim.opt.expandtab = true -- expands tabstop to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.encoding = "UTF-8" -- File Encoding
vim.opt.ruler = true -- shows line:columnnumber of cursor positions
vim.opt.mouse = "a" -- mouse support for all modes
vim.opt.title = true -- show title of file
-- vim.opt.hidden = true -- buffer become hidden
-- vim.opt.ttimeoutlen = 0 -- time in ms until a key sequence is completed
vim.opt.showcmd = true -- show command in last line
vim.opt.showmatch = true -- show matching brackets
vim.opt.inccommand = "split" -- shows command preview in extra window

vim.opt.splitright = true -- ensures current window stays top left when splitting
vim.opt.splitbelow = true

-- enable Folding
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- save file when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.fn.expand("%") ~= "" then
      -- vim.cmd("silent! write")
      vim.cmd("write")
    end
  end,
})
