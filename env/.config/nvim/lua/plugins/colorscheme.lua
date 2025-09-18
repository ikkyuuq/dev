return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
    lazy = false,
		priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
        }
      })
    end
	},
	{
		"vague2k/vague.nvim",
		name = "vague",
    lazy = false,
		config = function()
			require("vague").setup({})
		end,
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
	},
}
