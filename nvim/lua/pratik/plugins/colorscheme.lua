return {
	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			-- configure the colorscheme here
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = { "italic" },
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {
					latte = {
						base = "#cccccc", -- "#d7d9dd" or "#cccccc"
						mantle = "#fcfcfc", -- "#eff1f5" or "#f4f5f8" or "#f2f2f2"
					},
				},
				custom_highlights = {},
				integrations = {
					telescope = true,
					cmp = true,
					gitsigns = true,
					indent_blankline = { enabled = true },
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
			-- vim.cmd("colorscheme catppuccin-frappe")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd("colorscheme github_light")
		end,
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
}
