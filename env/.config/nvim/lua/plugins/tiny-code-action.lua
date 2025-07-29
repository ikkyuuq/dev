return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"folke/snacks.nvim",
			opts = {
				terminal = {},
			},
		},
	},
	event = "LspAttach",
	opts = {},
	vim.keymap.set({ "n", "x" }, "<leader>ca", function()
		require("tiny-code-action").code_action()
	end, { noremap = true, silent = true }),
}
