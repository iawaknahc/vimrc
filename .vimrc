" Make default shell script as POSIX
let g:is_posix=1

call plug#begin('~/.vim/plugged')
" fuzzy search
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
endif
call plug#end()

" look
set laststatus=2
set list listchars=tab:>-,trail:.
set number
set ruler
set showcmd
set ttimeout ttimeoutlen=100
set wildmenu

" responsiveness
set nocursorline
set nocursorcolumn
set lazyredraw
set synmaxcol=120

" editing
set autoindent
set backspace=indent,eol,start
set backupcopy=yes
set encoding=utf-8
set hidden
set noswapfile
set scrolloff=5

" clipboard
set clipboard=unnamed,unnamedplus

" mouse
set mouse=a

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

nnoremap <Space><Space> :set hlsearch!<CR>
nnoremap <Space>f :Files<CR>
nnoremap <Space>b :Buffers<CR>

function! PythonTemplate()
  call append(0, '#!/usr/bin/env python')
  call append(1, '# -*- coding: utf-8 -*-')
  call append(2, 'from __future__ import absolute_import, division, print_function, unicode_literals')
endfunction

function! ShellTemplate()
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
  autocmd BufNewFile *.py call PythonTemplate()
  autocmd BufNewFile *.sh call ShellTemplate()
augroup END

" indentation
augroup MyIndentation
  autocmd!
  autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4
  autocmd FileType javascript,json,ruby,sh,yaml,vim,ocaml setlocal expandtab shiftwidth=2 softtabstop=2
augroup END
