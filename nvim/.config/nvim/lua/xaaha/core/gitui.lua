-- State to track if the window is open
local is_open = false

-- Configuration for the floating GitUI window
local config = {
  binary = "/opt/homebrew/bin/lazygit",
  args = {},         -- Additional arguments to pass to lazygit or gitui
  width = 80,        -- Width of the floating window (percentage)
  height = 70,       -- Height of the floating window (percentage)
  border = "rounded", -- Border style: "none", "single", "rounded", "solid", "shadow"
}

-- Function to open the GitUI floating window
local function open_gitui()
  if is_open then
    return
  end

  -- Ensure the `gitui` binary is executable
  assert(vim.fn.executable(config.binary) == 1, config.binary .. " is not an executable")

  -- Create a new buffer for the floating window
  local bufnr = vim.api.nvim_create_buf(false, true)

  -- Calculate window dimensions
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  local win_height = math.ceil(height * (config.height / 100))
  local win_width = math.ceil(width * (config.width / 100))
  local row = math.ceil((height - win_height) / 2)
  local col = math.ceil((width - win_width) / 2)

  -- Window options
  local window_options = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = config.border,
    noautocmd = true,
  }

  -- Open the floating window
  vim.api.nvim_open_win(bufnr, true, window_options)

  -- Start the GitUI process in the terminal buffer
  vim.fn.termopen(table.concat(vim.tbl_flatten({ config.binary, config.args }), " "), {
    on_exit = function()
      -- Close the buffer and reset the state when the process exits
      vim.api.nvim_buf_delete(bufnr, { force = true })
      is_open = false
    end,
  })
  vim.cmd([[startinsert!]])
  is_open = true
end

-- Add a Neovim command to open GitUI
vim.api.nvim_create_user_command("Gitui", open_gitui, {})
vim.keymap.set("n", "<leader>gg", "<cmd>Gitui<cr>", { desc = "Open Gitui" })
