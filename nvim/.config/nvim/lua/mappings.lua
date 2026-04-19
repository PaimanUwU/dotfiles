require "nvchad.mappings"

local map = vim.keymap.set

-- 0. Cleanup NvChad Defaults (Avoid Conflicts)
local del = vim.keymap.del
del("n", "<leader>h") -- Remove terminal horizontal
del("n", "<leader>v") -- Remove terminal vertical
del("n", "<leader>x") -- Remove default buffer close
del("n", "<leader>b") -- Clear default buffer group

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

-- Add this to your custom mappings or init.lua
vim.keymap.set("n", "<leader>lx", function()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd("LspStart")
  print("LSP Cache Cleared")
end, { desc = "LSP: Reset and Clear Memory" })

-- 7. Which-Key Group Registration (For the Vertical List)
local wk = require("which-key")
wk.add({
  { "<leader>b", group = "buffer", icon = "󰈔" },
  { "<leader>bs", group = "split", icon = "" },
  { "<leader>f", group = "file/find", icon = "" },
  { "<leader>c", group = "code/preview", icon = "󰅩" },
})
