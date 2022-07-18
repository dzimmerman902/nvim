local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "dzimm.lsp.lsp-installer"
require "dzimm.lsp.handlers".setup()
require "dzimm.lsp.null-ls"
