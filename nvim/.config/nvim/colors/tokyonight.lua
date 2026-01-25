local M = {}

-- Official tokyonight (night) palette: https://github.com/folke/tokyonight.nvim
M.colors = {
  -- Backgrounds
  black = "#1a1b26",        -- bg (night)
  darker_black = "#16161e", -- bg_dark
  black2 = "#1f2335",       -- bg_dark (storm style)
  one_bg = "#24283b",       -- bg_highlight base
  one_bg2 = "#292e42",      -- bg_highlight
  one_bg3 = "#3b4261",      -- fg_gutter

  -- Greys
  grey = "#414868",       -- terminal_black
  grey_fg = "#565f89",    -- comment
  grey_fg2 = "#545c7e",   -- dark3
  light_grey = "#737aa2", -- dark5

  -- Foregrounds
  white = "#c0caf5",        -- fg
  darker_white = "#a9b1d6", -- fg_dark
  bright_white = "#c0caf5",

  -- Blues (tokyonight has many blue variants)
  blue = "#7aa2f7",      -- blue (main)
  blue0 = "#3d59a1",     -- blue0 (dark blue)
  blue1 = "#2ac3de",     -- blue1 (type color)
  blue2 = "#0db9d7",     -- blue2
  blue5 = "#89ddff",     -- blue5 (operators)
  blue6 = "#b4f9f8",     -- blue6 (light cyan)
  blue7 = "#394b70",     -- blue7
  nord_blue = "#7aa2f7", -- same as blue
  cyan = "#7dcfff",      -- cyan (keywords)

  -- Greens
  green = "#9ece6a",        -- green (strings)
  vibrant_green = "#73daca", -- green1
  green2 = "#41a6b5",       -- green2
  teal = "#1abc9c",         -- teal

  -- Reds/Pinks
  red = "#f7768e",       -- red
  red1 = "#db4b4b",      -- red1 (errors)
  baby_pink = "#ff007c", -- magenta2
  pink = "#ff007c",      -- magenta2

  -- Purple/Magenta
  purple = "#bb9af7",    -- magenta (main purple)
  dark_purple = "#9d7cd8", -- purple

  -- Warm colors
  orange = "#ff9e64", -- orange
  yellow = "#e0af68", -- yellow
  sun = "#e0af68",    -- yellow

  -- UI colors
  line = "#292e42",          -- bg_highlight for splits
  statusline_bg = "#16161e", -- bg_dark
  lightbg = "#292e42",       -- bg_highlight
  pmenu_bg = "#7aa2f7",      -- blue
  folder_bg = "#7aa2f7",     -- blue

  -- Git colors
  git_add = "#449dab",
  git_change = "#6183bb",
  git_delete = "#914c54",

  -- Base16 mapping for tokyonight
  base00 = "#1a1b26", -- bg
  base01 = "#1f2335", -- bg_dark (lighter)
  base02 = "#292e42", -- bg_highlight
  base03 = "#414868", -- terminal_black
  base04 = "#565f89", -- comment
  base05 = "#a9b1d6", -- fg_dark
  base06 = "#c0caf5", -- fg
  base07 = "#c0caf5", -- fg (bright)
  base08 = "#f7768e", -- red - variables/identifiers
  base09 = "#ff9e64", -- orange - constants/numbers
  base0A = "#e0af68", -- yellow - classes/types
  base0B = "#9ece6a", -- green - strings
  base0C = "#7dcfff", -- cyan - support/regex
  base0D = "#7aa2f7", -- blue - functions
  base0E = "#bb9af7", -- magenta - keywords
  base0F = "#db4b4b", -- red1 - special/errors
}

-- Override highlights to match original tokyonight.nvim behavior
M.highlights = {
  -- Functions use blue
  Function = { fg = M.colors.blue },
  ["@function"] = { fg = M.colors.blue },
  ["@function.builtin"] = { fg = M.colors.blue },
  ["@function.call"] = { fg = M.colors.blue },
  ["@method"] = { fg = M.colors.blue },
  ["@method.call"] = { fg = M.colors.blue },

  -- Keywords use purple/magenta
  Keyword = { fg = M.colors.purple },
  Statement = { fg = M.colors.purple },
  Conditional = { fg = M.colors.purple },
  Repeat = { fg = M.colors.purple },
  ["@keyword"] = { fg = M.colors.purple },
  ["@keyword.function"] = { fg = M.colors.purple },
  ["@keyword.return"] = { fg = M.colors.purple },
  ["@keyword.operator"] = { fg = M.colors.cyan },
  ["@conditional"] = { fg = M.colors.purple },
  ["@repeat"] = { fg = M.colors.purple },

  -- Types use blue1
  Type = { fg = M.colors.blue1 },
  ["@type"] = { fg = M.colors.blue1 },
  ["@type.builtin"] = { fg = M.colors.blue1 },

  -- Variables use fg
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.red },

  -- Parameters use yellow
  ["@parameter"] = { fg = M.colors.yellow },
  ["@variable.parameter"] = { fg = M.colors.yellow },

  -- Properties/fields use green1
  ["@property"] = { fg = M.colors.vibrant_green },
  ["@field"] = { fg = M.colors.vibrant_green },
  ["@variable.member"] = { fg = M.colors.vibrant_green },

  -- Constants use orange
  Constant = { fg = M.colors.orange },
  ["@constant"] = { fg = M.colors.orange },
  ["@constant.builtin"] = { fg = M.colors.orange },

  -- Numbers use orange
  Number = { fg = M.colors.orange },
  Float = { fg = M.colors.orange },
  ["@number"] = { fg = M.colors.orange },
  ["@float"] = { fg = M.colors.orange },

  -- Strings use green
  String = { fg = M.colors.green },
  ["@string"] = { fg = M.colors.green },

  -- Operators use blue5
  Operator = { fg = M.colors.blue5 },
  ["@operator"] = { fg = M.colors.blue5 },

  -- Punctuation
  ["@punctuation.bracket"] = { fg = M.colors.darker_white },
  ["@punctuation.delimiter"] = { fg = M.colors.blue5 },
  ["@punctuation.special"] = { fg = M.colors.blue5 },

  -- Constructors use blue1
  ["@constructor"] = { fg = M.colors.blue1 },

  -- Include/imports use cyan
  Include = { fg = M.colors.cyan },
  ["@include"] = { fg = M.colors.cyan },

  -- PreProc use cyan
  PreProc = { fg = M.colors.cyan },

  -- Special use blue1
  Special = { fg = M.colors.blue1 },

  -- Comments
  Comment = { fg = M.colors.grey_fg, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg, italic = true },

  -- Tags (HTML/JSX)
  ["@tag"] = { fg = M.colors.red },
  ["@tag.attribute"] = { fg = M.colors.vibrant_green },
  ["@tag.delimiter"] = { fg = M.colors.darker_white },

  -- Namespace
  ["@namespace"] = { fg = M.colors.blue1 },
  ["@module"] = { fg = M.colors.blue1 },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
