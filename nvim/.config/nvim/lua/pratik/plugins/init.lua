return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use

	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

	"RRethy/vim-illuminate", -- highlight other uses of the word under the cursor

	"preservim/vimux", -- vim test requires this

	"norcalli/nvim-colorizer.lua", -- see colors in vim

	{
		"stevearc/dressing.nvim", -- changes the default way of renaming and other ui stuff
		event = "VeryLazy",
	},
	{
		"christoomey/vim-tmux-navigator", -- moving between split windows
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}
