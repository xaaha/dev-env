" hi clear
let g:colors_name = 'xaaha_light'

let s:t_Co = &t_Co

hi! link helpVim Title
hi! link helpHeader Title
hi! link helpHyperTextJump Underlined
hi! link fugitiveSymbolicRef PreProc
hi! link fugitiveHeading Statement
hi! link fugitiveStagedHeading Statement
hi! link fugitiveUnstagedHeading Statement
hi! link fugitiveUntrackedHeading Statement
hi! link fugitiveStagedModifier PreProc
hi! link fugitiveUnstagedModifier PreProc
hi! link fugitiveHash Constant
hi! link diffFile PreProc
hi! link markdownHeadingDelimiter Special
hi! link rstSectionDelimiter Statement
hi! link rstDirective PreProc
hi! link rstHyperlinkReference Special
hi! link rstFieldName Constant
hi! link rstDelimiter Special
hi! link rstInterpretedText Special
hi! link rstCodeBlock Normal
hi! link rstLiteralBlock rstCodeBlock
hi! link markdownUrl String
hi! link colortemplateKey Statement
hi! link xmlTagName Statement
hi! link javaScriptFunction Statement
hi! link javaScriptIdentifier Statement
hi! link sqlKeyword Statement
hi! link yamlBlockMappingKey Statement
hi! link rubyMacro Statement
hi! link rubyDefine Statement
hi! link vimGroup Normal
hi! link vimVar Normal
hi! link vimOper Normal
hi! link vimSep Normal
hi! link vimParenSep Normal
hi! link vimOption Normal
hi! link vimCommentString Comment
hi! link pythonInclude Statement
hi! link shQuote Constant
hi! link shNoQuote Normal
hi! link shTestOpr Normal
hi! link shOperator Normal
hi! link shSetOption Normal
hi! link shOption Normal
hi! link shCommandSub Normal
hi! link shDerefPattern shQuote
hi! link shDerefOp Special
hi! link phpStorageClass Statement
hi! link phpStructure Statement
hi! link phpInclude Statement
hi! link phpDefine Statement
hi! link phpSpecialFunction Normal
hi! link phpParent Normal
hi! link phpComparison Normal
hi! link phpOperator Normal
hi! link phpVarSelector Special
hi! link phpMemberSelector Special
hi! link phpDocCustomTags phpDocTags
hi! link javaExternal Statement
hi! link javaType Statement
hi! link javaScopeDecl Statement
hi! link javaClassDecl Statement
hi! link javaStorageClass Statement
hi! link javaDocParam PreProc
hi! link csStorage Statement
hi! link csAccessModifier Statement
hi! link csClass Statement
hi! link csModifier Statement
hi! link csAsyncModifier Statement
hi! link csLogicSymbols Normal
hi! link csClassType Normal
hi! link csType Statement
hi! link Terminal Normal
hi! link StatuslineTerm Statusline
hi! link StatuslineTermNC StatuslineNC
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link MessageWindow PMenu
hi! link PopupNotification Todo
if &background ==# 'dark'
  if (has('termguicolors') && &termguicolors) || has('gui_running')
    let g:terminal_ansi_colors = ['#000000', '#af5f5f', '#5faf5f', '#af875f', '#5f87af', '#d787d7', '#5fafaf', '#c6c6c6', '#767676', '#ff5f5f', '#5fd75f', '#ffd787', '#5fafff', '#ff87ff', '#5fd7d7', '#ffffff']
    " Nvim uses g:terminal_color_{0-15} instead
    for i in range(g:terminal_ansi_colors->len())
      let g:terminal_color_{i} = g:terminal_ansi_colors[i]
    endfor
  endif
  hi Normal guifg=#c6c6c6 guibg=#000000 gui=NONE cterm=NONE
  hi Statusline guifg=#c6c6c6 guibg=#000000 gui=bold,reverse cterm=bold,reverse
  hi StatuslineNC guifg=#767676 guibg=#000000 gui=reverse cterm=reverse
  hi VertSplit guifg=#767676 guibg=#767676 gui=NONE cterm=NONE
  hi TabLine guifg=#000000 guibg=#c6c6c6 gui=NONE cterm=NONE
  hi TabLineFill guifg=NONE guibg=#767676 gui=NONE cterm=NONE
  hi TabLineSel guifg=#ffffff guibg=#000000 gui=bold cterm=bold
  hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ToolbarButton guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
  hi QuickFixLine guifg=#000000 guibg=#5fafff gui=NONE cterm=NONE
  hi CursorLineNr guifg=#ffffff guibg=NONE gui=bold cterm=bold
  hi LineNr guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi NonText guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi FoldColumn guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi SpecialKey guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi EndOfBuffer guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=NONE guibg=#303030 gui=NONE cterm=NONE
  hi PmenuSel guifg=NONE guibg=#4e4e4e gui=NONE cterm=NONE
  hi PmenuThumb guifg=NONE guibg=#c6c6c6 gui=NONE cterm=NONE
  hi PmenuSbar guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi PmenuKind guifg=#ff5f5f guibg=#303030 gui=NONE cterm=NONE
  hi PmenuKindSel guifg=#ff5f5f guibg=#4e4e4e gui=NONE cterm=NONE
  hi PmenuExtra guifg=#767676 guibg=#303030 gui=NONE cterm=NONE
  hi PmenuExtraSel guifg=#767676 guibg=#4e4e4e gui=NONE cterm=NONE
  hi SignColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Error guifg=#ffffff guibg=#ff5f5f gui=NONE cterm=NONE
  hi ErrorMsg guifg=#ffffff guibg=#ff5f5f gui=NONE cterm=NONE
  hi ModeMsg guifg=#ffd787 guibg=NONE gui=reverse cterm=reverse
  hi MoreMsg guifg=#5fd75f guibg=NONE gui=NONE cterm=NONE
  hi Question guifg=#ff87ff guibg=NONE gui=NONE cterm=NONE
  hi WarningMsg guifg=#ff5f5f guibg=NONE gui=NONE cterm=NONE
  hi Todo guifg=#5fd7d7 guibg=#000000 gui=reverse cterm=reverse
  hi Search guifg=#000000 guibg=#ffd787 gui=NONE cterm=NONE
  hi IncSearch guifg=#000000 guibg=#5fd75f gui=NONE cterm=NONE
  hi CurSearch guifg=#000000 guibg=#5fd75f gui=NONE cterm=NONE
  hi WildMenu guifg=#000000 guibg=#ffd787 gui=bold cterm=bold
  hi debugPC guifg=#5f87af guibg=NONE gui=reverse cterm=reverse
  hi debugBreakpoint guifg=#5fafaf guibg=NONE gui=reverse cterm=reverse
  hi Cursor guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
  hi lCursor guifg=#ff5fff guibg=#000000 gui=reverse cterm=reverse
  hi Visual guifg=#ffffff guibg=#005f87 gui=NONE cterm=NONE
  hi MatchParen guifg=#ff00af guibg=NONE gui=bold cterm=bold
  hi VisualNOS guifg=#000000 guibg=#5fafaf gui=NONE cterm=NONE
  hi CursorLine guifg=NONE guibg=#262626 gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE guibg=#262626 gui=NONE cterm=NONE
  hi Folded guifg=#767676 guibg=#303030 gui=NONE cterm=NONE
  hi ColorColumn guifg=NONE guibg=#303030 gui=NONE cterm=NONE
  hi SpellBad guifg=NONE guibg=NONE guisp=#ff5f5f gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellCap guifg=NONE guibg=NONE guisp=#5fafaf gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellLocal guifg=NONE guibg=NONE guisp=#5faf5f gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellRare guifg=NONE guibg=NONE guisp=#ff87ff gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Comment guifg=#5fafff guibg=NONE gui=NONE cterm=NONE
  hi Constant guifg=#ff87ff guibg=NONE gui=NONE cterm=NONE
  hi String guifg=#ffd787 guibg=NONE gui=NONE cterm=NONE
  hi Identifier guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Statement guifg=#e4e4e4 guibg=NONE gui=bold cterm=bold
  hi Type guifg=#5fd75f guibg=NONE gui=NONE cterm=NONE
  hi PreProc guifg=#5fd7d7 guibg=NONE gui=NONE cterm=NONE
  hi Special guifg=#5fafaf guibg=NONE gui=NONE cterm=NONE
  hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
  hi Title guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi Directory guifg=#5fafff guibg=NONE gui=bold cterm=bold
  hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi DiffAdd guifg=#c6c6c6 guibg=#875f87 gui=NONE cterm=NONE
  hi DiffChange guifg=#c6c6c6 guibg=#5f5f5f gui=NONE cterm=NONE
  hi DiffText guifg=#afffff guibg=#5f8787 gui=NONE cterm=NONE
  hi DiffDelete guifg=#d78787 guibg=NONE gui=NONE cterm=NONE
  hi diffAdded guifg=#5fd75f guibg=NONE gui=NONE cterm=NONE
  hi diffRemoved guifg=#d78787 guibg=NONE gui=NONE cterm=NONE
  hi diffSubname guifg=#ff87ff guibg=NONE gui=NONE cterm=NONE
  hi dirType guifg=#d787d7 guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionUser guifg=#5faf5f guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionGroup guifg=#af875f guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionOther guifg=#5fafaf guibg=NONE gui=NONE cterm=NONE
  hi dirOwner guifg=#767676 guibg=NONE gui=NONE cterm=NONE
  hi dirGroup guifg=#767676 guibg=NONE gui=NONE cterm=NONE
  hi dirTime guifg=#767676 guibg=NONE gui=NONE cterm=NONE
  hi dirSize guifg=#ffd787 guibg=NONE gui=NONE cterm=NONE
  hi dirSizeMod guifg=#d787d7 guibg=NONE gui=NONE cterm=NONE
  hi FilterMenuDirectorySubtle guifg=#878787 guibg=NONE gui=NONE cterm=NONE
  hi dirFilterMenuBookmarkPath guifg=#878787 guibg=NONE gui=NONE cterm=NONE
  hi dirFilterMenuHistoryPath guifg=#878787 guibg=NONE gui=NONE cterm=NONE
  hi FilterMenuLineNr guifg=#878787 guibg=NONE gui=NONE cterm=NONE
  hi CocSearch guifg=#ffd787 guibg=NONE gui=NONE cterm=NONE
