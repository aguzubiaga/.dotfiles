filetype off
set list

call plug#begin('~/.config/nvim/plugged')

"Plug 'neomake/neomake'
Plug 'junegunn/vim-easy-align'
"Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimproc.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/vim-stylus'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'digitaltoad/vim-pug'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'
Plug 'Quramy/tsuquyomi'
Plug 'junegunn/vim-easy-align'
Plug 'raichoo/purescript-vim'
Plug 'flowtype/vim-flow'
Plug 'frigoeu/psc-ide-vim'

call plug#end()

colorscheme atom-dark-256

set showcmd
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

set smartcase

set sw=2
set ts=2

set guifont=Hack:h12

set nobackup
set nowritebackup
set noswapfile

set relativenumber
set number
set clipboard=unnamed

" Leader key
let mapleader = ","
let NERDTreeShowHidden=1

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Tsuquyomi
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
"let g:tsuquyomi_disable_quickfix = 1

" NERD Mappings
map <leader>f :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

" Tabs Mapping
map <C-t> :tabnew<CR>

" Don't be stupid!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Multi cursor mappings
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Keep all multi cursors when leaving insert mode
let g:multi_cursor_exit_from_insert_mode=0

" Airline settings
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

" Identline settings
let g:indentLine_enabled = 0

" Move lines
let g:move_key_modifier = 'C'

" Add empty lines without entering normal mode
map <leader>o o<Esc>
map <leader>O O<Esc>

" Save map
imap <C-g> <Esc>:w<CR>
nmap <C-g> :w<CR>

" Fzf mappings
map <leader><leader> :Files<CR>
map <leader>gf :GitFiles<CR>
map <leader>gc :Commits<CR>
map <leader>/ :Lines<CR>
map <leader>\ :BLines<CR>
map <leader>b :Buffers<CR>
map <leader>ag :Ag<CR>

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Vim session
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Neomake
"autocmd! BufWritePost,BufEnter * Neomake

let g:neomake_warning_sign = {
  \ 'text': '⚠️',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '❌',
  \ 'texthl': 'ErrorMsg',
  \ }

" YouCompleteMe
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" angular2

func! Ng2GoTo(mode, type)
  if a:mode == 'e'
    let cmd = 'edit'
  elseif a:mode == 't'
    let cmd = 'tabe'
  elseif a:mode == 's'
    let cmd = 'sp'
  elseif a:mode == 'v'
    let cmd = 'vs'
  endif

  if a:type == 'v'
    let extension = 'html'
  elseif a:type == 'c'
    let extension = 'ts'
  elseif a:type == 'ss'
    let extension = 'scss'
  elseif a:type == 'sp'
    let extension = 'spec.ts'
  endif

  execute cmd . ' ' . expand('%:p:r') . '.' . extension
endfu

map <leader>ec :call Ng2GoTo('e', 'c') <CR>
map <leader>ev :call Ng2GoTo('e', 'v') <CR>
map <leader>ess :call Ng2GoTo('e', 'ss') <CR>
map <leader>tc :call Ng2GoTo('t', 'c') <CR>
map <leader>tv :call Ng2GoTo('t', 'v') <CR>
map <leader>tss :call Ng2GoTo('t', 'ss') <CR>
map <leader>vc :call Ng2GoTo('v', 'c') <CR>
map <leader>vv :call Ng2GoTo('v', 'v') <CR>
map <leader>vss :call Ng2GoTo('v', 'ss') <CR>
map <leader>sc :call Ng2GoTo('s', 'c') <CR>
map <leader>sv :call Ng2GoTo('s', 'v') <CR>
map <leader>sss :call Ng2GoTo('s', 'ss') <CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


let g:flow#enable = 0

au FileType purescript nmap <buffer> <leader>t :<C-U>PSCIDEtype<CR>
au FileType purescript nmap <buffer> <leader>s :<C-U>PSCIDEapplySuggestion<CR>
au FileType purescript nmap <buffer> <leader>a :<C-U>PSCIDEaddTypeAnnotation<CR>
au FileType purescript nmap <buffer> <leader>i :<C-U>PSCIDEimportIdentifier<CR>
au FileType purescript nmap <buffer> <leader>r :<C-U>PSCIDEload<CR>
au FileType purescript nmap <buffer> <leader>p :<C-U>PSCIDEpursuit<CR>
au FileType purescript nmap <buffer> <leader>c :<C-U>PSCIDEcaseSplit<CR>
au FileType purescript nmap <buffer> <leader>qd :<C-U>PSCIDEremoveImportQualifications<CR>
au FileType purescript nmap <buffer> <leader>qa :<C-U>PSCIDEaddImportQualifications<CR>
