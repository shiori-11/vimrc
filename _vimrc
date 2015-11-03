""" =======================
""" complement
""" =======================
"" common
" ファイル別にプラグインとインデントを有効にする
filetype plugin indent on


" 文字補完
ab #i #include
ab #d #define


""" ===============================
""" set
""" ===============================
set noswapfile             " スワップファイルを作らない
set backspace=2            " バックスペースでインデントや改行を削除
set showmatch              " 対括弧の表示
set autoindent
set nostartofline          " 行頭に移動しない
set number                 " 行番号表示
set wildmenu               " コマンドライン補完
set showcmd                " タイプ中のコマンドを表示
set showmode               " 現在のモードを表示
set hlsearch               " 検索語を強調表示（<C-L>で解除）
set grepprg=grep\ -nH\ $*  " grep 使用


" 日本語に対応させる
set encoding=utf-8
set fenc=uft-8
set fileencodings=utf-8,usc-bom,iso-2022-jp,euc-jp,cp932,sjis
set fileformats=unix,dos,mac

" tab 系 = 2space
set expandtab
set shiftwidth=2
set softtabstop=2

" ターミナルでマウスを使用
set mouse=a                " マウスを有効
set guioptions+=a
set ttymouse=xterm2        " ターミナルでマウスを使用

" バッファを保存しなくても他のバッファを表示できるようにする
setlocal hidden

"日本語の行の連結時には空白を入力しない
setlocal formatoptions+=mM

""□や○の文字があってもカーソル位置がずれないよう
if exists('&ambiwidth')
  set ambiwidth=double
endif

"画面最後の行をできる限り表示する。
set display+=lastline

" コメントやブロックの折りたたみ可能
set foldmethod=syntax

""" =============================
""" map
""" ============================

" rake
nnoremap rake :!rake<Enter>

" ヘルプの設定
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

" ハイライトを削除
nnoremap <ESC><ESC> :nohlsearch<CR>

" unite-rails の設定
nnoremap <C-x> :Unite rails/

""" =============================
""" autocmd
""" ============================
" 保存時にrubyの構文チェック
" augroup rbsyntaxcheck
"   autocmd!
"   autocmd BufWrite *.rb w !ruby -c
" augroup END


augroup csyntaxcheck
 autocmd!
 " C/C++関数を強調表示
 autocmd FileType c,cpp syntax match CFunction /[a-zA-Z_]\w*\s*\(\(\[[^]]*\]\s*\)\?(\s*[^\*]\)\@=/
 autocmd FileType c,cpp syntax match CFunction /\*\s*[a-zA-Z_]\w*\s*\(\(\[\]\s*\)\?)\s*(\)\@=/
 autocmd FileType c,cpp hi CFunction guifg=#ff0000 guibg=#ffff00 
 autocmd FileType c set omnifunc=ccomplete#Complete
augroup END

augroup templateload
  autocmd!
  autocmd BufNewFile repo.tex 0r ~/Dropbox/Document/tmp/tex/repo.tex
  autocmd BufNewFile slide.tex 0r ~/Dropbox/Document/tmp/tex/slide.tex
  autocmd BufNewFile ms.tex 0r ~/Dropbox/Document/tmp/tex/ms.tex
  autocmd BufNewFile *.java 0r ~/Dropbox/Document/tmp/java.java
augroup END

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP




""" =================================
""" color
""" =================================

syntax enable
colorscheme ron
"colorscheme darkblue
hi perlComment ctermfg=darkgray
hi perlDATA ctermfg=cyan
hi perlPOD ctermfg=darkred
hi Normal cterm=bold


let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'

"
inoremap <silent><ESC><ESC>:set iminsert=0<CR>




""" ===================
""" plugin 
""" ==================
"" def Vundle 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundleで管理するプラグインを書く
Bundle 'gmarik/vundle'

" github にあるプラグイン
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-visualstar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tomtom/tcomment_vim'
Bundle 'thinca/vim-ref'
Bundle 'soh335/vim-ref-jquery'
Bundle 'soh335/vim-ref-pman'
Bundle 'ujihisa/ref-hoogle'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/unite.vim'
Bundle 'basyura/unite-rails'
Bundle 'msanders/cocoa.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/errormarker.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'hallison/vim-markdown'

" www.vim.org にあるプラグイン
Bundle 'project.tar.gz'
Bundle 'Markdown'

" それ以外にある git リポジトリにあるプラグイン
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

"" end Vundle

"" common
" ファイル別にプラグインとインデントを有効にする
filetype plugin indent on

"" def vim-latex
let g:tex_flavor='latex' 
" スペルチェック（拡張子がTeXのときON）
"autocmd FileType tex set spell
""end vim-latex

"" def YankRing.vim
" 履歴ファイルの保存先を変更
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'

" :YRShowコマンドの設定
" F7 で :YRShow を実行出来るようにする
nnoremap <silent> <F7> :YRShow<CR> 
" 記録する履歴の件数を10件に制限する
let g:yankring_max_history = 10
" 履歴全体を見通せるようにウィンドウの高さを制限
let g:yankring_window_height = 13

"" end YankRing.vim 

"" def yanktmp.vim
map <silent> sy :call Yanktmpank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>
if has("win32")
  let g:yanktmp_file = $TEMP. '/vimyanktmp'
endif

"" end yanktmp.vim

"" def indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 15 
let g:indent_guides_guide_size = 1

"" end indent-guides

"" def vimshell
" nnoremap zsh :VimShellInteractive<Space>zsh
nnoremap shell :VimShell

"" end vimshell


"" quickrun
nnoremap run :QuickRun

let g:quickrun_config = {}
" if strlen($rvm_bin_path)
" let g:quickrun_config['ruby'] = {
" \   'command': 'ruby',
" \   'exec': '$rvm_bin_path/ruby %s',
" \   'tempfile': '{tempname()}.rb'
" \ }
" endif
"

let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'command': 'bluecloth',
      \ 'exec': '%c -f %s'
      \ }

"" end quickrun

"" necomplcache
let g:neocomplcache_enable_at_startup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_EnableUnderbarCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
" 

let g:neocomplcache_enable_underbar_completion = 1
" "Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"       \ 'default' : '',
"       \ 'vimshell' : $HOME.'/.vimshell_hist',
"       \ 'scheme' : $HOME.'/.gosh_completions'
"       \ }
" noremap <expr><C-e> neocomplcache#cancel_popup()
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" 

