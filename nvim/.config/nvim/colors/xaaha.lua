local colors = {
  -- xaaha: A minimal colorscheme with neutral greys and teal-amber accents
  -- Design philosophy: Following Neovim default - minimal, accessible, functional

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
  grey_fg = "#5A6672",    -- Comments (4.5:1 contrast)
  grey_fg2 = "#6A7684",   -- Secondary UI text
  light_grey = "#798492", -- StatusLine text
  white = "#C5CDD5",      -- Normal foreground (9:1 contrast)

  -- Line colors
  line = "#202830",          -- VertSplit, separators
  statusline_bg = "#1A2028", -- StatusLine background
  lightbg = "#252D35",       -- Lighter background elements

  -- Accent colors (teal-amber theme)
  -- Primary syntax colors
  cyan = "#6DB3B8",  -- Functions, main syntax (teal)
  green = "#D9A962", -- Strings, DiffAdd (amber/gold)

  -- Attention colors
  red = "#E15A60",     -- Errors, high attention (coral red)
  yellow = "#E8B55F",  -- Warnings, mild attention (peach yellow)
  blue = "#6B9FD6",    -- Hints, identifiers - used sparingly (sky blue)
  purple = "#B98EB2",  -- Very sparing use (mauve)
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

  -- Base16 color scheme, highlight groups
  base00 = "#151B23", -- Default background
  base01 = "#1C2329", -- Lighter background (status bars, line numbers)
  base02 = "#212931", -- Selection background
  base03 = "#5A6672", -- Comments, invisibles
  base04 = "#6A7684", -- Dark foreground (status bars)
  base05 = "#C5CDD5", -- Default foreground, variables, text
  base06 = "#D5DDE5", -- Light foreground
  base07 = "#E5EDF5", -- Light background (unused in dark scheme)
  base08 = "#E15A60", -- Variables, tags, delimiters (red)
  base09 = "#C5CDD5", -- Numbers, constants (same as fg - minimal)
  base0A = "#6B9FD6", -- Types, classes (blue - sparing)
  base0B = "#D9A962", -- Strings, inherited class (amber)
  base0C = "#6DB3B8", -- Support, regex, escape chars (cyan/teal)
  base0D = "#6DB3B8", -- Functions, methods (cyan/teal)
  base0E = "#B98EB2", -- Keywords, storage (purple/magenta)
  base0F = "#798492", -- Deprecated, delimiters (grey)
}

require("xaaha.core.colorscheme").setup_dark(colors)
