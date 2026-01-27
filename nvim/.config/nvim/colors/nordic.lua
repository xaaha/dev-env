local M = {}

-- https://github.com/AlexvZyl/nordic.nvim
M.colors = {
  -- Backgrounds
  black = "#191D24",
  darker_black = "#1E222A",
  black2 = "#222630",
  one_bg = "#242933",
  one_bg2 = "#2E3440",
  one_bg3 = "#3B4252",
  -- Greys
  grey = "#3B4252",
  grey_fg = "#60728A",
  grey_fg2 = "#4C566A",
  light_grey = "#60728A",
  -- Foregrounds
  white = "#BBC3D4",
  darker_white = "#D8DEE9",
  bright_white = "#ECEFF4",
  -- Blues
  blue = "#81A1C1",
  blue0 = "#5E81AC",
  blue2 = "#88C0D0",
  nord_blue = "#81A1C1",
  -- Cyans
  cyan = "#8FBCBB",
  cyan_bright = "#9FC6C5",
  teal = "#8FBCBB",
  -- Reds
  red = "#BF616A",
  red_bright = "#C5727A",
  dark_red = "#B74E58",
  -- Oranges
  orange = "#D08770",
  orange_bright = "#D79784",
  -- Yellows
  yellow = "#EBCB8B",
  yellow_bright = "#EFD49F",
  sun = "#EFD49F",
  -- Greens
  green = "#A3BE8C",
  green_bright = "#B1C89D",
  vibrant_green = "#B1C89D",
  -- Purples
  purple = "#B48EAD",
  purple_bright = "#BE9DB8",
  dark_purple = "#A97EA1",
  -- Pinks
  pink = "#B48EAD",
  baby_pink = "#BE9DB8",
  -- UI
  line = "#242933",
  statusline_bg = "#1E222A",
  lightbg = "#242933",
  pmenu_bg = "#81A1C1",
  folder_bg = "#81A1C1",
  -- Diagnostics
  error = "#BF616A",
  warn = "#EBCB8B",
  hint = "#B48EAD",
  info = "#88C0D0",
  -- Git
  git_add = "#A3BE8C",
  git_change = "#EBCB8B",
  git_delete = "#BF616A",
  -- Base16
  base00 = "#191D24",
  base01 = "#242933",
  base02 = "#2E3440",
  base03 = "#3B4252",
  base04 = "#4C566A",
  base05 = "#BBC3D4",
  base06 = "#D8DEE9",
  base07 = "#ECEFF4",
  base08 = "#BF616A",
  base09 = "#D08770",
  base0A = "#EBCB8B",
  base0B = "#A3BE8C",
  base0C = "#8FBCBB",
  base0D = "#88C0D0",
  base0E = "#B48EAD",
  base0F = "#5E81AC",
}

