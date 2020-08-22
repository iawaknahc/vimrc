" :help nvim-from-vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set inccommand=nosplit

if has('nvim-0.5.0')
  if exists('*packager#init')
    call packager#add('neovim/nvim-lsp')
  endif

  packadd nvim-lsp

  if exists('g:nvim_lsp')

lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.cssls.setup({})
nvim_lsp.html.setup({})
nvim_lsp.jsonls.setup({
  cmd = {"json-languageserver", "--stdio"},
})
nvim_lsp.tsserver.setup({})
nvim_lsp.gopls.setup({})
nvim_lsp.flow.setup({})
-- multiple language server enabled for a buffer will cause
-- previous messages to be overridden.
-- https://github.com/neovim/neovim/issues/12105
-- nvim_lsp.efm.setup({})
EOF
  endif
endif
