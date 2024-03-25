-- Pull in the wezterm API
local wezterm = require("wezterm")

return {
	-- font
	font_size = 17,
	font = wezterm.font("JetBrainsMono Nerd Font"),
	-- font = wezterm.font_with_fallback({ "Hack Nerd Font", { family = "JetBrainsMono Nerd Font", scale = 0.75 } }),
	use_cap_height_to_scale_fallback_fonts = true,
	--colorscheme
	colors = {
		foreground = "#E3EFF4",
		background = "#4A5D78",
		cursor_bg = "#95E3D9",
		cursor_fg = "#4A5D78",
		cursor_border = "#95E3D9",
		selection_fg = "#E3EFF4",
		selection_bg = "#6D83A3",
		scrollbar_thumb = "#222222",
		split = "#444444",
		ansi = {
			"#6D83A3",
			"#FFA0BE",
			"#9BCB8A",
			"#FFD966",
			"#9BD2FB",
			"#D1B4E9",
			"#95E3D9",
			"#C5D5E0",
		},
		brights = {
			"#8499B6",
			"#FFB1CA",
			"#A8E5A8",
			"#FFE680",
			"#B3DEFD",
			"#DECAEF",
			"#A9EEE5",
			"#E0EBF0",
		},
		indexed = { [136] = "#af8700" },
		compose_cursor = "orange",
		copy_mode_active_highlight_bg = { Color = "#000000" },
		copy_mode_active_highlight_fg = { AnsiColor = "Black" },
		copy_mode_inactive_highlight_bg = { Color = "#52ad70" },
		copy_mode_inactive_highlight_fg = { AnsiColor = "White" },
		quick_select_label_bg = { Color = "peru" },
		quick_select_label_fg = { Color = "#ffffff" },
		quick_select_match_bg = { AnsiColor = "Navy" },
		quick_select_match_fg = { Color = "#ffffff" },
	},
	-- window management
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 3,
	},
	window_decorations = "RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	initial_cols = 150,
	initial_rows = 57,
}
