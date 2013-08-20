" ==============================================================================
" File:        P4Vim.vim
" Description: Perforce plugin for Vim, utilising the P4Python API.
" Author:      Nick James
" License:     The MIT License (MIT)
" ==============================================================================

" Init {{{

" Check if we've already loaded P4Vim or if it's been disabled.
if exists('g:P4Vim_loaded') || exists('g:P4Vim_disable')
    finish
endif

" Ensure that Vim has python support.
if !has('python')
    echohl WarningMsg
    echomsg 'Error: P4Vim requires Vim to be compiled with Python support'
          \ '(+python)'
    finish
    echohl None
endif

" We've initialised everything.
let g:P4Vim_loaded = 1

" }}}

