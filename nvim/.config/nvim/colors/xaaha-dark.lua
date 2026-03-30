local M = {}

-- true color palette for campfire
local campfire = {
  -- Backgrounds (closer to Ghostty base ramp)
  night = "#0F141B",
  coal = "#151B23", -- matches Ghostty background
  charcoal = "#1B2430",
  dark_ash = "#202A36",
  ash = "#26313D",
  light_ash = "#2B3542", -- matches selection bg feel

  -- UI tones (cleaner separation)
  deep_smoke = "#1B2530",
  smoke = "#212C38",
  light_smoke = "#283340",

  -- Greys (more blue, less muddy)
  slate = "#6C7688", -- matches palette[8]
  stone = "#8A96A8",
  light_stone = "#A2ADBD",
  silver = "#B8C2D3",

  -- Foregrounds (Ghostty-aligned ramp)
  pale = "#D5DEEC", -- palette[7]
  frost = "#E6EDF7",
  ice = "#EEF4FF",
  snow = "#F3F7FF", -- foreground

  -- Warm accents (shifted toward Ghostty hues)
  flame = "#FF6570",         -- palette[1]
  amber = "#F8C278",         -- palette[3]
  vibrant_amber = "#FFD08A", -- palette[11]
  gold = "#F8C278",
  sun = "#FFD08A",
  rose = "#FF7E87", -- palette[9]

  -- Cool accents (more vibrant + clean)
  teal = "#7AD9DF", -- palette[6]
  cyan = "#94E5EA", -- palette[14]
  blue = "#78B4FF", -- palette[4]

  -- Purples (aligned to Ghostty)
  lavender = "#D0A4F5", -- palette[5]
  plum = "#DEB8FA",     -- palette[13]

  -- Green (brighter + fresher)
  green = "#BFF38F", -- palette[2]
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
  green = campfire.green,
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
  ["@keyword"] = { fg = campfire.lavender, italic = true },
  ["@keyword.function"] = { fg = campfire.lavender, italic = true },
  ["@keyword.return"] = { fg = campfire.lavender, italic = true },
  ["@keyword.operator"] = { fg = campfire.lavender, italic = true },
  ["@keyword.coroutine"] = { fg = campfire.lavender, italic = true },
  Keyword = { fg = campfire.lavender, italic = true },
  Statement = { fg = campfire.vibrant_amber, italic = true, bold = true },
  Conditional = { fg = campfire.vibrant_amber, italic = true, bold = true },
  Repeat = { fg = campfire.vibrant_amber, italic = true, bold = true },
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
  ["@string"] = { fg = campfire.amber },
  String = { fg = campfire.amber },
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
  ["@exception"] = { fg = campfire.plum },
  -- Diff
  DiffAdd = { fg = M.colors.base0A },
  GitSignsAdd = { fg = M.colors.base0A },
}

require("core.colorscheme").setup_dark(M.colors, M.highlights)
