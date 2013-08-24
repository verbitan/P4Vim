# ==============================================================================
# File:        P4Vim.py
# Description: Perforce plugin for Vim, utilising the P4Python API.
# Author:      Nick James
# License:     The MIT License (MIT)
# ==============================================================================

import vim
import sys

try:
    from P4 import P4, P4Exception

    if sys.version_info[:2] >= (2, 7):
        vim.command('let s:P4Vim_supportedPython = 1')

except ImportError, e:
    vim.command('let s:P4Vim_pythonInitFailure = 1')

class P4Vim:
    def __init__(self):
        self.p4 = P4()

        self.p4.prog = "P4Vim"

        if ( int(vim.eval("exists('g:P4Vim_port')")) ):
            self.p4.port = vim.eval('g:P4Vim_port')

        if ( int(vim.eval("exists('g:P4Vim_user')")) ):
            self.p4.user = vim.eval('g:P4Vim_user')

        if ( int(vim.eval("exists('g:P4Vim_passwd')")) ):
            self.p4.password = vim.eval('g:P4Vim_passwd')

        if ( int(vim.eval("exists('g:P4Vim_client')")) ):
            self.p4.client = vim.eval('g:P4Vim_client')

    def Add(self):
        try:
            self.p4.connect()
            self.p4.run("add", vim.current.buffer.name)
            self.p4.disconnect()
        except P4Exception:
            for e in self.p4.errors:
                print e
            for w in self.p4.warnings:
                print w

    def Edit(self):
        try:
            self.p4.connect()
            self.p4.run("edit", vim.current.buffer.name)
            self.p4.disconnect()
        except P4Exception:
            for e in self.p4.errors:
                print e
            for w in self.p4.warnings:
                print w

    def Revert(self):
        try:
            self.p4.connect()
            self.p4.run("revert", vim.current.buffer.name)
            self.p4.disconnect()
        except P4Exception:
            for e in self.p4.errors:
                print e
            for w in self.p4.warnings:
                print w