M.highlights = {
  -- Functions
  Function = { fg = M.colors.blue2 },
  ["@function"] = { fg = M.colors.blue2 },
  ["@function.builtin"] = { fg = M.colors.blue2 },
  ["@function.call"] = { fg = M.colors.blue2 },
  ["@method"] = { fg = M.colors.blue2 },
  ["@method.call"] = { fg = M.colors.blue2 },
  ["@function.macro"] = { fg = M.colors.red },
  Macro = { fg = M.colors.red },
  -- Keywords
  Keyword = { fg = M.colors.orange },
  Statement = { fg = M.colors.orange },
  Conditional = { fg = M.colors.orange },
  Repeat = { fg = M.colors.orange },
  ["@keyword"] = { fg = M.colors.orange },
  ["@keyword.function"] = { fg = M.colors.orange },
  ["@keyword.return"] = { fg = M.colors.orange },
  ["@keyword.operator"] = { fg = M.colors.orange },
  ["@keyword.conditional"] = { fg = M.colors.orange },
  ["@keyword.repeat"] = { fg = M.colors.orange },
  ["@keyword.coroutine"] = { fg = M.colors.red },
  ["@conditional"] = { fg = M.colors.orange },
  ["@repeat"] = { fg = M.colors.orange },
  -- Types
  Type = { fg = M.colors.yellow },
  ["@type"] = { fg = M.colors.yellow },
  ["@type.builtin"] = { fg = M.colors.yellow },
  ["@type.definition"] = { fg = M.colors.yellow },
  ["@type.qualifier"] = { fg = M.colors.orange },
  Typedef = { fg = M.colors.yellow },
  -- Variables
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.blue0 },
  ["@variable.member"] = { fg = M.colors.white },
  ["@field"] = { fg = M.colors.white },
  ["@property"] = { fg = M.colors.white },
  Identifier = { fg = M.colors.white },
  -- Parameters
  ["@parameter"] = { fg = M.colors.white, italic = true },
  ["@variable.parameter"] = { fg = M.colors.white, italic = true },
  -- Constants/Numbers
  Constant = { fg = M.colors.purple_bright },
  ["@constant"] = { fg = M.colors.purple_bright },
  ["@constant.builtin"] = { fg = M.colors.purple_bright },
  ["@constant.macro"] = { fg = M.colors.purple_bright },
  Number = { fg = M.colors.purple_bright },
  Float = { fg = M.colors.purple_bright },
  Boolean = { fg = M.colors.purple_bright },
  ["@number"] = { fg = M.colors.purple_bright },
  ["@float"] = { fg = M.colors.purple_bright },
  ["@boolean"] = { fg = M.colors.purple_bright },
  -- Strings
  String = { fg = M.colors.green },
  Character = { fg = M.colors.green },
  ["@string"] = { fg = M.colors.green },
  ["@character"] = { fg = M.colors.green },
  ["@string.escape"] = { fg = M.colors.purple_bright },
  ["@string.regex"] = { fg = M.colors.purple_bright },
  ["@string.special"] = { fg = M.colors.yellow },
  -- Operators/Punctuation
  Operator = { fg = M.colors.white },
  ["@operator"] = { fg = M.colors.white },
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.blue },
  Delimiter = { fg = M.colors.white },
  -- Include/PreProc
  Include = { fg = M.colors.blue },
  ["@include"] = { fg = M.colors.blue },
  PreProc = { fg = M.colors.blue },
  Define = { fg = M.colors.blue },
  -- Special
  Special = { fg = M.colors.blue },
  SpecialChar = { fg = M.colors.blue },
  ["@builtin"] = { fg = M.colors.blue0 },
  -- Constructors
  ["@constructor"] = { fg = M.colors.yellow },
  -- Comments
  Comment = { fg = M.colors.grey_fg, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg, italic = true },
  ["@comment.note"] = { fg = M.colors.hint },
  ["@comment.error"] = { fg = M.colors.error },
  ["@comment.warning"] = { fg = M.colors.warn },
  ["@comment.todo"] = { fg = M.colors.info },
  -- Tags
  Tag = { fg = M.colors.blue },
  ["@tag"] = { fg = M.colors.blue },
  ["@tag.attribute"] = { fg = M.colors.yellow },
  ["@tag.delimiter"] = { fg = M.colors.white },
  -- Namespace
  ["@namespace"] = { fg = M.colors.white },
  ["@module"] = { fg = M.colors.white },
  -- Labels/Storage
  Label = { fg = M.colors.blue },
  ["@label"] = { fg = M.colors.blue },
  StorageClass = { fg = M.colors.orange },
  ["@storageclass"] = { fg = M.colors.orange },
  -- Exception/Debug
  Exception = { fg = M.colors.orange },
  ["@exception"] = { fg = M.colors.orange },
  Debug = { fg = M.colors.red },
  -- Attribute
  ["@attribute"] = { fg = M.colors.yellow },
  ["@property.cpp"] = { fg = M.colors.cyan },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