else
  " Light background
  if (has('termguicolors') && &termguicolors) || has('gui_running')
    let g:terminal_ansi_colors = ['#000000', '#af0000', '#008700', '#af5f00', '#005fd7', '#af00af', '#005f5f', '#808080', '#767676', '#d70000', '#87d787', '#ffd787', '#0087d7', '#ff00ff', '#008787', '#ffffff']
    " Nvim uses g:terminal_color_{0-15} instead
    for i in range(g:terminal_ansi_colors->len())
      let g:terminal_color_{i} = g:terminal_ansi_colors[i]
    endfor
  endif
  hi Normal guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
  hi Statusline guifg=#ffffff guibg=#000000 gui=bold cterm=bold
  hi StatuslineNC guifg=#ffffff guibg=#767676 gui=NONE cterm=NONE
  hi VertSplit guifg=#767676 guibg=#767676 gui=NONE cterm=NONE
  hi TabLine guifg=#000000 guibg=#bcbcbc gui=NONE cterm=NONE
  hi TabLineFill guifg=NONE guibg=#767676 gui=NONE cterm=NONE
  hi TabLineSel guifg=#ffffff guibg=#000000 gui=bold,reverse cterm=bold,reverse
  hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ToolbarButton guifg=#ffffff guibg=#000000 gui=NONE cterm=NONE
  hi QuickFixLine guifg=#ffffff guibg=#0087d7 gui=NONE cterm=NONE
  hi CursorLineNr guifg=#000000 guibg=NONE gui=bold cterm=bold
  hi LineNr guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi NonText guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi FoldColumn guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi EndOfBuffer guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi SpecialKey guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=NONE guibg=#e4e4e4 gui=NONE cterm=NONE
  hi PmenuSel guifg=NONE guibg=#c6c6c6 gui=NONE cterm=NONE
  hi PmenuThumb guifg=NONE guibg=#767676 gui=NONE cterm=NONE
  hi PmenuSbar guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi PmenuKind guifg=#af0000 guibg=#e4e4e4 gui=NONE cterm=NONE
  hi PmenuKindSel guifg=#af0000 guibg=#c6c6c6 gui=NONE cterm=NONE
  hi PmenuExtra guifg=#767676 guibg=#e4e4e4 gui=NONE cterm=NONE
  hi PmenuExtraSel guifg=#767676 guibg=#c6c6c6 gui=NONE cterm=NONE
  hi SignColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Error guifg=#ffffff guibg=#d70000 gui=NONE cterm=NONE
  hi ErrorMsg guifg=#ffffff guibg=#d70000 gui=NONE cterm=NONE
  hi ModeMsg guifg=#ffd787 guibg=#000000 gui=reverse cterm=reverse
  hi MoreMsg guifg=#008700 guibg=NONE gui=bold cterm=bold
  hi Question guifg=#af00af guibg=NONE gui=bold cterm=bold
  hi WarningMsg guifg=#d70000 guibg=NONE gui=bold cterm=bold
  hi Todo guifg=#008787 guibg=#ffffff gui=reverse cterm=reverse
  hi Search guifg=#000000 guibg=#ffd787 gui=NONE cterm=NONE
  hi IncSearch guifg=#000000 guibg=#87d787 gui=NONE cterm=NONE
  hi CurSearch guifg=#000000 guibg=#87d787 gui=NONE cterm=NONE
  hi WildMenu guifg=#000000 guibg=#ffd787 gui=bold cterm=bold
  hi debugPC guifg=#005fd7 guibg=NONE gui=reverse cterm=reverse
  hi debugBreakpoint guifg=#005f5f guibg=NONE gui=reverse cterm=reverse
  hi Cursor guifg=#ffffff guibg=#000000 gui=NONE cterm=NONE
  hi lCursor guifg=#ff00ff guibg=#000000 gui=reverse cterm=reverse
  hi Visual guifg=#ffffff guibg=#5f87af gui=NONE cterm=NONE
  hi MatchParen guifg=#ff00af guibg=NONE gui=bold cterm=bold
  hi VisualNOS guifg=#ffffff guibg=#008787 gui=NONE cterm=NONE
  hi CursorLine guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  hi Folded guifg=#767676 guibg=#e4e4e4 gui=NONE cterm=NONE
  hi ColorColumn guifg=NONE guibg=#e4e4e4 gui=NONE cterm=NONE
  hi SpellBad guifg=NONE guibg=NONE guisp=#af0000 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellCap guifg=NONE guibg=NONE guisp=#005f5f gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellLocal guifg=NONE guibg=NONE guisp=#008700 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellRare guifg=NONE guibg=NONE guisp=#ff00ff gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Comment guifg=#005fd7 guibg=NONE gui=NONE cterm=NONE
  hi Constant guifg=#af00af guibg=NONE gui=NONE cterm=NONE
  hi String guifg=#af5f00 guibg=NONE gui=NONE cterm=NONE
  hi Identifier guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Statement guifg=#000000 guibg=NONE gui=bold cterm=bold
  hi Type guifg=#008700 guibg=NONE gui=NONE cterm=NONE
  hi PreProc guifg=#005f5f guibg=NONE gui=NONE cterm=NONE
  hi Special guifg=#008787 guibg=NONE gui=NONE cterm=NONE
  hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
  hi Title guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi Directory guifg=#005fd7 guibg=NONE gui=bold cterm=bold
  hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi DiffAdd guifg=#000000 guibg=#d7afd7 gui=NONE cterm=NONE
  hi DiffChange guifg=#000000 guibg=#d0d0d0 gui=NONE cterm=NONE
  hi DiffText guifg=#000000 guibg=#5fd7d7 gui=NONE cterm=NONE
  hi DiffDelete guifg=#870000 guibg=NONE gui=NONE cterm=NONE
  hi diffAdded guifg=#008700 guibg=NONE gui=NONE cterm=NONE
  hi diffRemoved guifg=#d70000 guibg=NONE gui=NONE cterm=NONE
  hi diffSubname guifg=#af00af guibg=NONE gui=NONE cterm=NONE
  hi dirType guifg=#005f5f guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionUser guifg=#af5f00 guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionGroup guifg=#008700 guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionOther guifg=#af00af guibg=NONE gui=NONE cterm=NONE
  hi dirOwner guifg=#808080 guibg=NONE gui=NONE cterm=NONE
  hi dirGroup guifg=#808080 guibg=NONE gui=NONE cterm=NONE
  hi dirTime guifg=#808080 guibg=NONE gui=NONE cterm=NONE
  hi dirSize guifg=#af0000 guibg=NONE gui=NONE cterm=NONE
  hi dirSizeMod guifg=#005f5f guibg=NONE gui=NONE cterm=NONE
  hi dirLink guifg=#008700 guibg=NONE gui=bold cterm=bold
  hi dirFilterMenuBookmarkPath guifg=#626262 guibg=NONE gui=NONE cterm=NONE
  hi dirFilterMenuHistoryPath guifg=#626262 guibg=NONE gui=NONE cterm=NONE
  hi FilterMenuDirectorySubtle guifg=#626262 guibg=NONE gui=NONE cterm=NONE
  hi FilterMenuLineNr guifg=#626262 guibg=NONE gui=NONE cterm=NONE
  hi CocSearch guifg=#af0000 guibg=NONE gui=NONE cterm=NONE
