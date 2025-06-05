return {
	"RRethy/vim-illuminate", -- highlight other uses of the word under the cursor
	"b0o/schemastore.nvim",
	"preservim/vimux", -- vim test requires this
	-- "norcalli/nvim-colorizer.lua", -- see colors in vim
	{
		"stevearc/dressing.nvim", -- changes the default way of renaming and other ui stuff
		event = "VeryLazy",
	},
	{
		"christoomey/vim-tmux-navigator", -- moving between split windows
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").set_icon({
				gql = {
					icon = "",
					color = "#e535ab",
					cterm_color = "199",
					name = "GraphQL",
				},
			})
		end,
	},
}
