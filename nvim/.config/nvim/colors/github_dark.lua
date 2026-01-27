local M = {}

-- https://github.com/projekt0n/github-nvim-theme
M.colors = {
  -- Backgrounds
  black = "#0d1117",
  darker_black = "#010409",
  black2 = "#161b22",
  one_bg = "#21262d",
  one_bg2 = "#30363d",
  one_bg3 = "#484f58",
  -- Greys
  grey = "#6e7681",
  grey_fg = "#8b949e",
  grey_fg2 = "#8b949e",
  light_grey = "#b1bac4",
  -- Foregrounds
  white = "#c9d1d9",
  darker_white = "#e6edf3",
  bright_white = "#f0f6fc",
  -- Blues
  blue = "#58a6ff",
  blue_bright = "#79c0ff",
  blue_light = "#a5d6ff",
  nord_blue = "#388bfd",
  blue_dark = "#1f6feb",
  -- Greens
  green = "#3fb950",
  vibrant_green = "#56d364",
  green_bright = "#7ee787",
  -- Reds
  red = "#ff7b72",
  red_bright = "#ffa198",
  dark_red = "#f85149",
  -- Oranges
  orange = "#ffa657",
  orange_bright = "#ffc680",
  orange_dark = "#f0883e",
  -- Yellows
  yellow = "#d29922",
  yellow_bright = "#e3b341",
  sun = "#f2cc60",
  -- Purples
  purple = "#d2a8ff",
  purple_bright = "#e2c5ff",
  dark_purple = "#a371f7",
  -- Pinks
  pink = "#f778ba",
  baby_pink = "#ff9bce",
  -- Cyans
  cyan = "#76e3ea",
  cyan_bright = "#b3f0ff",
  teal = "#3fb950",
  -- UI
  line = "#21262d",
  statusline_bg = "#161b22",
  lightbg = "#21262d",
  pmenu_bg = "#58a6ff",
  folder_bg = "#58a6ff",
  -- Git
  git_add = "#3fb950",
  git_change = "#d29922",
  git_delete = "#f85149",
  -- Base16
  base00 = "#0d1117",
  base01 = "#161b22",
  base02 = "#21262d",
  base03 = "#30363d",
  base04 = "#484f58",
  base05 = "#c9d1d9",
  base06 = "#e6edf3",
  base07 = "#f0f6fc",
  base08 = "#ff7b72",
  base09 = "#ffa657",
  base0A = "#d29922",
  base0B = "#a5d6ff",
  base0C = "#79c0ff",
  base0D = "#d2a8ff",
  base0E = "#ff7b72",
  base0F = "#f85149",
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
