--------------------------------------------------
-- Editor options
vim.opt.path = vim.opt.path + '**'
-- display matching files when hitting tab
vim.opt.wildmenu = true
-- show absolute number in current line
vim.opt.number = true
-- show relative numbers 
vim.opt.relativenumber = true
-- use clipboard for all operations
vim.opt.clipboard = "unnamedplus"
-- syntax highlighting on
vim.opt.syntax = "on"
-- automatical;y indents when going to new line
vim.opt.autoindent = true
-- expands tabstop to 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- File Encoding
vim.opt.encoding = "UTF-8"
-- shows line:columnnumber of cursor positions
vim.opt.ruler = true
-- mouse support for all modes
vim.opt.mouse = "a"
-- show title of file
vim.opt.title = true
-- buffer become hidden
vim.opt.hidden = true
-- time in ms until a key sequence is completed
vim.opt.ttimeoutlen = 0
-- show command in last line
vim.opt.showcmd = true
-- show matching brackets
vim.opt.showmatch = true
-- shows command preview in extra window
vim.opt.inccommand = "split"
-- ensures current window stays top left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Autocomplete Options
--vim.opt.completeopt = menuone

vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""


-- Mappings
-- Map <leader> to space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NETRW default Explorer
-- netrw disable ugly banner
vim.g.netrw_banner = 0
-- netrw file opening in same window
vim.g.netrw_browse_split = 0
-- netrw file split to 0=left/ 1=right
vim.g.netrw_altv = 1
-- netrw file preview in tree view
vim.g.netrw_liststyle = 3

-- Save
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>")
-- Quit
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>")
-- Exit insert
vim.keymap.set("i", "<C-c>", "<ESC>")

-- Windows splitting
vim.keymap.set("n", "<leader><leader>l", "<CMD>vsplit<CR>")
vim.keymap.set("n", "<leader><leader>j", "<CMD>split<CR>")

-- File Browsing with netrw
vim.keymap.set("n", "<leader>e", "<CMD>edit .<CR>")

-- Buffer Changing
vim.keymap.set("n", "<TAB>", "<CMD>bnext<CR>")
vim.keymap.set("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- Terminal
--vim.keymap.set("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
--vim.keymap.set("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")
--vim.keymap.set('n', '<C-e><C-e>','<CMD>TermExec cmd="pyexe %"<CR>i')
--vim.keymap.set("t", "<C-e>", "<C-\\><C-n>:q<CR>")

-- Markdown Preview
-- vim.keymap.set("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
-- vim.keymap.set("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>")

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Resize Windows
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Down>", "<C-w>-")

-- Map Ctrl+j and Ctrl+l for popupmenu navigation in Neovim
vim.api.nvim_set_keymap('i', '<C-j>', 'pumvisible() ? "<C-j>" : "<C-n>"', { expr = true })
vim.api.nvim_set_keymap('i', '<C-k>', 'pumvisible() ? "<C-k>" : "<C-p>"', { expr = true })

-- Snippets
local snip_if_name = "$HOME/.vimrc"

vim.keymap.set("n", ",if", ":-1read "..snip_if_name.."<CR>")


-- Colorscheme

	-- cmp: Autocomplete
--	use({
--		"hrsh7th/nvim-cmp",
--		event = "InsertEnter",
--		config = function()
--			require("slydragonn.configs.cmp")
--		end,
--	})
--
--	-- autopairs
--	use({
--		"windwp/nvim-autopairs",
--		config = function()
--			require("slydragonn.configs.autopairs")
--		end,
--	})


-- Plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin')

  -- Kanagawa Colorscheme
  Plug('rebelot/kanagawa.nvim')
  -- Autopair
  Plug('windwp/nvim-autopairs')

vim.call('plug#end') 


-- Activate Colorscheme
vim.cmd('colorscheme kanagawa')
-- Activate Autopairs
require("nvim-autopairs").setup()

