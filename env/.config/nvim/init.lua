require("core.options")
require("core.keymaps")
require("core.autocmds")

---@diagnostic disable: undefined-global
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.colortheme"),
	require("plugins.snacks"),
	require("plugins.oil"),
	-- require("plugins.lualine"),
	require("plugins.tpopestuff"),
	require("plugins.treesitter"),
	require("plugins.todo"),
	require("plugins.mini"),
	-- require("plugins.nvim-cmp"),
	require("plugins.blink"),
	require("plugins.lsp"),
	require("plugins.avante"),
	require("plugins.flash"),
	require("plugins.autopairs"),
	require("plugins.conform"),
	require("plugins.zen-mode"),
	require("plugins.gitsign"),
	require("plugins.grug-far"),
	require("plugins.noice"),
	require("plugins.vim-tmux-navigator"),
	require("plugins.tailwind-tools"),
	require("plugins.emmet"),
	require("plugins.telescope"),
	require("plugins.trouble"),
	-- require("plugins.harpoon"),
	require("plugins.undotree"),
	require("plugins.persistence"),
	require("plugins.showkeys"),
	require("plugins.gitworktree"),
	-- require("plugins.copilot"),
	require("plugins.linting"),
	require("plugins.yanky"),
	require("plugins.crates"),
	require("plugins.rustaceanvim"),
	require("plugins.nvim-dap"),
	require("plugins.supermaven"),
})

vim.cmd("colorscheme rose-pine")
