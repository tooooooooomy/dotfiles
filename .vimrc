syntax on
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

"-------------------------------------------------
" Auto Reload
"-------------------------------------------------
" Set augroup.
augroup MyAutoCmd
    autocmd!
augroup END

if !has('gui_running') && !(has('win32') || has('win64'))
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
                \if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif

"-------------------------------------------------
" NeoBundle
"-------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundle 'amdt/vim-niji'
NeoBundle 'einars/js-beautify'
NeoBundle 'evidens/vim-twig'
NeoBundle 'groenewege/vim-less'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'scrooloose/syntastic'
if has('lua')
    NeoBundle 'Shougo/neocomplete'
else
    NeoBundle 'Shougo/neocomplcache'
endif
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'sudo.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/autodate.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'JSON.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'fatih/vim-go'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'thinca/vim-themis'
NeoBundle 'kazu9su/lets-enjoy-vim-script'
NeoBundle 'kchmck/vim-coffee-script'
:setl omnifunc=jscomplete#CompleteJS

if has('vim_starting')
  call neobundle#end()
endif


filetype on
filetype plugin indent on     " required!

" neocomplcache
" -------------------------------------
let g:neocomplcache_enable_at_startup = 1
" 大文字小文字区別の有効化
let g:neocomplcache_smartcase = 1
" キャメルケース補完の有効化
let g:neocomplcache_enablecamelcasecompletion = 1
" アンダーバー補完の有効化
let g:neocomplcache_enableunderbarcompletion = 1
" 補完対象キーワードの最小長
let g:neocomplcache_min_syntax_length = 3
" プラグイン毎の補完関数を呼び出す文字数
let g:neocomplcache_plugincompletionlength = {
  \ 'keyword_complete' : 2,
  \ 'syntax_complete' : 2
  \ }
" ファイルタイプ毎の辞書ファイルの場所
let g:neocomplcache_dictionary_filetype_lists = { 
  \ 'default' : '', 
  \ }
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()

" neosnippet
"-------------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" quick run
"-------------------------------------------------
"初期化
let g:quickrun_config = {}

"vimproc
let g:quickrun_config['_'] = {}
let g:quickrun_config['_']['runner'] = 'vimproc'
let g:quickrun_config['_']['runner/vimproc/updatetime'] = 100

""phpunit
"augroup QuickRunPHPUnit
"  autocmd!
"  autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.unit
"augroup END
"let g:quickrun_config['php.unit'] = {}
""let g:quickrun_config['php.unit']['outputter/buffer/split'] = 'vertical 35'
"let g:quickrun_config['php.unit']['command'] = 'phpunit'
"let g:quickrun_config['php.unit']['cmdopt'] = ''
"let g:quickrun_config['php.unit']['exec'] = '%c %o %s'

"prove
augroup QuickRunProve
  autocmd!
  autocmd BufWinEnter,BufNewFile *.t set filetype=perl.unit
augroup END
let g:quickrun_config['perl.unit'] = {}
let g:quickrun_config['perl.unit']['command'] = 'carton'
let g:quickrun_config['perl.unit']['cmdopt'] = 'exec -- prove --verbose -Ilib'
let g:quickrun_config['perl.unit']['exec'] = '%c %o %s'

"perl debug
let g:quickrun_config['perl'] = {}
let g:quickrun_config['perl']['command'] = 'carton'
let g:quickrun_config['perl']['cmdopt'] = 'exec -- perl -d ./local/bin/morbo index.pl'
let g:quickrun_config['perl']['exec'] = '%c %o %s'

"gosh
let g:quickrun_config['scm'] = {}
let g:quickrun_config['scm']['command'] = 'gosh'
let g:quickrun_config['scm']['cmdopt'] = ''
let g:quickrun_config['scm']['exec'] = '%c %o %s'

" unite.vim
"-------------------------------------------------
"call unite#custom_default_action('file', 'tabopen')
nnoremap <silent> <C-O><C-O> :<C-U>Unite -buffer-name=files file bookmark file/new<CR>
nnoremap <silent> <C-O><C-F> :<C-U>UniteWithBufferDir -buffer-name=files file bookmark file/new<CR>
nnoremap <silent> <C-O><C-N> :<C-U>Unite -buffer-name=files file/new<CR>
nnoremap <silent> <C-O><C-H> :<C-U>Unite -buffer-name=files file_mru<CR>
nnoremap <silent> <C-O> :<C-U>Unite -buffer-name=files file_mru<CR>
nnoremap <silent> <C-O><C-G> :<C-U>Unite -buffer-name=files buffer<CR>

