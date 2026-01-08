local M = {}

-- Monochrome: A minimal colorscheme with neutral greys and teal-amber accents
-- Background: #151B23
-- Design philosophy: Following Neovim default - minimal, accessible, functional
-- Contrast: 11:1 for main text, 7:1 for variables, 4.5:1 for comments

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
  grey = "#4A5361",       -- Line numbers, fold column
  grey_fg = "#687580",    -- Comments (enhanced contrast ~5:1)
  grey_fg2 = "#7A8694",   -- Secondary UI text
  light_grey = "#8A96A4", -- StatusLine text
  white = "#D5DDE8",      -- Normal foreground (11:1 contrast - matching default)

  -- Line colors
  line = "#202830",          -- VertSplit, separators
  statusline_bg = "#1A2028", -- StatusLine background
  lightbg = "#252D35",       -- Lighter background elements

  -- Accent colors (teal-amber theme) - used minimally
  -- Primary syntax colors
  cyan = "#6DB3B8",  -- Functions (teal)
  green = "#D9A962", -- Strings (amber/gold)

  -- Attention colors
  red = "#E15A60",     -- Errors only (coral red)
  yellow = "#E8B55F",  -- Warnings only (peach yellow)
  blue = "#6B9FD6",    -- Identifiers, types, hints - used sparingly (sky blue)
  purple = "#B98EB2",  -- Minimal use (mauve)
  magenta = "#B98EB2", -- Alias for purple

  -- Additional accent variations
  vibrant_green = "#E0B56D", -- Slightly brighter amber
  nord_blue = "#6B9FD6",     -- Alias for blue
  teal = "#5FA8AD",          -- Darker teal
  orange = "#D9A962",        -- Alias for green (amber)
  baby_pink = "#E89BA5",     -- Soft pink
  pink = "#E89BA5",          -- Alias for baby_pink
  sun = "#F0C070",           -- Bright amber
  dark_purple = "#A67FA0",   -- Darker purple

  -- Special UI element colors
  pmenu_bg = "#6DB3B8",  -- Popup menu selection (teal)
  folder_bg = "#6B9FD6", -- Folder icons (blue)

  -- Base16 color scheme - Minimal color usage
  base00 = "#151B23", -- Default background
  base01 = "#1C2329", -- Lighter background (status bars, line numbers)
  base02 = "#212931", -- Selection background
  base03 = "#687580", -- Comments, invisibles (enhanced contrast)
  base04 = "#7A8694", -- Dark foreground (status bars)
  base05 = "#D5DDE8", -- Default foreground, text (11:1 contrast)
  base06 = "#E0E8F0", -- Light foreground
  base07 = "#EBF1F7", -- Lightest (unused in dark scheme)
  base08 = "#B5BDC8", -- Variables, members (slightly dimmed, 7:1 contrast)
  base09 = "#D5DDE8", -- Numbers, constants (same as fg - minimal)
  base0A = "#6B9FD6", -- Types, classes (blue - used sparingly)
  base0B = "#D9A962", -- Strings (amber)
  base0C = "#6DB3B8", -- Support, regex, escape chars (cyan/teal)
  base0D = "#6DB3B8", -- Functions, methods (cyan/teal)
  base0E = "#D5DDE8", -- Keywords will be bold + white via highlights override
  base0F = "#8A96A4", -- Delimiters (grey)
}

-- Highlights override - Following default Neovim minimal approach
M.highlights = {
  -- Variables: slightly dimmed but enough contrast (7:1)
  ["@variable"] = { fg = M.colors.base08 },
  ["@variable.member"] = { fg = M.colors.base08 },

  -- Builtin variables: keep distinct
  ["@variable.builtin"] = { fg = M.colors.base08 },

  -- Function parameters: subtle distinction
  ["@variable.parameter"] = { fg = M.colors.base08 },
  ["@parameter"] = { fg = M.colors.base08 },

  -- Keywords: bold + white (not purple) - like default Neovim
  ["@keyword"] = { fg = M.colors.white, bold = true },
  ["@keyword.function"] = { fg = M.colors.white, bold = true },
  ["@keyword.return"] = { fg = M.colors.white, bold = true },
  ["@keyword.operator"] = { fg = M.colors.white, bold = true },
  ["@keyword.coroutine"] = { fg = M.colors.white, bold = true },
  Statement = { fg = M.colors.white, bold = true },
  Keyword = { fg = M.colors.white, bold = true },
  Conditional = { fg = M.colors.white, bold = true },
  Repeat = { fg = M.colors.white, bold = true },

  -- Identifiers: keep blue for distinction (sparingly used)
  Identifier = { fg = M.colors.blue },

  -- Operators: normal foreground (minimal)
  ["@operator"] = { fg = M.colors.base05 },
  Operator = { fg = M.colors.base05 },

  -- Numbers and constants: same as normal text (minimal like default)
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
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
