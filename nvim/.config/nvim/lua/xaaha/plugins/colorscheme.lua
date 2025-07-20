return {
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
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "cool", -- Set the style
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
				highlights = {
					BlinkCmpMenuSelection = { fg = "#EBC175", bg = "#2A2A2A" },
					FzfLuaBorder = { fg = "#BF616A" },
				},
			})
			require("onedark").load() -- Ensure the theme is loaded
			vim.cmd("colorscheme onedark")
		end,
	},
}
