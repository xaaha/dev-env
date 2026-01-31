local M = {}

-- https://github.com/projekt0n/github-nvim-theme
M.colors = {
  -- Backgrounds
  black = "#22272e",
  darker_black = "#1c2128",
  black2 = "#2d333b",
  one_bg = "#373e47",
  one_bg2 = "#444c56",
  one_bg3 = "#545d68",
  -- Greys
  grey = "#768390",
  grey_fg = "#909dab",
  grey_fg2 = "#909dab",
  light_grey = "#adbac7",
  -- Foregrounds
  white = "#adbac7",
  darker_white = "#cdd9e5",
  bright_white = "#cdd9e5",
  -- Blues
  blue = "#539bf5",
  blue_bright = "#6cb6ff",
  blue_light = "#96d0ff",
  nord_blue = "#4184e4",
  blue_dark = "#316dca",
  -- Greens
  green = "#57ab5a",
  vibrant_green = "#6bc46d",
  green_bright = "#8ddb8c",
  red = "#f47067",
  red_bright = "#ff938a",
  dark_red = "#e5534b",
  -- Oranges
  orange = "#e09b62",
  orange_bright = "#edb383",
  orange_dark = "#d18151",
  -- Yellows
  yellow = "#c69026",
  yellow_bright = "#daaa3f",
  sun = "#e2c08d",
  -- Purples
  purple = "#b083f0",
  purple_bright = "#c297ff",
  dark_purple = "#986ee2",
  -- Pinks
  pink = "#e275ad",
  baby_pink = "#f098c3",
  -- Cyans
  cyan = "#76d5e3",
  cyan_bright = "#a2e2f4",
  teal = "#57ab5a",
  -- UI
  line = "#373e47",
  statusline_bg = "#2d333b",
  lightbg = "#373e47",
  pmenu_bg = "#539bf5",
  folder_bg = "#539bf5",
  -- Git
  git_add = "#57ab5a",
  git_change = "#c69026",
  git_delete = "#e5534b",
  -- Base16
  base00 = "#22272e",
  base01 = "#2d333b",
  base02 = "#373e47",
  base03 = "#444c56",
  base04 = "#545d68",
  base05 = "#adbac7",
  base06 = "#cdd9e5",
  base07 = "#cdd9e5",
  base08 = "#f47067",
  base09 = "#e09b62",
  base0A = "#c69026",
  base0B = "#96d0ff",
  base0C = "#6cb6ff",
  base0D = "#b083f0",
  base0E = "#f47067",
  base0F = "#e5534b",
}

M.highlights = {
  -- Functions
  Function = { fg = M.colors.purple },
  ["@function"] = { fg = M.colors.purple },
  ["@function.builtin"] = { fg = M.colors.purple },
  ["@function.call"] = { fg = M.colors.purple },
  ["@method"] = { fg = M.colors.purple },
  ["@method.call"] = { fg = M.colors.purple },
  -- Keywords
  Keyword = { fg = M.colors.red },
  Statement = { fg = M.colors.red },
  Conditional = { fg = M.colors.red },
  Repeat = { fg = M.colors.red },
  ["@keyword"] = { fg = M.colors.red },
  ["@keyword.function"] = { fg = M.colors.red },
  ["@keyword.return"] = { fg = M.colors.red },
  ["@keyword.operator"] = { fg = M.colors.red },
  ["@conditional"] = { fg = M.colors.red },
  ["@repeat"] = { fg = M.colors.red },
  -- Types
  Type = { fg = M.colors.orange },
  ["@type"] = { fg = M.colors.orange },
  ["@type.builtin"] = { fg = M.colors.orange },
  Typedef = { fg = M.colors.orange },
  -- Variables
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.blue_bright },
  ["@parameter"] = { fg = M.colors.white },
  ["@variable.parameter"] = { fg = M.colors.white },
  -- Properties/Fields
  ["@property"] = { fg = M.colors.blue_bright },
  ["@field"] = { fg = M.colors.blue_bright },
  ["@variable.member"] = { fg = M.colors.blue_bright },
  -- Constants/Numbers
  Constant = { fg = M.colors.blue_bright },
  ["@constant"] = { fg = M.colors.blue_bright },
  ["@constant.builtin"] = { fg = M.colors.blue_bright },
  Number = { fg = M.colors.blue_bright },
  Float = { fg = M.colors.blue_bright },
  Boolean = { fg = M.colors.blue_bright },
  ["@number"] = { fg = M.colors.blue_bright },
  ["@float"] = { fg = M.colors.blue_bright },
  ["@boolean"] = { fg = M.colors.blue_bright },
  -- Strings
  String = { fg = M.colors.blue_light },
  ["@string"] = { fg = M.colors.blue_light },
  Character = { fg = M.colors.blue_light },
  ["@character"] = { fg = M.colors.blue_light },
  -- Operators/Punctuation
  Operator = { fg = M.colors.blue_bright },
  ["@operator"] = { fg = M.colors.blue_bright },
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.blue_bright },
  Delimiter = { fg = M.colors.white },
  -- Constructors
  ["@constructor"] = { fg = M.colors.orange },
  -- Include/PreProc
  Include = { fg = M.colors.red },
  ["@include"] = { fg = M.colors.red },
  PreProc = { fg = M.colors.red },
  Define = { fg = M.colors.red },
  -- Special
  Special = { fg = M.colors.blue_bright },
  SpecialChar = { fg = M.colors.blue_bright },
  -- Comments
  Comment = { fg = M.colors.grey_fg, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg, italic = true },
  -- Tags
  Tag = { fg = M.colors.green },
  ["@tag"] = { fg = M.colors.green },
  ["@tag.attribute"] = { fg = M.colors.blue_bright },
  ["@tag.delimiter"] = { fg = M.colors.white },
  -- Namespace
  ["@namespace"] = { fg = M.colors.orange },
  ["@module"] = { fg = M.colors.orange },
  -- Labels/Storage
  Label = { fg = M.colors.blue_bright },
  ["@label"] = { fg = M.colors.blue_bright },
  StorageClass = { fg = M.colors.red },
  ["@storageclass"] = { fg = M.colors.red },
  Structure = { fg = M.colors.red },
  -- Attribute/Escape
  ["@attribute"] = { fg = M.colors.purple },
  ["@string.escape"] = { fg = M.colors.blue_bright },
  ["@string.special"] = { fg = M.colors.blue_bright },
  ["@string.regex"] = { fg = M.colors.blue_bright },
  ["@type.qualifier"] = { fg = M.colors.red },
  -- Exception
  Exception = { fg = M.colors.red },
  ["@exception"] = { fg = M.colors.red },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
