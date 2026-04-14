local chevron_left = ""
local chevron_right = ""

local cached_branch = ""

local function update_git_branch()
  local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1]
  if vim.v.shell_error ~= 0 or not branch or branch == "" then
    cached_branch = "Not a Git Repo "
  elseif #branch > 50 then
    cached_branch = "  " .. branch:sub(1, 48) .. "... "
  else
    cached_branch = "  " .. branch .. " "
  end
end

-- Only update on events that can change the branch, not every statusline redraw
update_git_branch()
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "DirChanged" }, {
  callback = update_git_branch,
})

local function git_branch()
  return cached_branch
end

local function file_size()
  local file = vim.fn.expand("%:p")
  if file == "" then
    return ""
  end

  local size = vim.fn.getfsize(file)
  if size < 0 then
    return ""
  end

  -- human-readable
  local units = { "B", "KB", "MB", "GB" }
  local i = 1
  while size >= 1024 and i < #units do
    size = size / 1024
    i = i + 1
  end

  return string.format(" %.1f%s ", size, units[i])
end

local statusline = table.concat({
  " %f " .. " | %{v:lua.git_branch()}" .. chevron_left, -- File name/path
  " %r",                                                -- Readonly flag
  "%#GitBranch#",                                       -- Git highlight start
  "%*",                                                 -- Reset highlight
  "%#GitChanges#",
  " %{get(b:,'gitsigns_status','')}",
  "%*",
  " %m ", -- Modified flag
  "%=",   -- divider
  chevron_right .. " %{v:lua.file_size()} | %L Lines ",
})

_G.git_branch = git_branch
_G.file_size = file_size
vim.o.statusline = statusline
