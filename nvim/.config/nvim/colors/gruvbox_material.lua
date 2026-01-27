local M = {}

-- https://github.com/sainnhe/gruvbox-material
M.colors = {
  -- Backgrounds
  black = "#282828",
  darker_black = "#1b1b1b",
  black2 = "#32302f",
  one_bg = "#32302f",
  one_bg2 = "#3c3836",
  one_bg3 = "#45403d",
  -- Greys
  grey = "#45403d",
  grey_fg = "#928374",
  grey_fg2 = "#7c6f64",
  light_grey = "#a89984",
  -- Foregrounds
  white = "#d4be98",
  darker_white = "#ddc7a1",
  bright_white = "#ddc7a1",
  -- Accents
  red = "#ea6962",
  orange = "#e78a4e",
  yellow = "#d8a657",
  green = "#a9b665",
  aqua = "#89b482",
  blue = "#7daea3",
  purple = "#d3869b",
  -- Derived
  cyan = "#89b482",
  teal = "#89b482",
  nord_blue = "#7daea3",
  vibrant_green = "#a9b665",
  baby_pink = "#d3869b",
  pink = "#d3869b",
  dark_purple = "#d3869b",
  sun = "#d8a657",
  dark_red = "#ea6962",
  -- UI
  line = "#32302f",
  statusline_bg = "#282828",
  lightbg = "#3c3836",
  pmenu_bg = "#a9b665",
  folder_bg = "#7daea3",
  -- Git
  git_add = "#a9b665",
  git_change = "#d8a657",
  git_delete = "#ea6962",
  -- Base16
  base00 = "#282828",
  base01 = "#32302f",
  base02 = "#3c3836",
  base03 = "#45403d",
  base04 = "#5a524c",
  base05 = "#d4be98",
  base06 = "#ddc7a1",
  base07 = "#ddc7a1",
  base08 = "#ea6962",
  base09 = "#e78a4e",
  base0A = "#d8a657",
  base0B = "#a9b665",
  base0C = "#89b482",
  base0D = "#7daea3",
  base0E = "#d3869b",
  base0F = "#ea6962",
}

M.highlights = {
  -- Functions
  Function = { fg = M.colors.green },
  ["@function"] = { fg = M.colors.green },
  ["@function.builtin"] = { fg = M.colors.green },
  ["@function.call"] = { fg = M.colors.green },
  ["@method"] = { fg = M.colors.green },
  ["@method.call"] = { fg = M.colors.green },
  ["@function.macro"] = { fg = M.colors.aqua },
  Macro = { fg = M.colors.aqua },
  -- Keywords
  Keyword = { fg = M.colors.red, italic = true },
  Statement = { fg = M.colors.red },
  Conditional = { fg = M.colors.red },
  Repeat = { fg = M.colors.red },
  ["@keyword"] = { fg = M.colors.red, italic = true },
  ["@keyword.function"] = { fg = M.colors.red, italic = true },
  ["@keyword.return"] = { fg = M.colors.red, italic = true },
  ["@keyword.operator"] = { fg = M.colors.orange },
  ["@conditional"] = { fg = M.colors.red },
  ["@repeat"] = { fg = M.colors.red },
  -- Types
  Type = { fg = M.colors.yellow },
  ["@type"] = { fg = M.colors.yellow },
  ["@type.builtin"] = { fg = M.colors.yellow },
  ["@type.qualifier"] = { fg = M.colors.orange },
  Structure = { fg = M.colors.yellow },
  Typedef = { fg = M.colors.yellow },
  -- Variables
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.blue },
  ["@parameter"] = { fg = M.colors.white },
  ["@variable.parameter"] = { fg = M.colors.white },
  Identifier = { fg = M.colors.blue },
  -- Properties/Fields
  ["@property"] = { fg = M.colors.blue },
  ["@field"] = { fg = M.colors.blue },
  ["@variable.member"] = { fg = M.colors.blue },
  -- Constants/Numbers
  Constant = { fg = M.colors.aqua },
  ["@constant"] = { fg = M.colors.aqua },
  ["@constant.builtin"] = { fg = M.colors.aqua },
  ["@constant.macro"] = { fg = M.colors.aqua },
  Number = { fg = M.colors.purple },
  Float = { fg = M.colors.purple },
  Boolean = { fg = M.colors.purple },
  ["@number"] = { fg = M.colors.purple },
  ["@float"] = { fg = M.colors.purple },
  ["@boolean"] = { fg = M.colors.purple },
  -- Strings
  String = { fg = M.colors.green },
  Character = { fg = M.colors.green },
  ["@string"] = { fg = M.colors.green },
  ["@character"] = { fg = M.colors.green },
  ["@string.escape"] = { fg = M.colors.aqua },
  ["@string.regex"] = { fg = M.colors.aqua },
  ["@string.special"] = { fg = M.colors.aqua },
  -- Operators/Punctuation
  Operator = { fg = M.colors.orange },
  ["@operator"] = { fg = M.colors.orange },
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.aqua },
  Delimiter = { fg = M.colors.white },
  -- Labels/Storage
  Label = { fg = M.colors.orange },
  ["@label"] = { fg = M.colors.orange },
  StorageClass = { fg = M.colors.orange },
  ["@storageclass"] = { fg = M.colors.orange },
  -- Include/PreProc
  Include = { fg = M.colors.aqua },
  ["@include"] = { fg = M.colors.aqua },
  PreProc = { fg = M.colors.purple },
  Define = { fg = M.colors.purple },
  -- Special
  Special = { fg = M.colors.yellow },
  SpecialChar = { fg = M.colors.yellow },
  -- Constructors
  ["@constructor"] = { fg = M.colors.yellow },
  -- Comments
  Comment = { fg = M.colors.grey_fg, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg, italic = true },
  -- Tags
  Tag = { fg = M.colors.orange },
  ["@tag"] = { fg = M.colors.orange },
  ["@tag.attribute"] = { fg = M.colors.aqua },
  ["@tag.delimiter"] = { fg = M.colors.white },
  -- Namespace
  ["@namespace"] = { fg = M.colors.yellow },
  ["@module"] = { fg = M.colors.yellow },
  -- Exception
  Exception = { fg = M.colors.red },
  ["@exception"] = { fg = M.colors.red },
  -- Attribute
  ["@attribute"] = { fg = M.colors.aqua },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
