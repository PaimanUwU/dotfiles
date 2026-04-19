---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  changed_themes = {
    catppuccin = {
      base = "#1E1E2E",
      mantle = "#1E1E2E",
      crust = "#1E1E2E",
    }
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    SnacksNormal = { bg = "#1E1E2E" },
    SnacksPickerNormal = { bg = "#1E1E2E" },
  }, -- Ensure this brace is closed
} -- <--- ADD A COMMA HERE if you define nvdash inside a single M table, 
  -- or just ensure this block is fully closed before starting M.nvdash.

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                                    ",
    " PaimanUwU on                                       ",
    "                                                    ",
    " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                    ",
    "                                                    ",
    "                                                    ",
    "                                                    ",
    "                                                    ",
  },
  buttons = {
    { txt = "  Find File", keys = "f", cmd = "Telescope find_files" },
    { txt = "󱘲  Explorer",  keys = "e", cmd = "lua Snacks.picker.explorer()" },
    { txt = "  Cheatsheet", keys = "c", cmd = "NvCheatsheet" },
    { txt = "󰚰  Update",     keys = "u", cmd = "Lazy sync" },
    { txt = "󱑫  Mason",      keys = "m", cmd = "Mason" },
    { txt = "󰒲  Lazy",       keys = "l", cmd = "Lazy" },
    { txt = "󰈆  Quit",       keys = "q", cmd = "qa" },
  },
}

M.ui = {
  statusline = {
    separator_style = "block",
    theme = "default",
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
    -- Selection visibility fix
    Visual = { bg = "#3e4452", fg = "NONE" },
    -- Your other overrides
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    NormalFloat = { bg = "#1E1D2D" },
    FloatBorder = { fg = "#313244", bg = "#1E1D2D" },
    WhichKey = { bg = "#1E1D2D" },
    WhichKeyFloat = { bg = "#1E1D2D" },
    SnacksNormal = { bg = "#1E1D2D" },
    SnacksBackdrop = { bg = "#1E1D2D" },
  },
  changed_themes = {
    all = {
      base_16 = {
        base01 = "#1E1D2D",
        base02 = "#1E1D2D",
      }
    }
  }
}

return M
