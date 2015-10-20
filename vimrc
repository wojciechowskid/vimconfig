set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ***** Plugins *****
" ### a Git wrapper ###
Plugin 'tpope/vim-fugitive'

" ### gitv ###
" gitv is a 'gitk clone' plugin for the text editor Vim
Plugin 'gregsexton/gitv'

" ### Easy motion ###
" if you're looking for an "o", you can use the f motion. Type <Leader><Leader>fo, and all "o" characters are highlighted
Plugin 'Lokaltog/vim-easymotion'

" ### A parser for a condensed HTML format ###
"  Type in something (e.g. #header > h1), then press <C-E> whilst in insert mode to expand to HTML
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"JavaScript bundles:
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'

"Closing brackets, quotes, etc:
Plugin 'Raimondi/delimitMate'
"inserts empty line between braces on ENTER:
"imap <C-c> <CR><Esc>O


Plugin 'scrooloose/syntastic'
" This does what it says on the tin. It will check your file on open too, not just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
" this requires $ sudo npm install -g jshint    globally, which provide you
" with JSLint

Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
let g:jedi#documentation_command = "<C-K>"

" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

Plugin 'marijnh/tern_for_vim'

"Powerline for showing git current branch in git:
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Powerline setup
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
" set laststatus=2

" ### Airline ###
Plugin 'bling/vim-airline'
set laststatus=2

Plugin 'scrooloose/nerdtree'
nmap <silent> <F3> :NERDTreeToggle<CR>

" ### NERDCommenter ###
" Allows easily comment code blocks
Plugin 'scrooloose/nerdcommenter'


"I don't know if it conflicts with Jedi from YouCompleteMe
Plugin 'klen/python-mode'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'

" ### CtrlP ###
Plugin 'kien/ctrlp.vim'
"mapping to <C-p>:
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'
" setting a starting directory:
let g:ctrlp_working_path_mode = 'ra'


" One needs somethink like SnipMate
" Optional:
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/ultisnips'

" ### vimwiki ###
Plugin 'vimwiki/vimwiki'




Plugin 'fholgado/minibufexpl.vim'

" All of your Plugins must be added before the following line
call vundle#end()

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..
" Put your non-Plugin stuff after this line


let g:snippets_dir = '~/.vim/bundle/vim-snippets/snippets'
" declare global configuration dictionary so that config options can be added:
let g:UltiSnips = {}

" customize mappings, eg use snipmate like behaviour
let g:UltiSnips.ExpandTrigger = "<c-j>"
" " It does make sense to not use <tab> here, use UltiSnips default <c-j>
" " let g:UltiSnips.JumpForwardTrigger = "<tab>"
" let g:UltiSnips.JumpBackwardTrigger = "<c-k>"

" Now its time to tell UltiSnips about which snippets to load.
" You do so for snipmate snippets and UltiSnips snippets individually.
" This example illustrates a setup loading snipmate snippets.

" See plugin/UltiSnips.vim, it has much additional documentation.
" Assuming you're not overrding default implemenation the default
" VimL function SnippetFilesForCurrentExpansionDefaultImplementation


" == UltiSnips snippets ==
" Because I want to use the snippet snippets 'default' does not load
" filetype.snippets snippet files. 'all' reperesents the snippets like box
" which are meant to be present always. (snipmate was using _ for this)
" For cpp, already all snippets have been converted to UltiSnips, so use
" those - but only the one provided by my ~/.vim direcotry.
let g:UltiSnips.UltiSnips_ft_filter = {
            \ 'default' : {'filetypes': ['all'] },
            \ 'all' : {'filetypes': ['all'] },
            \ 'cpp' : {'filetypes': ['cpp'], 'dir-regex': '[._]vim/UltiSnips$' },
            \ }
" you may want to replace ['all'] by ['all','FILETYPE'] in order to load
" all snippets - If you load all snipmate-snippets and UltiSnips snippets
" you may also want to set always_use_first_snippet configuration option to
" 1 like this:
let g:UltiSnips.always_use_first_snippet = 1

" == snipmate snippets ==
" For any other filetype do what I used in the past: snipmate-snippets
" repo (must be added to runtimepath)
" _ represents snipmate snippets which are present always
let g:UltiSnips.snipmate_ft_filter = {
            \ 'default' : {'filetypes': ["FILETYPE", "_"] },
            \ 'html' : {'filetypes': ["html", "javascript", "_"] },
            \ 'xhtml' : {'filetypes': ["xhtml", "html", "javascript", "_"] },
            \ 'cpp' : {'filetypes': [] },
            \ }

" Please mind that




set t_Co=256
set background=dark
"colorscheme distinguished
"
"max 120 symbols line width for python files:
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"folding
set foldmethod=indent
set nofoldenable    " disable auto folding"
" Don't autofold code
let g:pymode_folding = 0

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬

" automatically change window's cwd to file's dir
" set autochdir

" more subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif

set  number " Turn on line numbers:
set expandtab       " tabs are converted to spac
set tabstop=4       " numbers of spaces of tab character
set autoindent      " Always  set auto indenting on
set shiftwidth=4    " numbers of spaces to (auto)indent
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set numberwidth=4   " line numbering takes up 5 spaces
set ignorecase      " ignore case when searching
set nowrap          " stop lines from wrapping
syntax on     " syntax highlighing
filetype plugin indent on    " enable loading indent file for filetype
filetype plugin on

" Swap files and backups are annoying but can save you a lot of trouble. Rather than spread them all around your filesystem, isolate them to a single directory:
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" It’s often useful to know where you are in a buffer, but full line numbering is distracting. Setting the option below is a good compromise. Now in the bottom right corner of the status line there will be something like: 529, 35 68%, representing line 529, column 35, about 68% of the way to the end.
set ruler
set selectmode=mouse " select when using the mouse
":colorscheme
"colorscheme desert

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
" I like this as it makes reading texts easier (for me, at least).
set joinspaces

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" Omnicompletion functions
"set ofu=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd BufNewFile,BufRead *.less set ft=less.css
"au FileType py set expandtab
"au FileType py set foldmethod=indent
"set completeopt+=longest
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif



"Smart Home mapping
noremap <expr> <silent> <Home> col('.') == match(getline('.'), '\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>



"PyFlakes notifies about unused imports and invalid syntax. Here is the setting disabling the quickfix window
let g:pyflakes_use_quickfix = 0

"PEP8 - validates code across all projects. Here is key mapping to jump to each violation in the quickfix window
let g:pep8_map='<leader>8'

"Ack -- to fuzzy text  search anything in the code
nmap <leader>a <Esc>:Ack!


"Makegreen
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

"py.test
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

"for autocomplpop
"let g:acp_behaviorSnipmateLength=1

" ########### GENERAL SETTINGS ###############
"set wildmode=longest,list



"++++++++++ REPLACEMENTS AND BINDINGS +++++++++
"type ";" to invoke ":"
map ; :
"invoke TaskList
map <leader>td <Plug>TaskList
"Binding for Gungo -- Revision History
map <leader>g :GundoToggle<CR>
"navigating between buffers. Press F5
:nnoremap <F5> :buffers<CR>:buffer<Space>

"navigating between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

" Buffer naviation
map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>

" Select all.
map <c-a> ggVG

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