endif

if s:t_Co >= 256
  hi! link helpVim Title
  hi! link helpHeader Title
  hi! link helpHyperTextJump Underlined
  hi! link fugitiveSymbolicRef PreProc
  hi! link fugitiveHeading Statement
  hi! link fugitiveStagedHeading Statement
  hi! link fugitiveUnstagedHeading Statement
  hi! link fugitiveUntrackedHeading Statement
  hi! link fugitiveStagedModifier PreProc
  hi! link fugitiveUnstagedModifier PreProc
  hi! link fugitiveHash Constant
  hi! link diffFile PreProc
  hi! link markdownHeadingDelimiter Special
  hi! link rstSectionDelimiter Statement
  hi! link rstDirective PreProc
  hi! link rstHyperlinkReference Special
  hi! link rstFieldName Constant
  hi! link rstDelimiter Special
  hi! link rstInterpretedText Special
  hi! link rstCodeBlock Normal
  hi! link rstLiteralBlock rstCodeBlock
  hi! link markdownUrl String
  hi! link colortemplateKey Statement
  hi! link xmlTagName Statement
  hi! link javaScriptFunction Statement
  hi! link javaScriptIdentifier Statement
  hi! link sqlKeyword Statement
  hi! link yamlBlockMappingKey Statement
  hi! link rubyMacro Statement
  hi! link rubyDefine Statement
  hi! link vimGroup Normal
  hi! link vimVar Normal
  hi! link vimOper Normal
  hi! link vimSep Normal
  hi! link vimParenSep Normal
  hi! link vimOption Normal
  hi! link vimCommentString Comment
  hi! link pythonInclude Statement
  hi! link shQuote Constant
  hi! link shNoQuote Normal
  hi! link shTestOpr Normal
  hi! link shOperator Normal
  hi! link shSetOption Normal
  hi! link shOption Normal
  hi! link shCommandSub Normal
  hi! link shDerefPattern shQuote
  hi! link shDerefOp Special
  hi! link phpStorageClass Statement
  hi! link phpStructure Statement
  hi! link phpInclude Statement
  hi! link phpDefine Statement
  hi! link phpSpecialFunction Normal
  hi! link phpParent Normal
  hi! link phpComparison Normal
  hi! link phpOperator Normal
  hi! link phpVarSelector Special
  hi! link phpMemberSelector Special
  hi! link phpDocCustomTags phpDocTags
  hi! link javaExternal Statement
  hi! link javaType Statement
  hi! link javaScopeDecl Statement
  hi! link javaClassDecl Statement
  hi! link javaStorageClass Statement
  hi! link javaDocParam PreProc
  hi! link csStorage Statement
  hi! link csAccessModifier Statement
  hi! link csClass Statement
  hi! link csModifier Statement
  hi! link csAsyncModifier Statement
  hi! link csLogicSymbols Normal
  hi! link csClassType Normal
  hi! link csType Statement
  hi! link Terminal Normal
  hi! link StatuslineTerm Statusline
  hi! link StatuslineTermNC StatuslineNC
  hi! link LineNrAbove LineNr
  hi! link LineNrBelow LineNr
  hi! link MessageWindow PMenu
  hi! link PopupNotification Todo
  if &background ==# 'dark'
    hi Normal ctermfg=251 ctermbg=16 cterm=NONE
    hi Statusline ctermfg=251 ctermbg=16 cterm=bold,reverse
    hi StatuslineNC ctermfg=243 ctermbg=16 cterm=reverse
    hi VertSplit ctermfg=243 ctermbg=243 cterm=NONE
    hi TabLine ctermfg=16 ctermbg=251 cterm=NONE
    hi TabLineFill ctermfg=NONE ctermbg=243 cterm=NONE
    hi TabLineSel ctermfg=231 ctermbg=16 cterm=bold
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=16 ctermbg=231 cterm=NONE
    hi QuickFixLine ctermfg=16 ctermbg=75 cterm=NONE
    hi CursorLineNr ctermfg=231 ctermbg=NONE cterm=bold
    hi LineNr ctermfg=240 ctermbg=NONE cterm=NONE
    hi NonText ctermfg=240 ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=240 ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=240 ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=240 ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE
    hi PmenuSel ctermfg=NONE ctermbg=239 cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=251 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi PmenuKind ctermfg=203 ctermbg=236 cterm=NONE
    hi PmenuKindSel ctermfg=203 ctermbg=239 cterm=NONE
    hi PmenuExtra ctermfg=243 ctermbg=236 cterm=NONE
    hi PmenuExtraSel ctermfg=243 ctermbg=239 cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=231 ctermbg=203 cterm=NONE
    hi ErrorMsg ctermfg=231 ctermbg=203 cterm=NONE
    hi ModeMsg ctermfg=222 ctermbg=NONE cterm=reverse
    hi MoreMsg ctermfg=77 ctermbg=NONE cterm=NONE
    hi Question ctermfg=213 ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=203 ctermbg=NONE cterm=NONE
    hi Todo ctermfg=116 ctermbg=16 cterm=reverse
    hi Search ctermfg=16 ctermbg=222 cterm=NONE
    hi IncSearch ctermfg=16 ctermbg=77 cterm=NONE
    hi CurSearch ctermfg=16 ctermbg=77 cterm=NONE
    hi WildMenu ctermfg=16 ctermbg=222 cterm=bold
    hi debugPC ctermfg=67 ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=73 ctermbg=NONE cterm=reverse
    hi Visual ctermfg=231 ctermbg=24 cterm=NONE
    hi MatchParen ctermfg=199 ctermbg=NONE cterm=bold
    hi VisualNOS ctermfg=16 ctermbg=73 cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
    hi Folded ctermfg=243 ctermbg=236 cterm=NONE
    hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE
    hi SpellBad ctermfg=203 ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=73 ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=77 ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=213 ctermbg=NONE cterm=underline
    hi Comment ctermfg=75 ctermbg=NONE cterm=NONE
    hi Constant ctermfg=213 ctermbg=NONE cterm=NONE
    hi String ctermfg=222 ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=254 ctermbg=NONE cterm=bold
    hi Type ctermfg=77 ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=116 ctermbg=NONE cterm=NONE
    hi Special ctermfg=73 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=75 ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=251 ctermbg=96 cterm=NONE
    hi DiffChange ctermfg=251 ctermbg=59 cterm=NONE
    hi DiffText ctermfg=159 ctermbg=66 cterm=NONE
    hi DiffDelete ctermfg=174 ctermbg=NONE cterm=NONE
    hi diffAdded ctermfg=77 ctermbg=NONE cterm=NONE
    hi diffRemoved ctermfg=174 ctermbg=NONE cterm=NONE
    hi diffSubname ctermfg=213 ctermbg=NONE cterm=NONE
    hi dirType ctermfg=176 ctermbg=NONE cterm=NONE
    hi dirPermissionUser ctermfg=71 ctermbg=NONE cterm=NONE
    hi dirPermissionGroup ctermfg=137 ctermbg=NONE cterm=NONE
    hi dirPermissionOther ctermfg=73 ctermbg=NONE cterm=NONE
    hi dirOwner ctermfg=243 ctermbg=NONE cterm=NONE
    hi dirGroup ctermfg=243 ctermbg=NONE cterm=NONE
    hi dirTime ctermfg=243 ctermbg=NONE cterm=NONE
    hi dirSize ctermfg=222 ctermbg=NONE cterm=NONE
    hi dirSizeMod ctermfg=176 ctermbg=NONE cterm=NONE
    hi FilterMenuDirectorySubtle ctermfg=102 ctermbg=NONE cterm=NONE
    hi dirFilterMenuBookmarkPath ctermfg=102 ctermbg=NONE cterm=NONE
    hi dirFilterMenuHistoryPath ctermfg=102 ctermbg=NONE cterm=NONE
    hi FilterMenuLineNr ctermfg=102 ctermbg=NONE cterm=NONE
    hi CocSearch ctermfg=222 ctermbg=NONE cterm=NONE
  else
    " Light background
    hi Normal ctermfg=16 ctermbg=231 cterm=NONE
    hi Statusline ctermfg=231 ctermbg=16 cterm=bold
    hi StatuslineNC ctermfg=231 ctermbg=243 cterm=NONE
    hi VertSplit ctermfg=243 ctermbg=243 cterm=NONE
    hi TabLine ctermfg=16 ctermbg=250 cterm=NONE
    hi TabLineFill ctermfg=NONE ctermbg=243 cterm=NONE
    hi TabLineSel ctermfg=231 ctermbg=16 cterm=bold,reverse
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=231 ctermbg=16 cterm=NONE
    hi QuickFixLine ctermfg=231 ctermbg=32 cterm=NONE
    hi CursorLineNr ctermfg=16 ctermbg=NONE cterm=bold
    hi LineNr ctermfg=247 ctermbg=NONE cterm=NONE
    hi NonText ctermfg=247 ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=247 ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=247 ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=247 ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=NONE ctermbg=254 cterm=NONE
    hi PmenuSel ctermfg=NONE ctermbg=251 cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi PmenuKind ctermfg=124 ctermbg=254 cterm=NONE
    hi PmenuKindSel ctermfg=124 ctermbg=251 cterm=NONE
    hi PmenuExtra ctermfg=243 ctermbg=254 cterm=NONE
    hi PmenuExtraSel ctermfg=243 ctermbg=251 cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=231 ctermbg=160 cterm=NONE
    hi ErrorMsg ctermfg=231 ctermbg=160 cterm=NONE
    hi ModeMsg ctermfg=222 ctermbg=16 cterm=reverse
    hi MoreMsg ctermfg=28 ctermbg=NONE cterm=bold
    hi Question ctermfg=127 ctermbg=NONE cterm=bold
    hi WarningMsg ctermfg=160 ctermbg=NONE cterm=bold
    hi Todo ctermfg=30 ctermbg=231 cterm=reverse
    hi Search ctermfg=16 ctermbg=222 cterm=NONE
    hi IncSearch ctermfg=16 ctermbg=114 cterm=NONE
    hi CurSearch ctermfg=16 ctermbg=114 cterm=NONE
    hi WildMenu ctermfg=16 ctermbg=222 cterm=bold
    hi debugPC ctermfg=26 ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=23 ctermbg=NONE cterm=reverse
    hi Visual ctermfg=231 ctermbg=67 cterm=NONE
    hi MatchParen ctermfg=199 ctermbg=NONE cterm=bold
    hi VisualNOS ctermfg=231 ctermbg=30 cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=255 cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=255 cterm=NONE
    hi Folded ctermfg=243 ctermbg=254 cterm=NONE
    hi ColorColumn ctermfg=NONE ctermbg=254 cterm=NONE
    hi SpellBad ctermfg=124 ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=23 ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=28 ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=133 ctermbg=NONE cterm=underline
    hi Comment ctermfg=26 ctermbg=NONE cterm=NONE
    hi Constant ctermfg=127 ctermbg=NONE cterm=NONE
    hi String ctermfg=130 ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=16 ctermbg=NONE cterm=bold
    hi Type ctermfg=28 ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=23 ctermbg=NONE cterm=NONE
    hi Special ctermfg=30 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=26 ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=16 ctermbg=182 cterm=NONE
    hi DiffChange ctermfg=16 ctermbg=252 cterm=NONE
    hi DiffText ctermfg=16 ctermbg=80 cterm=NONE
    hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE
    hi diffAdded ctermfg=28 ctermbg=NONE cterm=NONE
    hi diffRemoved ctermfg=160 ctermbg=NONE cterm=NONE
    hi diffSubname ctermfg=127 ctermbg=NONE cterm=NONE
    hi dirType ctermfg=23 ctermbg=NONE cterm=NONE
    hi dirPermissionUser ctermfg=130 ctermbg=NONE cterm=NONE
    hi dirPermissionGroup ctermfg=28 ctermbg=NONE cterm=NONE
    hi dirPermissionOther ctermfg=127 ctermbg=NONE cterm=NONE
    hi dirOwner ctermfg=244 ctermbg=NONE cterm=NONE
    hi dirGroup ctermfg=244 ctermbg=NONE cterm=NONE
    hi dirTime ctermfg=244 ctermbg=NONE cterm=NONE
    hi dirSize ctermfg=124 ctermbg=NONE cterm=NONE
    hi dirSizeMod ctermfg=23 ctermbg=NONE cterm=NONE
    hi dirLink ctermfg=28 ctermbg=NONE cterm=bold
    hi dirFilterMenuBookmarkPath ctermfg=241 ctermbg=NONE cterm=NONE
    hi dirFilterMenuHistoryPath ctermfg=241 ctermbg=NONE cterm=NONE
    hi FilterMenuDirectorySubtle ctermfg=241 ctermbg=NONE cterm=NONE
    hi FilterMenuLineNr ctermfg=241 ctermbg=NONE cterm=NONE
    hi CocSearch ctermfg=124 ctermbg=NONE cterm=NONE
  endif
  unlet s:t_Co
  finish
