local M = {}

-- Official onenord light palette: https://github.com/rmehri01/onenord.nvim
M.colors = {
  -- Backgrounds (inverted for light theme)
  black = "#F7F8FA",        -- bg
  darker_black = "#FFFFFF", -- lighter than bg
  black2 = "#EFF0F2",       -- active
  one_bg = "#EDEEF0",       -- float
  one_bg2 = "#EAEBED",      -- highlight
  one_bg3 = "#DFE1E4",      -- highlight_dark

  -- Greys
  grey = "#DCDEE1",       -- selection
  grey_fg = "#838FA6",    -- gray
  grey_fg2 = "#646A76",   -- light_gray (comments)
  light_grey = "#646A76", -- light_gray

  -- Foregrounds (dark for light theme)
  white = "#2E3440",        -- fg
  darker_white = "#4C566A", -- fg_light
  bright_white = "#1D2128",

  -- Frost colors (adjusted for light bg)
  teal = "#5F9E9D",      -- light_green
  cyan = "#3EA1AD",      -- cyan
  nord_blue = "#3879C5", -- blue
  blue = "#1B40A6",      -- dark_blue

  -- Aurora colors (vivid for light bg)
  red = "#CB4F53",          -- red
  dark_red = "#C53B40",     -- dark_red
  orange = "#EE5E25",       -- orange
  yellow = "#BA793E",       -- yellow
  green = "#48A53D",        -- green
  purple = "#9F4ACA",       -- purple
  light_purple = "#9665AF", -- light_purple

  -- Pinks
  pink = "#E85B7A",
  dark_pink = "#E44675",
  baby_pink = "#D16366", -- light_red

  -- UI colors
  line = "#EDEEF0",          -- float color for splits
  statusline_bg = "#F7F8FA", -- bg
  lightbg = "#EAEBED",       -- highlight
  pmenu_bg = "#3879C5",      -- blue
  folder_bg = "#3879C5",     -- blue

  -- Derived colors
  vibrant_green = "#48A53D",
  sun = "#BA793E",
  dark_purple = "#9665AF",

  -- Base16 mapping for onenord light
  base00 = "#F7F8FA", -- bg
  base01 = "#EFF0F2", -- active
  base02 = "#EAEBED", -- highlight
  base03 = "#DFE1E4", -- highlight_dark
  base04 = "#DCDEE1", -- selection
  base05 = "#2E3440", -- fg
  base06 = "#4C566A", -- fg_light
  base07 = "#1D2128", -- dark text
  base08 = "#CB4F53", -- red - variables/identifiers
  base09 = "#EE5E25", -- orange - constants/numbers
  base0A = "#BA793E", -- yellow - types
  base0B = "#48A53D", -- green - strings
  base0C = "#3EA1AD", -- cyan - support/regex
  base0D = "#3879C5", -- blue - functions
  base0E = "#9F4ACA", -- purple - keywords
  base0F = "#C53B40", -- dark_red - special
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

require("xaaha.core.colorscheme").setup_light(M.colors, M.highlights)
