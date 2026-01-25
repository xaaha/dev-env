local M = {}

-- Official github_light palette: https://github.com/projekt0n/github-nvim-theme
-- Primitives from: lua/github-theme/palette/primitives/light.lua
M.colors = {
  -- Scale: Gray (index 1-10, light to dark)
  -- #f6f8fa, #eaeef2, #d0d7de, #afb8c1, #8c959f, #6e7781, #57606a, #424a53, #32383f, #24292f

  -- Backgrounds (light theme - using whites/light grays)
  black = "#ffffff",        -- canvas.default (white)
  darker_black = "#f6f8fa", -- canvas.subtle (gray[1])
  black2 = "#eaeef2",       -- gray[2]
  one_bg = "#eaeef2",       -- gray[2]
  one_bg2 = "#d0d7de",      -- gray[3]
  one_bg3 = "#afb8c1",      -- gray[4]

  -- Greys
  grey = "#d0d7de",       -- gray[3]
  grey_fg = "#57606a",    -- gray[7] - comment color
  grey_fg2 = "#6e7781",   -- gray[6]
  light_grey = "#8c959f", -- gray[5]

  -- Foregrounds (dark for light theme)
  white = "#24292f",        -- fg.default (gray[10] - darkest)
  darker_white = "#32383f", -- gray[9]
  bright_white = "#1F2328", -- scale.black

  -- Blues (scale: #ddf4ff, #b6e3ff, #80ccff, #54aeff, #218bff, #0969da, #0550ae, #033d8b, #0a3069, #002155)
  blue = "#0969da",        -- blue[6] - accent.fg
  blue_bright = "#218bff", -- blue[5]
  blue_const = "#0550ae",  -- blue[7] - constant color
  blue_string = "#0a3069", -- blue[9] - string color
  nord_blue = "#0969da",   -- blue[6]
  blue_dark = "#033d8b",   -- blue[8]

  -- Greens (scale: #dafbe1, #aceebb, #6fdd8b, #4ac26b, #2da44e, #1a7f37, #116329, #044f1e, #003d16, #002d11)
  green = "#1a7f37",         -- green[6] - success.fg
  vibrant_green = "#2da44e", -- green[5]
  green_bright = "#4ac26b",  -- green[4]
  green_tag = "#116329",     -- green[7] - entityTag color

  -- Reds (scale: #ffebe9, #ffcecb, #ffaba8, #ff8182, #fa4549, #cf222e, #a40e26, #82071e, #660018, #4c0014)
  red = "#cf222e",        -- red[6] - keyword/danger color
  red_bright = "#fa4549", -- red[5]
  dark_red = "#a40e26",   -- red[7]

  -- Oranges (scale: #fff1e5, #ffd8b5, #ffb77c, #fb8f44, #e16f24, #bc4c00, #953800, #762c00, #5c2200, #471700)
  orange = "#953800",        -- orange[7] - variable/type color
  orange_bright = "#bc4c00", -- orange[6]
  orange_light = "#e16f24",  -- orange[5]

  -- Yellows (scale: #fff8c5, #fae17d, #eac54f, #d4a72c, #bf8700, #9a6700, #7d4e00, #633c01, #4d2d00, #3b2300)
  yellow = "#9a6700",        -- yellow[6] - attention.fg
  yellow_bright = "#bf8700", -- yellow[5]
  sun = "#d4a72c",           -- yellow[4]

  -- Purples (scale: #fbefff, #ecd8ff, #d8b9ff, #c297ff, #a475f9, #8250df, #6639ba, #512a97, #3e1f79, #2e1461)
  purple = "#6639ba",        -- purple[7] - entity/function color
  purple_bright = "#8250df", -- purple[6]
  dark_purple = "#512a97",   -- purple[8]

  -- Pinks (scale: #ffeff7, #ffd3eb, #ffadda, #ff80c8, #e85aad, #bf3989, #99286e, #772057, #611347, #4d0336)
  pink = "#bf3989",      -- pink[6]
  baby_pink = "#e85aad", -- pink[5]

  -- Cyans
  cyan = "#1b7c83",        -- cyan.base
  cyan_bright = "#3192aa", -- cyan.bright
  teal = "#1a7f37",        -- using green for teal

  -- UI colors
  line = "#d0d7de",          -- border
  statusline_bg = "#f6f8fa", -- canvas.subtle
  lightbg = "#eaeef2",       -- gray[2]
  pmenu_bg = "#0969da",      -- accent.fg
  folder_bg = "#0969da",     -- accent.fg

  -- Git colors
  git_add = "#1a7f37",    -- success.fg
  git_change = "#9a6700", -- attention.fg
  git_delete = "#cf222e", -- danger.fg

  -- Base16 mapping for github_light
  base00 = "#ffffff", -- bg (white)
  base01 = "#f6f8fa", -- lighter bg
  base02 = "#eaeef2", -- selection
  base03 = "#d0d7de", -- comments bg
  base04 = "#afb8c1", -- dark fg
  base05 = "#24292f", -- fg (dark)
  base06 = "#32383f", -- darker fg
  base07 = "#1F2328", -- darkest fg
  base08 = "#cf222e", -- red - keywords
  base09 = "#953800", -- orange - types/variables
  base0A = "#9a6700", -- yellow - classes
  base0B = "#0a3069", -- dark blue - strings
  base0C = "#0550ae", -- blue - constants/support
  base0D = "#6639ba", -- purple - functions
  base0E = "#cf222e", -- red - keywords
  base0F = "#a40e26", -- dark red - special
}

-- Override highlights to match original github-nvim-theme behavior
M.highlights = {
  -- Functions use purple (entity color)
  Function = { fg = M.colors.purple },
  ["@function"] = { fg = M.colors.purple },
  ["@function.builtin"] = { fg = M.colors.purple },
  ["@function.call"] = { fg = M.colors.purple },
  ["@method"] = { fg = M.colors.purple },
  ["@method.call"] = { fg = M.colors.purple },
  ["@function.method.call"] = { fg = M.colors.purple },

  -- Keywords use red
  Keyword = { fg = M.colors.red },
  Statement = { fg = M.colors.red },
  Conditional = { fg = M.colors.red },
  Repeat = { fg = M.colors.red },
  ["@keyword"] = { fg = M.colors.red },
  ["@keyword.function"] = { fg = M.colors.red },
  ["@keyword.return"] = { fg = M.colors.red },
  ["@keyword.operator"] = { fg = M.colors.red },
  ["@conditional"] = { fg = M.colors.red },
  ["@repeat"] = { fg = M.colors.red },

  -- Types use orange (variable color in github)
  Type = { fg = M.colors.orange },
  ["@type"] = { fg = M.colors.orange },
  ["@type.builtin"] = { fg = M.colors.orange },

  -- Variables use fg
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.blue_const },

  -- Parameters
  ["@parameter"] = { fg = M.colors.white },
  ["@variable.parameter"] = { fg = M.colors.white },

  -- Properties/fields use constant color
  ["@property"] = { fg = M.colors.blue_const },
  ["@field"] = { fg = M.colors.blue_const },
  ["@variable.member"] = { fg = M.colors.blue_const },

  -- Constants use blue (constant color)
  Constant = { fg = M.colors.blue_const },
  ["@constant"] = { fg = M.colors.blue_const },
  ["@constant.builtin"] = { fg = M.colors.blue_const },

  -- Numbers use blue (constant color)
  Number = { fg = M.colors.blue_const },
  Float = { fg = M.colors.blue_const },
  Boolean = { fg = M.colors.blue_const },
  ["@number"] = { fg = M.colors.blue_const },
  ["@float"] = { fg = M.colors.blue_const },
  ["@boolean"] = { fg = M.colors.blue_const },

  -- Strings use dark blue (string color)
  String = { fg = M.colors.blue_string },
  ["@string"] = { fg = M.colors.blue_string },
  Character = { fg = M.colors.blue_string },
  ["@character"] = { fg = M.colors.blue_string },

  -- Operators use constant color
  Operator = { fg = M.colors.blue_const },
  ["@operator"] = { fg = M.colors.blue_const },

  -- Punctuation
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.blue_const },
  Delimiter = { fg = M.colors.white },

  -- Constructors use orange
  ["@constructor"] = { fg = M.colors.orange },

  -- Include/imports use red (keyword)
  Include = { fg = M.colors.red },
  ["@include"] = { fg = M.colors.red },

  -- PreProc use red
  PreProc = { fg = M.colors.red },
  Define = { fg = M.colors.red },

  -- Special use blue
  Special = { fg = M.colors.blue_const },
  SpecialChar = { fg = M.colors.blue_const },

  -- Comments use muted gray
  Comment = { fg = M.colors.grey_fg, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg, italic = true },

  -- Tags (HTML/JSX) use green (entityTag)
  Tag = { fg = M.colors.green_tag },
  ["@tag"] = { fg = M.colors.green_tag },
  ["@tag.attribute"] = { fg = M.colors.blue_const },
  ["@tag.delimiter"] = { fg = M.colors.white },

  -- Namespace/module
  ["@namespace"] = { fg = M.colors.orange },
  ["@module"] = { fg = M.colors.orange },

  -- Labels
  Label = { fg = M.colors.blue_const },
  ["@label"] = { fg = M.colors.blue_const },

  -- Storage
  StorageClass = { fg = M.colors.red },
  ["@storageclass"] = { fg = M.colors.red },

  -- Structure
  Structure = { fg = M.colors.red },

  -- Typedef
  Typedef = { fg = M.colors.orange },

  -- Attribute
  ["@attribute"] = { fg = M.colors.purple },

  -- Escape sequences
  ["@string.escape"] = { fg = M.colors.blue_const },
  ["@string.special"] = { fg = M.colors.blue_const },

  -- Regex
  ["@string.regex"] = { fg = M.colors.blue_string },

  -- Type qualifier
  ["@type.qualifier"] = { fg = M.colors.red },

  -- Exception
  Exception = { fg = M.colors.red },
  ["@exception"] = { fg = M.colors.red },
}

require("xaaha.core.colorscheme").setup_light(M.colors, M.highlights)
