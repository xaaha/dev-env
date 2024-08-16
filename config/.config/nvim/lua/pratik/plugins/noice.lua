return {
	"folke/noice.nvim",
	tag = "v4.5.0",
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
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			presets = {
				lsp_doc_border = true,
			},
		})
	end,
}
