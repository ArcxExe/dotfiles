local options = {
  formatters_by_ft = {
    python = {"ruff"},
    lua = { "stylua" },
    bash = { "shfmt"},
    rust = {"rustfmt"},
    cpp = {"cpplint"},
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
