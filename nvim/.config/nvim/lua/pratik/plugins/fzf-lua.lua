return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			grep = {
				actions = {
					["ctrl-h"] = require("fzf-lua.actions").toggle_hidden,
					["ctrl-i"] = require("fzf-lua.actions").toggle_ignore,
				},
				-- rg_opts = "--hidden --glob '!.git'", // work in progress
			},
		})
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		keymap("n", "<leader>fg", "<cmd>FzfLua live_grep_native<CR>", opts)
		keymap("n", "<leader>us", "<cmd>FzfLua colorschemes<CR>", opts)
	end,
}
