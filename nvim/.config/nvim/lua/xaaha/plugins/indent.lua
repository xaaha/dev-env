return {
	"echasnovski/mini.indentscope",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mini.indentscope").setup({
			draw = {
				delay = 0,
				animation = function()
					return 0
				end,
			},
			symbol = "│",
			try_as_border = true,
			options = {
				-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
				border = "both",
			},
		})
	end,
}
