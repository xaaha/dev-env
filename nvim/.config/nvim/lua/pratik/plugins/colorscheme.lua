return {
	{
		"catppuccin/nvim",
		lazy = false,
		opts = {
			flavour = "latte",
			styles = { functions = { "italic" } },
			color_overrides = {},
			custom_highlights = {},
		},
	},
	{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				options = {
					styles = {
						comments = "italic",
						keywords = "bold",
						types = "italic,bold",
					},
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"EdenEast/nightfox.nvim",
		opts = { dim_inactive = true },
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		opts = {
			style = "cool",
			toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
		},
		config = function(_, opts)
			require("onedark").setup(opts)
			require("onedark").load()
			vim.cmd.colorscheme("onedark")
		end,
	},
}
