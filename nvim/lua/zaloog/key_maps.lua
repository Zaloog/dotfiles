-- Save
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>")

-- Quit
vim.keymap.set("n", "<leader><leader>q", "<CMD>q<CR>")

-- Exit insert mode
vim.keymap.set("i", "<C-c>", "<ESC>")

-- Windows
vim.keymap.set("n", "<leader>n", "<CMD>vsplit<CR>")
vim.keymap.set("n", "<leader>p", "<CMD>split<CR>")

-- NeoTree
-- vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle<CR>")
-- vim.keymap.set("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffers
vim.keymap.set("n", "<C-j>", "<CMD>bprevious<CR>", {})
vim.keymap.set("n", "<C-k>", "<CMD>bnext<CR>", {})
vim.keymap.set("n", "<leader>q", "<CMD>bd<CR>", {})


vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gb", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- vim.keymap.set("n", "<leader>h", vim.lsp.buf.references, {})

-- Move selected lines with shift+j or shift+k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Terminal
-- vim.keymap.set("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>", {})
-- vim.keymap.set("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>", {})
-- vim.keymap.set('n', '<C-e><C-e>','<CMD>TermExec cmd="pyexe %"<CR>i', {})
-- vim.keymap.set("t", "<C-e>", "<C-\\><C-n>:q<CR>", {})

-- Markdown Preview
-- vim.keymap.set("n", "<leader>m", "<CMD>MarkdownPreview<CR>", {})
-- vim.keymap.set("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>", {})

-- Window Navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", {})
-- vim.keymap.set("n", "<C-l>", "<C-w>l", {})
-- vim.keymap.set("n", "<C-k>", "<C-w>k", {})
-- vim.keymap.set("n", "<C-j>", "<C-w>j", {})

-- Resize Windows
-- vim.keymap.set("n", "<C-Left>", "<C-w><", {})
-- vim.keymap.set("n", "<C-Right>", "<C-w>>", {})
-- vim.keymap.set("n", "<C-Up>", "<C-w>+", {})
-- vim.keymap.set("n", "<C-Down>", "<C-w>-", {})
