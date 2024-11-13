return {
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	opts = {},
	-- },
	{
		"nvimdev/indentmini.nvim",
		config = function()
			require("indentmini").setup({
				only_current = true, -- Highlight only the current scope
			})
		end,
	},
}
