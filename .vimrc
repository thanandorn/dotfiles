set number
set nocompatible
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'bling/vim-airline'
Plugin 'lervag/vimtex'
Plugin 'git://github.com/shime/vim-livedown.git'

" Syntax Highlighting
" Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'git://github.com/markcornick/vim-vagrant.git'
"Plugin 'git://github.com/rodjek/vim-puppet.git'
Plugin 'git://github.com/puppetlabs/puppet-syntax-vim.git'

" Supertab : awesome autocomplete
Plugin 'git://github.com/ervandew/supertab.git'

" Color schemes
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:promptline_powerline_symbols = 1
let g:molokai_original = 1
let g:rehash256 = 1
