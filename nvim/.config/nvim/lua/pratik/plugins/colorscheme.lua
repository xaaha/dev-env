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
		-- tons of variants. Especially, nordfox is great nord theme.
		-- Day and Dawn fox for light themes
		config = function()
			require("nightfox").setup({
				dim_inactive = true,
			})
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "cool", -- Set the style
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
			})
			require("onedark").load() -- Ensure the theme is loaded
			vim.cmd("colorscheme onedark")
		end,
	},
	{
		"dgox16/oldworld.nvim",
	},
}
