local bufnr = vim.api.nvim_get_current_buf()
local opts = { silent = true, buffer = bufnr }

vim.keymap.set("n", "<leader>dr", function()
	vim.cmd.RustLsp("debuggables")
end, opts)

vim.keymap.set("n", "<leader>rd", function()
	vim.cmd.RustLsp("relatedDiagnostics")
end, opts)

vim.keymap.set("n", "K", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, opts)
