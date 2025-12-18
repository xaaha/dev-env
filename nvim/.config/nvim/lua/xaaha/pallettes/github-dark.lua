local M = {}

M.colors = {
  -- Core UI
  white = "#c9d1d9",
  darker_black = "#161b22",
  black = "#212830", --"#0d1117",
  black2 = "#161b22",
  one_bg = "#1f2428",
  one_bg2 = "#21262d",
  one_bg3 = "#30363d",

  -- Greys
  grey = "#30363d",
  grey_fg = "#484f58",
  grey_fg2 = "#6e7681",
  light_grey = "#8b949e",

  -- Accent colors
  red = "#f85149",
  baby_pink = "#ff7b72",
  pink = "#db61a2",

  green = "#3fb950",
  vibrant_green = "#7ee787",

  blue = "#58a6ff",
  nord_blue = "#79c0ff",

  yellow = "#d29922",
  sun = "#e3b341",

  purple = "#a371f7",
  dark_purple = "#8957e5",

  teal = "#39c5cf",
  cyan = "#56d4dd",
  orange = "#ff9b50",

  -- UI specific
  line = "#21262d",
  statusline_bg = "#161b22",
  lightbg = "#21262d",
  pmenu_bg = "#2f81f7",
  folder_bg = "#2f81f7",

  -- Base16
  base00 = "#0d1117",
  base01 = "#161b22",
  base02 = "#21262d",
  base03 = "#30363d",
  base04 = "#484f58",
  base05 = "#c9d1d9",
  base06 = "#e6edf3",
  base07 = "#f0f6fc",

  base08 = "#f85149", -- red
  base09 = "#ff9b50", -- orange
  base0A = "#d29922", -- yellow
  base0B = "#3fb950", -- green
  base0C = "#39c5cf", -- cyan
  base0D = "#58a6ff", -- blue
  base0E = "#a371f7", -- purple
  base0F = "#7ee787", -- bright green
}

M.highlights = {
  ["@punctuation.bracket"] = { fg = M.colors.orange },
  ["@string"] = { fg = M.colors.white },
  ["@variable.member.key"] = { fg = M.colors.white },
  ["@constructor"] = { fg = M.colors.vibrant_green },
  ["@tag.attribute"] = { link = "@function.method" },
}

return M
