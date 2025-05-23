return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		indent = {
			enabled = false,
			only_scope = true,
			only_current = true,
			hl = "SnacksIndent5",
			scope = {
				only_current = true,
			},
			chunk = {
				enabled = true,
				only_current = true,
			},
		},
		lazygit = { enabled = true },
		notifier = { enabled = true },
		gitbrowse = { enabled = true },
	},
	-- https://github.com/folke/snacks.nvim/blob/64fbb157a0b7fa2279817ed16d3f530c00b8863c/doc/snacks.nvim.txt#L258
	keys = {
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"<leader>dt",
			function()
				if vim.g.snacks_indent_enabled then
					Snacks.indent.disable()
					vim.g.snacks_indent_enabled = false
				else
					Snacks.indent.enable()
					vim.g.snacks_indent_enabled = true
				end
			end,
			desc = "Toggle Indent in Current file",
		},
		{
			"<leader>of",
			function()
				Snacks.gitbrowse.open()
			end,
			desc = "Open Current file in browser",
		},
	},
}
