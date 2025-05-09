return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt" },
			javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			css = { "biome", "prettierd", "prettier", stop_after_first = true },
			graphql = { "biome", "prettierd", "prettier", stop_after_first = true },
			json = { "biome", "prettierd", "prettier", stop_after_first = true },
			jsonc = { "biome", "prettierd", "prettier", stop_after_first = true },
			go = { "gofmt", "goimports" },
		},
	},
}
