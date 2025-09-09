return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			"default", -- multiple profiles available in fzf-lua
			defaults = {
				formatter = "path.filename_first",
				multiline = 1,
			},
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
					["ctrl-h"] = require("fzf-lua.actions").toggle_hidden,
				},
			},
			lsp = {
				code_actions = {
					prompt = "Code Actions> ",
					async_or_timeout = 5000,
					previewer = "codeaction",
				},
			},
		})

		vim.cmd("FzfLua register_ui_select")

		-- send qf list to trouble
		local config = require("fzf-lua.config")
		local actions = require("trouble.sources.fzf").actions
		config.defaults.actions.files["ctrl-t"] = actions.open

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
		customKeymap("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Find lsp_document_symbols" })
		customKeymap("n", "<leader>fk", "<cmd>FzfLua keymaps<CR>", { desc = "Find Keymaps" })
		customKeymap(
			"n",
			"<leader>bd",
			"<cmd>FzfLua diagnostics_document<CR>",
			{ desc = "List Current Buffer diagnostics" }
		)
	end,
}
