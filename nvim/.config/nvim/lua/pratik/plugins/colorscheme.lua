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
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = true,
				transparent_mode = false,
			})
			-- vim.cmd("colorscheme gruvbox")
			vim.opt.background = "dark"
		end,
	},
	{
		"neanias/everforest-nvim",
		config = function()
			require("lualine").setup({
				dim_inactive_windows = true,
				options = {
					theme = "everforest", -- Can also be "auto" to detect automatically.
				},
			})
			vim.opt.background = "dark"
		end,
	},
}
