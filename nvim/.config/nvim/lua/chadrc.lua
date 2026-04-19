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

return M
