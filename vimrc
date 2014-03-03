"
" fvdbs vimrc for linux
"
"
"
" add vim addons
set nocompatible
" security
set nomodeline
set secure
" i want it all
set history=1000
set undolevels=1000

" save my eyes
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set guifont=DejaVu\ Sans\ Mono\ 14

" pathogen vim script/addon
" https://github.com/tpope/vim-pathogen
" Manage your 'runtimepath' with ease. In practical terms,
" pathogen.vim makes it super easy to install plugins and runtime files 
" in their own private directories.
"call pathogen#infect('C:\Users\yoicks\vimfiles\bundle')
call pathogen#infect()


" plugin: supertab
"
"the best hit is selected so just press enter 
let g:SuperTabLongestHighlight = 1                         
let g:SuperTabDefaultCompletionType = "context"

" plugin: clang_complete
" https://github.com/Rip-Rip/clang-complete
"
" clang_complete will not automatic set the hole word
" so it is possible to keep on tiping the word
set completeopt=longest,menuone

let g:clang_use_library = 1
let g:clang_complete_auto = 0
let g:clang_complete_copen = 1
let g:clang_debug = 0
" path to libclang.so
let g:clang_library_path = "/usr/lib/llvm-3.4/lib/"

" sonst Verhalten wie vi
set nocompatible			
" maximiert starten
" au GUIEnter * simalt ~x


" Achtung unter Windows nicht meine_farben.vim nennen
" auch wenn die Datei wirklich meine_farben.vim heisst
colorscheme fvdb
"colorscheme meine_farben_windows 

" die plugins fuer die einzelnen Dateien sind im plugin Ordner
" man sind das wieder geistreiche Kommentare
" so werden zB make files erkannt und die tabs nicht durch leer-
" zeichen ersetzt
filetype indent plugin on
"set ofu=syntaxcomplete " omnicompletion needs ctags

" add directories to your ctags lookup
" dont forget to run ctag in these directories
" cd /usr/include && ctags -R *
" or without the set tags settings here
" cd /myproject && ctags -R * /usr/include/*
"set tags+=C:\ctags <-- windows
"set tags+=/usr/include/tags
" ----------------------------------------------------------------
" --                    Tastenkuerzel Hilfe                     -- 
" --            fuer Tasten unter :help keycodes                --
" ----------------------------------------------------------------
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" and lets make these all work in insert mode too 
" ( <C-O> makes next cmd happen as if in command mode )
imap <C-W> <C-O><C-W>

map <c-RIGHT> :tabn<CR>
map <c-LEFT>  :tabp<CR>



" imap <F3> <cr><Up>#ifdef DEBUG<Down><End><cr>#endif
imap jj <Esc>
" :e means reedit the file; usefull if the current file has been changed
" outside of Vim
" map <F3>:e <Return>
" imap <F3> <Esc>:e <Return>


"map <F8> :w<Return>:!python3 % <Return> 

" geht
"imap <F8> <Esc>:w<Return><Esc>:!clear &&  python3 % <Return>


map <F2> :w<Return><Esc>:!clear && make <Return>
imap <F2> <Esc>:w<Return><Esc>:!clear && make <Return>

"map <F3> :w<Return><Esc>:! python3 % >> %<Return>:! echo ''' >> % <Return> :e<Return>
"imap <F3> <Esc>:w<Return><Esc>:! python3 % >> %<Return>:! echo ''' >> % <Return> :e<Return>

"map <F4> :w<Return><Esc>:!clear && python3 % <Return>
"imap <F4> <Esc>:w<Return><Esc>:!clear &&  python3 % <Return>


" %:r root of the filename
" %< current file name without extension
" help: %:r to see more
"

autocmd filetype c map <F8> :w<Return><Esc>:!clear && gcc %  -Wextra -pedantic -O -std=c99 -lm -o %:r.out && ./%:r.out <Return>
autocmd filetype c imap <F8> <Esc>:w<Return><Esc>:!clear && gcc %  -Wextra -pedantic -O -std=c99 -lm -o %:r.out && ./%:r.out <Return>

" this seems to work
" the program is compiled to *.out 
autocmd filetype cpp map <F8> :w<Return><Esc>:!clear && clang++ % -Wextra -Weffc++ -pedantic -O -std=c++0x -o %:r.out && ./%:r.out <Return>
autocmd filetype cpp imap <F8> <Esc>:w<Return><Esc>:!clear && clang++ % -Wextra -Weffc++ -pedantic -O -std=c++0x -o .%:r.out && ./%:r.out <Return>


autocmd filetype cpp map <F9> :w<Return><Esc>:!clear && clang++ % -Wextra -Weffc++ -pedantic -O -std=c++0x -o %:r && ./%:r >> %<Return> :e <Return>
autocmd filetype cpp imap <F9> <Esc>:w<Return><Esc>:!clear && clang++ % -Wextra -Weffc++ -pedantic -O -std=c++0x -o %:r && ./%:r >> %<Return> :e <Return>

