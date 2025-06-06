return {
	"folke/which-key.nvim",
	tag = "v3.13.2",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {},
}
