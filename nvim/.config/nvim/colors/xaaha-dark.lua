local M = {}

-- xaaha: A minimal colorscheme with neutral greys and teal-amber accents (High Contrast)
-- Background: #151B23
-- Design philosophy: Following Neovim default - minimal, accessible, functional, with teal and amber
-- Contrast: 13:1 for main text, 8:1 for variables, 5.5:1 for comments

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
  grey_fg = "#7A8997",    -- Comments (enhanced contrast ~5.5:1)
  grey_fg2 = "#8A98A8",   -- Secondary UI text
  light_grey = "#98A4B6", -- StatusLine text
  white = "#E5EDFA",      -- Normal foreground (13:1 contrast - for accessibility)

  -- Line colors
  line = "#202830",          -- VertSplit, separators
  statusline_bg = "#1A2028", -- StatusLine background
  lightbg = "#252D35",       -- Lighter background elements

  -- Accent colors (teal-amber theme) - used minimally
  -- Primary syntax colors
  cyan = "#75BEC4",  -- Functions (teal)
  green = "#E4B46D", -- Strings (amber/gold)

  -- Attention colors
  red = "#E96468",     -- Errors only (coral red)
  yellow = "#F2BF69",  -- Warnings only (peach yellow)
  blue = "#75A9E0",    -- Identifiers, types, hints - used sparingly (sky blue)
  purple = "#BF97BB",  -- Minimal use (mauve)
  magenta = "#BF97BB", -- Alias for purple

  -- Additional accent variations
  vibrant_green = "#EBC07A", -- Slightly brighter amber
  nord_blue = "#75A9E0",     -- Alias for blue
  teal = "#69B2B7",          -- Darker teal
  orange = "#E4B46D",        -- Alias for green (amber)
  baby_pink = "#F0A7B1",     -- Soft pink
  pink = "#F0A7B1",          -- Alias for baby_pink
  sun = "#FFCD7C",           -- Bright amber
  dark_purple = "#AD86A9",   -- Darker purple

  -- Special UI element colors
  pmenu_bg = "#75BEC4",  -- Popup menu selection (teal)
  folder_bg = "#75A9E0", -- Folder icons (blue)

  -- Base16 color scheme - Minimal color usage
  base00 = "#151B23", -- Default background
  base01 = "#1C2329", -- Lighter background (status bars, line numbers)
  base02 = "#212931", -- Selection background
  base03 = "#7A8997", -- Comments, invisibles (enhanced contrast)
  base04 = "#8A98A8", -- Dark foreground (status bars)
  base05 = "#E5EDFA", -- Default foreground, text (13:1 contrast)
  base06 = "#EDF3FF", -- Light foreground
  base07 = "#F5FAFF", -- Lightest (unused in dark scheme)
  base08 = "#C5D0E0", -- Variables, members (improved contrast 8:1)
  base09 = "#E5EDFA", -- Numbers, constants (same as fg - minimal)
  base0A = "#75A9E0", -- Types, classes (blue - used sparingly)
  base0B = "#E4B46D", -- Strings (amber)
  base0C = "#75BEC4", -- Support, regex, escape chars (cyan/teal)
  base0D = "#75BEC4", -- Functions, methods (cyan/teal)
  base0E = "#E5EDFA", -- Keywords will be bold + white via highlights override
  base0F = "#98A4B6", -- Delimiters (grey)
}

-- Highlights override - Following default Neovim minimal approach
M.highlights = {
  -- Variables: slightly dimmed but enough contrast (8:1)
  ["@variable"] = { fg = M.colors.base08 },
  ["@variable.member"] = { fg = M.colors.base08 },
  ["@variable.builtin"] = { fg = M.colors.base08 },
  ["@variable.parameter"] = { fg = M.colors.base08 },
  ["@parameter"] = { fg = M.colors.base08 },

  ["@keyword"] = { fg = M.colors.white, bold = true },
  ["@keyword.function"] = { fg = M.colors.white, bold = true },
  ["@keyword.return"] = { fg = M.colors.white, bold = true },
  ["@keyword.operator"] = { fg = M.colors.white, bold = true },
  ["@keyword.coroutine"] = { fg = M.colors.white, bold = true },
  Statement = { fg = M.colors.white, bold = true },
  Keyword = { fg = M.colors.white, bold = true },
  Conditional = { fg = M.colors.white, bold = true },
  Repeat = { fg = M.colors.white, bold = true },

  Identifier = { fg = M.colors.blue },

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

  -- Types: blue (used sparingly)
  ["@type"] = { fg = M.colors.blue },
  ["@type.builtin"] = { fg = M.colors.blue },
  Type = { fg = M.colors.blue },

  -- Functions: cyan/teal
  ["@function"] = { fg = M.colors.cyan },
  ["@function.call"] = { fg = M.colors.cyan },
  ["@function.builtin"] = { fg = M.colors.cyan },
  ["@method"] = { fg = M.colors.cyan },
  ["@method.call"] = { fg = M.colors.cyan },
  Function = { fg = M.colors.cyan },

  -- Strings: amber
  ["@string"] = { fg = M.colors.green },
  String = { fg = M.colors.green },

  -- Punctuation: minimal
  ["@punctuation.bracket"] = { fg = M.colors.base0F },
  ["@punctuation.delimiter"] = { fg = M.colors.base0F },

  -- Diff
  DiffAdd = { fg = M.colors.base0A },
  GitSignsAdd = { fg = M.colors.base0A },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
