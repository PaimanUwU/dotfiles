---@type ChadrcConfig
local M = {}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                                     ",
    " PaimanUwU on                                        ",
    "                                                     ",
    " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
  },
  buttons = {
    { txt = "  Find File", keys = "f", cmd = "Telescope find_files" },
    { txt = "󱘲  Explorer",  keys = "e", cmd = "lua Snacks.picker.explorer()" },
    { txt = "  Cheatsheet", keys = "c", cmd = "NvCheatsheet" },
    { txt = "󰚰  Update",      keys = "u", cmd = "Lazy sync" },
    { txt = "󱑫  Mason",       keys = "m", cmd = "Mason" },
    { txt = "󰒲  Lazy",        keys = "l", cmd = "Lazy" },
    { txt = "󰈆  Quit",        keys = "q", cmd = "qa" },
  },
}

M.ui = {
  statusline = {
    separator_style = "block",
    theme = "default",
    background = "#1E1D2D",
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "diagnostics",
      "cwd",
      "cursor",
    },
  },
}

M.base46 = {
  theme = "catppuccin",
  hl_override = {
    -- Base statusline background
    StatusLine = { bg = "#1E1D2D" },
    
    -- NvChad specific statusline background groups
    St_DefaultWidgets = { bg = "#1E1D2D" },
    St_EmptySpace = { bg = "#1E1D2D" },

    -- Ensure your other floats and backdrops stay consistent
    NormalFloat = { bg = "#1E1D2D" },
    FloatBorder = { fg = "#313244", bg = "#1E1D2D" },
    SnacksNormal = { bg = "#1E1D2D" },
    
    -- Keep your previous Visual and Comment overrides
    Visual = { bg = "#3e4452", fg = "NONE" },
    Comment = { italic = true },
    

    -- Heading Backgrounds (Force high-contrast blocks)
    RenderMarkdownH1Bg = { fg = "#1e1e2e", bg = "#89b4fa", bold = true }, -- Blue
    RenderMarkdownH2Bg = { fg = "#1e1e2e", bg = "#a6e3a1", bold = true }, -- Green
    RenderMarkdownH3Bg = { fg = "#1e1e2e", bg = "#f9e2af", bold = true }, -- Yellow
    RenderMarkdownH4Bg = { fg = "#1e1e2e", bg = "#f5c2e7", bold = true }, -- Pink
    RenderMarkdownH5Bg = { fg = "#1e1e2e", bg = "#94e2d5", bold = true }, -- Teal
    RenderMarkdownH6Bg = { fg = "#1e1e2e", bg = "#fab387", bold = true }, -- Peach

    -- Heading Icons (Foreground only)
    RenderMarkdownH1 = { fg = "#89b4fa" },
    RenderMarkdownH2 = { fg = "#a6e3a1" },
    RenderMarkdownH3 = { fg = "#f9e2af" },

    -- Table borders to make them look like the TUI repo
    RenderMarkdownTableHead = { fg = "#89b4fa", bold = true },
    RenderMarkdownTableFill = { fg = "#313244" }, -- The line color
    
    -- Code block background (to stand out from your #1E1D2D)
    RenderMarkdownCode = { bg = "#181825" },
  },
  changed_themes = {
    catppuccin = {
      base = "#1E1D2D",
      mantle = "#1E1D2D",
      crust = "#1E1D2D",
    },
    all = {
      base_16 = {
        base01 = "#1E1D2D",
        base02 = "#1E1D2D",
      }
    }
  }
}

return M
