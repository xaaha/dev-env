return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
	-- signature = { enabled = true },
	-- completion = {
	-- 	list = { selection = "auto_insert" },
	-- 	menu = {
	-- 		draw = {
	-- 			columns = {
	-- 				{ "label", "label_description", gap = 1 },
	-- 				{ "kind_icon", "kind" },
	-- 			},
	-- 		},
	-- 	},
	-- 	documentation = { auto_show = true, auto_show_delay_ms = 500 },
	-- },
}
