local M = {}

-- Monochrome: A minimal colorscheme with neutral greys and teal-amber accents
-- Background: #F0F5FC
-- Design philosophy: Following Neovim default - minimal, accessible, functional
-- Contrast: 13:1 for main text, 8:1 for variables, 5.5:1 for comments

M.colors = {
  -- Base30 - UI Colors
  -- Light greys (backgrounds, from lightest to darkest)
  darker_black = "#F7FAFF", -- NormalFloat background
  black = "#F0F5FC",        -- Main background
  black2 = "#E7EDF5",       -- Slightly darker background
  one_bg = "#E2E9F2",       -- CursorLine
  one_bg2 = "#DCE3ED",      -- Slightly darker still
  one_bg3 = "#D5DCE6",      -- Visual selection

  -- Dark greys (foregrounds, from lightest to darkest)
  grey = "#A7B0BD",       -- Line numbers, fold column
  grey_fg = "#8B94A0",    -- Comments (enhanced contrast ~5.5:1)
  grey_fg2 = "#6A7684",   -- Secondary UI text
  light_grey = "#596674", -- StatusLine text
  white = "#192330",      -- Normal foreground (13:1 contrast - for accessibility)

  -- Line colors
  line = "#DCE3ED",          -- VertSplit, separators
  statusline_bg = "#E7EDF5", -- StatusLine background
  lightbg = "#DEE5EE",       -- Lighter background elements

  -- Accent colors (teal-amber theme) - used minimally
  -- Primary syntax colors - adjusted for light background
  cyan = "#0F7C8A",  -- Functions (deep teal)
  green = "#945C14", -- Strings (dark amber/gold)

  -- Attention colors
  red = "#C73238",     -- Errors only (deep coral red)
  yellow = "#A46707",  -- Warnings only (deep amber)
  blue = "#2468A5",    -- Identifiers, types, hints - used sparingly (deep blue)
  purple = "#7F478F",  -- Minimal use (deep purple)
  magenta = "#7F478F", -- Alias for purple

  -- Additional accent variations
  vibrant_green = "#9C5F10", -- Slightly deeper amber
  nord_blue = "#2468A5",     -- Alias for blue
  teal = "#0D6E7B",          -- Darker teal
  orange = "#945C14",        -- Alias for green (amber)
  baby_pink = "#C04A62",     -- Deep pink
  pink = "#C04A62",          -- Alias for baby_pink
  sun = "#B06C00",           -- Deep amber
  dark_purple = "#6A3977",   -- Darker purple

  -- Special UI element colors
  pmenu_bg = "#0F7C8A",  -- Popup menu selection (teal)
  folder_bg = "#2468A5", -- Folder icons (blue)

  -- Base16 color scheme
  base00 = "#F0F5FC", -- Default background
  base01 = "#E2E9F2", -- Lighter background (status bars, line numbers)
  base02 = "#DCE3ED", -- Selection background
  base03 = "#8B94A0", -- Comments, invisibles (enhanced contrast)
  base04 = "#6A7684", -- Dark foreground (status bars)
  base05 = "#192330", -- Default foreground, text (13:1 contrast)
  base06 = "#101924", -- Light foreground
  base07 = "#0B1219", -- Lightest (unused in light scheme)
  base08 = "#364458", -- Variables, members (improved contrast 8:1)
  base09 = "#192330", -- Numbers, constants (same as fg - minimal)
  base0A = "#2468A5", -- Types, classes (blue - used sparingly)
  base0B = "#945C14", -- Strings (amber)
  base0C = "#0F7C8A", -- Support, regex, escape chars (cyan/teal)
  base0D = "#0F7C8A", -- Functions, methods (cyan/teal)
  base0E = "#192330", -- Keywords will be bold + dark via highlights override
  base0F = "#596674", -- Delimiters (grey)
}

-- Highlights override - Following default Neovim minimal approach
M.highlights = {
  -- Variables: slightly dimmed but enough contrast (8:1)
  ["@variable"] = { fg = M.colors.base08 },
  ["@variable.member"] = { fg = M.colors.base08 },

  -- Builtin variables: keep distinct
  ["@variable.builtin"] = { fg = M.colors.base08 },

  -- Function parameters: subtle distinction
  ["@variable.parameter"] = { fg = M.colors.base08 },
  ["@parameter"] = { fg = M.colors.base08 },

  -- Keywords: bold + black (not purple) - like default Neovim
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

require("xaaha.core.colorscheme").setup_light(M.colors, M.highlights)