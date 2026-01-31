local M = {}

-- https://github.com/projekt0n/github-nvim-theme
-- Colors sourced from official github-nvim-theme github_dark_dimmed palette
M.colors = {
  -- Backgrounds (canvas)
  black = "#22272e",        -- canvas.default
  darker_black = "#1c2128", -- canvas.inset
  black2 = "#2d333b",       -- canvas.overlay/subtle
  one_bg = "#373e47",       -- border.muted / scale.gray[7]
  one_bg2 = "#444c56",      -- border.default / scale.gray[6]
  one_bg3 = "#545d68",      -- scale.gray[5]
  -- Greys (scale.gray)
  grey = "#768390",         -- scale.gray[3] / fg.muted
  grey_fg = "#909dab",      -- scale.gray[2]
  grey_fg2 = "#768390",     -- prettylights.syntax.comment
  light_grey = "#adbac7",   -- scale.gray[1] / fg.default
  -- Foregrounds
  white = "#adbac7",        -- fg.default / scale.gray[1]
  darker_white = "#cdd9e5", -- fg.onEmphasis / scale.white
  bright_white = "#cdd9e5", -- scale.white
  -- Blues (scale.blue)
  blue = "#539bf5",         -- scale.blue[3] / accent.fg
  blue_bright = "#6cb6ff",  -- scale.blue[2] / prettylights.syntax.constant
  blue_light = "#96d0ff",   -- scale.blue[1] / prettylights.syntax.string
  nord_blue = "#4184e4",    -- scale.blue[4]
  blue_dark = "#316dca",    -- scale.blue[5] / accent.emphasis
  -- Greens (scale.green)
  green = "#57ab5a",        -- scale.green[3] / success.fg
  vibrant_green = "#6bc46d",-- scale.green[2]
  green_bright = "#8ddb8c", -- scale.green[1] / prettylights.syntax.entityTag
  -- Reds (scale.red)
  red = "#f47067",          -- scale.red[3] / prettylights.syntax.keyword
  red_bright = "#ff938a",   -- scale.red[2]
  dark_red = "#e5534b",     -- scale.red[4] / danger.fg
  -- Oranges (scale.orange)
  orange = "#f69d50",       -- scale.orange[2] / prettylights.syntax.variable
  orange_bright = "#ffbc6f",-- scale.orange[1]
  orange_dark = "#e0823d",  -- scale.orange[3]
  -- Yellows (scale.yellow)
  yellow = "#c69026",       -- scale.yellow[3] / attention.fg
  yellow_bright = "#daaa3f",-- scale.yellow[2]
  sun = "#eac55f",          -- scale.yellow[1]
  -- Purples (scale.purple)
  purple = "#b083f0",       -- scale.purple[3]
  purple_bright = "#dcbdfb",-- scale.purple[2] / prettylights.syntax.entity (functions)
  dark_purple = "#986ee2",  -- scale.purple[4] / done.fg
  -- Pinks (scale.pink)
  pink = "#e275ad",         -- scale.pink[3]
  baby_pink = "#fc8dc7",    -- scale.pink[2]
  -- Cyans
  cyan = "#76e3ea",         -- from palette (checks.ansi.cyan)
  cyan_bright = "#b3f0ff",  -- from palette (checks.ansi.cyanBright)
  teal = "#57ab5a",         -- same as green
  -- UI
  line = "#373e47",         -- border.muted
  statusline_bg = "#2d333b",-- canvas.overlay
  lightbg = "#373e47",
  pmenu_bg = "#539bf5",     -- accent.fg
  folder_bg = "#539bf5",
  -- Git
  git_add = "#57ab5a",      -- success.fg
  git_change = "#c69026",   -- attention.fg
  git_delete = "#e5534b",   -- danger.fg
  -- Base16 (adjusted to match official theme)
  base00 = "#22272e",       -- canvas.default
  base01 = "#2d333b",       -- canvas.overlay
  base02 = "#373e47",       -- border.muted
  base03 = "#444c56",       -- border.default
  base04 = "#545d68",       -- scale.gray[5]
  base05 = "#adbac7",       -- fg.default
  base06 = "#cdd9e5",       -- fg.onEmphasis
  base07 = "#cdd9e5",       -- scale.white
  base08 = "#f47067",       -- red / keyword
  base09 = "#6cb6ff",       -- blue_bright / constant (changed from orange)
  base0A = "#f69d50",       -- orange / variable/type (changed from yellow)
  base0B = "#96d0ff",       -- blue_light / string
  base0C = "#6cb6ff",       -- blue_bright / constant
  base0D = "#dcbdfb",       -- purple_bright / entity/function (changed)
  base0E = "#f47067",       -- red / keyword
  base0F = "#e5534b",       -- dark_red
}

