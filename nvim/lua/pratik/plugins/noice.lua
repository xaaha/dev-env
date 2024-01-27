return {
	"folke/noice.nvim",
	tag = "v2.0.0",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- `nvim-notify` feels obnixious to me
		-- "rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			views = {
				cmdline_popup = {
					position = {
						row = "95%", -- or row number: 5
						col = "5%",
					},
					size = {
						width = 40, -- "auto" is 60
						height = "auto",
					},
				},
			},
			cmdline = {
				format = {
					search_down = {
						icon = "🔍⌄",
					},
					search_up = {
						icon = "🔍⌃",
					},
				},
			},
			lsp = {
				signature = {
					enabled = false, -- using lsp-signature instead, which has a nice panda
				},
			},
		})
	end,
}
