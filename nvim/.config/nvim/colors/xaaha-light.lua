local M = {}

-- true color palette for campfire light
local campfire = {
  -- Backgrounds (light tones)
  morning = "#F7FAFF",
  daylight = "#F0F5FC",
  haze = "#E7EDF5",
  mist = "#E2E9F2",
  cloud = "#DCE3ED",
  overcast = "#D5DCE6",
  fog = "#DEE5EE",
  -- Greys
  pebble = "#A7B0BD",
  stone = "#8B94A0",
  flint = "#6A7684",
  slate = "#596674",
  -- Foregrounds (dark tones)
  dusk = "#364458",
  midnight = "#192330",
  deep_night = "#101924",
  pitch = "#0B1219",
  -- Warm accents
  ember = "#C73238",
  amber = "#945C14",
  dark_amber = "#9C5F10",
  gold = "#A46707",
  sun = "#B06C00",
  rose = "#C04A62",
  -- Cool accents
  teal = "#0D6E7B",
  cyan = "#0F7C8A",
  blue = "#2468A5",
  -- Purples
  lavender = "#7F478F",
  plum = "#6A3977",
}

-- xaaha-light: Minimal colorscheme with neutral greys and teal-amber accents
M.colors = {
  -- Backgrounds
  black = campfire.daylight,
  darker_black = campfire.morning,
  black2 = campfire.haze,
  one_bg = campfire.mist,
  one_bg2 = campfire.cloud,
  one_bg3 = campfire.overcast,
  -- Greys
  grey = campfire.pebble,
  grey_fg = campfire.stone,
  grey_fg2 = campfire.flint,
  light_grey = campfire.slate,
  -- Foregrounds
  white = campfire.midnight,
  -- Accents
  red = campfire.ember,
  orange = campfire.amber,
  yellow = campfire.gold,
  sun = campfire.sun,
  green = campfire.amber,
  vibrant_green = campfire.dark_amber,
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
  line = campfire.cloud,
  statusline_bg = campfire.haze,
  lightbg = campfire.fog,
  pmenu_bg = campfire.cyan,
  folder_bg = campfire.blue,
  -- Base16
  base00 = campfire.daylight,
  base01 = campfire.mist,
  base02 = campfire.cloud,
  base03 = campfire.stone,
  base04 = campfire.flint,
  base05 = campfire.midnight,
  base06 = campfire.deep_night,
  base07 = campfire.pitch,
  base08 = campfire.dusk,
  base09 = campfire.midnight,
  base0A = campfire.blue,
  base0B = campfire.amber,
  base0C = campfire.cyan,
  base0D = campfire.cyan,
  base0E = campfire.midnight,
  base0F = campfire.slate,
}

M.highlights = {
  -- Variables
  ["@variable"] = { fg = M.colors.base08 },
  ["@variable.member"] = { fg = M.colors.base08 },
  ["@variable.builtin"] = { fg = M.colors.base08 },
  ["@variable.parameter"] = { fg = M.colors.base08 },
  ["@parameter"] = { fg = M.colors.base08 },
  -- Keywords
  ["@keyword"] = { fg = M.colors.white, bold = true },
  ["@keyword.function"] = { fg = M.colors.white, bold = true },
  ["@keyword.return"] = { fg = M.colors.white, bold = true },
  ["@keyword.operator"] = { fg = M.colors.white, bold = true },
  ["@keyword.coroutine"] = { fg = M.colors.white, bold = true },
  Keyword = { fg = M.colors.white, bold = true },
  Statement = { fg = M.colors.white, bold = true },
  Conditional = { fg = M.colors.white, bold = true },
  Repeat = { fg = M.colors.white, bold = true },
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

require("xaaha.core.colorscheme").setup_light(M.colors, M.highlights)
