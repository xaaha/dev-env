-- Experimental UI2: floating cmdline and messages
vim.o.cmdheight = 1

local ui2 = require("vim._core.ui2")

ui2.enable({
  enable = true,
  msg = {
    targets = {
      [""] = "msg",
      bufwrite = "msg",
      emsg = "pager",
      echo = "msg",
      echomsg = "msg",
      echoerr = "pager",
      list_cmd = "pager",
      lua_error = "pager",
      lua_print = "msg",
      progress = "pager",
      rpc_error = "pager",
      quickfix = "msg",
      shell_cmd = "pager",
      shell_err = "pager",
      shell_out = "pager",
      shell_ret = "msg",
      undo = "msg",
      verbose = "pager",
      wmsg = "msg",
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
