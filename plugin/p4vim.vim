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
    echohl None
    finish
endif

" Try and load the P4Vim Python module.
let s:P4Vim_pythonFile = escape(expand('<sfile>:p:h'), '\') .  '/p4vim.py'
exe 'pyfile ' . s:P4Vim_pythonFile
python initP4Vim()

" Ensure that the P4Vim Python module initialised ok.
if exists('s:P4Vim_pythonInitFailure')
    echohl WarningMsg
    echomsg 'Error: P4Python not installed'
    echohl None
    finish
endif

" We've initialised everything.
let g:P4Vim_loaded = 1

" }}}

