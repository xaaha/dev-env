local ns = vim.api.nvim_create_namespace("indent_guides")
local indent_char = "│"
local indent_hl = "IndentGuide"
local indent_priority = 10

-- Set default highlight if not set
vim.api.nvim_set_hl(0, indent_hl, { link = "NonText", default = true })

-- Indentation per line
local function get_indent(line_num)
	return vim.fn.indent(line_num)
end

local function get_extmarks(indent, shiftwidth, leftcol)
	local extmarks = {}
	local level = math.floor(indent / shiftwidth)
	for i = 1, level do
		local col = (i - 1) * shiftwidth - leftcol
		if col >= 0 then
			table.insert(extmarks, {
				virt_text = { { indent_char, indent_hl } },
				virt_text_pos = "overlay",
				virt_text_win_col = col,
				hl_mode = "combine",
				priority = indent_priority,
				ephemeral = true,
			})
		end
	end
	return extmarks
end

-- Decoration callback
vim.api.nvim_set_decoration_provider(ns, {
	on_win = function(_, _, buf, top, bot)
		if vim.bo[buf].buftype ~= "" then
			return
		end
		local leftcol = vim.fn.winsaveview().leftcol
		local shiftwidth = vim.bo[buf].shiftwidth > 0 and vim.bo[buf].shiftwidth or vim.bo[buf].tabstop
		for lnum = top + 1, bot do
			local indent = get_indent(lnum)
			if indent > 0 then
				local extmarks = get_extmarks(indent, shiftwidth, leftcol)
				for _, mark in ipairs(extmarks) do
					vim.api.nvim_buf_set_extmark(buf, ns, lnum - 1, 0, mark)
				end
			end
		end
	end,
})