" python 3
"autocmd filetype python map <F8> :w<Return><Esc>:!clear && python3 % <CR>  
"autocmd filetype python imap <F8> <Esc>:w<Return><Esc>:!clear &&  python3 %<CR>
" python2
autocmd filetype python map <F8> <Esc>:w<Return><Esc>:!clear && python % <CR>
autocmd filetype python imap <F8> <Esc>:w<Return><Esc>:!clear &&  python %<CR>
" F11 fullscreen in gnome3

"map <F12> :w<Return><Esc>:!g++ % -Wall -O -pedantic -std=c++0x -o %:r.exe && %:r.exe >> % <Return>
"imap <F12> <Esc>:w<Return><Esc>:!g++ % -Wall -O -pedantic -std=c++0x -o %:r.exe && %:r.exe >> % <Return>
"map <F6> :w <Return>
"imap <F6> <Esc>:w<Return><Esc>:!dir<Return>
" ----------------------------------------------------------------

" better syntax for asm see gas.vim on www.vim.org/scripts
" copy to syntax and add this line to the end of your sourcecode file
" without the comment sign "
" /* vim: ft=gas :

" map ctrl-l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"
"erlang uses 4 spaces
"au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4
"
"make python follow pep8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" hightlight characters behind the 80 chars margin
" geht nicht
" :au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

" einschalten
"set spell
" sprache englisch und deutsch
"set spelllang=en,de

" set guifont=Lucida_Sans_Unicode_Standard:h18
" set guifont=courier_new:h14
"set guifont=monospace:h14

" in der Statuszeile sehen ob Einfuege-, Visueller- oder Kommonadomodus 
set showmode

" damit statusline in single window sichtbar ist
set laststatus=2

" meine statusline
"set statusline=lin:%l\ col:%c%V\ %P\ %<%F%h%m%r%h%w%y
"set statusline=lin:%l\ col:%c\ %P\ %<%F%h%m%r%h%w%y

" menu anzeigen mit :menu
" menu bar aus
set guioptions-=m
" remove toolbar
"set guioptions-=T
" Zeilennummern anzeigen
set number

" sichtbarer Cursor
"set cursorline

" Einagbe erscheint rechts unten in der Zeile damit man nicht blind tippt
set showcmd

" Zeilen und Zeichennummer unten rechts anzeigen
" set ruler

" set backspace=indent,start,eol eol weggenommen
" damit backspace nicht die vorherige zeike ueberlauft
set backspace=indent,start
								
set report=0

set noerrorbells

set wrapscan

" menu completion in command mode on <Tab>
set wildmenu
"" Complete only the first match.

"full" Complete the next full match.  After the last match, the original string is used and then the first match again.

"longest" Complete till longest common string.  If this doesn't result in a longer string, use the next part.

"longest:full" Like "longest", but also start 'wildmenu' if it is enabled.

"list" When more than one match, list all matches.

"list:full" When more than one match, list all matches and complete first match.

"list:longest" When more than one match, list all matches and complete till longest common string.

set wildmode=list:longest,list:full

" ignoriert Gross- und klein Buchstaben bei der Suche
set ignorecase	

" wenn bei der Suche Grossbuchstaben angegeben werden, dann wird ignorecase ausgeschaltet
set smartcase
set incsearch

" gefundene Suchbegriffe werden markiert
set hlsearch 

" Tabstop entspricht 4 Leerzeichen
set tabstop=4			
set expandtab

" Syntaxeinrueckung um 4 Leerzeichen
set shiftwidth=4	

" rundet Syntaxeinrueckungen beim > und < Kommando (VisuellerModus) auf ein vielfaches von shiftwight
set shiftround

" beim Tippen schliessender Klammer springt der Cursor zur oeffnenden Klammer
set showmatch

" einruecken fuer C-Syntax
set cindent 

" Einr�ckung der vorherigen Zeile erhalten
set autoindent		

set mouse=a " Maus einschalten fuer visuellen Modus
        " mit dem Zeiger ueber zu markierenden Bereich
        " oder Doppelklick um ein Wort zu markieren
        " oder 3 mal klicken um eine ganze Zeile zu
        " markieren

" vestecke die maus wenn text eingegeben wird
set mousehide	

" keine backupdateien anlegen
set nobackup
set nowb
set noswapfile


" directories for swp files
" set backupdir=~/.vimbackup
" set directory=~/.vimbackup


" keep 3 context lines above and below the cursor
set scrolloff=8

" Farben und Faltungen (Syntax einschalten)
syntax enable	


" wenn ich eine Datei mit einem anderen tool aender dann autoread
set autoread 

" Methode der Faltungen set fdm=(manual|syntax)
"set foldmethod=syntax
set foldmethod=indent
set foldlevel=99 " don't fold by default
"
"set wildmode=list:longest,list:full


"set diffexpr=MyDiff()
"function MyDiff()
"let opt = '-a --binary '
"if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"let arg1 = v:fname_in
"if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"let arg2 = v:fname_new
"if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"let arg3 = v:fname_out
"if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"let eq = ''
"if $VIMRUNTIME =~ ' '
"if &sh =~ '\<cmd'
"    let cmd = '""' . $VIMRUNTIME . '\diff"'
"    let eq = '"'
"else
"    let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"endif
"else
"let cmd = $VIMRUNTIME . '\diff'
"endif
"silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction


" when a file is opened, jump to the last position into the file
if has("autocmd")
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
  endif
