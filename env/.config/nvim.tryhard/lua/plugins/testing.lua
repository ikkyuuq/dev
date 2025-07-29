return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- Adapters
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-jest",
			"rouge8/neotest-rust",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
					}),
					require("neotest-go"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
					require("neotest-rust"),
				},
			})

			vim.keymap.set("n", "<leader>tt", function()
				neotest.run.run(vim.fn.expand("%"))
			end, { desc = "Run File Tests" })
			vim.keymap.set("n", "<leader>tT", function()
				neotest.run.run(vim.uv.cwd())
			end, { desc = "Run All Test Files" })
			vim.keymap.set("n", "<leader>tr", function()
				neotest.run.run()
			end, { desc = "Run Nearest Test" })
			vim.keymap.set("n", "<leader>tl", function()
				neotest.run.run_last()
			end, { desc = "Run Last Test" })
			vim.keymap.set("n", "<leader>ts", function()
				neotest.summary.toggle()
			end, { desc = "Toggle Test Summary" })
			vim.keymap.set("n", "<leader>to", function()
				neotest.output.open({ enter = true, auto_close = true })
			end, { desc = "Show Test Output" })
			vim.keymap.set("n", "<leader>tO", function()
				neotest.output_panel.toggle()
			end, { desc = "Toggle Test Output Panel" })
			vim.keymap.set("n", "<leader>tS", function()
				neotest.run.stop()
			end, { desc = "Stop Test" })
			vim.keymap.set("n", "<leader>tw", function()
				neotest.watch.toggle(vim.fn.expand("%"))
			end, { desc = "Toggle Test Watch" })
		end,
	},
}