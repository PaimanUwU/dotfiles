require "nvchad.autocmds"

-- Skip dashboard if nvim is opened with a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Check if the first argument is a directory (like '.')
    if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      -- 1. Open your Snacks Explorer
      require("snacks").picker.explorer()
      
      -- 2. Find and delete the Nvdash buffer so it's not sitting in the background
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == "nvdash" then
          vim.api.nvim_buf_delete(buf, { force = true })
        end
      end
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local highlights = {
      NormalFloat = { bg = "#1E1D2D" },
      FloatBorder = { fg = "#313244", bg = "#1E1D2D" },
      WhichKey = { bg = "#1E1D2D" },
      WhichKeyFloat = { bg = "#1E1D2D" },
      SnacksNormal = { bg = "#1E1D2D" },
    }

    for group, settings in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, settings)
    end
  end,
})
