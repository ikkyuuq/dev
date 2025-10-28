local util = require "utils.lsp"

return {
	cmd = { "arduino-language-server" },
	filetypes = { "arduino" },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(util.root_pattern('*.ino')(fname))
  end,
	root_markers = { "*.ino" },
	capabilities = {
		textDocument = {
			semanticTokens = vim.NIL,
		},
		workspace = {
			semanticTokens = vim.NIL,
		},
	},
}
