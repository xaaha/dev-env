local sep_right = "" -- 
-- local chevron_left = "\u{eab5}" -- 

local function git_branch()
  local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]
  if not branch or branch == "" or branch == "HEAD" then
    return ""
  end
  branch = #branch > 20 and branch:sub(-20) or branch
  return " " .. branch .. " " .. sep_right .. " "
end

local statusline = table.concat({
  " %f " .. sep_right, -- File name/path
  " %r",               -- Readonly flag
  "%#GitBranch#",      -- Git highlight start
  "%{v:lua.git_branch()}",
  "%*",                -- Reset highlight
  "%#GitChanges#",
  "%{get(b:,'gitsigns_status','')}",
  "%*",
  " %m ", -- Modified flag
  -- "%=",                              -- divider
  --  .. "%{get(b:, 'gitsigns_blame_line', '')} ",
})

_G.git_branch = git_branch

vim.o.statusline = statusline
