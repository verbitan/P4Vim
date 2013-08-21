# ==============================================================================
# File:        P4Vim.py
# Description: Perforce plugin for Vim, utilising the P4Python API.
# Author:      Nick James
# License:     The MIT License (MIT)
# ==============================================================================

def initP4Vim():
    import vim

    try:
        import P4
    except ImportError, e:
        vim.command('let s:P4Vim_pythonInitFailure = 1')

