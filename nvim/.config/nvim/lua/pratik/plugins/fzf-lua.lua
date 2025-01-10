return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			"telescope", -- "telescope", "fzf-native", "fzf-vim", "default"
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
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
			lsp = {
				code_actions = {
					previewer = "codeaction_native",
					preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
					prompt = "Code Actions󰅂 ",
					-- ui_select = false, -- use 'vim.ui.select'?
					async_or_timeout = 5000,
					winopts = {
						-- row = 0.40,
						-- height = 0.60,
						-- width = 0.60,
						preview = {
							border = "border-thinblock",
							layout = "vertical",
							vertical = "up:75%",
						},
					},
				},
			},
		})
		local customKeymap = vim.api.nvim_set_keymap
		customKeymap(
			"n",
			"<leader>fg",
			"<cmd>FzfLua live_grep_native<CR>",
			{ noremap = true, silent = true, desc = "Fzf live grep native" }
		)
		customKeymap(
			"n",
			"<leader>us",
			"<cmd>FzfLua colorschemes<CR>",
			{ noremap = true, silent = true, desc = "Preview and pick color scheme" }
		)
		customKeymap("n", "<C-p>", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
		customKeymap("n", "<leader>fc", "<cmd>FzfLua grep_cword<cr>", { desc = "Find string under cursor in cwd" })
		customKeymap("n", "<leader>fw", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Grep in current buffer" })
		customKeymap("n", "<c-b>", "<cmd>FzfLua buffers<CR>", { desc = "Find all files (including hidden) in cwd" })
		customKeymap("n", "<leader>ft", "<cmd>FzfLua git_status<CR>", { desc = "Find git_status files" })
	end,
}
