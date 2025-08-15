return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {},
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
}
