return {
	{
		"navarasu/onedark.nvim",
		-- priority = 1000,
		config = function()
			require("onedark").setup({
				style = "cool", -- Set the style
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
				highlights = {
					BlinkCmpMenuSelection = { fg = "#EBC175", bg = "#2A2A2A" },
					FzfLuaBorder = { fg = "#BF616A" },
				},
			})
			-- require("onedark").load() -- Ensure the theme is loaded
			-- vim.cmd("colorscheme onedark")
		end,
	},
	{
		-- dir = vim.fn.expand("~/path/to/onenord.nvim"),
		"xaaha/onenord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onenord").setup()
			require("onenord").load()
			vim.cmd("colorscheme onenord")
		end,
	},
}
