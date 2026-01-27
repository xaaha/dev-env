local M = {}

-- https://github.com/rmehri01/onenord.nvim
M.colors = {
  -- Backgrounds
  black = "#F7F8FA",
  darker_black = "#FFFFFF",
  black2 = "#EFF0F2",
  one_bg = "#EDEEF0",
  one_bg2 = "#EAEBED",
  one_bg3 = "#DFE1E4",
  -- Greys
  grey = "#DCDEE1",
  grey_fg = "#838FA6",
  grey_fg2 = "#646A76",
  light_grey = "#646A76",
  -- Foregrounds
  white = "#2E3440",
  darker_white = "#4C566A",
  bright_white = "#1D2128",
  -- Frost
  teal = "#5F9E9D",
  cyan = "#3EA1AD",
  nord_blue = "#3879C5",
  blue = "#1B40A6",
  -- Aurora
  red = "#CB4F53",
  dark_red = "#C53B40",
  orange = "#EE5E25",
  yellow = "#BA793E",
  green = "#48A53D",
  purple = "#9F4ACA",
  light_purple = "#9665AF",
  -- Pinks
  pink = "#E85B7A",
  dark_pink = "#E44675",
  baby_pink = "#D16366",
  -- Derived
  vibrant_green = "#48A53D",
  sun = "#BA793E",
  dark_purple = "#9665AF",
  -- UI
  line = "#EDEEF0",
  statusline_bg = "#F7F8FA",
  lightbg = "#EAEBED",
  pmenu_bg = "#3879C5",
  folder_bg = "#3879C5",
  -- Base16
  base00 = "#F7F8FA",
  base01 = "#EFF0F2",
  base02 = "#EAEBED",
  base03 = "#DFE1E4",
  base04 = "#DCDEE1",
  base05 = "#2E3440",
  base06 = "#4C566A",
  base07 = "#1D2128",
  base08 = "#CB4F53",
  base09 = "#EE5E25",
  base0A = "#BA793E",
  base0B = "#48A53D",
  base0C = "#3EA1AD",
  base0D = "#3879C5",
  base0E = "#9F4ACA",
  base0F = "#C53B40",
}

M.highlights = {
  -- Functions
  Function = { fg = M.colors.nord_blue },
  ["@function"] = { fg = M.colors.nord_blue },
  ["@function.builtin"] = { fg = M.colors.nord_blue },
  ["@function.call"] = { fg = M.colors.nord_blue },
  ["@method"] = { fg = M.colors.nord_blue },
  ["@method.call"] = { fg = M.colors.nord_blue },
  -- Keywords
  Keyword = { fg = M.colors.purple },
  Statement = { fg = M.colors.purple },
  Conditional = { fg = M.colors.purple },
  Repeat = { fg = M.colors.purple },
  ["@keyword"] = { fg = M.colors.purple },
  ["@keyword.function"] = { fg = M.colors.purple },
  ["@keyword.return"] = { fg = M.colors.purple },
  ["@conditional"] = { fg = M.colors.purple },
  ["@repeat"] = { fg = M.colors.purple },
  -- Types
  Type = { fg = M.colors.yellow },
  ["@type"] = { fg = M.colors.yellow },
  ["@type.builtin"] = { fg = M.colors.yellow },
  -- Variables
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.cyan },
  -- Parameters
  ["@parameter"] = { fg = M.colors.red },
  ["@variable.parameter"] = { fg = M.colors.red },
  -- Numbers
  Number = { fg = M.colors.orange },
  Float = { fg = M.colors.orange },
  ["@number"] = { fg = M.colors.orange },
  ["@float"] = { fg = M.colors.orange },
  -- Comments
  Comment = { fg = M.colors.grey_fg2, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg2, italic = true },
}

require("xaaha.core.colorscheme").setup_light(M.colors, M.highlights)
