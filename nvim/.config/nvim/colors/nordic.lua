local palette = {

  none = 'NONE',

  -- Blacks. Not in base Nord.
  black0 = '#191D24',
  black1 = '#1E222A',
  -- Slightly darker than bg.  Very useful for certain popups
  black2 = '#222630',

  -- Grays
  -- This color is used on their website's dark theme.
  gray0 = '#242933', --bg
  -- Polar Night.
  gray1 = '#2E3440',
  gray2 = '#3B4252',
  gray3 = '#434C5E',
  gray4 = '#4C566A',

  -- A light blue/gray.
  -- From @nightfox.nvim.
  gray5 = '#60728A',

  -- Dim white.
  -- default fg, has a blue tint.
  white0_normal = '#BBC3D4',
  -- less blue tint
  white0_reduce_blue = '#C0C8D8',

  -- Snow storm.
  white1 = '#D8DEE9',
  white2 = '#E5E9F0',
  white3 = '#ECEFF4',

  -- Frost.
  blue0 = '#5E81AC',
  blue1 = '#81A1C1',
  blue2 = '#88C0D0',

  cyan = {
    base = '#8FBCBB',
    bright = '#9FC6C5',
    dim = '#80B3B2',
  },

  -- Aurora.
  -- These colors are used a lot, so we need variations for them.
  -- Base colors are from original Nord palette.
  red = {
    base = '#BF616A',
    bright = '#C5727A',
    dim = '#B74E58',
  },
  orange = {
    base = '#D08770',
    bright = '#D79784',
    dim = '#CB775D',
  },
  yellow = {
    base = '#EBCB8B',
    bright = '#EFD49F',
    dim = '#E7C173',
  },
  green = {
    base = '#A3BE8C',
    bright = '#B1C89D',
    dim = '#97B67C',
  },
  magenta = {
    base = '#B48EAD',
    bright = '#BE9DB8',
    dim = '#A97EA1',
  },
}

local colors = {
  white = palette.white0_normal,
  darker_black = palette.black2,
  black = palette.black2, -- nvim bg
  black2 = palette.black1,
  one_bg = palette.gray0,
  one_bg2 = palette.gray1,
  one_bg3 = palette.gray2,
  grey = palette.gray3,
  grey_fg = palette.gray4,
  grey_fg2 = palette.gray5,
  light_grey = palette.white2,
  red = palette.red.base,
  baby_pink = palette.red.bright, -- A brighter version for variations
  pink = palette.red.dim,
  line = palette.gray1,           -- for lines like vertsplit
  green = palette.green.base,
  vibrant_green = palette.green.bright,
  nord_blue = palette.blue0,
  blue = palette.blue1,
  yellow = palette.yellow.base,
  sun = palette.yellow.bright, -- Using a brighter yellow
  purple = palette.magenta.base,
  dark_purple = palette.magenta.dim,
  teal = palette.cyan.base,
  orange = palette.orange.base,
  cyan = palette.cyan.base,
  statusline_bg = palette.gray1,
  lightbg = palette.gray2,
  pmenu_bg = palette.blue2,
  folder_bg = palette.green.base,

  base00 = palette.gray0,
  base01 = palette.gray1,
  base02 = palette.gray2,
  base03 = palette.gray3,
  base04 = palette.gray4,
  base05 = palette.white0_normal,
  base06 = palette.white1,
  base07 = palette.white2,
  base08 = palette.red.base,
  base09 = palette.red.bright,
  base0A = palette.yellow.base,
  base0B = palette.green.base,
  base0C = palette.cyan.base,
  base0D = palette.blue0,
  base0E = palette.magenta.base,
  base0F = palette.orange.base,

}

require("xaaha.core.colorscheme").setup_dark(colors)
