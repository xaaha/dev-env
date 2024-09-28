return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		-- local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		lualine.setup({
			options = {
				component_separators = "",
				section_separators = { left = "", right = "" },
			}, -- comment out to enable default ">" section and component section separator
			sections = {
				lualine_b = { "branch", "diagnostics" },
				lualine_c = { { "filename", path = 1 } }, -- 0 for file name only, 1 for relative file path
				lualine_y = { "searchcount" },
			},
			winbar = {
				lualine_b = { "filename", "diff" },
			},
		})
	end,
}
