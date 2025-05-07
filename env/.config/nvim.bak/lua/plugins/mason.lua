return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- servers for mason to install
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"gopls",
				"emmet_ls",
				"emmet_language_server",
				"marksman",
				"bashls",
				"intelephense",
				"jsonls",
				"pyright",
				"rust_analyzer",
				"biome",
			},
			-- auto install configured servers (with lspconfig)
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"pylint",
				"clangd",
				"denols",
				"eslint_d",
			},
		})

		-- NOTE: Moved from lspconfig.lua

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["rust_analyzer"] = function()
				lspconfig.rust_analyzer.setup({
					settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["emmet_language_server"] = function()
				lspconfig.emmet_language_server.setup({
					filetypes = {
						"css",
						"eruby",
						"html",
						"javascript",
						"javascriptreact",
						"less",
						"sass",
						"scss",
						"pug",
						"typescriptreact",
					},
					-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
					-- **Note:** only the options listed in the table are supported.
					init_options = {
						---@type table<string, string>
						includeLanguages = {},
						--- @type string[]
						excludeLanguages = {},
						--- @type string[]
						extensionsPath = {},
						--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
						preferences = {},
						--- @type boolean Defaults to `true`
						showAbbreviationSuggestions = true,
						--- @type "always" | "never" Defaults to `"always"`
						showExpandedAbbreviation = "always",
						--- @type boolean Defaults to `false`
						showSuggestionsAsSnippets = false,
						--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
						syntaxProfiles = {},
						--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
						variables = {},
					},
				})
			end,
			["denols"] = function()
				lspconfig.denols.setup({
					capabilities = capabilities,
					root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"), -- Attach only if these files exist
				})
			end,
			["ts_ls"] = function()
				lspconfig.ts_ls.setup({
					capabilities = capabilities,
					root_dir = function(fname)
						-- Use tsserver unless a Deno-specific config is present
						local util = lspconfig.util
						return not util.root_pattern("deno.json", "deno.jsonc")(fname)
							and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
					end,
					single_file_support = false,
					init_options = {
						preferences = {
							includeCompletionsWithSnippetText = true,
							includeCompletionsForImportStatements = true,
						},
					},
				})
			end,
			["biome"] = function()
				lspconfig.biome.setup({
					cmd = { "biome", "lsp-proxy" },
					filetypes = {
						"astro",
						"css",
						"graphql",
						"javascript",
						"javascriptreact",
						"json",
						"jsonc",
						"svelte",
						"typescript",
						"typescript.tsx",
						"typescriptreact",
						"vue",
					},
					root_dir = function(fname)
						-- Use biome unless a Deno-specific config is present
						local util = lspconfig.util
						return not util.root_pattern("deno.json", "deno.jsonc")(fname)
							and util.root_pattern("biome.json", "biome.jsonc")(fname)
					end,
					single_file_support = false,
				})
			end,
		})
	end,
}
