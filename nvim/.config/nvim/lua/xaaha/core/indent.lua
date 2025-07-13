local ns = vim.api.nvim_create_namespace("indent_guides")
local indent_char = "│"
local indent_hl = "IndentGuide"
local indent_priority = 10
local has_repeat_lb = vim.fn.has("nvim-0.10.0") == 1

-- Set default highlight if not set
vim.api.nvim_set_hl(0, indent_hl, { link = "NonText", default = true })

-- Should indent guides only show for current scope
local function only_scope_enabled(buf)
	return vim.g.indent_scope_only or vim.b[buf].indent_scope_only
end

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
				virt_text_repeat_linebreak = has_repeat_lb or nil,
			})
		end
	end
	return extmarks
end

-- Decoration callback
vim.api.nvim_set_decoration_provider(ns, {
	on_win = function(_, win, buf, top, bot)
		if vim.bo[buf].buftype ~= "" then
			return
		end

		local leftcol = vim.fn.winsaveview().leftcol
		local shiftwidth = vim.bo[buf].shiftwidth > 0 and vim.bo[buf].shiftwidth or vim.bo[buf].tabstop
		local indent_scope_only = only_scope_enabled(buf)

		-- Determine current scope bounds
		local scope_start, scope_end = 1, vim.api.nvim_buf_line_count(buf)
		if indent_scope_only then
			local cursor = vim.api.nvim_win_get_cursor(win)[1]
			scope_start = vim.fn.prevnonblank(cursor)
			scope_end = vim.fn.nextnonblank(cursor)
		end

		for lnum = top + 1, bot do
			if lnum >= scope_start and lnum <= scope_end then
				local indent = get_indent(lnum)
				if indent > 0 then
					local extmarks = get_extmarks(indent, shiftwidth, leftcol)
					for _, mark in ipairs(extmarks) do
						vim.api.nvim_buf_set_extmark(buf, ns, lnum - 1, 0, mark)
					end
				end
			end
		end
	end,
})
