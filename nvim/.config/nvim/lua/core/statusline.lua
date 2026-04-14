local mode_colors = {
  n = "StModeNormal",
  i = "StModeInsert",
  v = "StModeVisual",
  V = "StModeVisual",
  ["\22"] = "StModeVisual",
  s = "StModeVisual",
  S = "StModeVisual",
  R = "StModeReplace",
  c = "StModeCommand",
  t = "StModeTerminal",
}

local mode_labels = {
  n = "NOR",
  i = "INS",
  v = "VIS",
  V = "V-L",
  ["\22"] = "V-B",
  s = "SEL",
  S = "S-L",
  R = "REP",
  c = "CMD",
  t = "TER",
}

local function set_highlights()
  local st_bg = vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg

  -- Mode: colored text on statusline bg
  vim.api.nvim_set_hl(0, "StModeNormal", { fg = "#a3be8c", bg = st_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeInsert", { fg = "#88c0d0", bg = st_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeVisual", { fg = "#d08770", bg = st_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeReplace", { fg = "#bf616a", bg = st_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeCommand", { fg = "#ebcb8b", bg = st_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeTerminal", { fg = "#b48ead", bg = st_bg, bold = true })
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, { callback = set_highlights })

-- Cached git branch (async to avoid blocking)
local cached_branch = ""

local function update_git_branch()
  vim.system({ "git", "rev-parse", "--abbrev-ref", "HEAD" }, { text = true }, function(result)
    vim.schedule(function()
      if result.code ~= 0 or not result.stdout or result.stdout == "" then
        cached_branch = ""
      else
        local branch = vim.trim(result.stdout)
        if #branch > 30 then
          cached_branch = branch:sub(1, 28) .. ".."
        else
          cached_branch = branch
        end
      end
      vim.cmd.redrawstatus()
    end)
  end)
end

vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "FocusGained", "DirChanged" }, {
  callback = update_git_branch,
})

local function file_size()
  local file = vim.fn.expand("%:p")
  if file == "" then return "" end
  local size = vim.fn.getfsize(file)
  if size < 0 then return "" end
  local units = { "B", "KB", "MB", "GB" }
  local i = 1
  while size >= 1024 and i < #units do
    size = size / 1024
    i = i + 1
  end
  return string.format("%.1f%s", size, units[i])
end

function _G.statusline()
  local mode = vim.fn.mode()
  local mode_hl = mode_colors[mode] or "StModeNormal"
  local label = mode_labels[mode] or "NOR"

  -- LEFT
  local left = "%#" .. mode_hl .. "# " .. label .. " "

  local path = vim.fn.expand("%:~:.")
  if path == "" then path = "[No Name]" end
  left = left .. "%#StatusLine# " .. path .. " "

  if vim.bo.readonly then
    left = left .. "[RO] "
  end
  if vim.bo.modified then
    left = left .. "[+] "
  end

  left = left .. "| %#GitBranch#"
  if cached_branch ~= "" then
    left = left .. " " .. cached_branch .. " "
  end

  local gs = vim.b.gitsigns_status
  if gs and gs ~= "" then
    left = left .. "%#GitChanges#" .. gs .. " "
  end

  -- LEFT: diagnostics
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warns = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  if errors > 0 then
    left = left .. "%#DiagnosticError# " .. errors .. " "
  end
  if warns > 0 then
    left = left .. "%#DiagnosticWarn# " .. warns .. " "
  end

  -- RIGHT
  local right = ""
  local fsize = file_size()
  if fsize ~= "" then
    right = "%#StatusLine# " .. fsize .. " | %L Lines "
  end

  return left .. "%#StatusLine#%=" .. right
end

_G.file_size = file_size
vim.o.laststatus = 3
vim.o.statusline = "%{%v:lua.statusline()%}"
