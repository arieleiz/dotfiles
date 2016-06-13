" Vim syntax file
" Language: PTX

if exists("b:current_syntax")
  finish
endif

syn keyword ptxKeywords mov cvta ld st add sub mov setp neg and clz membar mad vote atom rem shfl shfr bra volatile shl shr cvt or ret mul 
syn keyword ptxModifier b64 s64 u64 b32 u32 s32 b16 u16 s16 b8 u8 s8 pred
syn keyword ptxModifier2 global ballot ne param wide ge lt local v2 eq cas visible entry reg to idx align sys func .gl

syn match ptxRegister '%[A-Za-z0-9]\+'
" Integer with - + or nothing in front
syn match ptxNumber '\d\+'
syn match ptxNumber '[-+]\d\+'

" Floating point number with decimal no E or e 
syn match ptxNumber '[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (+,-)
syn match ptxNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match ptxNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (+,-)
syn match ptxNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match ptxNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

syn match ptxLabel '^[A-Za-z0-9_]\+:'
syn match ptxPredicate '^@%[A-Za-z0-9_]\+'

syn region ptxDescBlock start="{" end="}" fold transparent
syn region ptxRegBlock start="<" end=">" fold transparent
syn region ptxParamBlock start="(" end=")" fold transparent
syn region ptxAddrBlock start="\[" end="\]" fold transparent

syn match ptxComment "//.*$" contains=ptxComment

let b:current_syntax = "ptx"

hi def link ptxModifier2   Special
hi def link ptxComment     Comment
hi def link ptxKeywords    Statement
hi def link ptxRegister    Type
hi def link ptxModifier    Constant
hi def link ptxDescBlock   PreProc
hi def link ptxRegBlock    PreProc
hi def link ptxParamBlock  PreProc
hi def link ptxAddrBlock   PreProc
hi def link ptxNumber      Constant
hi def link ptxLabel       Underlined
hi def link ptxPredicate   Label
