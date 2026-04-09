-- Experimental UI2: floating cmdline and messages
vim.o.cmdheight = 0

local ui2 = require("vim._core.ui2")

ui2.enable({
  enable = true,
  msg = {
    targets = {
      [""] = "msg",
      empty = "cmd",
      bufwrite = "msg",
      confirm = "cmd",
      emsg = "pager",
      echo = "msg",
      echomsg = "msg",
      echoerr = "pager",
      completion = "cmd",
      list_cmd = "pager",
      lua_error = "pager",
      lua_print = "msg",
      progress = "pager",
      rpc_error = "pager",
      quickfix = "msg",
      search_cmd = "cmd",
      search_count = "cmd",
      shell_cmd = "pager",
      shell_err = "pager",
      shell_out = "pager",
      shell_ret = "msg",
      undo = "msg",
      verbose = "pager",
      wildlist = "cmd",
      wmsg = "msg",
      typed_cmd = "cmd",
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.3,
      timeout = 5000,
    },
    pager = {
      height = 0.5,
    },
  },
})

--------------------------------------------------------------------------------
-- Msg window: style + reposition to top-right
--------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("FileType", {
  pattern = "msg",
  callback = function()
    local win = ui2.wins and ui2.wins.msg
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_set_option_value(
        "winhighlight",
        "Normal:NormalFloat,FloatBorder:FloatBorder",
        { scope = "local", win = win }
      )
    end
  end,
})

local msgs = require("vim._core.ui2.messages")
local orig_set_pos = msgs.set_pos
msgs.set_pos = function(tgt)
  orig_set_pos(tgt)
  if (tgt == "msg" or tgt == nil) and vim.api.nvim_win_is_valid(ui2.wins.msg) then
    pcall(vim.api.nvim_win_set_config, ui2.wins.msg, {
      relative = "editor",
      anchor = "NE",
      row = 1,
      col = vim.o.columns - 1,
      border = "rounded",
    })
  end
end

--------------------------------------------------------------------------------
-- Centered floating cmdline (tiny-cmdline style)
--------------------------------------------------------------------------------

local cmdline_config = {
  width = { value = "60%", min = 40, max = 80 },
  position = { x = "50%", y = "50%" },
  border = nil,
  menu_col_offset = 3,
  native_types = { "/", "?" },
  on_reposition = nil,
}

do
  local wb = vim.o.winborder
  cmdline_config.border = wb ~= "" and wb or "rounded"
end

local function parse_dimension(value, available)
  if type(value) == "string" then
    return math.floor(available * tonumber(value:match("^(%d+)%%$")) / 100)
  end
  return math.floor(value)
end

local function cmdline_geometry(content_height)
  local cols, lines = vim.o.columns, vim.o.lines
  local b = cmdline_config.border == "none" and 0 or 1
  local width = math.max(
    cmdline_config.width.min,
    math.min(cmdline_config.width.max, parse_dimension(cmdline_config.width.value, cols))
  )
  width = math.min(width, cols - 4)
  local row = math.max(0, parse_dimension(cmdline_config.position.y, lines - content_height - b * 2))
  local col = math.max(0, parse_dimension(cmdline_config.position.x, cols - width - b * 2))
  return width, row, col, b
end

local cmdline_type = nil
local original_ui_cmdline_pos = vim.g.ui_cmdline_pos
local cmd_win_saved = nil

local function set_cmdheight_0()
  vim._with({ noautocmd = true }, function()
    vim.o.cmdheight = 0
  end)
end

local function get_cmd_win()
  local win = ui2.wins and ui2.wins.cmd
  return (win and vim.api.nvim_win_is_valid(win)) and win or nil
end

local function cmdline_reposition()
  if not cmdline_type then
    return
  end
  local win = get_cmd_win()
  if not win then
    return
  end

  if not cmd_win_saved then
    local cfg = vim.api.nvim_win_get_config(win)
    cmd_win_saved = {
      relative = cfg.relative,
      anchor = cfg.anchor,
      col = cfg.col,
      row = cfg.row,
      width = cfg.width,
      border = cfg.border,
    }
  end

  local content_height = math.max(1, vim.api.nvim_win_get_height(win))

  if vim.tbl_contains(cmdline_config.native_types, cmdline_type) then
    pcall(vim.api.nvim_win_set_config, win, {
      relative = "editor",
      row = math.max(0, vim.o.lines - content_height),
      col = 0,
      width = vim.o.columns,
      border = "none",
    })
    vim.g.ui_cmdline_pos = original_ui_cmdline_pos
    return
  end

  local width, row, col, b = cmdline_geometry(content_height)
  pcall(vim.api.nvim_win_set_config, win, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    border = cmdline_config.border,
  })
  vim.g.ui_cmdline_pos = { row + content_height + b * 2, col + b + cmdline_config.menu_col_offset }

  if cmdline_config.on_reposition then
    cmdline_config.on_reposition()
  end
end

local cmdline_wrapped = false
local function wrap_cmdline_show()
  if cmdline_wrapped then
    return
  end
  local ok, cmdline = pcall(require, "vim._core.ui2.cmdline")
  if not ok then
    return
  end
  local orig = cmdline.cmdline_show
  cmdline.cmdline_show = function(...)
    local r = orig(...)
    set_cmdheight_0()
    if not cmdline_type then
      return r
    end
    cmdline_reposition()
    return r
  end
  cmdline_wrapped = true
end

local function wrap_and_reposition()
  wrap_cmdline_show()
  cmdline_reposition()
end

local cmdline_group = vim.api.nvim_create_augroup("tiny-cmdline", { clear = true })

vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = cmdline_group,
  callback = function()
    cmdline_type = vim.fn.getcmdtype()
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = cmdline_group,
  callback = function()
    cmdline_type = nil
    vim.g.ui_cmdline_pos = original_ui_cmdline_pos

    local win = get_cmd_win()
    if win and cmd_win_saved then
      pcall(vim.api.nvim_win_set_config, win, cmd_win_saved)
    end

    vim.schedule(set_cmdheight_0)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = cmdline_group,
  pattern = "cmd",
  callback = function()
    local win = get_cmd_win()
    if win then
      vim.api.nvim_set_option_value(
        "winhighlight",
        "Normal:NormalFloat,FloatBorder:FloatBorder",
        { scope = "local", win = win }
      )
    end
    vim.schedule(wrap_and_reposition)
  end,
})

vim.api.nvim_create_autocmd({ "VimResized", "TabEnter" }, {
  group = cmdline_group,
  callback = function()
    vim.schedule(cmdline_reposition)
  end,
})

vim.schedule(wrap_and_reposition)
