" Fitxer de configuració del vim
"
set nocompatible "permitir funciones avanzadas 
set encoding=utf-8
set mouse=a

map <TAB> gt
map <S-TAB> gT


"MAPEAR TAB PARA AUTOINDENT
function! Smart_TabComplete()
    let line = getline('.')                         " current line

    let substr = strpart(line, -1, col('.')+1)      " from the start of the current
    " line to one character right
    " of the cursor
    let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
    if (strlen(substr)==0)                          " nothing to match on empty string
        return "\<tab>"
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"                         " existing text matching
    elseif ( has_slash )
        return "\<C-X>\<C-F>"                         " file matching
    else
        return "\<C-X>\<C-O>"                         " plugin matching
    endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

inoremap <F3> <c-o>:w<cr>
map <F3> :w<cr>
map <C-a> o <ESC>
map <F8> :noh <CR>
" map <F7> :w <CR> | :!rst2pdf % <CR>
map <C-l> :!clear <CR>
syntax on
set autoindent


" colors
colorscheme delek
" colorscheme desert
" colorscheme darkburn
"
" coding
set filetype        " filetype detection on
filetype plugin on  " plugin detection
set autochdir       " always switch to the current file directory
set number          " line numbers
set hlsearch        " highlight search
set incsearch       " show search matches while typing
set showmatch       " show matching elements
set ignorecase      " case unsensitive search
set smartcase       " if there are caps go case-sensitive
set history=2000    " history length
set showcmd         " show mode
" set list            " show hidden chars
"set listchars=tab:^T,eol:·	" hidden chars representation
set listchars=tab:→\ ,trail:·,extends:>,eol:¶" hidden chars representation
set statusline=%F%m%h%w\ [%p%%]
set clipboard=unnamed " advanced clipboard
set omnifunc=syntaxcomplete#Complete     " autocomplete function
set completeopt=menu,preview " autocomplete function
set wildmenu        " command-line completion
set scrolloff=3     " lines before EOF
"
set autoindent      " code autoindent
filetype indent on  " detection of indentation scripts
set smartindent     " advanced indent
set backspace=indent,eol,start
set tabstop=4       " tab with
set shiftwidth=4    " tabs
set softtabstop=4   " tabs
set expandtab       " don't use real tabs
"
" backups
set backup           " backup files
set backupdir=~/tmp/vitmp,. " backup files
set directory=~/tmp/vitmp,. " swap files
"
" map
" up/down keys move one line not paragraph
map <Up> gk
map <Down> gj
"
" reload when source changes
checktime
set autoread
autocmd FileType * Tcolorscheme delek
autocmd FileType rst call SetRstOptions()
autocmd FileType c call SetCOptions()
autocmd FileType java call SetJavaOptions()
autocmd FileType html call SetHtmlOptions()
autocmd FileType php call SetPhpOptions()
autocmd FileType js call SetJsOptions()

function SetRstOptions()
    Tcolorscheme delek
    map <F7> :!rst2pdf % <CR>
endfunction
function SetCOptions()
    Tcolorscheme molokai
    map <F7> :!gcc -Wall -o %< % && ./%< <CR>
endfunction
function SetJavaOptions()
    Tcolorscheme 256-jungle
    map <F7> :!javac % && java %< <CR>
endfunction
function SetHtmlOptions()
    Tcolorscheme shine
    map <F7> :!google-chrome % <CR>
endfunction
function SetPhpOptions()
    Tcolorscheme shine
endfunction
function SetJsOptions()
    Tcolorscheme shine
    map <F7> :call CreaHtmlParaJs() <CR>
endfunction
function CreaHtmlParaJs()
    :!cat $Disco/plantilla/htmlHead.html > ./%<.html 
    :!echo "<scipt type='text/javascript' src='./%'/>" >> ./%<.html 
    :!cat $Disco/plantilla/htmlTail.html >> ./%<.html 
    :!google-chrome %<.html 
endfunction

"
" Some filetype distinctions
"autocmd Filetype rst set textwidth=70
"autocmd Filetype rst set formatoptions-=q   " to avoid considering * as comments
"autocmd Filetype rst behave mswin           " allow ctrl-shif selection
"autocmd Filetype rst set spell              " spell check on
"autocmd Filetype rst set spelllang=ca       " spell language catalan
" considera comentaris només per la primera línia.
"
"autocmd Filetype rst set comments=fb:-,fb:*,fb://
"if has("autocmd")
"    autocmd FileType python set complete+=k/home/shakir/.vim/pydiction-0.5/pydiction isk+=.,(
"endif  
"has("autocmd

" share clipboard vim from-to X Window 
" following http://www.reddit.com/r/vim/comments/m9tcz/ask_rvim_anyone_successfully_mapped_yankpaste/
if has('unnamedplus') 
    set clipboard=unnamedplus,autoselect " Use + register (X Window clipboard) as unnamed register
endif
" Elimina la toolbar
set guioptions-=T
"
" Afegeix un $ al final del text afectat per una comanda (c)hange
set cpoptions+=$
"
" càrrega de templates (si existeixen)
"autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl
"
" maps per saltar entre marques dels templates <+MARCA+>
"nnoremap <c-Tab> /<+.\{-1,}+><cr>c/+>/e<cr>
"inoremap <c-Tab> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>