endif

if s:t_Co >= 16
  if &background ==# 'dark'
    hi Normal ctermfg=grey ctermbg=black cterm=NONE
    hi Statusline ctermfg=grey ctermbg=black cterm=bold,reverse
    hi StatuslineNC ctermfg=darkgrey ctermbg=black cterm=reverse
    hi VertSplit ctermfg=darkgrey ctermbg=darkgrey cterm=NONE
    hi TabLine ctermfg=black ctermbg=grey cterm=NONE
    hi TabLineFill ctermfg=NONE ctermbg=darkgrey cterm=NONE
    hi TabLineSel ctermfg=white ctermbg=black cterm=bold
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=black ctermbg=white cterm=NONE
    hi QuickFixLine ctermfg=black ctermbg=blue cterm=NONE
    hi CursorLineNr ctermfg=white ctermbg=NONE cterm=bold
    hi LineNr ctermfg=grey ctermbg=NONE cterm=NONE
    hi NonText ctermfg=grey ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=grey ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=grey ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=black ctermbg=grey cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=darkgreen cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi PmenuSel ctermfg=black ctermbg=darkcyan cterm=NONE
    hi PmenuKind ctermfg=darkred ctermbg=grey cterm=NONE
    hi PmenuKindSel ctermfg=darkred ctermbg=darkcyan cterm=NONE
    hi PmenuExtra ctermfg=black ctermbg=grey cterm=NONE
    hi PmenuExtraSel ctermfg=black ctermbg=darkcyan cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=white ctermbg=red cterm=NONE
    hi ErrorMsg ctermfg=white ctermbg=red cterm=NONE
    hi ModeMsg ctermfg=yellow ctermbg=NONE cterm=reverse
    hi MoreMsg ctermfg=green ctermbg=NONE cterm=NONE
    hi Question ctermfg=magenta ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=red ctermbg=NONE cterm=NONE
    hi Todo ctermfg=cyan ctermbg=black cterm=reverse
    hi Search ctermfg=black ctermbg=yellow cterm=NONE
    hi IncSearch ctermfg=black ctermbg=green cterm=NONE
    hi CurSearch ctermfg=black ctermbg=green cterm=NONE
    hi WildMenu ctermfg=black ctermbg=yellow cterm=bold
    hi debugPC ctermfg=darkblue ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=darkcyan ctermbg=NONE cterm=reverse
    hi MatchParen ctermfg=NONE ctermbg=NONE cterm=bold,underline
    hi VisualNOS ctermfg=black ctermbg=darkcyan cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorColumn ctermfg=black ctermbg=yellow cterm=NONE
    hi Folded ctermfg=black ctermbg=darkyellow cterm=NONE
    hi ColorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi SpellBad ctermfg=red ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=darkcyan ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=green ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=magenta ctermbg=NONE cterm=underline
    hi Comment ctermfg=blue ctermbg=NONE cterm=NONE
    hi Constant ctermfg=magenta ctermbg=NONE cterm=NONE
    hi String ctermfg=yellow ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=grey ctermbg=NONE cterm=bold
    hi Type ctermfg=green ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=cyan ctermbg=NONE cterm=NONE
    hi Special ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=blue ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=white ctermbg=darkmagenta cterm=NONE
    hi DiffChange ctermfg=white ctermbg=darkgreen cterm=NONE
    hi DiffText ctermfg=black ctermbg=cyan cterm=NONE
    hi DiffDelete ctermfg=darkred ctermbg=NONE cterm=NONE
    hi diffAdded ctermfg=green ctermbg=NONE cterm=NONE
    hi diffRemoved ctermfg=darkred ctermbg=NONE cterm=NONE
    hi diffSubname ctermfg=magenta ctermbg=NONE cterm=NONE
    hi dirType ctermfg=darkmagenta ctermbg=NONE cterm=NONE
    hi dirPermissionUser ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi dirPermissionGroup ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi dirPermissionOther ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi dirOwner ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi dirGroup ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi dirTime ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi dirSize ctermfg=yellow ctermbg=NONE cterm=NONE
    hi dirSizeMod ctermfg=darkmagenta ctermbg=NONE cterm=NONE
    hi FilterMenuDirectorySubtle ctermfg=grey ctermbg=NONE cterm=NONE
    hi dirFilterMenuBookmarkPath ctermfg=grey ctermbg=NONE cterm=NONE
    hi dirFilterMenuHistoryPath ctermfg=grey ctermbg=NONE cterm=NONE
    hi FilterMenuLineNr ctermfg=grey ctermbg=NONE cterm=NONE
    hi CocSearch ctermfg=yellow ctermbg=NONE cterm=NONE
  else
    " Light background
    hi Normal ctermfg=black ctermbg=white cterm=NONE
    hi Statusline ctermfg=white ctermbg=black cterm=bold
    hi StatuslineNC ctermfg=white ctermbg=darkgrey cterm=NONE
    hi VertSplit ctermfg=darkgrey ctermbg=darkgrey cterm=NONE
    hi TabLine ctermfg=black ctermbg=lightgrey cterm=NONE
    hi TabLineFill ctermfg=NONE ctermbg=darkgrey cterm=NONE
    hi TabLineSel ctermfg=white ctermbg=black cterm=bold,reverse
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=white ctermbg=black cterm=NONE
    hi QuickFixLine ctermfg=white ctermbg=blue cterm=NONE
    hi CursorLineNr ctermfg=black ctermbg=NONE cterm=bold
    hi LineNr ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi NonText ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=black ctermbg=grey cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=darkgreen cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi PmenuSel ctermfg=black ctermbg=darkcyan cterm=NONE
    hi PmenuKind ctermfg=darkred ctermbg=grey cterm=NONE
    hi PmenuKindSel ctermfg=darkred ctermbg=darkcyan cterm=NONE
    hi PmenuExtra ctermfg=black ctermbg=grey cterm=NONE
    hi PmenuExtraSel ctermfg=black ctermbg=darkcyan cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=white ctermbg=red cterm=NONE
    hi ErrorMsg ctermfg=white ctermbg=red cterm=NONE
    hi ModeMsg ctermfg=yellow ctermbg=black cterm=reverse
    hi MoreMsg ctermfg=darkgreen ctermbg=NONE cterm=bold
    hi Question ctermfg=darkmagenta ctermbg=NONE cterm=bold
    hi WarningMsg ctermfg=red ctermbg=NONE cterm=bold
    hi Todo ctermfg=cyan ctermbg=white cterm=reverse
    hi Search ctermfg=black ctermbg=yellow cterm=NONE
    hi IncSearch ctermfg=black ctermbg=green cterm=NONE
    hi CurSearch ctermfg=black ctermbg=green cterm=NONE
    hi WildMenu ctermfg=black ctermbg=yellow cterm=bold
    hi debugPC ctermfg=darkblue ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=darkcyan ctermbg=NONE cterm=reverse
    hi Visual ctermfg=white ctermbg=darkblue cterm=NONE
    hi MatchParen ctermfg=NONE ctermbg=NONE cterm=bold,underline
    hi VisualNOS ctermfg=black ctermbg=cyan cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorColumn ctermfg=black ctermbg=yellow cterm=NONE
    hi Folded ctermfg=black ctermbg=darkyellow cterm=NONE
    hi ColorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi SpellBad ctermfg=darkred ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=darkcyan ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=darkgreen ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=magenta ctermbg=NONE cterm=underline
    hi Comment ctermfg=darkblue ctermbg=NONE cterm=NONE
    hi Constant ctermfg=darkmagenta ctermbg=NONE cterm=NONE
    hi String ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=black ctermbg=NONE cterm=bold
    hi Type ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Special ctermfg=cyan ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=darkblue ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=black ctermbg=darkmagenta cterm=NONE
    hi DiffChange ctermfg=black ctermbg=lightgray cterm=NONE
    hi DiffText ctermfg=black ctermbg=cyan cterm=NONE
    hi DiffDelete ctermfg=darkred ctermbg=NONE cterm=NONE
    hi diffAdded ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi diffRemoved ctermfg=red ctermbg=NONE cterm=NONE
    hi diffSubname ctermfg=darkmagenta ctermbg=NONE cterm=NONE
    hi dirType ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi dirPermissionUser ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi dirPermissionGroup ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi dirPermissionOther ctermfg=darkmagenta ctermbg=NONE cterm=NONE
    hi dirOwner ctermfg=grey ctermbg=NONE cterm=NONE
    hi dirGroup ctermfg=grey ctermbg=NONE cterm=NONE
    hi dirTime ctermfg=grey ctermbg=NONE cterm=NONE
    hi dirSize ctermfg=darkred ctermbg=NONE cterm=NONE
    hi dirSizeMod ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi dirLink ctermfg=darkgreen ctermbg=NONE cterm=bold
    hi dirFilterMenuBookmarkPath ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi dirFilterMenuHistoryPath ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi FilterMenuDirectorySubtle ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi FilterMenuLineNr ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi CocSearch ctermfg=darkred ctermbg=NONE cterm=NONE
  endif
  unlet s:t_Co
  finish
