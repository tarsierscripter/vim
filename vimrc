"Pathogen"{{{
so $VIM/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
"}}}

"Autocmds"{{{
augroup haskell
	au BufNewFile,BufRead,BufCreate *.hs setlocal expandtab
	au BufNewFile,BufRead,BufCreate *.hs setlocal shiftwidth=4
	au BufNewFile,BufRead,BufCreate *.hs setlocal tabstop=4
	au BufNewFile,BufRead,BufCreate *.hs setlocal commentstring=\ --%s
	au BufEnter *.hs nmap <buffer> <C-G> :LaunchInterpreter ghci<CR>
	au BufWritePost *.hs GhcModCheck
augroup END
	au BufEnter *.scm nmap <buffer> <C-G> :LaunchInterpreter mit-scheme\ --load<CR>
	au BufNewFile,BufRead,BufCreate *.html compiler tidy
	au BufWritePost vimrc so %
"}}}

"Commands"{{{
command! -nargs=1 Silent | exec ':silent !'.<q-args> | exec ':redraw!'
command! -nargs=1 LaunchInterpreter exec ':silent let vimDir=getcwd()' | exec ':silent cd %:p:h' | exec ':silent !start '.<q-args>.' %:t' | exec ':silent cd ' .vimDir
command! DeleteTrailingWs :%s/\s\+$//
command! Restart exec ':w' | exec ':silent !killall ghc; runhaskell %&' | exec ':redraw!'
command! Tidy exec '%!tidy -q -w 0 -asxhtml'
command! TidyIndent exec '%!tidy -i -q -w 0 -asxhtml'
command! Untab exec '%s/\t/  /g'
command! GLVSort exec 'silent GLVS' | exec '3,$!sort -fk4 | column -t' | exec 'w'
"}}}

"Filetype stuff"{{{
filetype indent on
filetype on
filetype plugin on
"}}}

"Highlight stuff"{{{
syntax on
" highlight ExtraWhitespace ctermbg=Black guibg=Black
" highlight LongLine ctermbg=DarkYellow guibg=DarkYellow
" match ExtraWhitespace /\s\+$/
"}}}

"Keybindings"{{{
imap <PageDown> <C-O><C-D>
imap <PageUp> <C-O><C-U>
nmap <PageDown> <C-D>
nmap <PageUp> <C-U>
nmap <silent> <Leader>gc :GhcModCheck<CR>
nmap <silent> <Leader>gl :GhcModLint<CR>
nmap <silent> <Leader>gt :GhcModType<CR>
nmap <silent> <Leader>gT :GhcModTypeClear<CR>
nmap <silent> <Leader>N :cd %:p:h<Bar>:NERDTree<CR>
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Space> :nohlsearch<Bar>:echo<CR>
vmap <PageDown> <C-D>
vmap <PageUp> <C-U>
"}}}

"Options"{{{
set autoindent
set background=dark
set backspace=2
set cinoptions=:0,g0,(0,Ws,l1
set cmdheight=1
set completeopt=menu,menuone,longest
set directory=$VIM/swap
set foldmethod=marker
set hidden
set history=1000
set hlsearch
set incsearch
set linebreak
set nomodeline
set nonumber
set noreadonly
set noshowcmd
set nostartofline
set nowarn
set ruler
set shiftwidth=4
set showmatch
set showmode
set smarttab
set softtabstop=0
set tabstop=4
set undodir=$VIM/undo
set undofile
set undolevels=1000
set undoreload=10000
set wildmenu
set window=0
"}}}

"Plugin Variables"{{{
let g:GetLatestVimScripts_allowautoinstall=1
let g:haddock_docdir='/Haskell Platform/2011.2.0.1/doc/html/'
let g:haddock_indexfile=$VIM."/Haddock/haddock_index.vim"
let g:haddock_indexfiledir=$VIM."/Haddock/"
let g:haskell_indent_if=2
let g:Tlist_Inc_Winwidth=0
let g:surround_40 = "(\r)"
let g:surround_91 = "[\r]"
"}}}

" GUI-Specific Settings"{{{
if has('gui_running')
	set formatprg=$VIM\bin\par.exe
	set guioptions=ac
	set guifont=Andale_Mono:h12:cANSI
	set t_Co=256
	colo vividchalk
	let g:haddock_browser=$HOME."/AppData/Local/Google/Chrome/Application/chrome.exe"
	set columns=126 lines=34
	cd ~\Documents\Vim
else
	colo elflord
endif
"}}}
