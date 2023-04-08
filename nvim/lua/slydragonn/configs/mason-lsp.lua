local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
	return
end

masonlsp.setup({
	automatic_installation = false,
	ensure_installed = {
--		"cssls",
--		"eslint",
--		"html",
--		"jsonls",
--		"tsserver",
--		"pyright",
--		"tailwindcss",
	},
})
