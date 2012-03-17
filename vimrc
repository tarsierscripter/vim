"Pathogen"{{{
so $VIM/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()"}}}

"Autocmds"{{{
cd ~\Documents\Vim
augroup haskell
	au BufNewFile,BufRead,BufCreate *.hs compiler ghc
	au BufNewFile,BufRead,BufCreate *.hs setlocal expandtab
	au BufNewFile,BufRead,BufCreate *.hs setlocal shiftwidth=4
	au BufNewFile,BufRead,BufCreate *.hs setlocal tabstop=4
	au BufNewFile,BufRead,BufCreate *.hs setlocal commentstring=\ --%s
	au BufEnter *.hs nmap <buffer> <C-G> :LaunchInterpreter ghci<CR>
	au BufWritePost *.hs GhcModCheck
augroup END
augroup scheme
	au BufNewFile,BufRead,BufCreate,BufEnter *.scm nmap <buffer> <C-G> :LaunchInterpreter mit-scheme\ --load<CR>
augroup END
augroup html
	au BufNewFile,BufRead,BufCreate *.html compiler tidy
augroup END
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
nmap <Leader>gt :GhcModType<CR>
nmap <Leader>gT :GhcModTypeClear<CR>
nmap <Leader>gc :GhcModCheck<CR>
nmap <Leader>gl :GhcModLint<CR>
imap <PageDown> <C-O><C-D>
imap <PageUp> <C-O><C-U>
vmap <PageDown> <C-D>
vmap <PageUp> <C-U>
nmap <PageDown> <C-D>
nmap <PageUp> <C-U>
nmap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"}}}

"Options"{{{
set columns=126 lines=34
set autoindent
set background=dark
set backspace=2
set cinoptions=:0,g0,(0,Ws,l1
set cmdheight=1
set completeopt=menu,menuone,longest
set directory=$VIM/swap
set foldmethod=marker
set guifont=Andale_Mono:h12:cANSI
set guioptions=ac
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
set t_Co=256 | colo xoria256
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
let g:haddock_browser=$HOME."/AppData/Local/Google/Chrome/Application/chrome.exe"
let g:haddock_docdir='/Haskell Platform/2011.2.0.1/doc/html/'
let g:haddock_indexfile=$VIM."/Haddock/haddock_index.vim"
let g:haddock_indexfiledir=$VIM."/Haddock/"
let g:haskell_indent_if=2
let g:Tlist_Inc_Winwidth=0
let g:surround_40 = "(\r)"
let g:surround_91 = "[\r]"
"}}}

