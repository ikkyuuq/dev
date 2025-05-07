-- Highlight on yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlist when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
	desc = "Highlight worh with visual",
	callback = function()
		vim.api.nvim_set_hl(0, "MiniCursorWord", { link = "Visual" })
		-- vim.api.nvim_set_hl(0, "MiniCursorWordCurrent", { link = "Visual" })
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("last-loc", { clear = true }),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("filetype", {
	group = vim.api.nvim_create_augroup("RustLog", { clear = true }),
	pattern = { "rust" },
	callback = function()
		vim.fn.setreg("l", "yoprintln!(" .. '"' .. "[LOG] jkpvb~A: {:?}" .. '"' .. ", " .. "jkpa);jk")
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		require("copilot.suggestion").dismiss()
		vim.b.copilot_suggestion_hidden = true
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuClose",
	callback = function()
		vim.b.copilot_suggestion_hidden = false
	end,
})
