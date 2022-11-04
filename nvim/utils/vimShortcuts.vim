
" Source your .vimrc

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" set leader key
let g:mapleader = " "

syntax enable                           " Enables syntax highlighing
set number relativenumber
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
"set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                          " Your working directory will always be the same as your working directory

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

xnoremap("<leader>p", "\"_dP")

" You can't stop me
cmap w!! w !sudo tee %

function! QWERTY()

    " I hate escape more than anything else
    inoremap jk <Esc>
    inoremap kj <Esc>

    " Easy CAPS
    " inoremap <c-u> <ESC>viwUi
    " nnoremap <c-u> viwU<Esc>


    " Better nav for omnicomplete
    " inoremap <expr> <c-j> ("\<C-n>")
    " inoremap <expr> <c-k> ("\<C-p>")

    " Use alt + hjkl to resize windows
    "nnoremap <M-j>    :resize -2<CR>
    "nnoremap <M-k>    :resize +2<CR>
    "nnoremap <M-h>    :vertical resize -2<CR>
    "nnoremap <M-l>    :vertical resize +2<CR>

endfunction

" Colmak
function! Colemak()
    " Description {{{
    "   Original by Shai Coleman, 2008-04-21.  http://colemak.com/
    "   Modified by Esko, 2012-09-14.
    "
    "   Load colemak.vim after all other Vim scripts.
    "
    "   Refer to ../README.markdown for keymap explanations.
    " }}}
    " Require Vim >=7.0 {{{
        if v:version < 700 | echohl WarningMsg | echo "colemak.vim: You need Vim version 7.0 or later." | echohl None | finish | endif
    " }}}
    " Up/down/left/right {{{
        nnoremap m h|xnoremap m h|onoremap m h|
        nnoremap n j|xnoremap n j|onoremap n j|
        nnoremap e k|xnoremap e k|onoremap e k|
        nnoremap i l|xnoremap i l|onoremap i l|
    " }}}
    " Words forward/backward {{{
        " l/L = back word/WORD
        " u/U = end of word/WORD
        " y/Y = forward word/WORD
        nnoremap l b|xnoremap l b|onoremap l b|
        nnoremap L B|xnoremap L B|onoremap L B|
        nnoremap u e|xnoremap u e|onoremap u e|
        nnoremap U E|xnoremap U E|onoremap U E|
        nnoremap y w|xnoremap y w|onoremap y w|
        nnoremap Y W|xnoremap Y W|onoremap Y W|
        cnoremap <C-L> <C-Left>
        cnoremap <C-Y> <C-Right>
    " }}}
    " inSert/Replace/append (T) {{{
        nnoremap s i|
        nnoremap S I|
        nnoremap t a|
        nnoremap T A|
    " }}}
    " Change {{{
        nnoremap w c|xnoremap w c|
        nnoremap W C|xnoremap W C|
        nnoremap ww cc|
    " }}}
    " Cut/copy/paste {{{
        nnoremap x x|xnoremap x d|
        nnoremap c y|xnoremap c y|
        nnoremap v p|xnoremap v p|
        nnoremap X dd|xnoremap X d|
        nnoremap C yy|xnoremap C y|
        nnoremap V P|xnoremap V P|
        nnoremap gv gp|xnoremap gv gp|
        nnoremap gV gP|xnoremap gV gP|
    " }}}
    " Undo/redo {{{
        nnoremap z u|xnoremap z :<C-U>undo<CR>|
        nnoremap gz U|xnoremap gz :<C-U>undo<CR>|
        nnoremap Z <C-R>|xnoremap Z :<C-U>redo<CR>|
    " }}}
    " Visual mode {{{
        nnoremap a v|xnoremap a v|
        nnoremap A V|xnoremap A V|
        nnoremap ga gv
        " Make insert/add work also in visual line mode like in visual block mode
        xnoremap <silent> <expr> s (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
        xnoremap <silent> <expr> S (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
        xnoremap <silent> <expr> t (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")
        xnoremap <silent> <expr> T (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")
    " }}}
    " Search {{{
        " f/F are unchanged
        nnoremap p t|xnoremap p t|onoremap p t|
        nnoremap P T|xnoremap P T|onoremap P T|
        nnoremap b ;|xnoremap b ;|onoremap b ;|
        nnoremap B ,|xnoremap B ,|onoremap B ,|
        nnoremap k n|xnoremap k n|onoremap k n|
        nnoremap K N|xnoremap K N|onoremap K N|
    " }}}
    " inneR text objects {{{
        " E.g. dip (delete inner paragraph) is now drp
        onoremap r i
    " }}}
    " Folds, etc. {{{
        nnoremap j z|xnoremap j z|
        nnoremap jn zj|xnoremap jn zj|
        nnoremap je zk|xnoremap je zk|
    " }}}
    " Overridden keys must be prefixed with g {{{
        nnoremap gX X|xnoremap gX X|
        nnoremap gK K|xnoremap gK K|
        nnoremap gL L|xnoremap gL L|
    " }}}
    " Window handling {{{
        nnoremap <C-W>h <C-W>h|xnoremap <C-W>h <C-W>h|
        nnoremap <C-W>n <C-W>j|xnoremap <C-W>n <C-W>j|
        nnoremap <C-W>e <C-W>k|xnoremap <C-W>e <C-W>k|
        nnoremap <C-W>i <C-W>l|xnoremap <C-W>i <C-W>l|
    " }}}

endfunction

" https://www.xudongz.com/blog/2017/vim-colemak/
function! Colemak2()
    noremap d d
    noremap e k
    noremap f e
    noremap g t
    noremap h m
    noremap i l
    noremap j y
    noremap k n
    noremap l u
    noremap n j
    noremap m h
    noremap o p
    noremap p r
    noremap r s
    noremap s d
    noremap t f
    noremap u i
    noremap y o
    noremap D D
    noremap E K
    noremap F E
    noremap G T
    noremap H M
    noremap I L
    noremap J Y
    noremap K N
    noremap L U
    noremap N J
    noremap H M
    noremap O P
    noremap P R
    noremap R S
    noremap S D
    noremap T F
    noremap U I
    noremap Y O
endfunction



"call Colemak2()
call QWERTY()

