local M = {}

-- Official nordic.nvim palette: https://github.com/AlexvZyl/nordic.nvim
-- From: lua/nordic/colors/nordic.lua
M.colors = {
  -- Blacks (darker than nord)
  black = "#191D24",        -- black0 - darkest
  darker_black = "#1E222A", -- black1
  black2 = "#222630",       -- black2

  -- Grays
  gray0 = "#242933",
  gray1 = "#2E3440", -- nord bg equivalent
  gray2 = "#3B4252",
  gray3 = "#434C5E",
  gray4 = "#4C566A",
  gray5 = "#60728A", -- comment color

  -- Backgrounds (using nordic's darker scheme)
  one_bg = "#242933",  -- gray0
  one_bg2 = "#2E3440", -- gray1
  one_bg3 = "#3B4252", -- gray2

  -- Greys for UI
  grey = "#3B4252",       -- gray2
  grey_fg = "#60728A",    -- gray5 - comments
  grey_fg2 = "#4C566A",   -- gray4
  light_grey = "#60728A", -- gray5

  -- Whites
  white = "#BBC3D4",        -- white0_normal - main fg
  white0 = "#BBC3D4",       -- white0_normal
  white0_rb = "#C0C8D8",    -- white0_reduce_blue
  darker_white = "#D8DEE9", -- white1
  white1 = "#D8DEE9",
  white2 = "#E5E9F0",
  bright_white = "#ECEFF4", -- white3
  white3 = "#ECEFF4",

  -- Blues
  blue = "#81A1C1",      -- blue1 - main blue
  blue0 = "#5E81AC",     -- blue0 - dark/builtin
  blue1 = "#81A1C1",     -- blue1
  blue2 = "#88C0D0",     -- blue2 - functions
  nord_blue = "#81A1C1", -- blue1

  -- Cyan (with variants)
  cyan = "#8FBCBB",        -- cyan.base
  cyan_bright = "#9FC6C5", -- cyan.bright
  cyan_dim = "#80B3B2",    -- cyan.dim
  teal = "#8FBCBB",        -- cyan.base

  -- Red (with variants)
  red = "#BF616A",        -- red.base
  red_bright = "#C5727A", -- red.bright
  red_dim = "#B74E58",    -- red.dim
  dark_red = "#B74E58",   -- red.dim

  -- Orange (with variants)
  orange = "#D08770",        -- orange.base
  orange_bright = "#D79784", -- orange.bright
  orange_dim = "#CB775D",    -- orange.dim

  -- Yellow (with variants)
  yellow = "#EBCB8B",        -- yellow.base
  yellow_bright = "#EFD49F", -- yellow.bright
  yellow_dim = "#E7C173",    -- yellow.dim
  sun = "#EFD49F",           -- yellow.bright

  -- Green (with variants)
  green = "#A3BE8C",        -- green.base
  green_bright = "#B1C89D", -- green.bright
  green_dim = "#97B67C",    -- green.dim
  vibrant_green = "#B1C89D", -- green.bright

  -- Magenta/Purple (with variants)
  purple = "#B48EAD",        -- magenta.base
  purple_bright = "#BE9DB8", -- magenta.bright
  purple_dim = "#A97EA1",    -- magenta.dim
  dark_purple = "#A97EA1",   -- magenta.dim

  -- Pinks (using magenta variants)
  pink = "#B48EAD",
  baby_pink = "#BE9DB8",

  -- UI colors
  line = "#242933",          -- gray0
  statusline_bg = "#1E222A", -- black1
  lightbg = "#242933",       -- gray0
  pmenu_bg = "#81A1C1",      -- blue1
  folder_bg = "#81A1C1",     -- blue1

  -- Diagnostic colors
  error = "#BF616A",  -- red.base
  warn = "#EBCB8B",   -- yellow.base
  hint = "#B48EAD",   -- magenta.base
  info = "#88C0D0",   -- blue2

  -- Git colors
  git_add = "#A3BE8C",    -- green.base
  git_change = "#EBCB8B", -- yellow.base
  git_delete = "#BF616A", -- red.base

  -- Base16 mapping for nordic
  base00 = "#191D24", -- bg (black0)
  base01 = "#242933", -- lighter bg (gray0)
  base02 = "#2E3440", -- selection (gray1)
  base03 = "#3B4252", -- comments bg (gray2)
  base04 = "#4C566A", -- dark fg (gray4)
  base05 = "#BBC3D4", -- fg (white0)
  base06 = "#D8DEE9", -- light fg (white1)
  base07 = "#ECEFF4", -- bright fg (white3)
  base08 = "#BF616A", -- red - variables/macros
  base09 = "#D08770", -- orange - keywords/constants
  base0A = "#EBCB8B", -- yellow - types
  base0B = "#A3BE8C", -- green - strings
  base0C = "#8FBCBB", -- cyan - support
  base0D = "#88C0D0", -- blue2 - functions
  base0E = "#B48EAD", -- magenta - keywords alt
  base0F = "#5E81AC", -- blue0 - special/builtin
}

-- Override highlights to match original nordic.nvim behavior
M.highlights = {
  -- Functions use blue2
  Function = { fg = M.colors.blue2 },
  ["@function"] = { fg = M.colors.blue2 },
  ["@function.builtin"] = { fg = M.colors.blue2 },
  ["@function.call"] = { fg = M.colors.blue2 },
  ["@method"] = { fg = M.colors.blue2 },
  ["@method.call"] = { fg = M.colors.blue2 },

  -- Function macros use red
  ["@function.macro"] = { fg = M.colors.red },
  Macro = { fg = M.colors.red },

  -- Keywords use orange (with bold option in original)
  Keyword = { fg = M.colors.orange },
  Statement = { fg = M.colors.orange },
  Conditional = { fg = M.colors.orange },
  Repeat = { fg = M.colors.orange },
  ["@keyword"] = { fg = M.colors.orange },
  ["@keyword.function"] = { fg = M.colors.orange },
  ["@keyword.return"] = { fg = M.colors.orange },
  ["@keyword.operator"] = { fg = M.colors.orange },
  ["@keyword.conditional"] = { fg = M.colors.orange },
  ["@keyword.repeat"] = { fg = M.colors.orange },
  ["@conditional"] = { fg = M.colors.orange },
  ["@repeat"] = { fg = M.colors.orange },

  -- Types use yellow
  Type = { fg = M.colors.yellow },
  ["@type"] = { fg = M.colors.yellow },
  ["@type.builtin"] = { fg = M.colors.yellow },
  ["@type.definition"] = { fg = M.colors.yellow },
  Typedef = { fg = M.colors.yellow },

  -- Type qualifier uses keyword color
  ["@type.qualifier"] = { fg = M.colors.orange },

  -- Variables use fg
  ["@variable"] = { fg = M.colors.white },
  Identifier = { fg = M.colors.white },

  -- Variable builtin uses blue0
  ["@variable.builtin"] = { fg = M.colors.blue0 },

  -- Variable member (fields)
  ["@variable.member"] = { fg = M.colors.white },
  ["@field"] = { fg = M.colors.white },
  ["@property"] = { fg = M.colors.white },

  -- Parameters use fg with italic
  ["@parameter"] = { fg = M.colors.white, italic = true },
  ["@variable.parameter"] = { fg = M.colors.white, italic = true },

  -- Constants use magenta.bright
  Constant = { fg = M.colors.purple_bright },
  ["@constant"] = { fg = M.colors.purple_bright },
  ["@constant.builtin"] = { fg = M.colors.purple_bright },
  ["@constant.macro"] = { fg = M.colors.purple_bright },

  -- Numbers link to Constant (magenta.bright)
  Number = { fg = M.colors.purple_bright },
  Float = { fg = M.colors.purple_bright },
  Boolean = { fg = M.colors.purple_bright },
  ["@number"] = { fg = M.colors.purple_bright },
  ["@float"] = { fg = M.colors.purple_bright },
  ["@boolean"] = { fg = M.colors.purple_bright },

  -- Strings use green
  String = { fg = M.colors.green },
  Character = { fg = M.colors.green },
  ["@string"] = { fg = M.colors.green },
  ["@character"] = { fg = M.colors.green },

  -- String escape/regex use magenta.bright
  ["@string.escape"] = { fg = M.colors.purple_bright },
  ["@string.regex"] = { fg = M.colors.purple_bright },
  ["@string.special"] = { fg = M.colors.yellow },

  -- Operators use fg
  Operator = { fg = M.colors.white },
  ["@operator"] = { fg = M.colors.white },

  -- Punctuation
  ["@punctuation.bracket"] = { fg = M.colors.white },
  ["@punctuation.delimiter"] = { fg = M.colors.white },
  ["@punctuation.special"] = { fg = M.colors.blue1 },
  Delimiter = { fg = M.colors.white },

  -- Special uses blue1
  Special = { fg = M.colors.blue1 },
  SpecialChar = { fg = M.colors.blue1 },

  -- Builtins use blue0
  ["@builtin"] = { fg = M.colors.blue0 },

  -- Constructors
  ["@constructor"] = { fg = M.colors.yellow },

  -- Include/imports
  Include = { fg = M.colors.blue1 },
  ["@include"] = { fg = M.colors.blue1 },

  -- PreProc
  PreProc = { fg = M.colors.blue1 },
  Define = { fg = M.colors.blue1 },

  -- Comments use gray5
  Comment = { fg = M.colors.grey_fg, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg, italic = true },

  -- Comment annotations (override base with nordic diagnostic colors)
  ["@comment.note"] = { fg = M.colors.hint },
  ["@comment.error"] = { fg = M.colors.error },
  ["@comment.warning"] = { fg = M.colors.warn },
  ["@comment.todo"] = { fg = M.colors.info },

  -- Tags (HTML/JSX)
  Tag = { fg = M.colors.blue1 },
  ["@tag"] = { fg = M.colors.blue1 },
  ["@tag.attribute"] = { fg = M.colors.yellow },
  ["@tag.delimiter"] = { fg = M.colors.white },

  -- Namespace/module
  ["@namespace"] = { fg = M.colors.white },
  ["@module"] = { fg = M.colors.white },

  -- Labels
  Label = { fg = M.colors.blue1 },
  ["@label"] = { fg = M.colors.blue1 },

  -- Storage
  StorageClass = { fg = M.colors.orange },
  ["@storageclass"] = { fg = M.colors.orange },

  -- Exception
  Exception = { fg = M.colors.orange },
  ["@exception"] = { fg = M.colors.orange },

  -- Debug
  Debug = { fg = M.colors.red },

  -- Coroutine keywords use macro color (red)
  ["@keyword.coroutine"] = { fg = M.colors.red },

  -- Attribute
  ["@attribute"] = { fg = M.colors.yellow },

  -- C++ property uses cyan
  ["@property.cpp"] = { fg = M.colors.cyan },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
