local ns = vim.api.nvim_create_namespace("indent_guides")
local indent_char = "│"
local indent_hl = "TroubleIndent"
local indent_priority = 10

vim.api.nvim_set_hl(0, indent_hl, { link = "NonText", default = true })

-- Get effective indent for a line
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

	local ip, in_ = vim.fn.indent(prev), vim.fn.indent(next)
	if ip ~= in_ and ip > 0 and in_ > 0 then
		return math.min(ip, in_) + vim.bo.shiftwidth
	end
	return math.min(ip, in_)
end

-- Generate extmarks based on indent
local function get_extmarks(indent, sw, leftcol)
	local marks = {}
	for i = 0, math.floor(indent / sw) - 1 do
		local col = i * sw - leftcol
		if col >= 0 then
			marks[#marks + 1] = {
				virt_text = { { indent_char, indent_hl } },
				virt_text_win_col = col,
				hl_mode = "combine",
				priority = indent_priority,
				ephemeral = true,
			}
		end
	end
	return marks
end

-- Register decoration provider
vim.api.nvim_set_decoration_provider(ns, {
	on_win = function(_, _, buf, top, bot)
		if vim.bo[buf].buftype ~= "" then
			return
		end

		local sw = vim.bo[buf].shiftwidth > 0 and vim.bo[buf].shiftwidth or vim.bo[buf].tabstop
		local leftcol = vim.fn.winsaveview().leftcol

		for lnum = top + 1, bot do
			local indent = get_indent(lnum)
			if indent > 0 then
				for _, mark in ipairs(get_extmarks(indent, sw, leftcol)) do
					vim.api.nvim_buf_set_extmark(buf, ns, lnum - 1, 0, mark)
				end
			end
		end
	end,
})
