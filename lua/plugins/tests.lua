return {
  "nvim-neotest/neotest",
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace "neotest"
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup {
      -- your neotest config here
      adapters = {
        require "neotest-go",
        require "neotest-rust",
        require "neotest-python",
        require "neotest-vitest",
        require "neotest-jest",
      },
    }
  end,
  ft = { "go", "rust", "python", "typescript" },
  dependencies = {
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
    "marilari88/neotest-vitest",
    "haydenmeade/neotest-jest",
  },
  keys = {
    { "<leader>Tr", "<cmd>lua require('neotest').run.run({ })<cr>", desc = "Run tests" },
  },
}