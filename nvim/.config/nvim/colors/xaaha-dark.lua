local M = {}

-- xaaha: Minimal colorscheme with neutral greys and teal-amber accents
M.colors = {
  -- Backgrounds
  black = "#151B23",
  darker_black = "#0D1117",
  black2 = "#1A2129",
  one_bg = "#1C2329",
  one_bg2 = "#212931",
  one_bg3 = "#252B33",
  -- Greys
  grey = "#5A6474",
  grey_fg = "#7A8997",
  grey_fg2 = "#8A98A8",
  light_grey = "#98A4B6",
  -- Foregrounds
  white = "#E5EDFA",
  -- Accents
  red = "#E96468",
  orange = "#E4B46D",
  yellow = "#F2BF69",
  sun = "#FFCD7C",
  green = "#E4B46D",
  vibrant_green = "#EBC07A",
  teal = "#69B2B7",
  cyan = "#75BEC4",
  blue = "#75A9E0",
  nord_blue = "#75A9E0",
  purple = "#BF97BB",
  magenta = "#BF97BB",
  dark_purple = "#AD86A9",
  pink = "#F0A7B1",
  baby_pink = "#F0A7B1",
  -- UI
  line = "#202830",
  statusline_bg = "#1A2028",
  lightbg = "#252D35",
  pmenu_bg = "#75BEC4",
  folder_bg = "#75A9E0",
  -- Base16
  base00 = "#151B23",
  base01 = "#1C2329",
  base02 = "#212931",
  base03 = "#7A8997",
  base04 = "#8A98A8",
  base05 = "#E5EDFA",
  base06 = "#EDF3FF",
  base07 = "#F5FAFF",
  base08 = "#C5D0E0",
  base09 = "#E5EDFA",
  base0A = "#75A9E0",
  base0B = "#E4B46D",
  base0C = "#75BEC4",
  base0D = "#75BEC4",
  base0E = "#E5EDFA",
  base0F = "#98A4B6",
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

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
