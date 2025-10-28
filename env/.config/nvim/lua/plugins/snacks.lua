return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    git = { enabled = true },
    lazygit = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    image = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true }
      }
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
  },
  keys = {
    -- Picker
    { "<leader><leader>", function() Snacks.picker.smart() end,                 desc = "Find smart" },
    { "<leader>pf",       function() Snacks.picker.files() end,                 desc = "Find files" },
    { "<leader>ph",       function() Snacks.picker.help() end,                  desc = "Find help" },
    { "<leader>pp",       function() Snacks.picker.projects() end,              desc = "Find projects" },
    { "<leader>pb",       function() Snacks.picker.buffers() end,               desc = "Find buffers" },
    { "<leader>pg",       function() Snacks.picker.grep() end,                  desc = "Find by grep" },
    { "<leader>pw",       function() Snacks.picker.grep_word() end,             desc = "Find by current word" },
    { "<leader>pc",       function() Snacks.picker.colorschemes() end,          desc = "Find colorscheme" },
    -- Git
    { "<leader>gb",       function() Snacks.picker.git_branches() end,           desc = "Git brances" },
    { "<leader>gd",       function() Snacks.picker.git_diff() end,              desc = "Git diff" },
    { "<leader>gl",       function() Snacks.picker.git_log() end,               desc = "Git log" },
    { "<leader>gL",       function() Snacks.picker.git_log_line() end,               desc = "Git log" },
    { "<leader>gg",       function() Snacks.lazygit() end,                      desc = "Lazygit" },
    -- LSP
    { "gd",               function() Snacks.picker.lsp_definitions({auto_confirm = true, include_current = false, nowait = true }) end,       desc = "Goto Definition" },
    { "gD",               function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
    { "gr",               function() Snacks.picker.lsp_references({nowait = true}) end,        desc = "References" },
    { "gI",               function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
    { "gy",               function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
    { "<leader>ss",       function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
    { "<leader>sS",       function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  }
}
