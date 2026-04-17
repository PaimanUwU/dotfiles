-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set custom background color to #0F0F1A
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Set the main background
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1E1E2E" })
    -- Optional: Match floating windows to the same color
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1E1E2E" })
  end,
})
-- Ensure the cursor returns to a bar (beam) when exiting Neovim
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.opt.guicursor = "a:ver25"
  end,
})
