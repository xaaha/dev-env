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

local function get_winbar()
	if vim.tbl_contains(excluded, vim.bo.filetype) then
		return nil
	end

	local filename = vim.fn.expand("%:t")
	if filename == "" then
		return nil
	end

	local ext = vim.fn.expand("%:e")
	local icon = ""
	local ok, devicons = pcall(require, "nvim-web-devicons")
	if ok then
		icon = devicons.get_icon(filename, ext, { default = true }) or icon
	end

	return string.format("%%#StatusLine# %s %s %%=", icon, filename)
end

local function setup()
	vim.api.nvim_set_hl(0, "WinBar", { link = "StatusLine" })
	vim.api.nvim_set_hl(0, "WinBarNC", { link = "StatusLineNC" })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
		callback = function()
			vim.opt_local.winbar = get_winbar()
		end,
	})
end

setup()
