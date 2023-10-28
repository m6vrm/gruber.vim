highlight clear

if exists("syntax_on")
    syntax reset
endif

set background=dark
let g:colors_name = "gruber"

" Colors
let s:black      = ["#1c1c1c", "234"]
let s:lightblack = ["#262626", "235"]
let s:darkgray   = ["#444444", "238"]
let s:gray       = ["#626262", "241"]
let s:white      = ["#e4e4e4", "254"]

let s:red     = ["#ff5f5f", "203"]
let s:green   = ["#87d75f", "113"]
let s:yellow  = ["#ffd700", "220"]
let s:blue    = ["#87afd7", "110"]
let s:magenta = ["#afafd7", "146"]
let s:cyan    = ["#afd7af", "151"]
let s:brown   = ["#af875f", "137"]

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

function! s:merge(arg1, arg2, ...) abort
    let l:result = copy(a:arg1)
    call call("extend", [l:result, a:arg2] + a:000)
    return l:result
endfunction

" :source $VIMRUNTIME/syntax/hitest.vim
" :help group-name
" :help highlight-default

let s:constant   = { "fg": s:white }
let s:identifier = { "fg": s:white }
let s:special    = { "fg": s:white }
let s:operator   = { "fg": s:cyan }
let s:comment    = { "fg": s:brown }
let s:preproc    = { "fg": s:cyan }
let s:keyword    = { "fg": s:yellow, "style": "bold" }
let s:type       = { "fg": s:yellow }
let s:function   = { "fg": s:blue }
let s:literal    = { "fg": s:magenta }
let s:string     = { "fg": s:green }
let s:char       = { "fg": s:cyan }
let s:info       = { "style": "italic" }

" Modes
call s:hl("Normal",         { "fg": s:white, "bg": s:black })
highlight! link NormalFloat Normal
highlight! link NormalNC    Normal
highlight! link MsgArea     Normal

call s:hl("Visual",         { "bg": s:gray })
highlight! link VisualNOS   Visual

" Syntax
call s:hl("Comment",        s:comment)
call s:hl("Constant",       s:constant)
call s:hl("String",         s:string)
call s:hl("Character",      s:char)
call s:hl("Number",         s:literal)
call s:hl("Boolean",        s:literal)
call s:hl("Float",          s:literal)
call s:hl("Identifier",     s:identifier)
call s:hl("Function",       s:function)
call s:hl("Statement",      s:keyword)
call s:hl("Operator",       s:operator)
call s:hl("PreProc",        s:preproc)
call s:hl("Type",           s:type)
call s:hl("Special",        s:special)
call s:hl("SpecialChar",    s:char)
call s:hl("SpecialComment", s:merge(s:comment, s:info))
call s:hl("Underlined",     { "style": "underline" })
call s:hl("Ignore",         { "fg": s:black })
call s:hl("Error",          { "fg": s:red })
call s:hl("Todo",           s:merge(s:comment, s:info))

" Cursor
call s:hl("Cursor",         { "fg": s:black, "bg": s:white })
call s:hl("TermCursorNC",   { "fg": s:black, "bg": s:gray })
highlight! link lCursor     Cursor
highlight! link CursorIM    Cursor
highlight! link TermCursor  Cursor

call s:hl("CursorLine",     { "bg": s:lightblack })
highlight! link CursorColumn CursorLine

call s:hl("CursorLineNr",   { "style": "bold" })

" Line numbers
call s:hl("LineNr",         { "fg": s:gray })
call s:hl("SignColumn",     { "bg": s:black })

" Status line
call s:hl("StatusLine",     { "fg": s:white, "bg": s:lightblack })
call s:hl("StatusLineNC",   { "fg": s:gray, "bg": s:lightblack })

" Search
call s:hl("Search",         { "fg": s:white, "bg": s:gray })
call s:hl("IncSearch",      { "fg": s:black, "bg": s:yellow, "style": "bold" })
highlight! link CurSearch IncSearch

" Completion
call s:hl("Pmenu",          { "fg": s:white, "bg": s:darkgray })
call s:hl("PmenuSel",       { "fg": s:white, "bg": s:gray, "style": "bold" })
call s:hl("PmenuSBar",      { "bg": s:darkgray })
call s:hl("PmenuThumb",     { "bg": s:gray })
call s:hl("WildMenu",       { "fg": s:white, "bg": s:gray, "style": "bold" })

" Tabs
call s:hl("TabLine",        { "fg": s:gray, "bg": s:lightblack })
highlight! link TabLineFill TabLine

call s:hl("TabLineSel",     { "fg": s:white, "style": "bold,italic" })
call s:hl("Title",          { "fg": s:yellow, "style": "bold" })

" Diff
call s:hl("DiffAdd",        { "fg": s:black, "bg": s:green })
call s:hl("DiffDelete",     { "fg": s:black, "bg": s:red })
call s:hl("DiffChange",     { "fg": s:black, "bg": s:blue })
call s:hl("DiffText",       { "fg": s:black, "bg": s:blue, "style": "bold,italic" })

" GitSigns
call s:hl("GitSignsAdd",    { "fg": s:green })
call s:hl("GitSignsDelete", { "fg": s:red })
call s:hl("GitSignsChange", { "fg": s:blue })

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
call s:hl("Folded",         { "fg": s:brown, "bg": s:lightblack , "style": "italic" })
call s:hl("FoldColumn",     { "fg": s:brown })

" Diagnostic
call s:hl("DiagnosticError",{ "fg": s:red })
call s:hl("DiagnosticWarn", { "fg": s:yellow })
call s:hl("DiagnosticInfo", { "fg": s:blue })
call s:hl("DiagnosticHint", { "fg": s:gray })

" Indentation
call s:hl("ColorColumn",    { "bg": s:lightblack })
call s:hl("NonText",        { "fg": s:darkgray })

" Splits
call s:hl("VertSplit",      { "fg": s:gray })
call s:hl("WinSeparator",   { "fg": s:gray })

" WinBar
call s:hl("WinBar",         { "fg": s:magenta, "style": "bold" })
highlight! link WinBarNC    WinBar

" Misc
call s:hl("MatchParen",     { "fg": s:yellow, "style": "bold" })
call s:hl("QuickFixLine",   { "bg": s:gray, "style": "bold" })
call s:hl("SpecialKey",     { "fg": s:magenta })
call s:hl("Conceal",        { "fg": s:magenta })
call s:hl("Directory",      { "fg": s:blue })
call s:hl("EndOfBuffer",    { "fg": s:black })

call s:hl("NvimInternalError", { "fg": s:black, "bg": s:red })
