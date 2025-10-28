return {
  "thePrimeagen/harpoon",
  enabled = true,
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      global_settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })

    vim.keymap.set("n", "<leader>m", function()
      harpoon:list():add()
    end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), {
        border = "rounded",
        title_pos = "center",
        ui_width_ratio = 0.40,
      })
    end)

    --Harpoon marked files
    for i = 0, 9 do
      vim.keymap.set("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end)
    end

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<S-H>", function()
      if not harpoon:list() then
        vim.notify("No files in harpoon list")
      else
        harpoon:list():prev({ ui_nav_wrap = true })
      end
    end)
    vim.keymap.set("n", "<S-L>", function()
      if not harpoon:list() then
        vim.notify("No files in harpoon list")
      else
        harpoon:list():next({ ui_nav_wrap = true })
      end
    end)
  end,
}