M.highlights = {
  -- Functions (prettylights.syntax.entity: #dcbdfb)
  Function = { fg = M.colors.purple_bright },
  ["@function"] = { fg = M.colors.purple_bright },
  ["@function.builtin"] = { fg = M.colors.purple_bright },
  ["@function.call"] = { fg = M.colors.purple_bright },
  ["@method"] = { fg = M.colors.purple_bright },
  ["@method.call"] = { fg = M.colors.purple_bright },
  -- Keywords (prettylights.syntax.keyword: #f47067)
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
  -- Types (prettylights.syntax.variable: #f69d50)
  Type = { fg = M.colors.orange },
  ["@type"] = { fg = M.colors.orange },
  ["@type.builtin"] = { fg = M.colors.orange },
  Typedef = { fg = M.colors.orange },
  -- Variables
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.blue_bright },
  ["@parameter"] = { fg = M.colors.white },
  ["@variable.parameter"] = { fg = M.colors.white },
  -- Properties/Fields (prettylights.syntax.constant: #6cb6ff)
  ["@property"] = { fg = M.colors.blue_bright },
  ["@field"] = { fg = M.colors.blue_bright },
  ["@variable.member"] = { fg = M.colors.blue_bright },
  -- Constants/Numbers (prettylights.syntax.constant: #6cb6ff)
  Constant = { fg = M.colors.blue_bright },
  ["@constant"] = { fg = M.colors.blue_bright },
  ["@constant.builtin"] = { fg = M.colors.blue_bright },
  Number = { fg = M.colors.blue_bright },
  Float = { fg = M.colors.blue_bright },
  Boolean = { fg = M.colors.blue_bright },
  ["@number"] = { fg = M.colors.blue_bright },
  ["@float"] = { fg = M.colors.blue_bright },
  ["@boolean"] = { fg = M.colors.blue_bright },
  -- Strings (prettylights.syntax.string: #96d0ff)
  String = { fg = M.colors.blue_light },
  ["@string"] = { fg = M.colors.blue_light },
  Character = { fg = M.colors.blue_light },
  ["@character"] = { fg = M.colors.blue_light },
  -- Operators/Punctuation
  Operator = { fg = M.colors.blue_bright },
  ["@operator"] = { fg = M.colors.blue_bright },
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.blue_bright },
  Delimiter = { fg = M.colors.white },
  -- Constructors
  ["@constructor"] = { fg = M.colors.orange },
  -- Include/PreProc
  Include = { fg = M.colors.red },
  ["@include"] = { fg = M.colors.red },
  PreProc = { fg = M.colors.red },
  Define = { fg = M.colors.red },
  -- Special
  Special = { fg = M.colors.blue_bright },
  SpecialChar = { fg = M.colors.blue_bright },
  -- Comments (prettylights.syntax.comment: #768390)
  Comment = { fg = M.colors.grey_fg2, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg2, italic = true },
  -- Tags (prettylights.syntax.entityTag: #8ddb8c)
  Tag = { fg = M.colors.green_bright },
  ["@tag"] = { fg = M.colors.green_bright },
  ["@tag.attribute"] = { fg = M.colors.blue_bright },
  ["@tag.delimiter"] = { fg = M.colors.white },
  -- Namespace/Module
  ["@namespace"] = { fg = M.colors.orange },
  ["@module"] = { fg = M.colors.orange },
  -- Labels/Storage
  Label = { fg = M.colors.blue_bright },
  ["@label"] = { fg = M.colors.blue_bright },
  StorageClass = { fg = M.colors.red },
  ["@storageclass"] = { fg = M.colors.red },
  Structure = { fg = M.colors.red },
  -- Attribute/Escape
  ["@attribute"] = { fg = M.colors.purple_bright },
  ["@string.escape"] = { fg = M.colors.blue_bright },
  ["@string.special"] = { fg = M.colors.blue_bright },
  ["@string.regex"] = { fg = M.colors.green_bright }, -- prettylights.syntax.stringRegexp: #8ddb8c
  ["@type.qualifier"] = { fg = M.colors.red },
  -- Exception
  Exception = { fg = M.colors.red },
  ["@exception"] = { fg = M.colors.red },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
