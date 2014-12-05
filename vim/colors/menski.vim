set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "menski"

" cterm options bold, underline, reverse, italic, none
" colors:
"         Dark     Light
" Black   #1A1A1A  #333333
" Red     #8B2500  #CD3700
" Green   #6E8B3D  #A2CD5A
" Yellow  #CD9B1D  #EEB422
" Blue    #36648B  #4F94CD
" Magenta #8B2252  #CD3278
" Cyan    #668B8B  #96CDCD
" White   #A9A9A9  #D3D3D3

" UI
hi StatusLine     cterm=none      ctermfg=black       ctermbg=lightgray   gui=none        guifg=#333333   guibg=#96CDCD
hi StatusLineNC   cterm=underline ctermfg=black       ctermbg=none        gui=underline   guifg=#670B8B   guibg=bg
hi WildMenu       cterm=none      ctermfg=black       ctermbg=green       gui=none        guifg=#333332   guibg=#D3D3D3
hi VertSplit      cterm=none      ctermfg=black       ctermbg=none        gui=none        guifg=#96CDCD   guibg=bg
hi LineNr         cterm=none      ctermfg=black       ctermbg=none        gui=none        guifg=#668B8B   guibg=bg
hi CursorLineNr   cterm=none      ctermfg=black       ctermbg=lightgray   gui=none        guifg=#CD3278   guibg=bg
hi ColorColumn    cterm=none      ctermfg=none        ctermbg=gray        gui=none        guifg=fg        guibg=#CD3278
hi Visual         cterm=reverse   ctermfg=cyan        ctermbg=black       gui=reverse     guifg=#96CDCD   guibg=#333333
hi Underlined     cterm=underline ctermfg=none        ctermbg=none        gui=underline   guifg=fg        guibg=bg
hi Pmenu          cterm=none      ctermfg=black       ctermbg=gray        gui=none        guifg=#333333   guibg=#668B8B
hi PmenuSel       cterm=none      ctermfg=black       ctermbg=green       gui=none        guifg=#D3D3D3   guibg=#668B8B

" Syntax
hi Comment        cterm=none      ctermfg=gray        ctermbg=none        gui=none        guifg=#668B8B   guibg=bg
hi Constant       cterm=none      ctermfg=black       ctermbg=none        gui=none        guifg=#96CDCD   guibg=bg
hi Identifier     cterm=none      ctermfg=darkblue    ctermbg=none        gui=none        guifg=#6E8B3D   guibg=bg
hi Statement      cterm=none      ctermfg=black       ctermbg=none        gui=none        guifg=#6E8B3D   guibg=bg
hi PreProc        cterm=none      ctermfg=black       ctermbg=none        gui=none        guifg=#4F94CD   guibg=bg
hi Type           cterm=none      ctermfg=black       ctermbg=none        gui=none        guifg=#CD9B1D   guibg=bg
hi Special        cterm=none      ctermfg=black       ctermbg=none        gui=none        guifg=#CD3278   guibg=bg
hi Error          cterm=none      ctermfg=red         ctermbg=none        gui=none        guifg=#CD3700   guibg=bg
hi Todo           cterm=underline ctermfg=blue        ctermbg=none        gui=underline   guifg=#8B2252   guibg=bg

" Highlightning
hi DiffAdd        cterm=none      ctermfg=black       ctermbg=green       gui=none        guifg=#333333   guibg=#A2CD5A
hi DiffChange     cterm=none      ctermfg=black       ctermbg=yellow      gui=none        guifg=#333333   guibg=#EEB422
hi DiffDelete     cterm=none      ctermfg=black       ctermbg=red         gui=none        guifg=#333333   guibg=#CD3700
hi DiffText       cterm=none      ctermfg=black       ctermbg=blue        gui=none        guifg=#333333   guibg=#4F94CD
hi IncSearch      cterm=none      ctermfg=black       ctermbg=yellow      gui=none        guifg=#333333   guibg=#EEB422
hi Search         cterm=none      ctermfg=black       ctermbg=yellow     gui=none        guifg=#D3D3D3   guibg=#CD3278
hi MatchParen     cterm=underline ctermfg=none        ctermbg=none        gui=underline   guifg=fg        guibg=bg

" Spellchecking
hi SpellBad       cterm=underline ctermfg=red         ctermbg=none        gui=underline   guifg=#8B2500   guibg=bg
hi SpellCap       cterm=underline ctermfg=blue        ctermbg=none        gui=underline   guifg=#4F94CD   guibg=bg
hi SpellLocal     cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi SpellRare      cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg

" Folding
hi Folded         cterm=none      ctermfg=darkblue    ctermbg=none        gui=none        guifg=#36648B   guibg=bg
hi FoldColumn     cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg

" Cleared
hi Ignore         cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi Conceal        cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi Cursor         cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=bg        guibg=fg
hi CursorIM       cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi CursorColumn   cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi CursorLine     cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=NONE      guibg=NONE
hi Directory      cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi ErrorMsg       cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi SignColumn     cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi ModeMsg        cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi MoreMsg        cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi NonText        cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi Normal         cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=#D3D3D3   guibg=#333333
hi PmenuSbar      cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi PmenuThumb     cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi Question       cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi SpecialKey     cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi TabLine        cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi TabLineFill    cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi TabLineSel     cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi Title          cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi VisualNOS      cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
hi WarningMsg     cterm=none      ctermfg=none        ctermbg=none        gui=none        guifg=fg        guibg=bg
