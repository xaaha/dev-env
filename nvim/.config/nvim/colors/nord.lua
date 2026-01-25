local M = {}

-- Official Nord palette: https://www.nordtheme.com/docs/colors-and-palettes
M.colors = {
  -- Polar Night (dark backgrounds)
  black = "#2E3440",        -- nord0 - bg
  darker_black = "#272C36", -- darker than nord0
  black2 = "#3B4252",       -- nord1 - lighter bg
  one_bg = "#3B4252",       -- nord1
  one_bg2 = "#434C5E",      -- nord2
  one_bg3 = "#4C566A",      -- nord3

  -- Greys
  grey = "#4C566A",       -- nord3
  grey_fg = "#616E88",    -- nord3 bright (comment color)
  grey_fg2 = "#616E88",   -- nord3 bright
  light_grey = "#D8DEE9", -- nord4

  -- Snow Storm (whites)
  white = "#D8DEE9",        -- nord4 - main fg
  darker_white = "#E5E9F0", -- nord5
  bright_white = "#ECEFF4", -- nord6

  -- Frost (blues/cyans)
  teal = "#8FBCBB",      -- nord7 - frozen water
  cyan = "#88C0D0",      -- nord8 - clear ice
  nord_blue = "#81A1C1", -- nord9 - glacier
  blue = "#5E81AC",      -- nord10 - arctic ocean

  -- Aurora (accent colors)
  red = "#BF616A",    -- nord11
  orange = "#D08770", -- nord12
  yellow = "#EBCB8B", -- nord13
  green = "#A3BE8C",  -- nord14
  purple = "#B48EAD", -- nord15

  -- UI colors
  line = "#3B4252",          -- nord1 - for splits
  statusline_bg = "#2E3440", -- nord0
  lightbg = "#3B4252",       -- nord1
  pmenu_bg = "#81A1C1",      -- nord9
  folder_bg = "#81A1C1",     -- nord9

  -- Derived colors (for compatibility)
  baby_pink = "#BF616A",
  pink = "#BF616A",
  vibrant_green = "#A3BE8C",
  sun = "#EBCB8B",
  dark_purple = "#B48EAD",

  -- Base16 mapping for nord (standard base16-nord)
  base00 = "#2E3440", -- bg
  base01 = "#3B4252", -- lighter bg
  base02 = "#434C5E", -- selection
  base03 = "#4C566A", -- comments base
  base04 = "#D8DEE9", -- dark fg
  base05 = "#E5E9F0", -- default fg
  base06 = "#ECEFF4", -- light fg
  base07 = "#8FBCBB", -- teal (nord7)
  base08 = "#BF616A", -- red (nord11) - variables/identifiers in base16
  base09 = "#D08770", -- orange (nord12) - constants/numbers in base16
  base0A = "#EBCB8B", -- yellow (nord13) - types/classes
  base0B = "#A3BE8C", -- green (nord14) - strings
  base0C = "#88C0D0", -- cyan (nord8) - support/regex
  base0D = "#81A1C1", -- glacier (nord9) - functions
  base0E = "#B48EAD", -- purple (nord15) - keywords
  base0F = "#5E81AC", -- blue (nord10) - deprecated/special
}

