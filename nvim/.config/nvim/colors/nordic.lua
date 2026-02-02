local M = {}

-- https://github.com/AlexvZyl/nordic.nvim
M.colors = {
  -- Backgrounds (darker)
  black = "#14181E",
  darker_black = "#191D24",
  black2 = "#1D212A",
  one_bg = "#1F242D",
  one_bg2 = "#29303B",
  one_bg3 = "#363D4D",
  -- Greys
  grey = "#363D4D",
  grey_fg = "#6A7C95",
  grey_fg2 = "#526078",
  light_grey = "#6A7C95",
  -- Foregrounds (brighter for contrast)
  white = "#C4CCD8",
  darker_white = "#DCE2ED",
  bright_white = "#F0F3F8",
  -- Blues (more saturated)
  blue = "#7BA5C8",
  blue0 = "#5A85B8",
  blue2 = "#80C5D8",
  nord_blue = "#7BA5C8",
  -- Cyans (more saturated)
  cyan = "#88C0C0",
  cyan_bright = "#98CACA",
  teal = "#88C0C0",
  -- Reds (more vivid)
  red = "#C55B65",
  red_bright = "#D06A74",
  dark_red = "#B74E58",
  -- Oranges (more vivid)
  orange = "#D68268",
  orange_bright = "#E0927A",
  -- Yellows (more vivid)
  yellow = "#F0C880",
  yellow_bright = "#F5D494",
  sun = "#F5D494",
  -- Greens (more saturated)
  green = "#9DC285",
  green_bright = "#ABCC96",
  vibrant_green = "#ABCC96",
  -- Purples (more saturated)
  purple = "#BB8AB0",
  purple_bright = "#C89ABD",
  dark_purple = "#AD7AA5",
  -- Pinks
  pink = "#BB8AB0",
  baby_pink = "#C89ABD",
  -- UI
  line = "#1F242D",
  statusline_bg = "#191D24",
  lightbg = "#1F242D",
  pmenu_bg = "#7BA5C8",
  folder_bg = "#7BA5C8",
  -- Diagnostics
  error = "#C55B65",
  warn = "#F0C880",
  hint = "#BB8AB0",
  info = "#80C5D8",
  -- Git
  git_add = "#9DC285",
  git_change = "#F0C880",
  git_delete = "#C55B65",
  -- Base16 (updated to match)
  base00 = "#14181E",
  base01 = "#1F242D",
  base02 = "#29303B",
  base03 = "#363D4D",
  base04 = "#526078",
  base05 = "#C4CCD8",
  base06 = "#DCE2ED",
  base07 = "#F0F3F8",
  base08 = "#C55B65",
  base09 = "#D68268",
  base0A = "#F0C880",
  base0B = "#9DC285",
  base0C = "#88C0C0",
  base0D = "#80C5D8",
  base0E = "#BB8AB0",
  base0F = "#5A85B8",
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
