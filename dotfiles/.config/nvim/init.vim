call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim2hs', { 'for': 'haskell' }
Plug 'davidbeckingsale/writegood.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'flazz/vim-colorschemes'
Plug 'freitass/todo.txt-vim'
Plug 'idris-hackers/idris-vim'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-startify'
Plug 'msteinert/vim-prolog', { 'for': 'prolog' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'oftlisp/vim-oftlisp', { 'for': 'oftlisp' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'purescript-contrib/purescript-vim', { 'for': 'purescript' }
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex', { 'for': 'tex' }
Plug 'dbmrq/vim-redacted'
Plug 'vim-scripts/alex.vim', { 'for': 'alex' }
Plug 'vim-scripts/happy.vim', { 'for': 'happy' }
Plug 'vim-scripts/JavaDecompiler.vim'
Plug 'wakatime/vim-wakatime'

call plug#end()

filetype plugin indent on
syntax enable

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:codi#interpreters = {
		\ 'haskell': {
			\ 'bin': ['stack', 'ghci']
		\ },
        \ 'sml': {
            \ 'bin': 'sml',
            \ 'prompt': '^- ',
        \ }
	\ }
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:deoplete#enable_at_startup = 1
let g:haskell_conceal = 0
let g:jsx_ext_required = 0
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ }
let g:markdown_fold_style = 'nested'
let g:rustfmt_autosave = 1
let g:tagbar_type_rust = {
	\ 'ctagstype' : 'rust',
	\ 'kinds' : [
		\ 'T:types,type definitions',
		\ 'f:functions,function definitions',
		\ 'g:enum,enumeration names',
		\ 's:structure names',
		\ 'm:modules,module names',
		\ 'c:consts,static constants',
		\ 't:traits',
		\ 'i:impls,trait implementations',
	\ ]
	\ }
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = "pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style --shell-escape $*"

noremap <tab> :NERDTreeToggle<cr>
noremap <S-tab> :TagbarToggle<cr>

inoremap <f1> <esc>:bp<cr>
nnoremap <f1> :bp<cr>
inoremap <f2> <esc>:bn<cr>
nnoremap <f2> :bn<cr>
nnoremap <leader><leader> :w<cr>
inoremap <leader><leader> <esc>:w<cr>
" vnoremap <expr> // 'y/\V'.escape(@",'\').'<cr>'
" inoremap <leader>r <esc>lR
" inoremap <leader>i <esc>a
nnoremap <leader>m <esc>:w<cr>:!make<cr>
nmap <leader>r <Plug>Redact
vmap <leader>r <Plug>Redact

set background=dark
set clipboard=unnamedplus
set colorcolumn=80
set foldmethod=syntax
set foldnestmax=1
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
set title

colorscheme Benokai
" colorscheme default

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
autocmd BufRead * normal zR
autocmd BufWritePre * :%s/\s\+$//e

augroup SALTPACK
	au!
	" Make sure nothing is written to ~/.viminfo
	au BufReadPre,FileReadPre *.saltpack setlocal viminfo=
	" No other files with unencrypted info
	au BufReadPre,FileReadPre *.saltpack setlocal noswapfile noundofile nobackup

	" Reading Files, assumes you can decrypt
	au BufReadPost,FileReadPost *.saltpack :%!keybase decrypt 2>/dev/null

	" Writing requires users
	au BufWritePre,FileReadPre *.saltpack let usernames = input('Users: ')
	au BufWritePre,FileReadPre *.saltpack :exec "%!keybase encrypt " . usernames
	au BufWritePost,FileReadPost *.saltpack u
augroup end

:set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
