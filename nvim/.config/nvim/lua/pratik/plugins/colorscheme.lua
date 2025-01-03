return {
	{
		"catppuccin/nvim",
		lazy = false,
		config = function()
			-- configure the colorscheme here
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				styles = {
					functions = { "italic" },
				},
				color_overrides = {},
				custom_highlights = {},
			})
			-- vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		priority = 1000,
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

			vim.cmd("colorscheme github_dark")
		end,
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"EdenEast/nightfox.nvim",
		-- tons of variants. Especially, nordfox is great nord theme.
		-- Day and Dawn fox for light themes
		config = function()
			require("nightfox").setup({
				dim_inactive = true,
			})
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "savq/melange-nvim" },
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "dark", -- Set the style to "dark"
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
			})
			require("onedark").load() -- Ensure the theme is loaded
		end,
	},
}
