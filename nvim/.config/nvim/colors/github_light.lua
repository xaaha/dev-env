local M = {}

-- https://github.com/projekt0n/github-nvim-theme
M.colors = {
  -- Backgrounds
  black = "#ffffff",
  darker_black = "#f6f8fa",
  black2 = "#eaeef2",
  one_bg = "#eaeef2",
  one_bg2 = "#d0d7de",
  one_bg3 = "#afb8c1",
  -- Greys
  grey = "#d0d7de",
  grey_fg = "#57606a",
  grey_fg2 = "#6e7781",
  light_grey = "#8c959f",
  -- Foregrounds
  white = "#24292f",
  darker_white = "#32383f",
  bright_white = "#1F2328",
  -- Blues
  blue = "#0969da",
  blue_bright = "#218bff",
  blue_const = "#0550ae",
  blue_string = "#0a3069",
  nord_blue = "#0969da",
  blue_dark = "#033d8b",
  -- Greens
  green = "#1a7f37",
  vibrant_green = "#2da44e",
  green_bright = "#4ac26b",
  green_tag = "#116329",
  -- Reds
  red = "#cf222e",
  red_bright = "#fa4549",
  dark_red = "#a40e26",
  -- Oranges
  orange = "#953800",
  orange_bright = "#bc4c00",
  orange_light = "#e16f24",
  -- Yellows
  yellow = "#9a6700",
  yellow_bright = "#bf8700",
  sun = "#d4a72c",
  -- Purples
  purple = "#6639ba",
  purple_bright = "#8250df",
  dark_purple = "#512a97",
  -- Pinks
  pink = "#bf3989",
  baby_pink = "#e85aad",
  -- Cyans
  cyan = "#1b7c83",
  cyan_bright = "#3192aa",
  teal = "#1a7f37",
  -- UI
  line = "#d0d7de",
  statusline_bg = "#f6f8fa",
  lightbg = "#eaeef2",
  pmenu_bg = "#0969da",
  folder_bg = "#0969da",
  -- Git
  git_add = "#1a7f37",
  git_change = "#9a6700",
  git_delete = "#cf222e",
  -- Base16
  base00 = "#ffffff",
  base01 = "#f6f8fa",
  base02 = "#eaeef2",
  base03 = "#d0d7de",
  base04 = "#afb8c1",
  base05 = "#24292f",
  base06 = "#32383f",
  base07 = "#1F2328",
  base08 = "#cf222e",
  base09 = "#953800",
  base0A = "#9a6700",
  base0B = "#0a3069",
  base0C = "#0550ae",
  base0D = "#6639ba",
  base0E = "#cf222e",
  base0F = "#a40e26",
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
  ["@variable.builtin"] = { fg = M.colors.blue_const },
  ["@parameter"] = { fg = M.colors.white },
  ["@variable.parameter"] = { fg = M.colors.white },
  -- Properties/Fields
  ["@property"] = { fg = M.colors.blue_const },
  ["@field"] = { fg = M.colors.blue_const },
  ["@variable.member"] = { fg = M.colors.blue_const },
  -- Constants/Numbers
  Constant = { fg = M.colors.blue_const },
  ["@constant"] = { fg = M.colors.blue_const },
  ["@constant.builtin"] = { fg = M.colors.blue_const },
  Number = { fg = M.colors.blue_const },
  Float = { fg = M.colors.blue_const },
  Boolean = { fg = M.colors.blue_const },
  ["@number"] = { fg = M.colors.blue_const },
  ["@float"] = { fg = M.colors.blue_const },
  ["@boolean"] = { fg = M.colors.blue_const },
  -- Strings
  String = { fg = M.colors.blue_string },
  ["@string"] = { fg = M.colors.blue_string },
  Character = { fg = M.colors.blue_string },
  ["@character"] = { fg = M.colors.blue_string },
  -- Operators/Punctuation
  Operator = { fg = M.colors.blue_const },
  ["@operator"] = { fg = M.colors.blue_const },
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.blue_const },
  Delimiter = { fg = M.colors.white },
  -- Constructors
  ["@constructor"] = { fg = M.colors.orange },
  -- Include/PreProc
  Include = { fg = M.colors.red },
  ["@include"] = { fg = M.colors.red },
  PreProc = { fg = M.colors.red },
  Define = { fg = M.colors.red },
  -- Special
  Special = { fg = M.colors.blue_const },
  SpecialChar = { fg = M.colors.blue_const },
  -- Comments
  Comment = { fg = M.colors.grey_fg, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg, italic = true },
  -- Tags
  Tag = { fg = M.colors.green_tag },
  ["@tag"] = { fg = M.colors.green_tag },
  ["@tag.attribute"] = { fg = M.colors.blue_const },
  ["@tag.delimiter"] = { fg = M.colors.white },
  -- Namespace
  ["@namespace"] = { fg = M.colors.orange },
  ["@module"] = { fg = M.colors.orange },
  -- Labels/Storage
  Label = { fg = M.colors.blue_const },
  ["@label"] = { fg = M.colors.blue_const },
  StorageClass = { fg = M.colors.red },
  ["@storageclass"] = { fg = M.colors.red },
  Structure = { fg = M.colors.red },
  -- Attribute/Escape
  ["@attribute"] = { fg = M.colors.purple },
  ["@string.escape"] = { fg = M.colors.blue_const },
  ["@string.special"] = { fg = M.colors.blue_const },
  ["@string.regex"] = { fg = M.colors.blue_string },
  ["@type.qualifier"] = { fg = M.colors.red },
  -- Exception
  Exception = { fg = M.colors.red },
  ["@exception"] = { fg = M.colors.red },
}

require("xaaha.core.colorscheme").setup_light(M.colors, M.highlights)
