set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
 Plugin 'gmarik/Vundle.vim'

 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " plugin on GitHub repo
 Plugin 'tpope/vim-fugitive'
 " plugin from http://vim-scripts.org/vim/scripts.html
 Plugin 'L9'
 " Git plugin not hosted on GitHub
 Plugin 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 "Plugin 'file:///home/gmarik/path/to/plugin'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
 " To get plugins from Vim Scripts, you can reference the plugin
 " by name as it appears on the site
 
 Plugin 'Buffergator'
 Plugin 'JavaRun'
 Plugin 'JavaScript-Indent'
 Plugin 'JavaScript-syntax'
 Plugin 'Javascript-OmniCompletion-with-YUI-and-j'
 Plugin 'PHP-correct-Indenting'
 Plugin 'PHPcollection'
 Plugin 'html_FileCompletion'
 Plugin 'java_fold'
 Plugin 'javacomplete'
 Plugin 'javaimports.vim'
 Plugin 'php.vim'
 Plugin 'phpcomplete.vim'
 Plugin 'phpfolding.vim'
 Plugin 'open-terminal-filemanager'
 Plugin 'basic-colors'
 Plugin 'ColorX'
 Plugin '285colors-with-az-menu'
 Plugin 'Simple-R-Omni-Completion'
 Plugin 'Syntastic'
 Plugin 'Tagbar'
 Plugin 'pathogen.vim'
 Plugin 'eclm_wombat.vim'
 "Plugin 'SnippetComplete'
 Plugin 'AutoComplPop'
Plugin 'The-NERD-tree'
"Plugin 'snippets.vim'
Plugin 'snipMate'
Plugin 'git://github.com/moiatgit/vim-rst-sections.git'

 call vundle#end()
