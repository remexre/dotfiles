call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim'
Plug 'autozimu/LanguageClient-neovim'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim2hs'
Plug 'davidbeckingsale/writegood.vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kovisoft/slimv'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-startify'
Plug 'nelstrom/vim-markdown-folding'
Plug 'oftlisp/vim-oftlisp'
Plug 'pangloss/vim-javascript'
Plug 'purescript-contrib/purescript-vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'vim-scripts/alex.vim'
Plug 'wakatime/vim-wakatime'
Plug 'vim-scripts/happy.vim'

call plug#end()

filetype plugin indent on
syntax enable

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:deoplete#enable_at_startup = 1
let g:haskell_conceal = 0
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ }
let g:markdown_fold_style = 'nested'
let g:tex_flavor='latex'

noremap <tab> :NERDTreeToggle<cr>

inoremap <f1> <esc>:bp<cr>
nnoremap <f1> :bp<cr>
inoremap <f2> <esc>:bn<cr>
nnoremap <f2> :bn<cr>
nnoremap <leader><leader> :w<cr>
inoremap <leader><leader> <esc>:w<cr>
vnoremap <expr> // 'y/\V'.escape(@",'\').'<cr>'

nmap q <nop>

set background=dark
set clipboard=unnamedplus
set foldmethod=syntax
set foldnestmax=2
set hidden
set modeline
set mouse=a
set number
set relativenumber
set ruler
set shiftwidth=4
set showcmd
set showmatch
set showmode
set tabstop=4

" colorscheme Benokai
colorscheme default

if has("gui")
	set guifont=PT\ Mono\ Nerd\ Font\ 14
	colorscheme lightcolors
endif

if executable("rg")
	set grepprg=rg\ --vimgrep\ --no-heading
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

function! s:goyo_enter()
	Limelight
	PencilSoft
	setlocal spell
endfunction

function! s:goyo_leave()
	Limelight!
	PencilOff
	setlocal nospell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd BufRead *.md PencilSoft

augroup SALTPACK
	au!
	" Make sure nothing is written to ~/.viminfo
	au BufReadPre,FileReadPre *.saltpack set viminfo=
	" No other files with unencrypted info
	au BufReadPre,FileReadPre *.saltpack set noswapfile noundofile nobackup

	" Reading Files, assumes you can decrypt
	au BufReadPost,FileReadPost *.saltpack :%!keybase decrypt 2>/dev/null

	" Writing requires users
	au BufWritePre,FileReadPre *.saltpack let usernames = input('Users: ')
	au BufWritePre,FileReadPre *.saltpack :exec "%!keybase encrypt " . usernames
	au BufWritePost,FileReadPost *.saltpack u
augroup end

:set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
