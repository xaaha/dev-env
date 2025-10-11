local excluded = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
	"alpha",
	"lir",
	"Outline",
	"spectre_panel",
	"toggleterm",
}

local function isempty(s)
	return s == nil or s == ""
end

local function get_filename()
	local filename = vim.fn.expand("%:t")
	if isempty(filename) then
		return ""
	end

	local ext = vim.fn.expand("%:e")
	local icon, color = require("nvim-web-devicons").get_icon_color(filename, ext, { default = true })
	local hl_group = "WinbarFileIcon_" .. ext

	vim.api.nvim_set_hl(0, hl_group, { fg = color, bg = "NONE" })

	return string.format(" %%#%s#%s %%* %%#StatusLine#%s%%*", hl_group, icon or "", filename)
end

local function get_winbar()
	if vim.tbl_contains(excluded, vim.bo.filetype) then
		return ""
	end

	local name = get_filename()
	if isempty(name) then
		return ""
	end

	return "%#StatusLine#" .. name .. "%="
end

local function setup()
	vim.api.nvim_set_hl(0, "WinBar", { link = "StatusLine" })
	vim.api.nvim_set_hl(0, "WinBarNC", { link = "StatusLineNC" })
	vim.api.nvim_set_hl(0, "WinBarFile", { link = "Normal" })
	vim.api.nvim_set_hl(0, "WinBarFill", { link = "Normal" })

	-- Update on buffer change
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
		callback = function()
			local winbar_str = get_winbar()
			if isempty(winbar_str) then
				vim.opt_local.winbar = nil
			else
				vim.opt_local.winbar = winbar_str
			end
		end,
	})
end

setup()
