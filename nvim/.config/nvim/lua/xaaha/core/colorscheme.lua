local M = {}

local function apply(colors, bg, overwriteHighlights, colorscheme_name)
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")

    vim.o.background = bg

    vim.g.colors_name = colorscheme_name
    -- Define highlight groups
    local highlights = {
      -- Editor highlights
      Normal = { fg = colors.base05, bg = colors.black },
      NormalFloat = { fg = colors.base05, bg = colors.black2 },
      FloatBorder = { fg = colors.grey_fg },
      FloatTitle = { fg = colors.white, bg = colors.grey },

      -- Window/Buffer
      ColorColumn = { bg = colors.black2 },
      Cursor = { fg = colors.black, bg = colors.white },
      CursorColumn = { bg = colors.one_bg },
      CursorLine = { bg = colors.one_bg },
      CursorLineNr = { fg = colors.white, bold = true },
      LineNr = { fg = colors.grey },
      SignColumn = { fg = colors.grey, bg = colors.black },
      VertSplit = { fg = colors.line },
      WinSeparator = { fg = colors.line },
      EndOfBuffer = { fg = colors.black },
      Folded = { fg = colors.light_grey, bg = colors.one_bg },
      FoldColumn = { fg = colors.grey, bg = colors.black },

      -- Statusline
      StatusLine = { fg = colors.base06, bg = colors.statusline_bg },
      StatusLineNC = { fg = colors.grey_fg, bg = colors.statusline_bg },
      GitBranch = { fg = colors.base05, bg = "NONE", italic = true },
      GitChanges = { fg = colors.yellow, bg = "NONE", bold = true },

      -- Popup menu
      Pmenu = { fg = colors.white, bg = colors.black2 },
      PmenuSel = { fg = colors.black, bg = colors.pmenu_bg, bold = true },
      PmenuSbar = { bg = colors.one_bg2 },
      PmenuThumb = { bg = colors.grey },

      -- Search
      Search = { fg = colors.black, bg = colors.yellow },
      IncSearch = { fg = colors.black, bg = colors.orange },
      CurSearch = { fg = colors.black, bg = colors.red },
      Substitute = { fg = colors.black, bg = colors.green },

      -- Visual
      Visual = { bg = colors.one_bg3 },
      VisualNOS = { bg = colors.one_bg2 },

      -- Messages
      ErrorMsg = { fg = colors.red, bold = true },
      WarningMsg = { fg = colors.yellow, bold = true },
      ModeMsg = { fg = colors.green, bold = true },
      MoreMsg = { fg = colors.green },
      Question = { fg = colors.green },

      -- Syntax highlighting (using base16 scheme)
      Comment = { fg = colors.grey_fg2, italic = true },

      -- Constants
      Constant = { fg = colors.base09 },
      String = { fg = colors.green },
      Character = { fg = colors.green },
      Number = { fg = colors.base09 },
      Boolean = { fg = colors.base09 },
      Float = { fg = colors.base09 },

      -- Identifiers
      Identifier = { fg = colors.base08 },
      Function = { fg = colors.base0D },

      -- Statements
      Statement = { fg = colors.base0E },
      Conditional = { fg = colors.base0E },
      Repeat = { fg = colors.base0E },
      Label = { fg = colors.base0A },
      Operator = { fg = colors.base05 },
      Keyword = { fg = colors.base0E, italic = true },
      Exception = { fg = colors.base08 },

      -- Preprocs
      PreProc = { fg = colors.base0A },
      Include = { fg = colors.base0D },
      Define = { fg = colors.base0E },
      Macro = { fg = colors.base08 },
      PreCondit = { fg = colors.base0A },

      -- Types
      Type = { fg = colors.base0A },
      StorageClass = { fg = colors.base0A },
      Structure = { fg = colors.base0E },
      Typedef = { fg = colors.base0A },

      -- Specials
      Special = { fg = colors.base0C },
      SpecialChar = { fg = colors.orange },
      Tag = { fg = colors.base0A },
      Delimiter = { fg = colors.base0F },
      SpecialComment = { fg = colors.grey_fg },
      Debug = { fg = colors.base08 },

      -- Other
      Underlined = { fg = colors.green, underline = true },
      Ignore = { fg = colors.grey },
      Error = { fg = colors.red, bold = true },
      Todo = { fg = colors.yellow, bg = colors.one_bg, bold = true },

      -- Spell
      SpellBad = { undercurl = true, sp = colors.red },
      SpellCap = { undercurl = true, sp = colors.yellow },
      SpellLocal = { undercurl = true, sp = colors.green },
      SpellRare = { undercurl = true, sp = colors.purple },

      -- Diff
      DiffAdd = { fg = colors.green },
      DiffChange = { fg = colors.yellow },
      DiffDelete = { fg = colors.red },
      DiffText = { fg = colors.blue, bold = true },

      -- Git signs
      GitSignsAdd = { fg = colors.green },
      GitSignsChange = { fg = colors.yellow },
      GitSignsDelete = { fg = colors.red },

      -- Diagnostic
      DiagnosticError = { fg = colors.red },
      DiagnosticWarn = { fg = colors.yellow },
      DiagnosticInfo = { fg = colors.blue },
      DiagnosticHint = { fg = colors.purple },
      DiagnosticOk = { fg = colors.green },

      DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
      DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
      DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
      DiagnosticUnderlineHint = { undercurl = true, sp = colors.purple },
      DiagnosticUnderlineOk = { undercurl = true, sp = colors.green },

      -- LSP
      LspReferenceText = { bg = colors.one_bg2 },
      LspReferenceRead = { bg = colors.one_bg2 },
      LspReferenceWrite = { bg = colors.one_bg2 },
      LspSignatureActiveParameter = { fg = colors.black, bg = colors.green },
      LspCodeLens = { fg = colors.grey_fg },


      -- TreesitterContext
      TreesitterContext = { fg = "NONE", bg = colors.statusline_bg },

      -- Treesitter
      ["@variable"] = { fg = colors.base05 },
      ["@variable.builtin"] = { fg = colors.red },
      ["@variable.parameter"] = { fg = colors.base08 },
      ["@variable.member"] = { fg = colors.base08 },

      ["@constant"] = { fg = colors.base09 },
      ["@constant.builtin"] = { fg = colors.base09 },
      ["@constant.macro"] = { fg = colors.base08 },

      ["@module"] = { fg = colors.base08 },
      ["@label"] = { fg = colors.base0A },

      ["@string"] = { fg = colors.green },
      ["@string.regex"] = { fg = colors.base0B },
      ["@string.escape"] = { fg = colors.base0C },
      ["@string.special"] = { fg = colors.base0C },

      ["@character"] = { fg = colors.green },
      ["@character.special"] = { fg = colors.base0F },

      ["@boolean"] = { fg = colors.base09 },
      ["@number"] = { fg = colors.base09 },
      ["@float"] = { fg = colors.base09 },

      ["@function"] = { fg = colors.base0D },
      ["@function.builtin"] = { fg = colors.base0D },
      ["@function.call"] = { fg = colors.base0D },
      ["@function.macro"] = { fg = colors.base08 },
      ["@method"] = { fg = colors.base0D },
      ["@method.call"] = { fg = colors.base0D },
      ["@constructor"] = { fg = colors.base0C },
      ["@parameter"] = { fg = colors.base08 },

      ["@keyword"] = { fg = colors.base0E, italic = true },
      ["@keyword.coroutine"] = { fg = colors.base0E },
      ["@keyword.function"] = { fg = colors.base0E },
      ["@keyword.operator"] = { fg = colors.base0E },
      ["@keyword.return"] = { fg = colors.base0E },

      ["@conditional"] = { fg = colors.base0E },
      ["@repeat"] = { fg = colors.base0E },
      ["@debug"] = { fg = colors.base08 },
      ["@include"] = { fg = colors.base0D },
      ["@exception"] = { fg = colors.base08 },

      ["@type"] = { fg = colors.base0A },
      ["@type.builtin"] = { fg = colors.base0A },
      ["@type.definition"] = { fg = colors.base0A },
      ["@type.qualifier"] = { fg = colors.base0E },

      ["@storageclass"] = { fg = colors.base0A },
      ["@attribute"] = { fg = colors.base0A },
      ["@field"] = { fg = colors.base08 },
      ["@property"] = { fg = colors.base08 },

      ["@punctuation.delimiter"] = { fg = colors.base0F },
      ["@punctuation.bracket"] = { fg = colors.red }, -- Special from polish_hl
      ["@punctuation.special"] = { fg = colors.base0F },

      ["@comment"] = { fg = colors.grey_fg2, italic = true },
      ["@comment.documentation"] = { fg = colors.base0C },

      ["@tag"] = { fg = colors.base0A },
      ["@tag.attribute"] = { fg = colors.base08 },
      ["@tag.delimiter"] = { fg = colors.base0F },

      ["@text.strong"] = { bold = true },
      ["@text.emphasis"] = { italic = true },
      ["@text.underline"] = { underline = true },
      ["@text.strike"] = { strikethrough = true },
      ["@text.title"] = { fg = colors.base0D, bold = true },
      ["@text.literal"] = { fg = colors.green },
      ["@text.quote"] = { fg = colors.grey_fg2 },
      ["@text.uri"] = { fg = colors.base0C, underline = true },
      ["@text.math"] = { fg = colors.base0C },
      ["@text.reference"] = { fg = colors.base0C },

      ["@text.diff.add"] = { fg = colors.green },
      ["@text.diff.delete"] = { fg = colors.red },

      ["@namespace"] = { fg = colors.base08 },
      ["@operator"] = { fg = colors.base05 },

      -- Treesitter/LSP semantic token links
      ["@lsp.type.namespace"] = { link = "@namespace" },
      ["@lsp.type.type"] = { link = "@type" },
      ["@lsp.type.class"] = { link = "@type" },
      ["@lsp.type.enum"] = { link = "@type" },
      ["@lsp.type.interface"] = { link = "@type" },
      ["@lsp.type.typeParameter"] = { link = "@type" },
      ["@lsp.type.parameter"] = { link = "@parameter" },
      ["@lsp.type.variable"] = { link = "@variable" },
      ["@lsp.type.property"] = { link = "@property" },
      ["@lsp.type.enumMember"] = { link = "@constant" },
      ["@lsp.type.function"] = { link = "@function" },
      ["@lsp.type.method"] = { link = "@method" },
      ["@lsp.type.macro"] = { link = "@constant.macro" },
      ["@lsp.type.keyword"] = { link = "@keyword" },
      ["@lsp.type.comment"] = { link = "@comment" },
      ["@lsp.type.string"] = { link = "@string" },
      ["@lsp.type.number"] = { link = "@number" },
      ["@lsp.type.regexp"] = { link = "@string.regex" },
      ["@lsp.type.operator"] = { link = "@operator" },
      ["@lsp.type.decorator"] = { link = "@function.macro" },
      ["@lsp.mod.deprecated"] = { strikethrough = true },
      ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
      ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
      ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },

      ["@text.environment"] = { link = "@markup.environment" },
      ["@text.environment.name"] = { link = "@markup.environment.name" },
      ["@text.todo"] = { link = "@comment.todo" },
      ["@text.warning"] = { link = "@comment.warning" },
      ["@text.note"] = { link = "@comment.note" },
      ["@text.danger"] = { link = "@comment.error" },
    }

    if type(overwriteHighlights) == "table" then
      for name, value in pairs(overwriteHighlights) do
        highlights[name] = value
      end
    end

    -- Apply highlights
    for group, settings in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, settings)
    end

    -- Set terminal colors
    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.white
    vim.g.terminal_color_8 = colors.grey
    vim.g.terminal_color_9 = colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.purple
    vim.g.terminal_color_14 = colors.cyan
    vim.g.terminal_color_15 = colors.white
  end
end

local function get_colors_name()
  local source = debug.getinfo(3, "S").source
  return source:match("([^/]+)%.lua$")
end

function M.setup_dark(colors, highlights, colorscheme_name)
  colorscheme_name = colorscheme_name or get_colors_name()
  apply(colors, "dark", highlights, colorscheme_name)
end

function M.setup_light(colors, highlights, colorscheme_name)
  colorscheme_name = colorscheme_name or get_colors_name()
  apply(colors, "light", highlights, colorscheme_name)
end

return M