-- Override highlights to match original nord.nvim behavior
-- (nord.nvim doesn't follow standard base16 semantics)
M.highlights = {
  -- In original nord: identifiers use nord4 (white), not red
  Identifier = { fg = M.colors.white },

  -- Functions use nord8 (cyan/off_blue)
  Function = { fg = M.colors.cyan },
  ["@function"] = { fg = M.colors.cyan },
  ["@function.builtin"] = { fg = M.colors.cyan },
  ["@function.call"] = { fg = M.colors.cyan },
  ["@method"] = { fg = M.colors.cyan },
  ["@method.call"] = { fg = M.colors.cyan },

  -- Keywords use nord9 (glacier)
  Keyword = { fg = M.colors.nord_blue },
  Statement = { fg = M.colors.nord_blue },
  Conditional = { fg = M.colors.nord_blue },
  Repeat = { fg = M.colors.nord_blue },
  ["@keyword"] = { fg = M.colors.nord_blue },
  ["@keyword.function"] = { fg = M.colors.nord_blue },
  ["@keyword.return"] = { fg = M.colors.nord_blue },
  ["@keyword.operator"] = { fg = M.colors.nord_blue },
  ["@conditional"] = { fg = M.colors.nord_blue },
  ["@repeat"] = { fg = M.colors.nord_blue },

  -- Types use nord7 (teal) or nord9
  Type = { fg = M.colors.teal },
  ["@type"] = { fg = M.colors.teal },
  ["@type.builtin"] = { fg = M.colors.teal },

  -- Variables use nord4 (white)
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.nord_blue },
  ["@variable.parameter"] = { fg = M.colors.white },
  ["@variable.member"] = { fg = M.colors.white },

  -- Parameters
  ["@parameter"] = { fg = M.colors.white },

  -- Properties and fields
  ["@property"] = { fg = M.colors.white },
  ["@field"] = { fg = M.colors.white },

  -- Constants use nord4
  Constant = { fg = M.colors.white },
  ["@constant"] = { fg = M.colors.white },
  ["@constant.builtin"] = { fg = M.colors.nord_blue },

  -- Numbers use nord15 (purple)
  Number = { fg = M.colors.purple },
  Boolean = { fg = M.colors.nord_blue },
  Float = { fg = M.colors.purple },
  ["@number"] = { fg = M.colors.purple },
  ["@boolean"] = { fg = M.colors.nord_blue },
  ["@float"] = { fg = M.colors.purple },

  -- Include/imports use nord9
  Include = { fg = M.colors.nord_blue },
  ["@include"] = { fg = M.colors.nord_blue },

  -- Constructors use nord9
  ["@constructor"] = { fg = M.colors.nord_blue },

  -- Namespace/module
  ["@module"] = { fg = M.colors.white },
  ["@namespace"] = { fg = M.colors.white },

  -- Exception
  Exception = { fg = M.colors.nord_blue },
  ["@exception"] = { fg = M.colors.nord_blue },

  -- Operators use nord9
  Operator = { fg = M.colors.nord_blue },
  ["@operator"] = { fg = M.colors.nord_blue },

  -- Punctuation - nord uses white/fg
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.nord_blue },
  Delimiter = { fg = M.colors.white },

  -- Tags (HTML/JSX)
  Tag = { fg = M.colors.nord_blue },
  ["@tag"] = { fg = M.colors.nord_blue },
  ["@tag.attribute"] = { fg = M.colors.teal },
  ["@tag.delimiter"] = { fg = M.colors.white },

  -- Special
  Special = { fg = M.colors.white },
  SpecialChar = { fg = M.colors.yellow },

  -- Macro
  Macro = { fg = M.colors.nord_blue },
  ["@function.macro"] = { fg = M.colors.nord_blue },
  ["@constant.macro"] = { fg = M.colors.nord_blue },

  -- Labels
  Label = { fg = M.colors.nord_blue },
  ["@label"] = { fg = M.colors.nord_blue },

  -- Preproc
  PreProc = { fg = M.colors.nord_blue },
  Define = { fg = M.colors.nord_blue },
  PreCondit = { fg = M.colors.nord_blue },

  -- Storage
  StorageClass = { fg = M.colors.nord_blue },
  ["@storageclass"] = { fg = M.colors.nord_blue },

  -- Structure
  Structure = { fg = M.colors.nord_blue },

  -- Typedef
  Typedef = { fg = M.colors.teal },

  -- Debug
  Debug = { fg = M.colors.white },
  ["@debug"] = { fg = M.colors.white },

  -- Attribute
  ["@attribute"] = { fg = M.colors.teal },

  -- Type qualifier
  ["@type.qualifier"] = { fg = M.colors.nord_blue },

  -- Title
  ["@text.title"] = { fg = M.colors.nord_blue, bold = true },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
