local M = {}

-- xaaha-light: Minimal colorscheme with neutral greys and teal-amber accents
M.colors = {
  -- Backgrounds
  black = "#F0F5FC",
  darker_black = "#F7FAFF",
  black2 = "#E7EDF5",
  one_bg = "#E2E9F2",
  one_bg2 = "#DCE3ED",
  one_bg3 = "#D5DCE6",
  -- Greys
  grey = "#A7B0BD",
  grey_fg = "#8B94A0",
  grey_fg2 = "#6A7684",
  light_grey = "#596674",
  -- Foregrounds
  white = "#192330",
  -- Accents
  red = "#C73238",
  orange = "#945C14",
  yellow = "#A46707",
  sun = "#B06C00",
  green = "#945C14",
  vibrant_green = "#9C5F10",
  teal = "#0D6E7B",
  cyan = "#0F7C8A",
  blue = "#2468A5",
  nord_blue = "#2468A5",
  purple = "#7F478F",
  magenta = "#7F478F",
  dark_purple = "#6A3977",
  pink = "#C04A62",
  baby_pink = "#C04A62",
  -- UI
  line = "#DCE3ED",
  statusline_bg = "#E7EDF5",
  lightbg = "#DEE5EE",
  pmenu_bg = "#0F7C8A",
  folder_bg = "#2468A5",
  -- Base16
  base00 = "#F0F5FC",
  base01 = "#E2E9F2",
  base02 = "#DCE3ED",
  base03 = "#8B94A0",
  base04 = "#6A7684",
  base05 = "#192330",
  base06 = "#101924",
  base07 = "#0B1219",
  base08 = "#364458",
  base09 = "#192330",
  base0A = "#2468A5",
  base0B = "#945C14",
  base0C = "#0F7C8A",
  base0D = "#0F7C8A",
  base0E = "#192330",
  base0F = "#596674",
}

M.highlights = {
  -- Variables
  ["@variable"] = { fg = M.colors.base08 },
  ["@variable.member"] = { fg = M.colors.base08 },
  ["@variable.builtin"] = { fg = M.colors.base08 },
  ["@variable.parameter"] = { fg = M.colors.base08 },
  ["@parameter"] = { fg = M.colors.base08 },
  -- Keywords
  ["@keyword"] = { fg = M.colors.white, bold = true },
  ["@keyword.function"] = { fg = M.colors.white, bold = true },
  ["@keyword.return"] = { fg = M.colors.white, bold = true },
  ["@keyword.operator"] = { fg = M.colors.white, bold = true },
  ["@keyword.coroutine"] = { fg = M.colors.white, bold = true },
  Keyword = { fg = M.colors.white, bold = true },
  Statement = { fg = M.colors.white, bold = true },
  Conditional = { fg = M.colors.white, bold = true },
  Repeat = { fg = M.colors.white, bold = true },
  -- Types
  ["@type"] = { fg = M.colors.blue },
  ["@type.builtin"] = { fg = M.colors.blue },
  Type = { fg = M.colors.blue },
  Identifier = { fg = M.colors.blue },
  -- Functions
  ["@function"] = { fg = M.colors.cyan },
  ["@function.call"] = { fg = M.colors.cyan },
  ["@function.builtin"] = { fg = M.colors.cyan },
  ["@method"] = { fg = M.colors.cyan },
  ["@method.call"] = { fg = M.colors.cyan },
  Function = { fg = M.colors.cyan },
  -- Strings
  ["@string"] = { fg = M.colors.green },
  String = { fg = M.colors.green },
  -- Numbers/Constants
  ["@number"] = { fg = M.colors.base05 },
  ["@float"] = { fg = M.colors.base05 },
  ["@boolean"] = { fg = M.colors.base05 },
  ["@constant"] = { fg = M.colors.base05 },
  ["@constant.builtin"] = { fg = M.colors.base05 },
  Number = { fg = M.colors.base05 },
  Boolean = { fg = M.colors.base05 },
  Float = { fg = M.colors.base05 },
  Constant = { fg = M.colors.base05 },
  -- Operators
  ["@operator"] = { fg = M.colors.base05 },
  Operator = { fg = M.colors.base05 },
  -- Punctuation
  ["@punctuation.bracket"] = { fg = M.colors.base0F },
  ["@punctuation.delimiter"] = { fg = M.colors.base0F },
  -- Diff
  DiffAdd = { fg = M.colors.base0A },
  GitSignsAdd = { fg = M.colors.base0A },
}

require("xaaha.core.colorscheme").setup_light(M.colors, M.highlights)
