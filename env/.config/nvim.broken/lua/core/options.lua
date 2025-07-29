--- @diagnostic disable : undefined-global
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"

vim.o.ls = 24
vim.o.clipboard = "unnamedplus"
vim.o.wrap = false
vim.o.linebreak = false
vim.o.mouse = "a"
vim.o.autoindent = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.numberwidth = 2
vim.o.expandtab = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.whichwrap = "bs<>[]hl"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.showtabline = 1
vim.o.backspace = "indent,eol,start"
vim.o.pumheight = 10
vim.o.conceallevel = 0
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 0
vim.o.colorcolumn = "80"
vim.o.showmode = false
vim.o.hlsearch = false
vim.o.undofile = true
vim.o.guicursor = ""
vim.o.updatetime = 100
vim.o.timeoutlen = 400

-- vim.opt.iskeyword:remove("_")
-- vim.opt.iskeyword:append("-")

vim.opt.laststatus = 3
vim.opt.termguicolors = true

vim.g.markdown_recommended_style = 0

vim.g.rustaceanvim = function()
	local ext_path = vim.env.HOME .. "/.cache/yay/codelldb-bin/src/extension/"
	local codelldb_path = ext_path .. "adapter/codelldb"
	local liblldb_path = ext_path .. "lldb/lib/liblldb.so"

	local cfg = require("rustaceanvim.config")
	return {
		dap = {
			adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
		},
	}
end
