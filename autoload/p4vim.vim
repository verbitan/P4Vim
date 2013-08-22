" ==============================================================================
" File:        P4Vim.vim
" Description: Perforce plugin for Vim, utilising the P4Python API.
" Author:      Nick James
" License:     The MIT License (MIT)
" ==============================================================================

" External Functions {{{
"
function! p4vim#PAdd() "{{{
    python P4Vim().Add()
endfunction "}}}

function! p4vim#PEdit() "{{{
    python P4Vim().Edit()
endfunction "}}}

" }}}

