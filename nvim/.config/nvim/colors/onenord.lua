local M = {}

-- Official onenord palette: https://github.com/rmehri01/onenord.nvim
M.colors = {
  -- Backgrounds
  black = "#2E3440",        -- bg
  darker_black = "#282E3A", -- darker than bg
  black2 = "#353B49",       -- active
  one_bg = "#3B4252",       -- float
  one_bg2 = "#3F4758",      -- highlight
  one_bg3 = "#434C5E",      -- highlight_dark

  -- Greys
  grey = "#4C566A",       -- selection
  grey_fg = "#646A76",    -- gray (comment base)
  grey_fg2 = "#6C7A96",   -- light_gray (comments)
  light_grey = "#6C7A96", -- light_gray

  -- Foregrounds
  white = "#C8D0E0",        -- fg
  darker_white = "#E5E9F0", -- fg_light
  bright_white = "#ECEFF4",

  -- Frost colors
  teal = "#8FBCBB",      -- light_green
  cyan = "#88C0D0",      -- cyan
  nord_blue = "#81A1C1", -- blue
  blue = "#5E81AC",      -- dark_blue

  -- Aurora colors
  red = "#D57780",          -- red
  dark_red = "#BF616A",     -- dark_red
  orange = "#D08F70",       -- orange
  yellow = "#EBCB8B",       -- yellow
  green = "#A3BE8C",        -- green
  purple = "#B988B0",       -- purple
  light_purple = "#B48EAD", -- light_purple

  -- Pinks (onenord specific)
  pink = "#E85B7A",      -- pink
  dark_pink = "#E44675", -- dark_pink
  baby_pink = "#DE878F", -- light_red

  -- UI colors
  line = "#3B4252",          -- float color for splits
  statusline_bg = "#2E3440", -- bg
  lightbg = "#3F4758",       -- highlight
  pmenu_bg = "#81A1C1",      -- blue
  folder_bg = "#81A1C1",     -- blue

  -- Derived colors
  vibrant_green = "#A3BE8C",
  sun = "#EBCB8B",
  dark_purple = "#B48EAD",

  -- Base16 mapping for onenord
  base00 = "#2E3440", -- bg
  base01 = "#353B49", -- active
  base02 = "#3F4758", -- highlight
  base03 = "#434C5E", -- highlight_dark
  base04 = "#4C566A", -- selection
  base05 = "#C8D0E0", -- fg
  base06 = "#E5E9F0", -- fg_light
  base07 = "#ECEFF4", -- bright white
  base08 = "#D57780", -- red - variables/identifiers
  base09 = "#D08F70", -- orange - constants/numbers
  base0A = "#EBCB8B", -- yellow - types
  base0B = "#A3BE8C", -- green - strings
  base0C = "#88C0D0", -- cyan - support/regex
  base0D = "#81A1C1", -- blue - functions
  base0E = "#B988B0", -- purple - keywords
  base0F = "#BF616A", -- dark_red - special
}

-- Override highlights to match original onenord.nvim behavior
M.highlights = {
  -- Functions use blue
  Function = { fg = M.colors.nord_blue },
  ["@function"] = { fg = M.colors.nord_blue },
  ["@function.builtin"] = { fg = M.colors.nord_blue },
  ["@function.call"] = { fg = M.colors.nord_blue },
  ["@method"] = { fg = M.colors.nord_blue },
  ["@method.call"] = { fg = M.colors.nord_blue },

  -- Keywords use purple
  Keyword = { fg = M.colors.purple },
  Statement = { fg = M.colors.purple },
  Conditional = { fg = M.colors.purple },
  Repeat = { fg = M.colors.purple },
  ["@keyword"] = { fg = M.colors.purple },
  ["@keyword.function"] = { fg = M.colors.purple },
  ["@keyword.return"] = { fg = M.colors.purple },
  ["@conditional"] = { fg = M.colors.purple },
  ["@repeat"] = { fg = M.colors.purple },

  -- Types use yellow
  Type = { fg = M.colors.yellow },
  ["@type"] = { fg = M.colors.yellow },
  ["@type.builtin"] = { fg = M.colors.yellow },

  -- Variables use fg
  ["@variable"] = { fg = M.colors.white },
  ["@variable.builtin"] = { fg = M.colors.cyan },

  -- Parameters use red
  ["@parameter"] = { fg = M.colors.red },
  ["@variable.parameter"] = { fg = M.colors.red },

  -- Numbers use orange
  Number = { fg = M.colors.orange },
  Float = { fg = M.colors.orange },
  ["@number"] = { fg = M.colors.orange },
  ["@float"] = { fg = M.colors.orange },

  -- Comments use light_gray
  Comment = { fg = M.colors.grey_fg2, italic = true },
  ["@comment"] = { fg = M.colors.grey_fg2, italic = true },
}

require("xaaha.core.colorscheme").setup_dark(M.colors, M.highlights)
