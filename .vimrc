set ts=4 sw=4 expandtab
colorscheme elflord

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab
endif

fun! ReadMan()
  " Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')
  " Open a new window:
  :exe ":wincmd n"
  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":r!man " . s:man_word . " | col -b"
  " Goto first line...
  :exe ":goto"
  " and delete it:
  :exe ":delete"
endfun
" Map the K key to the ReadMan function:
map K :call ReadMan()<CR>

fun! CompileFile()
  " Open a new window:
  :exe ":wincmd n"
  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":r!make | col -b"
  " Goto first line...
  ":exe ":goto"
  " and delete it:
  ":exe ":delete"
endfun
" Map the K key to the ReadMan function:
map M :call CompileFile()<CR>

