set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Generic
Plugin 'junegunn/fzf.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Syntax
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'flowtype/vim-flow'
Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-markdown'

" Theme
Plugin 'flazz/vim-colorschemes'

" Tmux
Plugin 'tmux-plugins/vim-tmux'

call vundle#end()

filetype plugin indent on
