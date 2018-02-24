" Make default shell script as POSIX
let g:is_posix=1

call plug#begin('~/.vim/plugged')
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
endif
Plug 'leafgarland/typescript-vim'
Plug 'reasonml-editor/vim-reason-plus'
if executable('opam') && executable('ocamlmerlin')
  Plug (substitute(system('opam config var share'),'\n$','','''') . '/merlin/vim')
endif
Plug 'iawaknahc/vim-colorscheme-simple'
Plug 'w0rp/ale'
call plug#end()

" ALE
let g:ale_fix_on_save=1
let g:ale_fixers={}
let g:ale_fixers['go']=['gofmt', 'goimports']
let g:ale_fixers['javascript']=['prettier']
let g:ale_fixers['typescript']=['prettier']
let g:ale_javascript_prettier_use_local_config=1
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_text_changed='never'

" look
set laststatus=2
set list listchars=tab:>-,trail:.
set number
set ruler
silent! colorscheme simple

" command completion
set wildmenu
set wildmode=longest:full,full

set ttimeout ttimeoutlen=100

" responsiveness
set lazyredraw

" editing
set autoread
set autoindent
set backspace=indent,eol,start
set backupcopy=yes
set hidden
set noswapfile
set scrolloff=5

" indentation
set expandtab shiftwidth=2 softtabstop=2

" clipboard
set clipboard=unnamed

" mouse
set mouse=a

" search
set hlsearch
set ignorecase smartcase
set incsearch

" mapping
nnoremap Y y$
nnoremap <Space><Space> :set hlsearch!<CR>

function! s:PythonTemplate()
  call append(0, '#!/usr/bin/env python')
  call append(1, '# -*- coding: utf-8 -*-')
  call append(2, 'from __future__ import absolute_import, division, print_function, unicode_literals')
endfunction

function! s:ShellTemplate()
  call append(0, '#!/bin/sh')
  call append(1, 'set -eu')
endfunction

" file types
augroup MyFileType
  autocmd!
  autocmd BufRead,BufNewFile BUCK set filetype=python
  autocmd BufRead,BufNewFile Podfile,*.podspec set filetype=ruby
  autocmd BufRead,BufNewFile *.gradle set filetype=groovy
augroup END

" useful template
augroup MyTemplate
  autocmd!
  autocmd BufNewFile *.py call s:PythonTemplate()
  autocmd BufNewFile *.sh call s:ShellTemplate()
augroup END

" indentation
augroup MyIndentation
  autocmd!
  autocmd FileType
        \ go
        \ setlocal noexpandtab shiftwidth=4 tabstop=4
  autocmd FileType
        \ java
        \ setlocal expandtab shiftwidth=4 softtabstop=4
augroup END
