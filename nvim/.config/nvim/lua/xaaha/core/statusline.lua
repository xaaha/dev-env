local chevron_left = ""
local chevron_right = ""

local function git_branch()
  local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1]
  if vim.v.shell_error ~= 0 or not branch or branch == "" then
    return "Not a Git Repo "
  end
  branch = #branch > 30 and branch:sub(-30) or branch
  return "  " .. branch .. " "
end

local statusline = table.concat({
  " %f " .. chevron_left, -- File name/path
  " %r",                  -- Readonly flag
  "%#GitBranch#",         -- Git highlight start
  "%*",                   -- Reset highlight
  "%#GitChanges#",
  "%{get(b:,'gitsigns_status','')}",
  "%*",
  " %m ", -- Modified flag
  "%=",   -- divider
  chevron_right .. " %{v:lua.git_branch()}",
})

_G.git_branch = git_branch

vim.o.statusline = statusline
