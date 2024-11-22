return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
  },
  opts = {}
}
