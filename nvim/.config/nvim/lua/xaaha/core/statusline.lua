local statusline = {
	" %t", -- File name
	" %r", -- Readonly flag
	" %m", -- Modified flag
	"%=", -- divider
	" %f", -- Full file path
	" %3l:%-2c ", -- Line and column
}

vim.o.statusline = table.concat(statusline, "")
