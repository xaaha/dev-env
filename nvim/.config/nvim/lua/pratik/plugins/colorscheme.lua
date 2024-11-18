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
			vim.cmd("colorscheme catppuccin-mocha")
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
		"gbprod/nord.nvim",
	},
	{
		"EdenEast/nightfox.nvim",
		-- tons of variants. Especially, nordfox is great nord theme.
		-- Day and Dawn fox for light themes
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"sainnhe/gruvbox-material",
		config = function()
			-- Set up the Gruvbox Material theme
			vim.g.gruvbox_material_background = "medium" -- You can set this to 'dark', 'light', or 'medium'
			vim.g.gruvbox_material_palette = "original" -- You can choose 'original', 'mix', or 'material'
			vim.g.gruvbox_material_enable_italic = 1 -- Enable italics in the theme
			vim.g.gruvbox_material_better_performance = 1 -- Enable better performance (optional)
		end,
	},
	{
		"neanias/everforest-nvim",
	},
}
