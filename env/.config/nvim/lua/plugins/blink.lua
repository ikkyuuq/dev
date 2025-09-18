return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "L3MON4D3/LuaSnip", keys = {} },
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
      "saghen/blink.compat"
		},
		version = "*",
		config = function()
			require("blink.cmp").setup({
				snippets = { preset = "luasnip" },
				signature = { enabled = true },
				appearance = {
					use_nvim_cmp_as_default = false,
					nerd_font_variant = "normal",
				},
				sources = {
					default = { "lazydev", "lsp", "path", "snippets", "buffer", "emoji" },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
						cmdline = {
							min_keyword_length = 2,
						},
						emoji = {
							name = "emoji",
							module = "blink.compat.source",
							transform_items = function(ctx, items)
								local kind = require("blink.cmp.types").CompletionItemKind.Text
								for i = 1, #items do
									items[i].kind = kind
								end
								return items
							end,
						},
					},
				},
				keymap = {
					["<C-f>"] = {},
				},
				cmdline = {
					enabled = false,
					completion = { menu = { auto_show = true } },
					keymap = {
						["<CR>"] = { "accept_and_enter", "fallback" },
					},
				},
				completion = {
					menu = {
						border = nil,
						scrolloff = 1,
						scrollbar = false,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", "label_description", gap = 1 },
								{ "kind" },
								{ "source_name" },
							},
						},
					},
					documentation = {
						window = {
							border = nil,
							scrollbar = false,
							winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						},
						auto_show = true,
						auto_show_delay_ms = 500,
					},
				},
			})

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
