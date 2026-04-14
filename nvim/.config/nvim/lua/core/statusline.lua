-- Mode colors (applied as highlight groups)
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

-- Define mode highlight groups (refreshed on ColorScheme)
local function set_mode_highlights()
  local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
  vim.api.nvim_set_hl(0, "StModeNormal", { fg = "#a3be8c", bg = normal_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeInsert", { fg = "#88c0d0", bg = normal_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeVisual", { fg = "#d08770", bg = normal_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeReplace", { fg = "#bf616a", bg = normal_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeCommand", { fg = "#ebcb8b", bg = normal_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeTerminal", { fg = "#b48ead", bg = normal_bg, bold = true })
  vim.api.nvim_set_hl(0, "StFile", { fg = "NONE", bg = "NONE" })
  vim.api.nvim_set_hl(0, "StDim", { link = "NonText" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })
end

set_mode_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_mode_highlights })

-- Cached git branch
local cached_branch = ""

local function update_git_branch()
  local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1]
  if vim.v.shell_error ~= 0 or not branch or branch == "" then
    cached_branch = ""
  elseif #branch > 30 then
    cached_branch = branch:sub(1, 28) .. ".."
  else
    cached_branch = branch
  end
end

update_git_branch()
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "DirChanged" }, {
  callback = update_git_branch,
})

-- Global statusline
function _G.statusline()
  local mode = vim.fn.mode()
  local hl = mode_colors[mode] or "StModeNormal"
  local label = mode_labels[mode] or "NOR"

  local left = {}
  local center = {}
  local right = {}

  -- LEFT: mode
  table.insert(left, "%#" .. hl .. "# " .. label .. " ")

  -- CENTER: file path + modified + branch + gitsigns
  local path = vim.fn.expand("%:~:.")
  if path == "" then path = "[No Name]" end
  table.insert(center, "%#StFile#" .. path)

  if vim.bo.modified then
    table.insert(center, " %#StDim#[+]")
  end
  if vim.bo.readonly then
    table.insert(center, " %#StDim#[RO]")
  end

  if cached_branch ~= "" then
    table.insert(center, "%#StDim#  " .. cached_branch)
  end

  local gs = vim.b.gitsigns_status
  if gs and gs ~= "" then
    table.insert(center, " %#GitChanges#" .. gs)
  end

  -- RIGHT: diagnostics + line.col
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warns = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  if errors > 0 then
    table.insert(right, "%#DiagnosticError# " .. errors .. " ")
  end
  if warns > 0 then
    table.insert(right, "%#DiagnosticWarn# " .. warns .. " ")
  end

  local line = vim.fn.line(".")
  local col = vim.fn.virtcol(".")
  table.insert(right, "%#StDim#" .. line .. "." .. col .. " ")

  return table.concat(left)
      .. "%="
      .. table.concat(center)
      .. "%="
      .. table.concat(right)
end

vim.o.laststatus = 3
vim.o.statusline = "%{%v:lua.statusline()%}"
