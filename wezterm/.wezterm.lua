-- Pull in the wezterm API
local xaaha = require("themes.xaaha")
local wezterm = require("wezterm")

return {
	-- font
	font_size = 17,
	font = wezterm.font("JetBrainsMono Nerd Font"),
	-- font = wezterm.font_with_fallback({ "Hack Nerd Font", { family = "JetBrainsMono Nerd Font", scale = 0.75 } }),
	use_cap_height_to_scale_fallback_fonts = true,
	--colorscheme
	-- colors = xaaha.XAAHA_BLUE,
	color_scheme = "rose-pine-moon",
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
