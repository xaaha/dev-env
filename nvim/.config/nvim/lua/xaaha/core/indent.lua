local ns = vim.api.nvim_create_namespace("indent_guides")
local indent_char = "│"
local indent_hl = "NonText"

local function get_indent(lnum)
  local indent = vim.fn.indent(lnum)
  if indent > 0 or vim.fn.getline(lnum):match("%S") then
    return indent
  end
  local prev, next_ = vim.fn.prevnonblank(lnum), vim.fn.nextnonblank(lnum)
  if prev == 0 and next_ == 0 then
    return 0
  end
  local ip, in_ = vim.fn.indent(prev), vim.fn.indent(next_)
  return (ip ~= in_ and ip > 0 and in_ > 0) and math.min(ip, in_) + vim.bo.shiftwidth or math.min(ip, in_)
end

local enabled = false

vim.api.nvim_set_decoration_provider(ns, {
  on_win = function(_, win, buf, top, bot)
    -- Only draw in current window and when enabled
    if not enabled or win ~= vim.api.nvim_get_current_win() then
      return
    end
    if vim.bo[buf].buftype ~= "" then
      return
    end

    local sw = vim.bo[buf].shiftwidth > 0 and vim.bo[buf].shiftwidth or vim.bo[buf].tabstop
    local leftcol = vim.fn.winsaveview().leftcol
    for lnum = top + 1, bot do
      local indent = get_indent(lnum)
      if indent > 0 then
        for i = 0, math.floor(indent / sw) - 1 do
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

vim.keymap.set("n", "<leader>et", function()
  enabled = not enabled -- Toggle the state
  vim.cmd("redraw!")   -- Force redraw to update the display
end, { desc = "Toggle indent in current file" })
