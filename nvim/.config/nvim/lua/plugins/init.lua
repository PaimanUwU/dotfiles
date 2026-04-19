return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false, -- Load on startup so it's ready for immediate navigation
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        sources = {
          explorer = {
            -- Forces the explorer to the right
            layout = { layout = { position = "right" } },
          },
        },
        layouts = {
          sidebar = {
            layout = { position = "right" },
          },
        },
      },
      -- Recommended: Enable other snacks features you might like
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {}, -- You can add custom config here later
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- 1. Use rounded separators for the internal sections
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = ""

      -- 2. Round the leftmost edge (Section A)
      -- We add a left separator to the first component in lualine_a
      if opts.sections.lualine_a and opts.sections.lualine_a[1] then
        opts.sections.lualine_a[1] = {
          opts.sections.lualine_a[1],
          separator = { left = "" }, -- Rounded outer left
          padding = { left = 1, right = 1 },
        }
      end

      -- 3. Round the rightmost edge (Section Z)
      -- We add a right separator to the last component in lualine_z
      if opts.sections.lualine_z and #opts.sections.lualine_z > 0 then
        local last_idx = #opts.sections.lualine_z
        opts.sections.lualine_z[last_idx] = {
          opts.sections.lualine_z[last_idx],
          separator = { right = "" }, -- Rounded outer right
          padding = { left = 1, right = 1 },
        }
      end
    end,
  },

  -- Render Markdown (In-editor visuals)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {},
  },

  -- Live Browser Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },


  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "markdown", "markdown_inline", "lua", "vim" },
      highlight = { enable = true }, -- THIS MUST BE TRUE
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = { -- Insert mode
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
          n = { -- Normal mode
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern", 
      win = {
        border = "single",
        padding = { 1, 2 },
      },
      layout = {
        -- This is the "secret sauce" for the list view
        columns = 1, -- Forces everything into a single vertical column
        align = "left",
        spacing = 3,
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
    },
  }

  -- test new blink
  --
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
