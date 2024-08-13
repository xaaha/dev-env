return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                                       ",
			"	▀████    ▐████▀    ▄████████    ▄████████    ▄█    █▄       ▄████████ ",
			"	  ███▌   ████▀    ███    ███   ███    ███   ███    ███     ███    ███ ",
			"	   ███  ▐███      ███    ███   ███    ███   ███    ███     ███    ███ ",
			"	   ▀███▄███▀      ███    ███   ███    ███  ▄███▄▄▄▄███▄▄   ███    ███ ",
			"	   ████▀██▄     ▀███████████ ▀███████████ ▀▀███▀▀▀▀███▀  ▀███████████ ",
			"	  ▐███  ▀███      ███    ███   ███    ███   ███    ███     ███    ███ ",
			"	 ▄███     ███▄    ███    ███   ███    ███   ███    ███     ███    ███ ",
			"	████       ███▄   ███    █▀    ███    █▀    ███    █▀      ███    █▀  ",
			"                                                                       ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button(
				"Ctrl P",
				"󰱼 > Find File",
				"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>"
			),
			dashboard.button("SPC fg", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("Ctrl n", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
