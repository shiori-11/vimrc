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

"" =============================
"" map
"" ============================

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
set nocompatible              " be iMproved, required
filetype off
set rtp+=~/.vim/vimfiles/vundle
call vundle#begin()

" Vundleで管理するプラグインを書く
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" github にあるプラグイン
Plugin 'Shougo/unite.vim'             " ファイルオープンを便利に
Plugin 'thinca/vim-ref'
Plugin 'thinca/vim-quickrun'          " コード実行可能
Plugin 'vim-ruby/vim-ruby'
Plugin 'basyura/unite-rails'
Plugin 'nathanaelkane/vim-indent-guides'      " インデントの表示
Plugin 'Shougo/vimproc'
Plugin 'thinca/vim-visualstar'
Plugin 'tomtom/tcomment_vim'          " 一部まとめてコメントアウト
Plugin 'itchyny/lightline.vim'        " ステータスバーを装飾
Plugin 'bronson/vim-trailing-whitespace'      " 後ろのスペースを表示
Plugin 'lambdalisue/vim-gita'         " gitのプラグイン　開発中
Plugin 'Shougo/neocomplete'       " 補完
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'   " 補完ここまで

call vundle#end()            " required
"" end Vundle

"" common
" ファイル別にプラグインとインデントを有効にする
filetype plugin indent on


"" quickrun
nnoremap run :QuickRun
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'command': 'bluecloth',
      \ 'exec': '%c -f %s'
      \ }

"" end quickrun

"" def lightline.vim
set laststatus=2    " 表示されない時の設定
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?" ":""}',
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }
"" end lightline.vim

"" def vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
"" end vim-indent-guides

" ------------------------------------------------------------
" NeoSnippetの設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neocomplete#enable_at_startup = 1
" End NeoSnippetの設定
" ------------------------------------------------------------
