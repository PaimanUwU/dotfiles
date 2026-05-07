require "nvchad.mappings"

local map = vim.keymap.set

-- 0. Cleanup NvChad Defaults (Avoid Conflicts)
local del = vim.keymap.del
del("n", "<leader>h") -- Remove terminal horizontal
del("n", "<leader>v") -- Remove terminal vertical
del("n", "<leader>x") -- Remove default buffer close
del("n", "<leader>b") -- Clear default buffer group
del("n", "<leader>n") -- line number

-- 1. General & UI
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "q", "<Nop>", { desc = "Disable macro recording" })

-- 2. Buffer Navigation (Home Row)
map("n", "L", function() require("nvchad.tabufline").next() end, { desc = "Buffer Next Tab" })
map("n", "H", function() require("nvchad.tabufline").prev() end, { desc = "Buffer Prev Tab" })

-- 3. Buffer & Split Management
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "Buffer New" })
map("n", "<leader>bd", function() require("nvchad.tabufline").close_buffer() end, { desc = "Buffer Delete" })

-- Directional Splits 
map("n", "<leader>bsl", "<cmd>vsplit<cr><C-w>l", { desc = "Split Right" })
map("n", "<leader>bsh", "<cmd>vsplit<cr><C-w>h", { desc = "Split Left" })
map("n", "<leader>bsj", "<cmd>split<cr><C-w>j",  { desc = "Split Down" })
map("n", "<leader>bsk", "<cmd>split<cr><C-w>k",  { desc = "Split Up" })

-- 4. Paste Logic
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Clean Paste" })

-- 5. Navigation & Plugins
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Right" })

-- Snacks & Telescope
map("n", "<leader>e", function() Snacks.picker.explorer() end, { desc = "Snacks Explorer" })
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Snacks Find Files" })
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find Files" })
map("n", "<leader>nh", function() Snacks.notifier.show_history() end, { desc = "Snacks Notification History" })

-- 6. Tools
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash Jump" })
map("n", "<leader>cp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

vim.keymap.set("n", "<leader>lx", function()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd("LspStart")
  print("LSP Cache Cleared")
end, { desc = "LSP: Reset and Clear Memory" })

-- 7. Which-Key Group Registration (For the Vertical List)
local wk = require("which-key")
wk.add({
  -- Label
  { "<leader>", group = "+Leader" }, 
  { "g", group = "+Go to" },

  -- Leader
  { "<leader>b", group = "Buffer", icon = "󰈔" },
  { "<leader>bs", group = "Splits", icon = "" },
  { "<leader>f", group = "Find", icon = "" },
  { "<leader>c", group = "Code", icon = "󰅩" },
  { "<leader>l", group = "LSP", icon = "󰘦" },

  { "<leader>/", icon = "󰍉", desc = "Grep Search" },
  { "<leader>e", icon = "󰙅", desc = "Explorer" },
  { "<leader> ", icon = "", desc = "Find Files" }, -- Spacebar
  { "<leader>n", icon = "󰵙", desc = "Notifications" },

  { "<leader>d", icon = "󰆼", group = "Debug" },
  { "<leader>g", icon = "󰊢", group = "Git" },
  { "<leader>m", icon = "󱪖", group = "Marks" },
  { "<leader>p", icon = "󰏖", group = "Lazy" },
  { "<leader>r", icon = "󰑐", group = "Rename" },
  { "<leader>t", icon = "󰙵", group = "Terminal" },
  { "<leader>w", icon = "󰓩", group = "Window" },

  -- Go to
  { "gd", desc = "Go to Definition", icon = "󰦨" },
  { "gD", desc = "Go to Declaration", icon = "󰦨" },
  { "ge", desc = "Backward End of Word", icon = "󰦮" },
  { "gf", desc = "Go to File under Cursor", icon = "󰈔" },
  { "gg", desc = "First Line", icon = "󰜣" },
  { "gi", desc = "Last Insert Position", icon = "󰏫" },
  { "gn", desc = "Search Forward", icon = "" },
  { "gN", desc = "Search Backward", icon = "" },
  { "go", desc = "Document Symbols", icon = "󰘦" },
  { "gt", desc = "Next Tab", icon = "󰓩" },
  { "gT", desc = "Previous Tab", icon = "󰓩" },
  { "gu", desc = "Make Lowercase", icon = "󰬛" },
  { "gU", desc = "Make Uppercase", icon = "󰬐" },
  { "gv", desc = "Restore Last Visual", icon = "󰒅" },
  { "gw", desc = "Format Operator", icon = "󰉿" },
  { "gx", desc = "Open Link/URI", icon = "󰌷" },
  { "g%", desc = "Cycle Matches", icon = "󰑐" },
  { "g,", desc = "Newer Change List", icon = "󰮳" },
  { "g;", desc = "Older Change List", icon = "󰮲" },
  { "g~", desc = "Toggle Case Operator", icon = "󰚗" },

  -- Visual
  { "vy", icon = "󰅍", desc = "Yank to Explorer" },
  { "vp", icon = "󰅊", desc = "Clean Paste" },
  { "vs", icon = "󱊄", desc = "Flash Jump" },

  { "vh", icon = "", desc = "Left" },
  { "vj", icon = "", desc = "Down" },
  { "vk", icon = "", desc = "Up" },
  { "vl", icon = "", desc = "Right" },

  { "0", icon = "󰗘", desc = "Start of Line" },
  { "$", icon = "󰗙", desc = "End of Line" },
  { "w", icon = "󰬞", desc = "Next Word" },
  { "b", icon = "󰬛", desc = "Prev Word" },
  { "e", icon = "󰬝", desc = "End of Word" },
  { "G", icon = "󰜣", desc = "Last Line" },

  { "c", icon = "󰏫", desc = "Change" },
  { "d", icon = "󰆴", desc = "Delete" },
  { "r", icon = "󰑐", desc = "Replace" },
  { "u", icon = "󰬛", desc = "Lowercase" },
  { "U", icon = "󰬐", desc = "Uppercase" },
  { "~", icon = "󰚗", desc = "Toggle Case" },
  { "<", icon = "󰔚", desc = "Indent Left" },
  { ">", icon = "󰔙", desc = "Indent Right" },

  { "/", icon = "", desc = "Search Forward" },
  { "?", icon = "", desc = "Search Backward" },
  { "%", icon = "󰡏", desc = "Match Pair" },

  { "a", group = "Around", icon = "󰭜" },
  { "i", group = "Inside", icon = "󰭝" },
  { "g", group = "Go To", icon = "󰘦" },
  { "z", group = "Fold/Extra", icon = "󰘖" },
  { "[", group = "Prev", icon = "󰮲" },
  { "]", group = "Next", icon = "󰮳" },
})
