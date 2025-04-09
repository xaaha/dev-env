return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	opts = {
		completion = {
			menu = {
				border = "rounded",
				draw = { gap = 1 },
			},
		},
		cmdline = {
			enabled = true,
			completion = {
				menu = {
					auto_show = true, -- false is default and requires user to hit tab to show the menu
				},
			},
		},
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},
	},
	opts_extend = { "sources.default" },
}
