local global = vim.g
local o = vim.o

-- Map <leader> = the space key

global.mapleader = " "
global.maplocalleader = " "
global.python3_host_prog = "C:/Users/GNCZD/Envs/neovim/Scripts/python.exe"

-- Editor options

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.encoding = "UTF-8"
o.ruler = true
o.mouse = "a"
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.splitbelow = "splitright"

o.shell = "pwsh"
o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
o.shellquote = ""
o.shellxquote = ""
