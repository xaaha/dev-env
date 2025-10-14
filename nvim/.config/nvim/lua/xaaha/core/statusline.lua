local chevron_right = "\u{eab6}" -- 
local chevron_left = "\u{eab5}"  -- 

--- Gets the current Git branch name
---@return string
local function get_git_branch()
  local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
  if handle then
    local branch = handle:read("*a") -- Read the output of the command
    handle:close()
    branch = branch:gsub("%s+", "")  -- Remove any trailing whitespace
    return branch
  end
  return "" -- Return an empty string if the command fails
end

--- Git component for the statusline
---@return string
local function git_component()
  local branch = get_git_branch()
  if branch == "" then
    return "" -- No branch detected
  end

  -- Trim the branch name to the last 10 characters if it's too long
  local trimmed_branch = #branch > 20 and branch:sub(-20) or branch
  return string.format(" %s " .. chevron_right .. " ", trimmed_branch)
end

local statusline = {
  " %f " .. chevron_right, -- File path. If you need to trim the path use, "[%<%.30f]"
  " %r",                   -- Readonly flag
  "%#GitBranch#",          -- Start git component highlight
  git_component(),
  "%*",                    -- Reset to default highlight
  "%#GitChanges#",
  "%{get(b:,'gitsigns_status','')}",
  "%*",   -- Reset to default highlight
  " %m ", -- Modified flag
  "%=",   -- divider
  chevron_left .. " Line: %l Column: %c ",
}

vim.o.statusline = table.concat(statusline, "")
