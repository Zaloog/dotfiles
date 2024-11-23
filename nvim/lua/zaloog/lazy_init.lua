local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- vim.filetype.add({
--   extension = {
--     tcss = "css", -- Treat .tcss as css
--   },
-- })

require("lazy").setup({
    spec = "zaloog.lazy",
    change_detection = { notify = false }
})


