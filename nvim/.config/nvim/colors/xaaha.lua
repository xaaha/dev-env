local M = {}

-- xaaha: A minimal, monochromatic colorscheme with amber accent (Medium Contrast)
-- Background: #151B23
-- Design philosophy: Blue for functions/types, bold white for keywords, amber for strings
-- Inspired by Nord's cohesive approach
-- Contrast: 11:1 for main text, 8:1 for variables, 5:1 for comments

M.colors = {
  -- Base30 - UI Colors
  -- Dark greys (backgrounds, from darkest to lightest)
  darker_black = "#0D1117", -- NormalFloat background
  black = "#151B23",        -- Main background
  black2 = "#1A2129",       -- Slightly lighter background
  one_bg = "#1C2329",       -- CursorLine
  one_bg2 = "#212931",      -- Slightly lighter still
  one_bg3 = "#252B33",      -- Visual selection

  -- Light greys (foregrounds, from darkest to lightest)
  grey = "#5A6474",       -- Line numbers, fold column
  grey_fg = "#6E7A88",    -- Comments (~5:1 contrast)
  grey_fg2 = "#7A8694",   -- Secondary UI text
  light_grey = "#8A96A6", -- StatusLine text
  white = "#D8E8F8",      -- Normal foreground (11:1 contrast)

  -- Line colors
  line = "#202830",          -- VertSplit, separators
  statusline_bg = "#1A2028", -- StatusLine background
  lightbg = "#252D35",       -- Lighter background elements

  -- Primary syntax color (one blue for cohesion, like Nord)
  blue = "#9EC8F0", -- Primary syntax: functions, types (brighter)
  cyan = "#9EC8F0", -- Alias for blue
  nord_blue = "#9EC8F0",
  teal = "#9EC8F0", -- Alias for blue (unified)

  -- Warm accent (strings only - the standout color)
  green = "#D4A45D",  -- Strings (amber/gold)
  orange = "#D4A45D", -- Alias
  vibrant_green = "#DBB06A",
  sun = "#EFBD6C",

  -- Attention colors (errors/warnings only)
  red = "#D95A5E",
  yellow = "#E2AF59",

  -- Muted accents (minimal use)
  purple = "#A898B8",
  magenta = "#A898B8",
  dark_purple = "#9888A8",
  baby_pink = "#C8A8B0",
  pink = "#C8A8B0",

  -- Special UI element colors
  pmenu_bg = "#9EC8F0",  -- Popup menu selection
  folder_bg = "#9EC8F0", -- Folder icons

  -- Base16 color scheme - Monochromatic with amber accent
  base00 = "#151B23", -- Default background
  base01 = "#1C2329", -- Lighter background
  base02 = "#212931", -- Selection background
  base03 = "#6E7A88", -- Comments (~5:1 contrast)
  base04 = "#7A8694", -- Dark foreground
  base05 = "#D8E8F8", -- Default foreground (11:1 contrast)
  base06 = "#E5F0FF", -- Light foreground
  base07 = "#9EC8F0", -- Cyan accent
  base08 = "#B8C8D8", -- Variables (8:1 contrast)
  base09 = "#D8E8F8", -- Numbers, constants (same as fg)
  base0A = "#9EC8F0", -- Types (blue)
  base0B = "#D4A45D", -- Strings (amber - the warm accent)
  base0C = "#9EC8F0", -- Support, regex (blue)
  base0D = "#9EC8F0", -- Functions (blue)
  base0E = "#D8E8F8", -- Keywords (white, bold via highlights)
  base0F = "#8A96A6", -- Delimiters (grey)
}

-- Highlights override - Monochromatic with amber accent
M.highlights = {
  -- Variables: slightly dimmed (7:1 contrast)
  ["@variable"] = { fg = M.colors.base08 },
  ["@variable.member"] = { fg = M.colors.base08 },
  ["@variable.builtin"] = { fg = M.colors.base08 },
  ["@variable.parameter"] = { fg = M.colors.base08 },
  ["@parameter"] = { fg = M.colors.base08 },

  -- Keywords: bold white
  ["@keyword"] = { fg = M.colors.white, bold = true },
  ["@keyword.function"] = { fg = M.colors.white, bold = true },
  ["@keyword.return"] = { fg = M.colors.white, bold = true },
  ["@keyword.operator"] = { fg = M.colors.white, bold = true },
  ["@keyword.coroutine"] = { fg = M.colors.white, bold = true },
  Statement = { fg = M.colors.white, bold = true },
  Keyword = { fg = M.colors.white, bold = true },
  Conditional = { fg = M.colors.white, bold = true },
  Repeat = { fg = M.colors.white, bold = true },

  Identifier = { fg = M.colors.base08 },

  ["@operator"] = { fg = M.colors.base05 },
  Operator = { fg = M.colors.base05 },

  -- Numbers and constants: same as normal text
  ["@number"] = { fg = M.colors.base05 },
  ["@float"] = { fg = M.colors.base05 },
  ["@boolean"] = { fg = M.colors.base05 },
  ["@constant"] = { fg = M.colors.base05 },
  ["@constant.builtin"] = { fg = M.colors.base05 },
  Number = { fg = M.colors.base05 },
  Boolean = { fg = M.colors.base05 },
  Float = { fg = M.colors.base05 },
  Constant = { fg = M.colors.base05 },

  -- Types: same blue (unified)
  ["@type"] = { fg = M.colors.blue },
  ["@type.builtin"] = { fg = M.colors.blue },
  Type = { fg = M.colors.blue },

  -- Functions: blue
  ["@function"] = { fg = M.colors.blue },
  ["@function.call"] = { fg = M.colors.blue },
  ["@function.builtin"] = { fg = M.colors.blue },
  ["@method"] = { fg = M.colors.blue },
  ["@method.call"] = { fg = M.colors.blue },
  Function = { fg = M.colors.blue },

  -- Strings: amber (the warm standout)
  ["@string"] = { fg = M.colors.green },
  String = { fg = M.colors.green },

  -- Punctuation: neutral
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },

  -- Diff
  DiffAdd = { fg = M.colors.blue },
  GitSignsAdd = { fg = M.colors.blue },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
