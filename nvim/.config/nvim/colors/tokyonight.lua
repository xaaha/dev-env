local M = {}

-- https://github.com/folke/tokyonight.nvim
M.colors = {
  -- Backgrounds
  black = "#1a1b26",
  darker_black = "#16161e",
  black2 = "#1f2335",
  one_bg = "#24283b",
  one_bg2 = "#292e42",
  one_bg3 = "#3b4261",
  -- Greys
  grey = "#414868",
  grey_fg = "#565f89",
  grey_fg2 = "#545c7e",
  light_grey = "#737aa2",
  -- Foregrounds
  white = "#c0caf5",
  darker_white = "#a9b1d6",
  bright_white = "#c0caf5",
  -- Blues
  blue = "#7aa2f7",
  blue0 = "#3d59a1",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  nord_blue = "#7aa2f7",
  cyan = "#7dcfff",
  -- Greens
  green = "#9ece6a",
  vibrant_green = "#73daca",
  green2 = "#41a6b5",
  teal = "#1abc9c",
  -- Reds/Pinks
  red = "#f7768e",
  red1 = "#db4b4b",
  baby_pink = "#ff007c",
  pink = "#ff007c",
  -- Purple
  purple = "#bb9af7",
  dark_purple = "#9d7cd8",
  -- Warm
  orange = "#ff9e64",
  yellow = "#e0af68",
  sun = "#e0af68",
  -- UI
  line = "#292e42",
  statusline_bg = "#16161e",
  lightbg = "#292e42",
  pmenu_bg = "#7aa2f7",
  folder_bg = "#7aa2f7",
  -- Git
  git_add = "#449dab",
  git_change = "#6183bb",
  git_delete = "#914c54",
  -- Base16
  base00 = "#1a1b26",
  base01 = "#1f2335",
  base02 = "#292e42",
  base03 = "#414868",
  base04 = "#565f89",
  base05 = "#a9b1d6",
  base06 = "#c0caf5",
  base07 = "#c0caf5",
  base08 = "#f7768e",
  base09 = "#ff9e64",
  base0A = "#e0af68",
  base0B = "#9ece6a",
  base0C = "#7dcfff",
  base0D = "#7aa2f7",
  base0E = "#bb9af7",
  base0F = "#db4b4b",
}

M.highlights = {
  -- Functions
  Function = { fg = M.colors.blue },
  ["@function"] = { fg = M.colors.blue },
  ["@function.builtin"] = { fg = M.colors.blue },
  ["@function.call"] = { fg = M.colors.blue },
  ["@method"] = { fg = M.colors.blue },
  ["@method.call"] = { fg = M.colors.blue },
  -- Keywords
  Keyword = { fg = M.colors.purple },
  Statement = { fg = M.colors.purple },
  Conditional = { fg = M.colors.purple },
  Repeat = { fg = M.colors.purple },
  ["@keyword"] = { fg = M.colors.purple },
  ["@keyword.function"] = { fg = M.colors.purple },
  ["@keyword.return"] = { fg = M.colors.purple },
  ["@keyword.operator"] = { fg = M.colors.cyan },
  ["@conditional"] = { fg = M.colors.purple },
  ["@repeat"] = { fg = M.colors.purple },
  -- Types
  Type = { fg = M.colors.blue1 },
  ["@type"] = { fg = M.colors.blue1 },
  ["@type.builtin"] = { fg = M.colors.blue1 },
  -- Variables
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.red },
  -- Parameters
  ["@parameter"] = { fg = M.colors.yellow },
  ["@variable.parameter"] = { fg = M.colors.yellow },
  -- Properties/Fields
  ["@property"] = { fg = M.colors.vibrant_green },
  ["@field"] = { fg = M.colors.vibrant_green },
  ["@variable.member"] = { fg = M.colors.vibrant_green },
  -- Constants/Numbers
  Constant = { fg = M.colors.orange },
  ["@constant"] = { fg = M.colors.orange },
  ["@constant.builtin"] = { fg = M.colors.orange },
  Number = { fg = M.colors.orange },
  Float = { fg = M.colors.orange },
  ["@number"] = { fg = M.colors.orange },
  ["@float"] = { fg = M.colors.orange },
  -- Strings
  String = { fg = M.colors.green },
  ["@string"] = { fg = M.colors.green },
  -- Operators/Punctuation
  Operator = { fg = M.colors.blue5 },
  ["@operator"] = { fg = M.colors.blue5 },
  ["@punctuation.bracket"] = { fg = M.colors.darker_white },
  ["@punctuation.delimiter"] = { fg = M.colors.blue5 },
  ["@punctuation.special"] = { fg = M.colors.blue5 },
  -- Constructors
  ["@constructor"] = { fg = M.colors.blue1 },
  -- Include/PreProc
  Include = { fg = M.colors.cyan },
  ["@include"] = { fg = M.colors.cyan },
  PreProc = { fg = M.colors.cyan },
  -- Special
  Special = { fg = M.colors.blue1 },
  -- Comments
  Comment = { fg = M.colors.grey_fg, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg, italic = true },
  -- Tags
  ["@tag"] = { fg = M.colors.red },
  ["@tag.attribute"] = { fg = M.colors.vibrant_green },
  ["@tag.delimiter"] = { fg = M.colors.darker_white },
  -- Namespace
  ["@namespace"] = { fg = M.colors.blue1 },
  ["@module"] = { fg = M.colors.blue1 },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
