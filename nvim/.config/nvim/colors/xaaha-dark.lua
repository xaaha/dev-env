local M = {}

-- true color palette for campfire
local campfire = {
  -- Backgrounds
  night = "#0D1117",
  coal = "#151B23",
  charcoal = "#1A2129",
  dark_ash = "#1C2329",
  ash = "#212931",
  light_ash = "#252B33",
  -- UI tones
  deep_smoke = "#1A2028",
  smoke = "#202830",
  light_smoke = "#252D35",
  -- Greys
  slate = "#5A6474",
  stone = "#7A8997",
  light_stone = "#8A98A8",
  silver = "#98A4B6",
  -- Foregrounds
  pale = "#C5D0E0",
  frost = "#E5EDFA",
  ice = "#EDF3FF",
  snow = "#F5FAFF",
  -- Warm accents
  flame = "#E96468",
  amber = "#E4B46D",
  vibrant_amber = "#EBC07A",
  gold = "#F2BF69",
  sun = "#FFCD7C",
  rose = "#F0A7B1",
  -- Cool accents
  teal = "#69B2B7",
  cyan = "#75BEC4",
  blue = "#75A9E0",
  -- Purples
  lavender = "#BF97BB",
  plum = "#AD86A9",
  -- Green
  green = "#A8E4AC",
}

-- xaaha: Minimal colorscheme with neutral greys and teal-amber accents
M.colors = {
  -- Backgrounds
  black = campfire.coal,
  darker_black = campfire.night,
  black2 = campfire.charcoal,
  one_bg = campfire.dark_ash,
  one_bg2 = campfire.ash,
  one_bg3 = campfire.light_ash,
  -- Greys
  grey = campfire.slate,
  grey_fg = campfire.stone,
  grey_fg2 = campfire.light_stone,
  light_grey = campfire.silver,
  -- Foregrounds
  white = campfire.frost,
  -- Accents
  red = campfire.flame,
  orange = campfire.amber,
  yellow = campfire.gold,
  sun = campfire.sun,
  green = campfire.amber,
  vibrant_green = campfire.vibrant_amber,
  teal = campfire.teal,
  cyan = campfire.cyan,
  blue = campfire.blue,
  nord_blue = campfire.blue,
  purple = campfire.lavender,
  magenta = campfire.lavender,
  dark_purple = campfire.plum,
  pink = campfire.rose,
  baby_pink = campfire.rose,
  -- UI
  line = campfire.smoke,
  statusline_bg = campfire.deep_smoke,
  lightbg = campfire.light_smoke,
  pmenu_bg = campfire.cyan,
  folder_bg = campfire.blue,
  -- Base16
  base00 = campfire.coal,
  base01 = campfire.dark_ash,
  base02 = campfire.ash,
  base03 = campfire.stone,
  base04 = campfire.light_stone,
  base05 = campfire.frost,
  base06 = campfire.ice,
  base07 = campfire.snow,
  base08 = campfire.pale,
  base09 = campfire.frost,
  base0A = campfire.blue,
  base0B = campfire.amber,
  base0C = campfire.cyan,
  base0D = campfire.cyan,
  base0E = campfire.frost,
  base0F = campfire.silver,
}

M.highlights = {
  -- Variables
  ["@variable"] = { fg = M.colors.base08 },
  ["@variable.member"] = { fg = M.colors.base08 },
  ["@variable.builtin"] = { fg = M.colors.base08 },
  ["@variable.parameter"] = { fg = M.colors.base08 },
  ["@parameter"] = { fg = M.colors.base08 },
  -- Keywords
  ["@keyword"] = { fg = campfire.green },
  ["@keyword.function"] = { fg = campfire.green },
  ["@keyword.return"] = { fg = campfire.green },
  ["@keyword.operator"] = { fg = campfire.green },
  ["@keyword.coroutine"] = { fg = campfire.green },
  Keyword = { fg = campfire.green },
  Statement = { fg = campfire.green },
  Conditional = { fg = campfire.green },
  Repeat = { fg = campfire.green },
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
