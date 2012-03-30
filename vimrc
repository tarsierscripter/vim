"Pathogen"{{{
so $VIM/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
"}}}

"Autocmds"{{{
	au BufNewFile,BufRead,BufCreate *.hs setlocal expandtab
	au BufNewFile,BufRead,BufCreate *.hs setlocal shiftwidth=4
	au BufNewFile,BufRead,BufCreate *.hs setlocal tabstop=4
	au BufNewFile,BufRead,BufCreate *.hs setlocal commentstring=\ --%s
	au BufWritePost *.hs GhcModCheck
	au BufNewFile,BufRead,BufCreate *.html compiler tidy
	au BufEnter *.hs nmap <buffer> <C-G> :silent call LaunchInterpreter('ghci')<CR>
	au BufEnter *.scm nmap <buffer> <C-G> :silent call LaunchInterpreter('mit-scheme --load')<CR>
"}}}

"Commands"{{{
command! DeleteTrailingWs :%s/\s\+$//
command! Restart exec ':w' | exec ':silent !killall ghc; runhaskell %&' | exec ':redraw!'
command! Tidy exec '%!tidy -q -w 0 -asxhtml'
command! TidyIndent exec '%!tidy -i -q -w 0 -asxhtml'
command! Untab exec '%s/\t/  /g'
"}}}

"Functions"{{{
function! LaunchInterpreter(interp)
	let vimDir=getcwd()
	exec ':silent cd %:p:h'
	if a:interp == 'mit-scheme --load'
		let $MITSCHEME_BACKGROUND = '0x000000'
		let $MITSCHEME_FONT = 'Andale Mono 12'
		let $MITSCHEME_FOREGROUND = '0xdddddd'
		let $MITSCHEME_GEOMETRY = '75,150,1024,660'
		let $MITSCHEME_LIBRARY_PATH = 'C:\Program Files (x86)\MIT-GNU Scheme\lib'
		exec ':silent !start ' . a:interp . ' ' . shellescape(expand('%:p'))
		let $MITSCHEME_BACKGROUND = ''
		let $MITSCHEME_FOREGROUND = ''
		let $MITSCHEME_FONT = ''
		let $MITSCHEME_GEOMETRY = ''
		let $MITSCHEME_LIBRARY_PATH = ''
	else
		exec ':silent !start ' . a:interp . ' ' . shellescape(expand('%:p'))
	endif
	exec ':silent cd ' . vimDir
endfunc
"}}}

"Syntax + Filetype stuff"{{{
filetype indent on
filetype on
filetype plugin on
syntax on
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
set cmdheight=1
set completeopt=menu,menuone,longest
set directory=$VIM/swap
set foldmethod=marker
set hidden
set history=1000
set hlsearch
set incsearch
set linebreak
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
"}}}

"Plugin Variables"{{{
let g:haskell_indent_if=2
let g:surround_40 = "(\r)"
let g:surround_91 = "[\r]"
"}}}

" GUI-Specific Settings"{{{
if has('gui_win32')
	set guioptions=ac
	set guifont=Andale_Mono:h12:cANSI
	set t_Co=256
	colo vividchalk
	let g:haddock_browser=$HOME."/AppData/Local/Google/Chrome/Application/chrome.exe"
	set columns=126 lines=34
	cd ~\Documents\Vim
	winpos 1280 871
else
	colo elflord
endif
"}}}
