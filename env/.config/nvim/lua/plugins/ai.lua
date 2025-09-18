return {
  {
    "supermaven-inc/supermaven-nvim",
    enabled = false,
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claude-code").setup({
        window = {
          split_ratio = 0.4,
          position = "vertical"
        }
      })
    end,

    vim.keymap.set("n", "<leader>cc", ":ClaudeCode<CR>", {desc = "Toggle Claude Code"})
  }
}