" " Now we can turn our filetype functionality back on
 filetype plugin indent on
 syntax on
 "color simple256
 color calmar256-dark
 set encoding=utf-8
 set autoindent
 set mouse=a
 set filetype        " filetype detection on
 set autochdir       " always switch to the current file directory
 set number          " line numbers
 set hlsearch        " highlight search
 set incsearch       " show search matches while typing
 set showmatch       " show matching elements
 set ignorecase      " case unsensitive search
 set smartcase       " if there are caps go case-sensitive
 set history=2000    " history length
 set showcmd         " show mode
 set listchars=tab:▸\ ,eol:¬
 "set statusline=%F%m%h%w\ [%p%%]
 set clipboard=unnamed " advanced clipboard
 set omnifunc=syntaxcomplete#Complete     " autocomplete function
 set completeopt=menu,preview " autocomplete function
 set wildmenu        " command-line completion
 set scrolloff=3     " lines before EOF
 "
 set autoindent      " code autoindent
 set smartindent     " advanced indent
 set backspace=indent,eol,start
 set tabstop=4       " tab with
 set shiftwidth=4    " tabs
 set softtabstop=4   " tabs
 set expandtab       " don't use real tabs
 "
 " backups
 "
 " map
 " up/down keys move one line not paragraph
 map <Up> gk
 map <Down> gj
 map <tab> gt
 map <S-tab> gT
 "
 " reload when source changes
 checktime
 set autoread
 let mapleader=','
 "
 " Some filetype distinctions
 "autocmd Filetype rst set textwidth=70
 "autocmd Filetype rst set formatoptions-=q   " to avoid considering * as comments
 "autocmd Filetype rst behave mswin           " allow ctrl-shif selection
 "autocmd Filetype rst set spell              " spell check on
 "autocmd Filetype rst set spelllang=ca       " spell language catalan
 " considera comentaris nomÃ©s per la primera lÃ­nia.
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
 "set guioptions-=T
 "
 " Afegeix un $ al final del text afectat per una comanda (c)hange
 set cpoptions+=$

 ""MAPEAR TAB PARA AUTOINDENT
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


 set showcmd
 set showmatch
 set showmode
 set incsearch
 set ruler


 " Add and delete spaces in increments of `shiftwidth' for tabs
 set smarttab

 " Highlight syntax in programming languages
 syntax on

 " In Makefiles, don't expand tabs to spaces, since we need the actual tabs
 autocmd FileType make set noexpandtab

 " Useful macros for cleaning up code to conform to LLVM coding guidelines

 " Delete trailing whitespace and tabs at the end of each line
 command! DeleteTrailingWs :%s/\s\+$//

 " Convert all tab characters to two spaces
 command! Untab :%s/\t/  /g

 " Enable pathogen
 "call pathogen#infect()
 call pathogen#runtime_append_all_bundles()
 call pathogen#helptags()
 " Enable pathogen
 call pathogen#infect()
 " call pathogen#runtime_append_all_bundles()
 call pathogen#helptags()


 """ Functions

 function! ConditionalPairMap(open, close)
     let line = getline('.')
     let col = col('.')
     if col < col('$') || stridx(line, a:close, col + 1) != -1
         return a:open
     else
         return a:open . a:close . repeat("\<left>", len(a:close))
     endif
 endf
 """ End Functions

 syntax enable
 if !has('gui_running')
     " Compatibility for Terminal
     let g:solarized_termtrans=1

     if (&t_Co >= 256 || $TERM == 'xterm-256color')
         " Do nothing, it handles itself.
     else
         " Make Solarized use 16 colors for Terminal support
         let g:solarized_termcolors=16
     endif
 endif
 """ Colorschemes
 "colorscheme solarized
 hi Normal ctermbg=NONE
 set background=dark
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif

 " Folds
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif

 set foldmethod=indent
 set foldlevel=99

 " SuperTab plugin

 au FileType python set omnifunc=pythoncomplete#Complete
 let g:SuperTabDefaultCompletionType = "context"

 set completeopt=menuone,longest,preview





 " Delete trailing whitespace and tabs at the end of each line
 command! DeleteTrailingWs :%s/\s\+$//

 " Convert all tab characters to two spaces
 command! Untab :%s/\t/  /g



 " NERDTree
 map <F2> :NERDTreeToggle<CR>
 "Enable Ctrl+P to paste
 map <C-Y> :set paste<CR>
 " Moving around windows
 map <c-j> <c-w>j
 map <c-k> <c-w>k
 map <c-l> <c-w>l
 map <c-h> <c-w>h
 map <leader>vimrc :tabe ~/.vimrc<cr>
 map <leader>bashrc :tabe ~/.bashrc<cr>
 nmap <F12> :TagbarToggle<CR>
 :map <M-Esc>[62~ <MouseDown> 
 :map! <M-Esc>[62~ <MouseDown> 
 :map <M-Esc>[63~ <MouseUp> 
 :map! <M-Esc>[63~ <MouseUp> 
 :map <M-Esc>[64~ <S-MouseDown> 
 :map! <M-Esc>[64~ <S-MouseDown> 
 :map <M-Esc>[65~ <S-MouseUp> 
 :map! <M-Esc>[65~ <S-MouseUp>
 " Moving around windows
 "map <c-j> <c-w>j
 "map <c-k> <c-w>k
 "map <c-l> <c-w>l
 "map <c-h> <c-w>h

 " NERDTree
 map <F2> :NERDTreeToggle<CR>
 "Enable Ctrl+P to paste
 map <C-y> :set paste<CR>


 " Let's remember some things, like where the .vim folder is.
 "if has("win32") || has("win64")
 "    let windows=1
 "    let vimfiles=$HOME . "/vimfiles"
 "    let sep=";"
 "else
 "    let windows=0
 "    let vimfiles=$HOME . "/.vim"
 "    let sep=":"
 "endif

 " Folds
 set foldmethod=indent
 set foldlevel=99

 "if has("gui_running")
 set cursorline                  "Highlight background of current line
 "autocmd VimEnter * NERDTree     "run nerdtree
 "autocmd VimEnter * TagbarOpen

 " Show tabs and newline characters with ,s
 nmap <Leader>s :set list!<CR>
 set listchars=tab:▸\ ,eol:¬
 "Invisible character colors
 highlight NonText guifg=#4a4a59
 highlight SpecialKey guifg=#4a4a59
 "endif

 "if has("gui_macvim") "Use Experimental Renderer option must be enabled for transparencY
 let s:uname = system("uname")
 if s:uname == "Darwin\n"
     set guifont=Menlo\ for\ Powerline:h14
 endif
 map <SwipeLeft> :bprev<CR>
 map <SwipeRight> :bnext<CR>
 "endif

 if filereadable($HOME.'/.vimrc_local')
     source $HOME/.vimrc_local
 endif

 " Syntax highlighting for clojurescript files
 autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
 " For statusline
 set encoding=utf-8
 set t_Co=256
 autocmd bufwritepost .vimrc source $MYVIMRC

 " Go tags

 let g:tagbar_type_go = {
             \ 'ctagstype' : 'go',
             \ 'kinds'     : [
             \ 'p:package',
             \ 'i:imports:1',
             \ 'c:constants',
             \ 'v:variables',
             \ 't:types',
             \ 'n:interfaces',
             \ 'w:fields',
             \ 'e:embedded',
             \ 'm:methods',
             \ 'r:constructor',
             \ 'f:functions'
             \ ],
             \ 'sro' : '.',
             \ 'kind2scope' : {
             \ 't' : 'ctype',
             \ 'n' : 'ntype'
             \ },
             \ 'scope2kind' : {
             \ 'ctype' : 't',
             \ 'ntype' : 'n'
             \ },
             \ 'ctagsbin'  : 'gotags',
             \ 'ctagsargs' : '-sort -silent'
             \ }
 set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*
 map <F8> :noh <CR>
 au FileType rst call SetRSTOptions()
 au FileType java call SetJavaOptions()

 function! SetRSTOptions()
    map <F7> :!rst2pdf % <CR>
 endfunction
 function! SetJavaOptions()
    map <F7> :!javac % && java %< <CR>
 endfunction
