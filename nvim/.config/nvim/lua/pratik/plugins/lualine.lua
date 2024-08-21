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
				lualine_x = {
					-- {
					-- 	lazy_status.updates,
					-- 	cond = lazy_status.has_updates,
					-- 	color = { fg = "#c3ccdc" },
					-- },
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