endif

if s:t_Co >= 8
  if &background ==# 'dark'
    hi Normal ctermfg=grey ctermbg=black cterm=NONE
    hi Statusline ctermfg=grey ctermbg=black cterm=bold,reverse
    hi StatuslineNC ctermfg=black ctermbg=grey cterm=NONE
    hi VertSplit ctermfg=grey ctermbg=grey cterm=NONE
    hi TabLine ctermfg=grey ctermbg=black cterm=reverse
    hi TabLineFill ctermfg=NONE ctermbg=grey cterm=NONE
    hi TabLineSel ctermfg=grey ctermbg=black cterm=NONE
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=grey ctermbg=black cterm=bold,reverse
    hi QuickFixLine ctermfg=grey ctermbg=darkblue cterm=bold
    hi CursorLineNr ctermfg=black ctermbg=NONE cterm=bold
    hi LineNr ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi NonText ctermfg=grey ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=grey ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=grey ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=grey ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=black ctermbg=grey cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=darkgreen cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi PmenuSel ctermfg=black ctermbg=darkcyan cterm=NONE
    hi PmenuKind ctermfg=darkred ctermbg=grey cterm=NONE
    hi PmenuKindSel ctermfg=darkred ctermbg=darkcyan cterm=NONE
    hi PmenuExtra ctermfg=black ctermbg=grey cterm=NONE
    hi PmenuExtraSel ctermfg=black ctermbg=darkcyan cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=grey ctermbg=darkred cterm=NONE
    hi ErrorMsg ctermfg=grey ctermbg=darkred cterm=NONE
    hi ModeMsg ctermfg=darkyellow ctermbg=black cterm=reverse
    hi MoreMsg ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi Question ctermfg=darkmagenta ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=darkred ctermbg=NONE cterm=NONE
    hi Todo ctermfg=darkcyan ctermbg=black cterm=reverse
    hi Search ctermfg=darkyellow ctermbg=black cterm=reverse
    hi IncSearch ctermfg=darkgreen ctermbg=black cterm=reverse
    hi CurSearch ctermfg=darkgreen ctermbg=black cterm=reverse
    hi WildMenu ctermfg=black ctermbg=darkyellow cterm=bold
    hi debugPC ctermfg=darkblue ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=darkcyan ctermbg=NONE cterm=reverse
    hi Visual ctermfg=NONE ctermbg=NONE cterm=reverse
    hi MatchParen ctermfg=magenta ctermbg=NONE cterm=bold
    hi VisualNOS ctermfg=black ctermbg=darkcyan cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi Folded ctermfg=black ctermbg=darkyellow cterm=NONE
    hi ColorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi SpellBad ctermfg=darkred ctermbg=NONE cterm=reverse,underline
    hi SpellCap ctermfg=darkcyan ctermbg=NONE cterm=reverse,underline
    hi SpellLocal ctermfg=darkgreen ctermbg=black cterm=reverse,underline
    hi SpellRare ctermfg=darkmagenta ctermbg=NONE cterm=reverse,underline
    hi Comment ctermfg=darkblue ctermbg=NONE cterm=NONE
    hi Constant ctermfg=darkred ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=grey ctermbg=NONE cterm=bold
    hi Type ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Special ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=darkblue ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=white ctermbg=darkmagenta cterm=NONE
    hi DiffChange ctermfg=white ctermbg=darkgreen cterm=NONE
    hi DiffText ctermfg=black ctermbg=grey cterm=NONE
    hi DiffDelete ctermfg=darkred ctermbg=NONE cterm=NONE
  else
    " Light background
    hi Normal ctermfg=black ctermbg=grey cterm=NONE
    hi Statusline ctermfg=grey ctermbg=black cterm=bold
    hi StatuslineNC ctermfg=grey ctermbg=darkgrey cterm=NONE
    hi VertSplit ctermfg=black ctermbg=black cterm=NONE
    hi TabLine ctermfg=black ctermbg=grey cterm=reverse
    hi TabLineFill ctermfg=NONE ctermbg=darkgrey cterm=NONE
    hi TabLineSel ctermfg=black ctermbg=grey cterm=NONE
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=grey ctermbg=black cterm=bold
    hi QuickFixLine ctermfg=grey ctermbg=darkblue cterm=bold
    hi CursorLineNr ctermfg=black ctermbg=NONE cterm=bold
    hi LineNr ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi NonText ctermfg=black ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=black ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=black ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=black ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=grey ctermbg=black cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=darkgreen cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi PmenuSel ctermfg=NONE ctermbg=darkcyan cterm=NONE
    hi PmenuKind ctermfg=darkred ctermbg=black cterm=NONE
    hi PmenuKindSel ctermfg=darkred ctermbg=darkcyan cterm=NONE
    hi PmenuExtra ctermfg=grey ctermbg=black cterm=NONE
    hi PmenuExtraSel ctermfg=black ctermbg=darkcyan cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=grey ctermbg=darkred cterm=NONE
    hi ErrorMsg ctermfg=grey ctermbg=darkred cterm=NONE
    hi ModeMsg ctermfg=darkyellow ctermbg=black cterm=reverse
    hi MoreMsg ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi Question ctermfg=darkmagenta ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=darkred ctermbg=NONE cterm=NONE
    hi Todo ctermfg=darkcyan ctermbg=black cterm=reverse
    hi Search ctermfg=black ctermbg=darkyellow cterm=NONE
    hi IncSearch ctermfg=black ctermbg=darkgreen cterm=NONE
    hi CurSearch ctermfg=black ctermbg=darkgreen cterm=NONE
    hi WildMenu ctermfg=black ctermbg=darkyellow cterm=bold
    hi debugPC ctermfg=darkblue ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=darkcyan ctermbg=NONE cterm=reverse
    hi Visual ctermfg=NONE ctermbg=NONE cterm=reverse
    hi MatchParen ctermfg=magenta ctermbg=NONE cterm=bold
    hi VisualNOS ctermfg=black ctermbg=darkcyan cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi Folded ctermfg=black ctermbg=darkyellow cterm=NONE
    hi ColorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi SpellBad ctermfg=darkred ctermbg=NONE cterm=reverse,underline
    hi SpellCap ctermfg=darkcyan ctermbg=NONE cterm=reverse,underline
    hi SpellLocal ctermfg=darkgreen ctermbg=black cterm=reverse,underline
    hi SpellRare ctermfg=darkmagenta ctermbg=NONE cterm=reverse,underline
    hi Comment ctermfg=darkblue ctermbg=NONE cterm=NONE
    hi Constant ctermfg=darkred ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=black ctermbg=NONE cterm=bold
    hi Type ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Special ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=black ctermbg=NONE cterm=bold
    hi Directory ctermfg=darkblue ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=black ctermbg=darkmagenta cterm=NONE
    hi DiffChange ctermfg=black ctermbg=darkcyan cterm=NONE
    hi DiffText ctermfg=grey ctermbg=black cterm=NONE
    hi DiffDelete ctermfg=darkred ctermbg=NONE cterm=NONE
  endif
  unlet s:t_Co
  finish
