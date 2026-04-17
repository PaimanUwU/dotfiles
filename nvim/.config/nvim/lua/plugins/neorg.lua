return {
  -- 1. Unpin Treesitter and use the main branch
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- Use the latest (main branch)
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      highlight = { enable = true },
    },
  },
  {
    "vhyrro/luarocks.nvim", -- Use the full path here
    priority = 1000, -- We want this to load first
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "vhyrro/luarocks.nvim" },
    lazy = false,
    version = "*",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },
}
