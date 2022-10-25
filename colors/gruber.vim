highlight clear

if exists("syntax_on")
    syntax reset
endif

set background=dark
let g:colors_name = "gruber"

" Colors
let s:black     = ["#1c1c1c", "234"]
let s:graphite  = ["#262626", "235"]
let s:gray      = ["#626262", "241"]
let s:white     = ["#e4e4e4", "254"]

let s:red       = ["#ff5f5f", "203"]
let s:green     = ["#87d75f", "113"]
let s:yellow    = ["#ffd700", "220"]
let s:blue      = ["#87afd7", "110"]
let s:magenta   = ["#afafd7", "146"]
let s:cyan      = ["#afd7af", "151"]
let s:brown     = ["#af875f", "137"]

function! s:hl(group, attrs) abort
    if has_key(a:attrs, "fg")
        let a:attrs["guifg"] = a:attrs["fg"][0]
        let a:attrs["ctermfg"] = a:attrs["fg"][1]
        unlet a:attrs["fg"]
    endif

    if has_key(a:attrs, "bg")
        let a:attrs["guibg"] = a:attrs["bg"][0]
        let a:attrs["ctermbg"] = a:attrs["bg"][1]
        unlet a:attrs["bg"]
    endif

    if has_key(a:attrs, "style")
        let a:attrs["gui"] = a:attrs["style"]
        let a:attrs["cterm"] = a:attrs["style"]
        unlet a:attrs["style"]
    endif

    let l:defaults = { "guifg": "NONE", "guibg": "NONE", "gui": "NONE", "guisp": "NONE",
                     \ "ctermfg": "NONE", "ctermbg": "NONE", "cterm": "NONE" }
    call extend(l:defaults, a:attrs)

    let l:command = "highlight" . " " . a:group
    for name in keys(l:defaults)
        let l:command .= " " . name . "=" . l:defaults[name]
    endfor

    execute l:command
endfunction

" Test highlighting with `:source $VIMRUNTIME/syntax/hitest.vim`

" Modes
call s:hl("Normal",         { "fg": s:white, "bg": s:black })
highlight! link NormalFloat Normal
highlight! link NormalNC    Normal
highlight! link MsgArea     Normal

call s:hl("Visual",         { "bg": s:gray })
highlight! link VisualNOS   Visual

" Syntax
call s:hl("Comment",        { "fg": s:brown })
call s:hl("Constant",       { "fg": s:magenta })
call s:hl("String",         { "fg": s:green })
call s:hl("Identifier",     { "fg": s:white })
call s:hl("Function",       { "fg": s:blue })
call s:hl("Statement",      { "fg": s:yellow, "style": "bold" })
call s:hl("Operator",       { "fg": s:white })
call s:hl("PreProc",        { "fg": s:cyan })
call s:hl("Type",           { "fg": s:yellow })
call s:hl("Structure",      { "fg": s:cyan })
call s:hl("Special",        { "fg": s:white })
call s:hl("Underlined",     { "style": "underline" })
call s:hl("Ignore",         { "fg": s:black })
call s:hl("Error",          { "fg": s:red })
call s:hl("Todo",           { "fg": s:brown, "style": "italic" })

" Cursor
call s:hl("Cursor",         { "fg": s:black, "bg": s:white })
call s:hl("TermCursorNC",   { "fg": s:black, "bg": s:gray })
highlight! link lCursor     Cursor
highlight! link CursorIM    Cursor
highlight! link TermCursor  Cursor

call s:hl("CursorLine",     { "bg": s:graphite })
highlight! link CursorColumn CursorLine

" Line numbers
call s:hl("LineNr",         { "fg": s:gray, "bg": s:black })
call s:hl("CursorLineNr",   { "style": "bold" })
call s:hl("SignColumn",     { "bg": s:black })

" Status line
call s:hl("StatusLine",     { "fg": s:white, "bg": s:graphite })
call s:hl("StatusLineNC",   { "fg": s:gray, "bg": s:graphite })

" Search
call s:hl("Search",         { "fg": s:white, "bg": s:gray })
call s:hl("IncSearch",      { "fg": s:black, "bg": s:yellow })
call s:hl("CurSearch",      { "fg": s:black, "bg": s:yellow, "style": "bold" })

" Completion
call s:hl("Pmenu",          { "fg": s:white, "bg": s:graphite })
call s:hl("PmenuSel",       { "fg": s:white, "bg": s:gray, "style": "bold" })
call s:hl("PmenuSBar",      { "bg": s:graphite })
call s:hl("PmenuThumb",     { "bg": s:gray })
call s:hl("WildMenu",       { "fg": s:white, "bg": s:gray, "style": "bold" })

" Tabs
call s:hl("TabLine",        { "fg": s:gray, "bg": s:graphite })
highlight! link TabLineFill TabLine

call s:hl("TabLineSel",     { "fg": s:white, "bg": s:black, "style": "bold,italic" })
call s:hl("Title",          { "fg": s:yellow, "style": "bold" })

" Diff
call s:hl("DiffAdd",        { "fg": s:green })
call s:hl("DiffDelete",     { "fg": s:red })
call s:hl("DiffChange",     { "fg": s:blue })
call s:hl("DiffText",       { "style": "bold" })

" Messages
call s:hl("ModeMsg",        { "style": "bold" })
call s:hl("MsgSeparator",   { "fg": s:gray })
call s:hl("ErrorMsg",       { "fg": s:red })
call s:hl("WarningMsg",     { "fg": s:yellow })
call s:hl("MoreMsg",        { "fg": s:green })
call s:hl("Question",       { "fg": s:green })

" Spell
call s:hl("SpellBad",       { "style": "underline" })
call s:hl("SpellCap",       { "style": "underline" })
call s:hl("SpellLocal",     { "style": "undercurl" })
call s:hl("SpellRare",      { "style": "underdotted" })

" Folding
call s:hl("Folded",         { "fg": s:brown, "bg": s:graphite , "style": "italic" })
call s:hl("FoldColumn",     { "fg": s:brown })

" Diagnostic
call s:hl("DiagnosticError",{ "fg": s:red })
call s:hl("DiagnosticWarn", { "fg": s:yellow })
call s:hl("DiagnosticInfo", { "fg": s:blue })
call s:hl("DiagnosticHint", { "fg": s:gray })

" Indentation
call s:hl("ColorColumn",    { "bg": s:graphite })
call s:hl("NonText",        { "fg": s:gray })

" Splits
call s:hl("VertSplit",      { "fg": s:gray })
call s:hl("WinSeparator",   { "fg": s:gray })

" WinBar
call s:hl("WinBar",         { "fg": s:magenta, "bg": s:black, "style": "bold" })
highlight! link WinBarNC    WinBar

" Misc
call s:hl("MatchParen",     { "bg": s:blue, "style": "bold" })
call s:hl("QuickFixLine",   { "bg": s:gray, "style": "bold" })
call s:hl("SpecialKey",     { "fg": s:magenta })
call s:hl("Conceal",        { "fg": s:magenta })
call s:hl("Directory",      { "fg": s:blue })
call s:hl("EndOfBuffer",    { "fg": s:black })

call s:hl("NvimInternalError", { "fg": s:black, "bg": s:red })
