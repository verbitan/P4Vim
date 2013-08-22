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

" Ensure that the P4Vim Python module initialised ok.
if exists('s:P4Vim_pythonInitFailure')
    echohl WarningMsg
    echomsg 'Error: P4Python not installed'
    echohl None
    finish
endif

" Ensure that the version of Python is new enough.
if !exists('s:P4Vim_supportedPython')
    echohl WarningMsg
    echomsg 'Error: P4Python requires Python 2.7+'
    echohl None
    finish
endif

" P4Vim has loaded.
let g:P4Vim_loaded = 1

" }}}

" External Functions {{{

command! -nargs=0 PAdd call p4vim#PAdd()
command! -nargs=0 PEdit call p4vim#PEdit()
command! -nargs=0 PRevert call p4vim#PRevert()

" }}}

