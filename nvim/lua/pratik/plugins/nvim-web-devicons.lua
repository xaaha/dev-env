return {
	"nvim-tree/nvim-web-devicons",
	-- skipping tag since it does not look like an actual release
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
}
