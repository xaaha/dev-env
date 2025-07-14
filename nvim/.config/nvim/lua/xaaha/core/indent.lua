local ns = vim.api.nvim_create_namespace("indent_guides")
local indent_char = "│"
local indent_hl = "TroubleIndent"
local indent_priority = 10

vim.api.nvim_set_hl(0, indent_hl, { link = "NonText", default = true })

-- Get indent level in spaces
local function get_indent(lnum)
	local indent = vim.fn.indent(lnum)
	if indent > 0 or vim.fn.getline(lnum):match("%S") then
		return indent
	end

	local prev = vim.fn.prevnonblank(lnum)
	local next = vim.fn.nextnonblank(lnum)
	if prev == 0 and next == 0 then
		return 0
	end

	local indent_prev = prev > 0 and vim.fn.indent(prev) or 0
	local indent_next = next > 0 and vim.fn.indent(next) or 0

	if indent_prev ~= indent_next and indent_prev > 0 and indent_next > 0 then
		return math.min(indent_prev, indent_next) + vim.bo.shiftwidth
	end

	return math.min(indent_prev, indent_next)
end

-- Generate extmarks for a given line's indent level
local function get_extmarks(indent, shiftwidth, leftcol)
	local extmarks = {}
	local levels = math.floor(indent / shiftwidth)
	for i = 1, levels do
		local col = (i - 1) * shiftwidth - leftcol
		if col >= 0 then
			table.insert(extmarks, {
				virt_text = { { indent_char, indent_hl } },
				virt_text_win_col = col,
				hl_mode = "combine",
				priority = indent_priority, -- so that other plugin won't be able to overwrite this.
				ephemeral = true,
			})
		end
	end
	return extmarks
end

-- Decoration callback: runs during redraws
vim.api.nvim_set_decoration_provider(ns, {
	on_win = function(_, _, buf, top, bot)
		if vim.bo[buf].buftype ~= "" then
			return
		end
		local shiftwidth = vim.bo[buf].shiftwidth > 0 and vim.bo[buf].shiftwidth or vim.bo[buf].tabstop
		local leftcol = vim.fn.winsaveview().leftcol
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
