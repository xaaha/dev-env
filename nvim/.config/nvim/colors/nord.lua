local M = {}

-- https://www.nordtheme.com/docs/colors-and-palettes
M.colors = {
  -- Backgrounds (Polar Night)
  black = "#2E3440",
  darker_black = "#272C36",
  black2 = "#3B4252",
  one_bg = "#3B4252",
  one_bg2 = "#434C5E",
  one_bg3 = "#4C566A",
  -- Greys
  grey = "#4C566A",
  grey_fg = "#616E88",
  grey_fg2 = "#616E88",
  light_grey = "#D8DEE9",
  -- Foregrounds (Snow Storm)
  white = "#D8DEE9",
  darker_white = "#E5E9F0",
  bright_white = "#ECEFF4",
  -- Frost
  teal = "#8FBCBB",
  cyan = "#88C0D0",
  nord_blue = "#81A1C1",
  blue = "#5E81AC",
  -- Aurora
  red = "#BF616A",
  orange = "#D08770",
  yellow = "#EBCB8B",
  green = "#A3BE8C",
  purple = "#B48EAD",
  -- Derived
  baby_pink = "#BF616A",
  pink = "#BF616A",
  vibrant_green = "#A3BE8C",
  sun = "#EBCB8B",
  dark_purple = "#B48EAD",
  -- UI
  line = "#3B4252",
  statusline_bg = "#2E3440",
  lightbg = "#3B4252",
  pmenu_bg = "#81A1C1",
  folder_bg = "#81A1C1",
  -- Base16
  base00 = "#2E3440",
  base01 = "#3B4252",
  base02 = "#434C5E",
  base03 = "#4C566A",
  base04 = "#D8DEE9",
  base05 = "#E5E9F0",
  base06 = "#ECEFF4",
  base07 = "#8FBCBB",
  base08 = "#BF616A",
  base09 = "#D08770",
  base0A = "#EBCB8B",
  base0B = "#A3BE8C",
  base0C = "#88C0D0",
  base0D = "#81A1C1",
  base0E = "#B48EAD",
  base0F = "#5E81AC",
}

M.highlights = {
  -- Functions
  Function = { fg = M.colors.cyan },
  ["@function"] = { fg = M.colors.cyan },
  ["@function.builtin"] = { fg = M.colors.cyan },
  ["@function.call"] = { fg = M.colors.cyan },
  ["@method"] = { fg = M.colors.cyan },
  ["@method.call"] = { fg = M.colors.cyan },
  -- Keywords
  Keyword = { fg = M.colors.nord_blue },
  Statement = { fg = M.colors.nord_blue },
  Conditional = { fg = M.colors.nord_blue },
  Repeat = { fg = M.colors.nord_blue },
  ["@keyword"] = { fg = M.colors.nord_blue },
  ["@keyword.function"] = { fg = M.colors.nord_blue },
  ["@keyword.return"] = { fg = M.colors.nord_blue },
  ["@keyword.operator"] = { fg = M.colors.nord_blue },
  ["@conditional"] = { fg = M.colors.nord_blue },
  ["@repeat"] = { fg = M.colors.nord_blue },
  -- Types
  Type = { fg = M.colors.teal },
  ["@type"] = { fg = M.colors.teal },
  ["@type.builtin"] = { fg = M.colors.teal },
  Typedef = { fg = M.colors.teal },
  -- Variables
  Identifier = { fg = M.colors.white },
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.nord_blue },
  ["@variable.parameter"] = { fg = M.colors.white },
  ["@variable.member"] = { fg = M.colors.white },
  ["@parameter"] = { fg = M.colors.white },
  ["@property"] = { fg = M.colors.white },
  ["@field"] = { fg = M.colors.white },
  -- Constants/Numbers
  Constant = { fg = M.colors.white },
  ["@constant"] = { fg = M.colors.white },
  ["@constant.builtin"] = { fg = M.colors.nord_blue },
  Number = { fg = M.colors.purple },
  Float = { fg = M.colors.purple },
  Boolean = { fg = M.colors.nord_blue },
  ["@number"] = { fg = M.colors.purple },
  ["@float"] = { fg = M.colors.purple },
  ["@boolean"] = { fg = M.colors.nord_blue },
  -- Operators/Punctuation
  Operator = { fg = M.colors.nord_blue },
  ["@operator"] = { fg = M.colors.nord_blue },
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.nord_blue },
  Delimiter = { fg = M.colors.white },
  -- Include/PreProc
  Include = { fg = M.colors.nord_blue },
  ["@include"] = { fg = M.colors.nord_blue },
  PreProc = { fg = M.colors.nord_blue },
  Define = { fg = M.colors.nord_blue },
  PreCondit = { fg = M.colors.nord_blue },
  -- Constructors/Macros
  ["@constructor"] = { fg = M.colors.nord_blue },
  Macro = { fg = M.colors.nord_blue },
  ["@function.macro"] = { fg = M.colors.nord_blue },
  ["@constant.macro"] = { fg = M.colors.nord_blue },
  -- Labels/Storage
  Label = { fg = M.colors.nord_blue },
  ["@label"] = { fg = M.colors.nord_blue },
  StorageClass = { fg = M.colors.nord_blue },
  ["@storageclass"] = { fg = M.colors.nord_blue },
  Structure = { fg = M.colors.nord_blue },
  -- Exception
  Exception = { fg = M.colors.nord_blue },
  ["@exception"] = { fg = M.colors.nord_blue },
  -- Namespace/Module
  ["@module"] = { fg = M.colors.white },
  ["@namespace"] = { fg = M.colors.white },
  -- Tags
  Tag = { fg = M.colors.nord_blue },
  ["@tag"] = { fg = M.colors.nord_blue },
  ["@tag.attribute"] = { fg = M.colors.teal },
  ["@tag.delimiter"] = { fg = M.colors.white },
  -- Special
  Special = { fg = M.colors.white },
  SpecialChar = { fg = M.colors.yellow },
  Debug = { fg = M.colors.white },
  ["@debug"] = { fg = M.colors.white },
  ["@attribute"] = { fg = M.colors.teal },
  ["@type.qualifier"] = { fg = M.colors.nord_blue },
  ["@text.title"] = { fg = M.colors.nord_blue, bold = true },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
