return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "rcarriga/nvim-dap-ui", opts = {} },
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
	},
	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

		vim.keymap.set("n", "<M-y>", dap.continue)
		vim.keymap.set("n", "<M-i>", dap.step_into)
		vim.keymap.set("n", "<M-o>", dap.step_out)
		vim.keymap.set("n", "<M-p>", dap.step_back)
		vim.keymap.set("n", "<M-r>", dap.restart)

		dap.listeners.before.attach["dapui"] = function()
			ui.open()
		end
		dap.listeners.before.launch["dapui"] = function()
			ui.open()
		end
		dap.listeners.before.event_terminated["dapui"] = function()
			ui.close()
		end
		dap.listeners.before.event_exited["dapui"] = function()
			ui.close()
		end
	end,
}
