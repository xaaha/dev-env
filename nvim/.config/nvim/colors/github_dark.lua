local M = {}

-- Official github_dark palette: https://github.com/projekt0n/github-nvim-theme
-- Primitives from: lua/github-theme/palette/primitives/dark.lua
M.colors = {
  -- Scale: Gray (index 1-10, light to dark)
  -- #f0f6fc, #c9d1d9, #b1bac4, #8b949e, #6e7681, #484f58, #30363d, #21262d, #161b22, #0d1117

  -- Backgrounds
  black = "#0d1117",        -- canvas.default (gray[10])
  darker_black = "#010409", -- scale.black
  black2 = "#161b22",       -- canvas.overlay (gray[9])
  one_bg = "#21262d",       -- canvas.subtle (gray[8])
  one_bg2 = "#30363d",      -- border.default (gray[7])
  one_bg3 = "#484f58",      -- border.muted (gray[6])

  -- Greys
  grey = "#6e7681",       -- gray[5] - neutral.muted
  grey_fg = "#8b949e",    -- gray[4] - fg.muted / comment
  grey_fg2 = "#8b949e",   -- gray[4]
  light_grey = "#b1bac4", -- gray[3]

  -- Foregrounds
  white = "#c9d1d9",        -- fg.default (gray[2])
  darker_white = "#e6edf3", -- fg.default alternate
  bright_white = "#f0f6fc", -- gray[1] - brightest

  -- Blues (scale: #cae8ff, #a5d6ff, #79c0ff, #58a6ff, #388bfd, #1f6feb, #1158c7, #0d419d, #0c2d6b, #051d4d)
  blue = "#58a6ff",       -- blue[4] - accent.fg
  blue_bright = "#79c0ff", -- blue[3] - constant color
  blue_light = "#a5d6ff",  -- blue[2] - string color
  nord_blue = "#388bfd",   -- blue[5]
  blue_dark = "#1f6feb",   -- blue[6]

  -- Greens (scale: #aff5b4, #7ee787, #56d364, #3fb950, #2ea043, #238636, #196c2e, #0f5323, #033a16, #04260f)
  green = "#3fb950",        -- green[4] - success.fg
  vibrant_green = "#56d364", -- green[3]
  green_bright = "#7ee787", -- green[2]

  -- Reds (scale: #ffdcd7, #ffc1ba, #ffa198, #ff7b72, #f85149, #da3633, #b62324, #8e1519, #67060c, #490202)
  red = "#ff7b72",       -- red[4] - keyword color
  red_bright = "#ffa198", -- red[3]
  dark_red = "#f85149",  -- red[5] - danger.fg

  -- Oranges (scale: #ffdfb6, #ffc680, #ffa657, #f0883e, #db6d28, #bd561d, #9b4215, #762d0a, #5a1e02, #3d1300)
  orange = "#ffa657",      -- orange[3] - variable/type color
  orange_bright = "#ffc680", -- orange[2]
  orange_dark = "#f0883e", -- orange[4]

  -- Yellows (scale: #f8e3a1, #f2cc60, #e3b341, #d29922, #bb8009, #9e6a03, #845306, #693e00, #4b2900, #341a00)
  yellow = "#d29922",       -- yellow[4] - attention.fg
  yellow_bright = "#e3b341", -- yellow[3]
  sun = "#f2cc60",          -- yellow[2]

  -- Purples (scale: #eddeff, #e2c5ff, #d2a8ff, #bc8cff, #a371f7, #8957e5, #6e40c9, #553098, #3c1e70, #271052)
  purple = "#d2a8ff",      -- purple[3] - entity/function color
  purple_bright = "#e2c5ff", -- purple[2]
  dark_purple = "#a371f7", -- purple[5] - done.fg

  -- Pinks (scale: #ffdaec, #ffbedd, #ff9bce, #f778ba, #db61a2, #bf4b8a, #9e3670, #7d2457, #5e103e, #42062a)
  pink = "#f778ba",      -- pink[4]
  baby_pink = "#ff9bce", -- pink[3]

  -- Cyans
  cyan = "#76e3ea",       -- cyan.fg
  cyan_bright = "#b3f0ff", -- cyan.bright
  teal = "#3fb950",       -- using green for teal

  -- UI colors
  line = "#21262d",          -- border.muted
  statusline_bg = "#161b22", -- canvas.overlay
  lightbg = "#21262d",       -- canvas.subtle
  pmenu_bg = "#58a6ff",      -- accent.fg
  folder_bg = "#58a6ff",     -- accent.fg

  -- Git colors
  git_add = "#3fb950",    -- success.fg
  git_change = "#d29922", -- attention.fg
  git_delete = "#f85149", -- danger.fg

  -- Base16 mapping for github_dark
  base00 = "#0d1117", -- bg
  base01 = "#161b22", -- lighter bg
  base02 = "#21262d", -- selection
  base03 = "#30363d", -- comments base
  base04 = "#484f58", -- dark fg
  base05 = "#c9d1d9", -- fg
  base06 = "#e6edf3", -- light fg
  base07 = "#f0f6fc", -- bright fg
  base08 = "#ff7b72", -- red - variables/keywords
  base09 = "#ffa657", -- orange - types/variables
  base0A = "#d29922", -- yellow - classes
  base0B = "#a5d6ff", -- light blue - strings
  base0C = "#79c0ff", -- blue - constants/support
  base0D = "#d2a8ff", -- purple - functions
  base0E = "#ff7b72", -- red - keywords
  base0F = "#f85149", -- dark red - special
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
  ["@variable.builtin"] = { fg = M.colors.blue_bright },

  -- Parameters
  ["@parameter"] = { fg = M.colors.white },
  ["@variable.parameter"] = { fg = M.colors.white },

  -- Properties/fields
  ["@property"] = { fg = M.colors.blue_bright },
  ["@field"] = { fg = M.colors.blue_bright },
  ["@variable.member"] = { fg = M.colors.blue_bright },

  -- Constants use blue (constant color)
  Constant = { fg = M.colors.blue_bright },
  ["@constant"] = { fg = M.colors.blue_bright },
  ["@constant.builtin"] = { fg = M.colors.blue_bright },

  -- Numbers use blue (constant color)
  Number = { fg = M.colors.blue_bright },
  Float = { fg = M.colors.blue_bright },
  Boolean = { fg = M.colors.blue_bright },
  ["@number"] = { fg = M.colors.blue_bright },
  ["@float"] = { fg = M.colors.blue_bright },
  ["@boolean"] = { fg = M.colors.blue_bright },

  -- Strings use light blue (string color)
  String = { fg = M.colors.blue_light },
  ["@string"] = { fg = M.colors.blue_light },
  Character = { fg = M.colors.blue_light },
  ["@character"] = { fg = M.colors.blue_light },

  -- Operators use blue (constant color)
  Operator = { fg = M.colors.blue_bright },
  ["@operator"] = { fg = M.colors.blue_bright },

  -- Punctuation
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.blue_bright },
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
  Special = { fg = M.colors.blue_bright },
  SpecialChar = { fg = M.colors.blue_bright },

  -- Comments use muted gray
  Comment = { fg = M.colors.grey_fg, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg, italic = true },

  -- Tags (HTML/JSX) use green
  Tag = { fg = M.colors.green },
  ["@tag"] = { fg = M.colors.green },
  ["@tag.attribute"] = { fg = M.colors.blue_bright },
  ["@tag.delimiter"] = { fg = M.colors.white },

  -- Namespace/module
  ["@namespace"] = { fg = M.colors.orange },
  ["@module"] = { fg = M.colors.orange },

  -- Labels
  Label = { fg = M.colors.blue_bright },
  ["@label"] = { fg = M.colors.blue_bright },

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
  ["@string.escape"] = { fg = M.colors.blue_bright },
  ["@string.special"] = { fg = M.colors.blue_bright },

  -- Regex
  ["@string.regex"] = { fg = M.colors.blue_bright },

  -- Builtin types
  ["@type.qualifier"] = { fg = M.colors.red },

  -- Exception
  Exception = { fg = M.colors.red },
  ["@exception"] = { fg = M.colors.red },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
