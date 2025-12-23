local M = {}

M.colors = {
  -- Core UI
  white = "#24292f",
  darker_black = "#f6f8fa",
  black = "#ffffff",
  black2 = "#f6f8fa",
  one_bg = "#f6f8fa",
  one_bg2 = "#eaeef2",
  one_bg3 = "#d0d7de",

  -- Greys
  grey = "#d0d7de",
  grey_fg = "#afb8c1",
  grey_fg2 = "#8c959f",
  light_grey = "#57606a",

  -- Accent colors
  red = "#cf222e",
  baby_pink = "#ff8182",
  pink = "#bf3989",

  green = "#1a7f37",
  vibrant_green = "#2da44e",

  blue = "#0969da",
  nord_blue = "#218bff",

  yellow = "#9a6700",
  sun = "#bf8700",

  purple = "#8250df",
  dark_purple = "#6639ba",

  teal = "#1b7c83",
  cyan = "#3192aa",
  orange = "#bc4c00",

  -- UI specific
  line = "#d0d7de",
  statusline_bg = "#f6f8fa",
  lightbg = "#eaeef2",
  pmenu_bg = "#0969da",
  folder_bg = "#0969da",

  -- Base16
  base00 = "#ffffff",
  base01 = "#f6f8fa",
  base02 = "#eaeef2",
  base03 = "#d0d7de",
  base04 = "#8c959f",
  base05 = "#24292f",
  base06 = "#1f2328",
  base07 = "#0b0f14",

  base08 = "#cf222e", -- red
  base09 = "#bc4c00", -- orange
  base0A = "#9a6700", -- yellow
  base0B = "#1a7f37", -- green
  base0C = "#1b7c83", -- cyan
  base0D = "#0969da", -- blue
  base0E = "#8250df", -- purple
  base0F = "#2da44e", -- bright green
}

M.highlights = {
  ["@punctuation.bracket"] = { fg = M.colors.orange },
  ["@string"] = { fg = M.colors.green },
  ["@variable.member.key"] = { fg = M.colors.white },
  ["@constructor"] = { fg = M.colors.vibrant_green },
  ["@tag.attribute"] = { link = "@function.method" },
}

require("xaaha.core.colorscheme").setup_light(M.colors, M.highlights)
