return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
		handler_opts = {
			border = "rounded", -- double, rounded, single, shadow, none, or a table of borders
			verbose = true,
		},
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}
