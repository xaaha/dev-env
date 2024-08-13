return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs", -- buffers, tabs
				separator_style = "thick", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
				max_name_length = 20,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 18,
				color_icons = true,
				show_close_icon = true,
				close_icon = "✗",
				show_tab_indicators = true,
				indicator = {
					style = "icon", -- underline, icon, none
					icon = "🏕️", -- remove this line if the style is other than icon
				},
			},
		})
	end,
	opts = {},
}
