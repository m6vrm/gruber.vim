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

" Texts
let s:primary   = s:white
let s:secondary = s:gray

" Backgrounds
let s:bg        = s:black
let s:accent    = s:graphite
let s:selection = s:gray
let s:highlight = s:yellow

" Messages
let s:error = s:red
let s:warn  = s:yellow
let s:info  = s:blue
let s:hint  = s:gray

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

    let l:defaults = { "guifg": "none", "guibg": "none", "gui": "none", "guisp": "none",
                     \ "ctermfg": "none", "ctermbg": "none", "cterm": "none" }
    call extend(l:defaults, a:attrs)

    let l:command = "highlight" . " " . a:group
    for name in keys(l:defaults)
        let l:command .= " " . name . "=" . l:defaults[name]
    endfor

    execute l:command
endfunction

" Test highlighting with `:source $VIMRUNTIME/syntax/hitest.vim`

" Modes
call s:hl("Normal",         { "fg": s:primary, "bg": s:bg })
call s:hl("EndOfBuffer",    { "fg": s:bg })

call s:hl("Visual",         { "bg": s:selection })
call s:hl("VisualNOS",      { "bg": s:selection })

" Syntax
call s:hl("Comment",        { "fg": s:brown })
call s:hl("Constant",       { "fg": s:magenta })
call s:hl("String",         { "fg": s:green })
call s:hl("Identifier",     { "fg": s:primary })
call s:hl("Function",       { "fg": s:blue })
call s:hl("Statement",      { "fg": s:yellow, "style": "bold" })
call s:hl("Operator",       { "fg": s:primary })
call s:hl("PreProc",        { "fg": s:cyan })
call s:hl("Type",           { "fg": s:yellow })
call s:hl("Structure",      { "fg": s:cyan })
call s:hl("Special",        { "fg": s:primary })
call s:hl("Underlined",     { "style": "underline" })
call s:hl("Ignore",         { "fg": s:bg })
call s:hl("Error",          { "fg": s:error })
call s:hl("Todo",           { "fg": s:brown, "style": "italic" })

" Cursor
call s:hl("Cursor",         { "fg": s:bg, "bg": s:primary })
call s:hl("TermCursor",     { "fg": s:bg, "bg": s:primary })
call s:hl("CursorLine",     { "bg": s:accent })
call s:hl("CursorColumn",   { "bg": s:accent })

" Line numbers
call s:hl("SignColumn",     { "bg": s:bg })
call s:hl("LineNr",         { "fg": s:secondary })
call s:hl("CursorLineNr",   { "style": "bold" })

" Status line
call s:hl("StatusLine",     { "bg": s:accent })
call s:hl("StatusLineNC",   { "fg": s:secondary, "bg": s:accent })

" Search
call s:hl("Search",         { "fg": s:primary, "bg": s:selection })
call s:hl("IncSearch",      { "fg": s:bg, "bg": s:highlight })
call s:hl("CurSearch",      { "fg": s:bg, "bg": s:highlight, "style": "bold" })

" Completion
call s:hl("Pmenu",          { "bg": s:accent })
call s:hl("PmenuSel",       { "bg": s:selection })
call s:hl("PmenuSBar",      { "bg": s:accent })
call s:hl("PmenuThumb",     { "bg": s:selection })
call s:hl("WildMenu",       { "bg": s:selection })

" Tabs
call s:hl("TabLine",        { "fg": s:secondary, "bg": s:accent })
call s:hl("TabLineFill",    { "fg": s:secondary, "bg": s:accent })
call s:hl("TabLineSel",     { "style": "bold,italic" })
call s:hl("Title",          { "fg": s:yellow, "style": "bold" })

" Diff
call s:hl("DiffAdd",        { "fg": s:green })
call s:hl("DiffDelete",     { "fg": s:red })
call s:hl("DiffChange",     { "fg": s:blue })
call s:hl("DiffText",       { "style": "bold" })

" Messages
call s:hl("ErrorMsg",       { "fg": s:error })
call s:hl("WarningMsg",     { "fg": s:warn })
call s:hl("ModeMsg",        { "style": "bold" })
call s:hl("MoreMsg",        { "fg": s:green })
call s:hl("Question",       { "fg": s:green })

" Spell
call s:hl("SpellBad",       { "style": "underline" })
call s:hl("SpellCap",       { "style": "underline" })
call s:hl("SpellLocal",     { "style": "undercurl" })
call s:hl("SpellRare",      { "style": "underdotted" })

" Folding
call s:hl("Folded",         { "fg": s:brown, "bg": s:accent, "style": "italic" })
call s:hl("FoldColumn",     { "fg": s:brown, "style": "italic" })

" Diagnostic
call s:hl("DiagnosticError",{ "fg": s:error })
call s:hl("DiagnosticWarn", { "fg": s:warn })
call s:hl("DiagnosticInfo", { "fg": s:info })
call s:hl("DiagnosticHint", { "fg": s:hint })

" Indentation
call s:hl("ColorColumn",    { "bg": s:accent })
call s:hl("NonText",        { "fg": s:secondary })

" Misc
call s:hl("Conceal",        { "fg": s:magenta })
call s:hl("Directory",      { "fg": s:blue })
call s:hl("MatchParen",     { "style": "bold,underline" })
call s:hl("QuickFixLine",   { "bg": s:selection, "style": "bold" })
call s:hl("SpecialKey",     { "fg": s:magenta })
call s:hl("VertSplit",      { "fg": s:gray })
call s:hl("WinBar",         { "style": "bold" })

call s:hl("NvimInternalError", { "fg": s:bg, "bg": s:error })
