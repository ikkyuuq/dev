return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  opts = {
    foldtext = {
      lineCount = {
        template = " %d"
      }
    }
  },
  init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99

    local fold_util = require("utils.folds")

    vim.keymap.set("n", "[[", fold_util.goto_previous_fold, { noremap = true, silent = true })
    vim.keymap.set("n", "]]", "zj", { noremap = true, silent = true })

    vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "LspAttach" }, {
      callback = function(opts)
        fold_util.update_ranges(opts.buf)
      end,
    })

    local last_row = nil
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = function(opts)
        local row = vim.api.nvim_win_get_cursor(0)[1]
        if row ~= last_row then
          last_row = row

          fold_util.update_current_fold(row, opts.buf)
        end
      end,
    })

    vim.api.nvim_create_autocmd({ "BufUnload", "BufWipeout" }, {
      callback = function(opts)
        fold_util.clear(opts.buf)
      end,
    })

    vim.opt.statuscolumn = "%!v:lua.StatusCol()"
    function _G.StatusCol()
      return fold_util.statuscol()
    end
  end
}

