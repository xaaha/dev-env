return {
	{
		"catppuccin/nvim",
		priority = 1000,
		lazy = false,
		config = function()
			-- configure the colorscheme here
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					functions = { "italic" },
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					telescope = {
						enabled = true,
						style = "nvchad",
					},
					aerial = true,
					noice = true,
					notify = true,
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
			vim.cmd("colorscheme catppuccin-frappe")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		-- priority = 1000,
		-- lazy = false,
		-- config = function()
		-- 	vim.cmd("colorscheme github_light_tritanopia")
		-- end,
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"shatur/neovim-ayu", -- light: ayu
	},
	{
		"olimorris/onedarkpro.nvim",
	},
	{
		"gbprod/nord.nvim",
	},
	{
		"sainnhe/edge", -- mainly installed for edge light
	},
	{
		"EdenEast/nightfox.nvim",
		-- tons of variants. Especially, nordfox is great nord theme.
		-- Day and Dawn fox for light themes
	},
	{ "rose-pine/neovim", name = "rose-pine" },
}
