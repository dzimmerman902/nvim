local M = {
  'akinsho/bufferline.nvim',
  lazy = false
}

function M.config()
  local wk = require "which-key"

  wk.register {
      ["<leader>bp"] = { "<Cmd>BufferLineTogglePin<CR>", "Toggle Pin" },
      ["<leader>bP"] = { "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete Non-Pinned Buffers" },
      ["<leader>bo"] = { "<Cmd>BufferLineCloseOthers<CR>", "Delete Other Buffers" },
      ["<leader>br"] = { "<Cmd>BufferLineCloseRight<CR>", "Delete Buffers to the Right" },
      ["<leader>bl"] = { "<Cmd>BufferLineCloseLeft<CR>", "Delete Buffers to the Left" },
      ["<S-h>"] = { "<cmd>BufferLineCyclePrev<cr>", "Prev Buffer" },
      ["<S-l>"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
      ["[b"] = { "<cmd>BufferLineCyclePrev<cr>", "Prev Buffer" },
      ["]b"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
  }

  require('bufferline').setup({
    options = {
      close_command = function(n) require("mini.bufremove").delete(n, false) end
    }
  })
end

return M
