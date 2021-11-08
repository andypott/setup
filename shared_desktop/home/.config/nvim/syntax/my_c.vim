" Vim syntax file
" Language: C
" Maintainer: Andy Potter
" Latest Revision: 26 April 2021

if exists("b:current_syntax")
    finish
endif

syn region cComment start='/\*' end='\*/'
syn region cComment start='#if 0' end='#endif'
syn match cComment '//.*$'

syn region cString start='"' end='"' skip='\\"'

syn region cChar start='\'' end='\'' skip='\\\''

hi def link cComment Comment
hi def link cString String
hi def link cChar Character

let b:current_syntax="c"
