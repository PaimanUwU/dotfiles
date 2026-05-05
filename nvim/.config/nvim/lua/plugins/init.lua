return {

  -- BASE ------------------------------------------------------------------------------------------------------------
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "markdown", "markdown_inline",
       "java"
  		},
      highlight = { enable = true }, -- THIS MUST BE TRUE
  	},
  },

  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
          },
        },
        layouts = {
          sidebar = {
            layout = { position = "right" },
          },
        },
      },
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
    opts = {},
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = ""

      if opts.sections.lualine_a and opts.sections.lualine_a[1] then
        opts.sections.lualine_a[1] = {
          opts.sections.lualine_a[1],
          separator = { left = "" }, -- Rounded outer left
          padding = { left = 1, right = 1 },
        }
      end

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
      preset = "helix",
      sort = { "local", "order", "group", "alphanum" },
      win = {
        border = "single",
        padding = { 1, 2 },
        col = 1,
        width = 40,
        height = { min = 20, max = 50 },
      },
      layout = {
        columns = 1,
        align = "left",
        spacing = 3,
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        mapping = false,
      },
    },
  },

  {
    "Zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      aggressive_mode = false,
      excluded_lsp_clients = { "lua_ls" },
    }
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },


  -- NOTE TAKING ------------------------------------------------------------------------------------------------------------
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, 
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },


  -- JAVA DEVELOPMENT ------------------------------------------------------------------------------------------------------------
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = { "jdtls" },
  --   },
  -- },

  {
    "nvim-java/nvim-java",
    -- We change 'ft = "java"' to 'lazy = true' and use a command
    cmd = "JavaStart", 
    config = function()
      require("java").setup()
      require("lspconfig").jdtls.setup({
        on_attach = require("nvchad.configs.lspconfig").on_attach,
        capabilities = require("nvchad.configs.lspconfig").capabilities,
      })
    end,
  },
}
