-- State to track if the window is open
local is_open = false

local function getlazygit()
  -- assumes that which is always present
  local handle = io.popen("which lazygit")
  local lazygit = "lazygit not found"
  if handle then
    lazygit = handle:read("*a"):gsub("%s+", "")
    handle:close()
  end
  return lazygit
end


-- Configuration for the floating GitUI window
local config = {
  binay = getlazygit(),
  args = {},          -- Additional arguments to pass to lazygit or gitui
  width = 80,         -- Width of the floating window (percentage)
  height = 70,        -- Height of the floating window (percentage)
  border = "rounded", -- Border style: "none", "single", "rounded", "solid", "shadow"
}

-- Close the buffer and reset the state when the process exits
local function close_gitui(bufnr)
  if vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end
  is_open = false
end

-- Function to open the GitUI floating window
local function open_gitui()
  if is_open then
    return
  end

  -- Ensure the `gitui` binary is executable
  assert(vim.fn.executable(config.binay) == 1, config.binay .. " is not an executable")

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
  vim.fn.termopen(table.concat(vim.tbl_flatten({ config.binay, config.args }), " "), {
    on_exit = function()
      close_gitui(bufnr)
    end,
  })

  -- Open the floating window
  vim.api.nvim_open_win(bufnr, true, window_options)

  -- quit on control + z
  vim.keymap.set("t", "<C-z>", function()
    close_gitui(bufnr)
  end, { buffer = bufnr, silent = true })
  vim.cmd([[startinsert!]])
  is_open = true
end

-- Add a Neovim command to open GitUI
vim.api.nvim_create_user_command("Gitui", open_gitui, {})
vim.keymap.set("n", "<leader>gg", "<cmd>Gitui<cr>", { desc = "Open Gitui" })
