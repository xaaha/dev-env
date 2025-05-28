return {
	"stevearc/oil.nvim",
	opts = {
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
			natural_order = true,
			is_always_hidden = function(name, _)
				return name == ".."
					or name == ".git"
					or name == ".DS_Store"
					or name == ".mypy_cache"
					or name == ".pytest_cache"
					or name == "__pycache__"
			end,
		},
		keymaps = {
			["<C-c>"] = false,
			["q"] = "actions.close",
			["<C-p>"] = false,
			["<C-o>"] = "actions.preview",
		},
	},
	dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
	lazy = false,
	keys = {
		{ "<C-n>", "<cmd>Oil<cr>", desc = "Open parent directory" },
	},
}
