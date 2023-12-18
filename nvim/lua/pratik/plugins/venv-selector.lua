return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python",
	},
	opts = {
		-- Your options go here
		-- name = "venv",
		-- auto_refresh = false
	},
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Open venv for python" },
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Retrieve venv from cache for python" },
	},
}
