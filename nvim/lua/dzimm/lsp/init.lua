local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("dzimm.lsp.handlers").setup()
require("dzimm.lsp.null-ls")
