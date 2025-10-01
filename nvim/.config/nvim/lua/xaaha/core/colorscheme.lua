local M = {}

local onenord_dark = {
	-- Colors from
	-- https://github.com/NvChad/base46/blob/v3.0/lua/base46/themes/onenord.lua
	-- Base30
	white = "#D8DEE9",
	darker_black = "#252b37",
	black = "#2a303c", --  nvim bg
	black2 = "#2f3541",
	one_bg = "#343a46",
	one_bg2 = "#3e4450",
	one_bg3 = "#484e5a",
	grey = "#4d535f",
	grey_fg = "#545a66",
	grey_fg2 = "#595f6b",
	light_grey = "#606672",
	red = "#d57780",
	baby_pink = "#de878f",
	pink = "#da838b",
	line = "#414753", -- for lines like vertsplit
	green = "#A3BE8C",
	vibrant_green = "#afca98",
	blue = "#7797b7",
	nord_blue = "#81A1C1",
	yellow = "#EBCB8B",
	sun = "#e1c181",
	purple = "#aab1be",
	dark_purple = "#B48EAD",
	teal = "#6484a4",
	orange = "#e39a83",
	cyan = "#9aafe6",
	statusline_bg = "#333945",
	lightbg = "#3f4551",
	pmenu_bg = "#A3BE8C",
	folder_bg = "#7797b7",

	-- Base16 colors from NvChad
	base00 = "#2a303c",
	base01 = "#3B4252",
	base02 = "#434C5E",
	base03 = "#4C566A",
	base04 = "#566074",
	base05 = "#bfc5d0",
	base06 = "#c7cdd8",
	base07 = "#ced4df",
	base08 = "#d57780",
	base09 = "#e39a83",
	base0A = "#EBCB8B",
	base0B = "#A3BE8C",
	base0C = "#97b7d7",
	base0D = "#81A1C1",
	base0E = "#B48EAD",
	base0F = "#d57780",
}

local onenord_light = {
	white = "#54555b",
	darker_black = "#efeff0",
	black = "#fafafa", --  nvim bg
	black2 = "#EAEAEB",
	one_bg = "#dadadb", -- real bg of onedark
	one_bg2 = "#d4d4d5",
	one_bg3 = "#cccccd",
	grey = "#b7b7b8",
	grey_fg = "#b0b0b1",
	grey_fg2 = "#a9a9aa",
	light_grey = "#a2a2a3",
	red = "#d84a3d",
	baby_pink = "#F07178",
	pink = "#ff75a0",
	line = "#e2e2e2",
	green = "#50a14f",
	vibrant_green = "#7eca9c",
	nord_blue = "#428bab",
	blue = "#4078f2",
	yellow = "#c18401",
	sun = "#dea95f",
	purple = "#a28dcd",
	dark_purple = "#8e79b9",
	teal = "#519ABA",
	orange = "#FF6A00",
	cyan = "#0b8ec6",
	statusline_bg = "#ececec",
	lightbg = "#d3d3d3",
	pmenu_bg = "#5e5f65",
	folder_bg = "#6C6C6C",

	-- Base16
	base00 = "#fafafa",
	base01 = "#f4f4f4",
	base02 = "#e5e5e6",
	base03 = "#dfdfe0",
	base04 = "#d7d7d8",
	base05 = "#383a42",
	base06 = "#202227",
	base07 = "#090a0b",
	base08 = "#d84a3d",
	base09 = "#d75f00",
	base0A = "#c18401",
	base0B = "#50a14f",
	base0C = "#0070a8",
	base0D = "#4078f2",
	base0E = "#a626a4",
	base0F = "#986801",
}

local function apply(colors, bg)
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")

		vim.o.background = bg
		vim.g.colors_name = "onenord"

		-- in case I need to add more highlights
		-- https://github.com/xaaha/onenord.nvim/blob/9dc5bffa630351fdb8c3c5fe9e795f0ec6fea8eb/lua/onenord/theme.lua

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

			-- Statusline
			GitBranch = { fg = colors.cyan, bg = "NONE", italic = true },
			GitChanges = { fg = colors.yellow, bg = "NONE", bold = true },

			-- TreesitterContext
			TreesitterContext = { fg = "NONE", bg = colors.active },

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

function M.setup_dark()
	apply(onenord_dark, "dark")
end

function M.setup_light()
	apply(onenord_light, "light")
end

return M
