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
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "soft", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"neanias/everforest-nvim",
	},
}
