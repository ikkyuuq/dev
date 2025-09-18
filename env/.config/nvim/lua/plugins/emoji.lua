return {
  "allaman/emoji.nvim",
  version = "1.0.0", -- optionally pin to a tag
  ft = "typst", -- adjust to your needs
  dependencies = {
    "saghen/blink.cmp",
  },
  opts = {
    enable_cmp_integration = true,
  },
  config = function(_, opts)
    require("emoji").setup(opts)
  end,
}
