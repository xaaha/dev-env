return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			"telescope", -- "telescope", "fzf-native", "fzf-vim", "default"
			grep = {
				actions = {
					["ctrl-h"] = require("fzf-lua.actions").toggle_hidden,
					["ctrl-i"] = require("fzf-lua.actions").toggle_ignore,
				},
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
				grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e",
				rg_glob = true,
			},
			files = {
				actions = {
					["ctrl-g"] = require("fzf-lua.actions").toggle_ignore,
				},
			},
		})
		local keymap = vim.api.nvim_set_keymap
		keymap(
			"n",
			"<leader>fg",
			"<cmd>FzfLua live_grep_native<CR>",
			{ noremap = true, silent = true, desc = "Fzf live grep native" }
		)
		keymap(
			"n",
			"<leader>us",
			"<cmd>FzfLua colorschemes<CR>",
			{ noremap = true, silent = true, desc = "Preview and pick color scheme" }
		)
		keymap("n", "<C-p>", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap("n", "<leader>fc", "<cmd>FzfLua grep_cword<cr>", { desc = "Find string under cursor in cwd" })
	end,
}
