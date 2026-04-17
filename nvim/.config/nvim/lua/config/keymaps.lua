-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })

-- Paste without overwriting the register
vim.keymap.set("x", "p", [["_dP]])
