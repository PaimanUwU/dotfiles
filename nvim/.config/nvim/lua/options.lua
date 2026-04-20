require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

require('render-markdown').setup({
    anti_conceal = {
        enabled = true,
        disabled_modes = false,
        above = 0,
        below = 0,
        -- Which elements to always show, ignoring anti conceal behavior. Values can either be
        -- booleans to fix the behavior or string lists representing modes where anti conceal
        -- behavior will be ignored. Valid values are:
        --   bullet
        --   callout
        --   check_icon, check_scope
        --   code_background, code_border, code_language
        --   dash
        --   head_background, head_border, head_icon
        --   indent
        --   link
        --   quote
        --   sign
        --   table_border
        --   virtual_lines
        ignore = {
            code_background = true,
            indent = true,
            sign = true,
            virtual_lines = true,
        },
    },
})
