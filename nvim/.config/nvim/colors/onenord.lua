local M = {}

-- https://github.com/rmehri01/onenord.nvim
M.colors = {
  -- Backgrounds
  black = "#2E3440",
  darker_black = "#282E3A",
  black2 = "#353B49",
  one_bg = "#3B4252",
  one_bg2 = "#3F4758",
  one_bg3 = "#434C5E",
  -- Greys
  grey = "#4C566A",
  grey_fg = "#646A76",
  grey_fg2 = "#6C7A96",
  light_grey = "#6C7A96",
  -- Foregrounds
  white = "#C8D0E0",
  darker_white = "#E5E9F0",
  bright_white = "#ECEFF4",
  -- Frost
  teal = "#8FBCBB",
  cyan = "#88C0D0",
  nord_blue = "#81A1C1",
  blue = "#5E81AC",
  -- Aurora
  red = "#D57780",
  dark_red = "#BF616A",
  orange = "#D08F70",
  yellow = "#EBCB8B",
  green = "#A3BE8C",
  purple = "#B988B0",
  light_purple = "#B48EAD",
  -- Pinks
  pink = "#E85B7A",
  dark_pink = "#E44675",
  baby_pink = "#DE878F",
  -- Derived
  vibrant_green = "#A3BE8C",
  sun = "#EBCB8B",
  dark_purple = "#B48EAD",
  -- UI
  line = "#3B4252",
  statusline_bg = "#2E3440",
  lightbg = "#3F4758",
  pmenu_bg = "#81A1C1",
  folder_bg = "#81A1C1",
  -- Base16
  base00 = "#2E3440",
  base01 = "#353B49",
  base02 = "#3F4758",
  base03 = "#434C5E",
  base04 = "#4C566A",
  base05 = "#C8D0E0",
  base06 = "#E5E9F0",
  base07 = "#ECEFF4",
  base08 = "#D57780",
  base09 = "#D08F70",
  base0A = "#EBCB8B",
  base0B = "#A3BE8C",
  base0C = "#88C0D0",
  base0D = "#81A1C1",
  base0E = "#B988B0",
  base0F = "#BF616A",
}

M.highlights = {
  -- Functions
  Function = { fg = M.colors.nord_blue },
  ["@function"] = { fg = M.colors.nord_blue },
  ["@function.builtin"] = { fg = M.colors.nord_blue },
  ["@function.call"] = { fg = M.colors.nord_blue },
  ["@method"] = { fg = M.colors.nord_blue },
  ["@method.call"] = { fg = M.colors.nord_blue },
  -- Keywords
  Keyword = { fg = M.colors.purple },
  Statement = { fg = M.colors.purple },
  Conditional = { fg = M.colors.purple },
  Repeat = { fg = M.colors.purple },
  ["@keyword"] = { fg = M.colors.purple },
  ["@keyword.function"] = { fg = M.colors.purple },
  ["@keyword.return"] = { fg = M.colors.purple },
  ["@conditional"] = { fg = M.colors.purple },
  ["@repeat"] = { fg = M.colors.purple },
  -- Types
  Type = { fg = M.colors.yellow },
  ["@type"] = { fg = M.colors.yellow },
  ["@type.builtin"] = { fg = M.colors.yellow },
  -- Variables
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.cyan },
  -- Parameters
  ["@parameter"] = { fg = M.colors.red },
  ["@variable.parameter"] = { fg = M.colors.red },
  -- Numbers
  Number = { fg = M.colors.orange },
  Float = { fg = M.colors.orange },
  ["@number"] = { fg = M.colors.orange },
  ["@float"] = { fg = M.colors.orange },
  -- Comments
  Comment = { fg = M.colors.grey_fg2, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg2, italic = true },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