"-------------------------------------------------
" setting
"-------------------------------------------------
set backspace=indent,eol,start
set browsedir=buffer
set clipboard=unnamed
set cursorline
set expandtab
set ffs=unix
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>_,trail:^
set nobackup
set nocompatible
set noswapfile
set novisualbell
set nowrapscan
set number
set pastetoggle=<F2>
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set statusline=%f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set wildmode=list:longest
set whichwrap=b,s,h,l,<,>,[,]
set tw=0

""-------------------------------------------------------------------------------
" Mapping <jump-tag>
"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------
" perl like express
nnoremap / /\v
vnoremap / /\v
noremap  
noremap!  
noremap <BS> 
noremap! <BS> 
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
nmap <silent> <C-{><C-{> :nohlsearch<CR><C-{>
" in normal mode, ; -> :
nnoremap ; :

map ,pt <Esc>:%! perltidy -se<CR>
map ,ptv <Esc>:'<,'>! perltidy -se<CR>
map ,phf <Esc>:%! phpcbf --standard=psr2<CR>
map ,phfv <Esc>:'<,'>! phpcbf --standard=psr2<CR>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html,php vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

"=== JSON tidy
map ,jt <Esc>:%call JsBeautify()<CR>
map ,jtv <Esc>:'<,'>call JsBeautify()<CR>

"----------------------------------------------------
" テンプレート補完
"----------------------------------------------------
autocmd BufNewFile * silent! 0r $HOME/.vim/template/skel.%:e
autocmd BufNewFile,BufReadPost Makefile,*.snip silent! setl noexpandtab
autocmd BufNewFile *.tx silent! setl ft=html
autocmd BufNewFile,BufReadPost *.yml,*.yaml silent! setl ft=txt
autocmd BufNewFile,BufReadPost *.html,*.rb,*.coffee,*.js,*.tx silent! setl shiftwidth=2 tabstop=2
au BufNewFile,BufRead *.tx set filetype=html

autocmd BufNewFile *.pm call s:pm_template()
au! BufWritePost *.pm call s:check_package_name()

autocmd! BufNewFile,BufRead *.psgi setf perl
"----------------------------------------------------
" Additional Functions
"----------------------------------------------------
" Directory creation
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}
set ts=4

" perl package name
function! s:pm_template()
    let path = substitute(expand('%'), '.*lib/', '', 'g')
    let path = substitute(path, '[\\/]', '::', 'g')
    let path = substitute(path, '\.pm$', '', 'g')

    call append(0, 'package ' . path . ';')
    call append(1, 'use common::sense;')
    call append(2, '')
    call append(3, '')
    call append(4, '')
    call append(5, '1;')
    call cursor(6, 0)
    " echomsg path
endfunction

function! s:get_package_name()
    let mx = '^\s*package\s\+\([^ ;]\+\)'
    for line in getline(1, 5)
        if line =~ mx
        return substitute(matchstr(line, mx), mx, '\1', '')
        endif
    endfor
    return ""
endfunction

function! s:check_package_name()
    let path = substitute(expand('%:p'), '\\', '/', 'g')
    let name = substitute(s:get_package_name(), '::', '/', 'g') . '.pm'
    if path[-len(name):] != name
        echohl WarningMsg
        echomsg "ぱっけーじめいと、ほぞんされているぱすが、ちがうきがします！"
        echomsg "ちゃんとなおしてください＞＜"
        echohl None
    endif
endfunction

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_auto_loc_list = 1
let g:syntastic_php_checkers = ["phpcs"]
let g:syntastic_php_phpcs_args="--standard=psr2"

" neosnippet
let s:my_snippet = '~/.snippet_mine/'
let g:neosnippet#snippets_directory = s:my_snippet

" スワップファイルは使わない
set noswapfile
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バックアップディレクトリの指定(でもバックアップは使ってない))
set backupdir=$HOME/.vimbackup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない))
set browsedir=buffer

" coffee
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
