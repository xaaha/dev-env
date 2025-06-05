-- Copied and Modified from this reddit post
-- https://www.reddit.com/r/neovim/comments/17hbep3/anyone_built_a_statusline_with_no_plugins/
local statusline = {
	" %t", -- File name
	" %r", -- Readonly flag
	" %m", -- Modified flag
	"%=", -- divider
	" %f", -- Full file path
	" %3l:%-2c ", -- Line and column
}

vim.o.statusline = table.concat(statusline, "")
