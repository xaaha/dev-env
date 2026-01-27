local M = {}

-- https://github.com/drewtempelmeyer/palenight.vim
M.colors = {
  -- Backgrounds
  black = "#292D3E",
  darker_black = "#232738",
  black2 = "#2f3344",
  one_bg = "#333748",
  one_bg2 = "#3c4051",
  one_bg3 = "#444859",
  -- Greys
  grey = "#515566",
  grey_fg = "#5b5f70",
  grey_fg2 = "#65697a",
  light_grey = "#6d7182",
  -- Foregrounds
  white = "#ffffff",
  -- Accents
  red = "#f07178",
  pink = "#ff5370",
  baby_pink = "#606475",
  orange = "#ffa282",
  yellow = "#ffcb6b",
  sun = "#ffd373",
  green = "#c3e88d",
  vibrant_green = "#96e88d",
  teal = "#89ffe6",
  cyan = "#89ddff",
  blue = "#82aaff",
  nord_blue = "#8fb7ff",
  purple = "#c792ea",
  dark_purple = "#b383d2",
  -- UI
  line = "#3f4354",
  statusline_bg = "#2d3142",
  lightbg = "#3c4051",
  pmenu_bg = "#82aaff",
  folder_bg = "#82aaff",
  -- Base16
  base00 = "#292d3e",
  base01 = "#444267",
  base02 = "#32374d",
  base03 = "#676e95",
  base04 = "#8796b0",
  base05 = "#d3d3d3",
  base06 = "#efefef",
  base07 = "#ffffff",
  base08 = "#f07178",
  base09 = "#ffa282",
  base0A = "#ffcb6b",
  base0B = "#c3e88d",
  base0C = "#89ddff",
  base0D = "#82aaff",
  base0E = "#c792ea",
  base0F = "#ff5370",
}

M.highlights = {
  ["@keyword.import"] = { fg = M.colors.purple },
  ["@variable.member.key"] = { fg = M.colors.orange },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