endif

if s:t_Co >= 0
  hi Normal term=NONE
  hi ColorColumn term=reverse
  hi Conceal term=NONE
  hi Cursor term=reverse
  hi CursorColumn term=NONE
  hi CursorLine term=underline
  hi CursorLineNr term=bold
  hi DiffAdd term=reverse
  hi DiffChange term=NONE
  hi DiffDelete term=reverse
  hi DiffText term=reverse
  hi Directory term=NONE
  hi EndOfBuffer term=NONE
  hi ErrorMsg term=bold,reverse
  hi FoldColumn term=NONE
  hi Folded term=NONE
  hi IncSearch term=bold,reverse,underline
  hi LineNr term=NONE
  hi MatchParen term=bold,underline
  hi ModeMsg term=bold
  hi MoreMsg term=NONE
  hi NonText term=NONE
  hi Pmenu term=reverse
  hi PmenuSbar term=reverse
  hi PmenuSel term=bold
  hi PmenuThumb term=NONE
  hi Question term=standout
  hi Search term=reverse
  hi SignColumn term=reverse
  hi SpecialKey term=bold
  hi SpellBad term=underline
  hi SpellCap term=underline
  hi SpellLocal term=underline
  hi SpellRare term=underline
  hi StatusLine term=bold,reverse
  hi StatusLineNC term=bold,underline
  hi TabLine term=bold,underline
  hi TabLineFill term=NONE
  hi Terminal term=NONE
  hi TabLineSel term=bold,reverse
  hi Title term=NONE
  hi VertSplit term=NONE
  hi Visual term=reverse
  hi VisualNOS term=NONE
  hi WarningMsg term=standout
  hi WildMenu term=bold
  hi CursorIM term=NONE
  hi ToolbarLine term=reverse
  hi ToolbarButton term=bold,reverse
  hi CurSearch term=reverse
  hi CursorLineFold term=underline
  hi CursorLineSign term=underline
  hi Comment term=bold
  hi Constant term=NONE
  hi Error term=bold,reverse
  hi Identifier term=NONE
  hi Ignore term=NONE
  hi PreProc term=NONE
  hi Special term=NONE
  hi Statement term=NONE
  hi Todo term=bold,reverse
  hi Type term=NONE
  hi Underlined term=underline
  unlet s:t_Co
  finish
