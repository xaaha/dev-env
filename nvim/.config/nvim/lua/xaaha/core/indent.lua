local ns = vim.api.nvim_create_namespace("indent_guides")
local indent_char = "│"
local indent_hl = "NonText"


local cache = setmetatable({}, {
  __index = function(t, bufnr)
    t[bufnr] = { indents = {}, dirty = true }
    return t[bufnr]
  end
})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*",
  callback = function(args)
    if cache[args.buf] then
      cache[args.buf].dirty = true
    end
  end
})

local function get_indent(lnum)
  local line = vim.fn.getline(lnum)

  if line:match("%S") then
    return vim.fn.indent(lnum)
  end

  local prev_line = vim.fn.prevnonblank(lnum - 1)
  local next_line = vim.fn.nextnonblank(lnum + 1)

  local prev_indent = (prev_line > 0) and vim.fn.indent(prev_line) or 0
  local next_indent = (next_line > 0) and vim.fn.indent(next_line) or 0

  if prev_line == 0 and next_line == 0 then return 0 end
  if prev_line == 0 then return next_indent end
  if next_line == 0 then return prev_indent end

  return math.min(prev_indent, next_indent)
end


local function update_cache(bufnr)
  local buf_cache = cache[bufnr]
  if not buf_cache.dirty then return end

  local line_count = vim.api.nvim_buf_line_count(bufnr)
  buf_cache.indents = {}
  for lnum = 1, line_count do
    buf_cache.indents[lnum] = get_indent(lnum, bufnr)
  end
  buf_cache.dirty = false
end

local enabled = false

vim.api.nvim_set_decoration_provider(ns, {
  on_win = function(_, win, buf, top, bot)
    if not enabled or win ~= vim.api.nvim_get_current_win() or vim.bo[buf].buftype ~= "" then
      return
    end
    update_cache(buf)
    local buf_cache = cache[buf]
    local sw = vim.bo[buf].shiftwidth > 0 and vim.bo[buf].shiftwidth or vim.bo[buf].tabstop
    if sw == 0 then return end

    local leftcol = vim.fn.winsaveview().leftcol


    for lnum = top + 1, bot do
      local indent = buf_cache.indents[lnum]
      if indent and indent > 0 then
        for i = 0, math.floor((indent - 1) / sw) do
          local col = i * sw - leftcol
          if col >= 0 then
            vim.api.nvim_buf_set_extmark(buf, ns, lnum - 1, 0, {
              virt_text = { { indent_char, indent_hl } },
              virt_text_win_col = col,
              hl_mode = "combine",
              ephemeral = true,
            })
          end
        end
      end
    end
  end,
})


vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  callback = function()
    if enabled then
      vim.cmd("redraw")
    end
  end,
})


vim.keymap.set("n", "<leader>et", function()
  enabled = not enabled
  if enabled then
    for bufnr, _ in pairs(cache) do cache[bufnr].dirty = true end
  end
  vim.cmd("redraw!")
end, { desc = "Toggle indent in current file" })
