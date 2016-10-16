" General
set nocompatible

set encoding=utf-8
set t_Co=256
set number         "Line numbers me likey
set backspace=2    "Make backspace work like most other apps
set history=10000  "Shit load of history for :cmdline
set showcmd        "Show me incomplete commands down bottom
set visualbell     "Please, no sounds
set autoread       "Reload files changed outside vim
set wmh=0          "Set minimum window height to 0, helps when stacking splits
set laststatus=2   "Always show the bar

set undofile "automatically save and restore undo history
set undodir=~/.vim/undos

if $TMUX == ""
  set clipboard+=unnamed
endif

" Spell checking
set nospell

" Key mappings

let mapleader=","

inoremap jk <esc><esc>:w<cr>

" never go into Ex mode
noremap Q <Nop>

" Git bindings
nnoremap <leader>gc :Gcommit -S<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gw :Gw<cr>

"allow for command repetition in visual mode
vnoremap . :norm.<cr>

" Toggle spelling
nnoremap <leader>s :set spell!<cr>

" Toggle numbers
nnoremap <leader>1 :set number!<cr>

",<space> clears search highlightning
nnoremap <leader><space> :noh<cr>

"Next buffer with TAB
nnoremap <tab> :bnext<cr>

"Previous buffer with Shift+TAB
nnoremap <s-tab> :bprevious<cr>

"Toggle last two buffers
nnoremap <leader><leader> <C-^>

",v splits vertically
nnoremap <leader>v :vsp<cr>

",h splits horizontally
nnoremap <leader>h :split<cr>

" Load Plugins

if filereadable(expand("$HOME/.vim/vundle.vim"))
  source $HOME/.vim/vundle.vim
endif

" control+{h,j,k,l} to navigate between splits
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C--> <C-W><S-->
nnoremap <C-=> <C-W>=

" double T makes a new tab
nnoremap tt :tabnew<cr>
" navigate tabs with H and L
nnoremap th :tabp<cr>
nnoremap tl :tabn<cr>

" Indentation

set autoindent
set smartindent
set smarttab
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

filetype plugin indent on

set wrap

" Searching

set hlsearch
set incsearch
set ignorecase
set showmatch
set smartcase

" Colors

syntax on
colorscheme pencil
set cursorline
set background=dark
let g:jsx_ext_required = 0

set rtp+=/usr/local/opt/fzf
map <leader><tab> :FZF -x<cr>

set colorcolumn=81
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/


" Syntastic config

let g:syntastic_html_tidy_ignore_errors = ['propietary attribute "ng- "v-']

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

" Staturs line config
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'component': {
  \   'readonly': '%{&readonly?"⭤":""}',
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
  \ }


function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is elected, save it in the v buffer and send that buffer it to tmux
vmap <leader>e "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <leader>vs vip<LocalLeader>vs<CR>

autocmd FileType racket call VimuxRunCommand("racket")
autocmd FileType ruby call VimuxRunCommand("irb")

" autocmd BufWritePost {.,}tmux*.conf -- send keys to reload tmux
"
set exrc
set secure