endif

" Background: any
" Background: dark
" Color: color00                 #000000        16             black
" Color: color08                 #767676        243            darkgrey
" Color: color01                 #AF5F5F        131            darkred
" Color: color09                 #FF5F5F        203            red
" Color: color02                 #5FAF5F        71             darkgreen
" Color: color10                 #5FD75F        77             green
" Color: color03                 #AF875F        137            darkyellow
" Color: color11                 #FFD787        222            yellow
" Color: color04                 #5F87AF        67             darkblue
" Color: color12                 #5FAFFF        75             blue
" Color: color05                 #D787D7        176            darkmagenta
" Color: color13                 #FF87FF        213            magenta
" Color: color06                 #5FAFAF        73             darkcyan
" Color: color14                 #5FD7D7        116            cyan
" Color: color07                 #C6C6C6        251            grey
" Color: color15                 #FFFFFF        231            white
" Color: colorDimWhite           #E4E4E4        254            grey
" Color: colorLine               #262626        235            darkgrey
" Color: colorB                  #303030        236            darkgrey
" Color: colorNonT               #585858        240            grey
" Color: colorTab                #585858        240            grey
" Color: colorC                  #FFFFFF        231            white
" Color: colorlC                 #FF5FFF        207            magenta
" Color: colorV                  #005F87        24             darkblue
" Color: colorMP                 #ff00af        199            magenta
" Color: colorPMenuSel           #4e4e4e        239            darkcyan
" Color: colorDim                #878787        102            grey
" Color: diffAdd                 #875f87        96             darkmagenta
" Color: diffDelete              #D78787        174            darkred
" Color: diffChange              #5f5f5f        59             darkgreen
" Color: diffText                #5f8787        66             cyan
" Color: fgDiffText              #afffff        159            black
" Color: fgDiff                  #C6C6C6        251            white
" Term colors: color00 color01 color02 color03 color04 color05 color06 color07
" Term colors: color08 color09 color10 color11 color12 color13 color14 color15
" Background: light
" Color: color00                 #000000        16             black
" Color: color08                 #767676        243            darkgrey
" Color: color01                 #AF0000        124            darkred
" Color: color09                 #D70000        160            red
" Color: color02                 #008700        28             darkgreen
" Color: color10                 #87D787        114            green
" Color: color03                 #AF5F00        130            darkyellow
" Color: color11                 #FFD787        222            yellow
" Color: color04                 #005FD7        26             darkblue
" Color: color12                 #0087D7        32             blue
" Color: color05                 #AF00AF        127            darkmagenta
" Color: color13                 #FF00FF        133            magenta
" Color: color06                 #005F5F        23             darkcyan
" Color: color14                 #008787        30             cyan
" Color: color07                 #808080        244            grey
" Color: color15                 #FFFFFF        231            white
" Color: colorLine               #EEEEEE        255            grey
" Color: colorB                  #E4E4E4        254            grey
" Color: colorNonT               #9E9E9E        247            darkgrey
" Color: colorTab                #BCBCBC        250            lightgrey
" Color: colorC                  #000000        16             black
" Color: colorlC                 #FF00FF        201            magenta
" Color: colorV                  #5F87AF        67             darkblue
" Color: colorMP                 #ff00af        199            magenta
" Color: colorPMenuSel           #C6C6C6        251            darkcyan
" Color: colorDim                #626262        241            darkgrey
" Color: diffAdd                 #D7AFD7        182            darkmagenta
" Color: diffDelete              #870000        88             darkred
" Color: diffChange              #D0D0D0        252            lightgray
" Color: diffText                #5FD7D7        80             cyan
" Color: fgDiff                  #000000        16             black
" Term colors: color00 color01 color02 color03 color04 color05 color06 color07
" Term colors: color08 color09 color10 color11 color12 color13 color14 color15
" Background: any
" vim: et ts=8 sw=2 sts=2
