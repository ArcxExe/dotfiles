return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",
        "rust",
        "python",
        "bash",
        "fish",
        "hyprlang",
      }
    },
  },
  -- {
  --
  --   "williamboman/mason.nvim",
  --
  --   opts_extend = { "ensure_installed" },
  --   opts = {
  --     ensure_installed = {
  --       "lua-language-server",
  --       "stylua",
  --       "selene",
  --       "luacheck",
  --       "shellcheck",
  --       "shfmt",
  --       "pyright",
  --       "ruff",
  --       "rust-analyzer",
  --       "rustfmt",
  --       "hyprls",
  --     },
  --   },
  --   ---@param opts MasonSettings | {ensure_installed: string[]}
  -- config = function(_, opts)
  --   require("mason").setup(opts)
  --   local mr = require("mason-registry")
  --   mr.refresh(function()
  --     for _, tool in ipairs(opts.ensure_installed) do
  --       local p = mr.get_package(tool)
  --       if not p:is_installed() then
  --         p:install()
  --       end
  --     end
  --   end)
  -- end,
  -- },

}
