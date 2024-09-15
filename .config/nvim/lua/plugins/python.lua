return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     local servers = { "pyright","ruff_lsp", ruff, lsp }
  --     for _, server in ipairs(servers) do
  --       opts.servers[server] = opts.servers[server] or {}
  --       opts.servers[server].enabled = server == lsp or server == ruff
  --     end
  --   end,
  -- },
}
