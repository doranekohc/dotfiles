""
"" .vimrc : settings for vim
""

let mapleader = ","

set t_Co=256
scriptencoding utf-8
set encoding=utf-8

" ====================================================================
" Dein Setting:
" ====================================================================
if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

" 変数定義
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが無かったらgithubからcloneする
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

" 設定
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let s:toml = $XDG_CONFIG_HOME . '/dein/plugins.toml'
let s:lazy_toml = $XDG_CONFIG_HOME . '/dein/plugins_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [s:toml, s:lazy_toml])

  " TOMLを読み込んでキャッシュ
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif


" ====================================================================
" Ctags And Cscope Setting:
" 全然見直してないので使うときは確認
" ====================================================================
"
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:SrcExpl_updateTagsCmd = "/usr/local/bin/ctags --sort=foldcase -R ."
let tlist_php_settings = 'php;c:class;d:constant;f:function'

if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
     if filereadable("cscope.out")
         cs add cscope.out
           " else add database pointed to by environment
             elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
  "set cscopequickfix=s-,c-,d-,i-,t-,e-
  map <C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>
  map <C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
  map <C-_> :cs find c <C-R>=expand("<cword>")<CR><CR> endif
endif


" ====================================================================
" NeoVim Settings:
" ====================================================================
"
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

endif


" ====================================================================
" General Settings:
" ====================================================================
"   (...拡張子別の設定は ~/.vim/ftplugin/拡張子.vim に書きましょう)
"
syntax enable
set number
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set cursorline
set autoindent
set bg=dark
set backspace=indent,eol,start

" show statusline
set laststatus=2
"set statusline=%f%m%r%=--%p\/100%%--\ [\ format:%{&ff}\ ][\ enc:%{&fileencoding}\ ][\ col:%3c\ ]

" netrwは常にtree view
let g:netrw_liststyle = 3

" ====================================================================
" Keymap:
" ====================================================================
" ----------------------------------------------
" Normal Mode:
" ----------------------------------------------
" window size
nnoremap t< 10<C-w><
nnoremap t> 10<C-w>>
nnoremap t+ 10<C-w>+
nnoremap t- 10<C-w>-
" tab behavior
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap t<C-l> :<C-u>tabmove +1<CR>
nnoremap t<C-h> :<C-u>tabmove -1<CR>
" cursor
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <Leader>w <C-w><C-w>
" default comma -> shift-;(+)
nnoremap + ,
" Netrw
nnoremap <Leader>t :<C-u>Texplore<Return>
nnoremap <Leader>v :<C-u>Vexplore<Esc><C-w>L
nnoremap <Leader>h :<C-u>Hexplore<Return>
" other
nnoremap <Leader>cc :<C-u>set cursorcolumn<Return>
nnoremap <Leader>ncc :<C-u>set nocursorcolumn<Return>

" no-op
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap <C-z> <Nop>
nnoremap <C-s> <Nop>

" ----------------------------------------------
" Insert Mode:
" ----------------------------------------------
inoremap jj <ESC>

" ----------------------------------------------
""" Visual Mode:
" ----------------------------------------------
" v選択後、*でサーチ
vnoremap * "zy:let @/ = @z<CR>n
vnoremap <C-j> 10j
vnoremap <C-k> 10k
" 選択
vnoremap iq i"

" ----------------------------------------------
" Command Mode:
" ----------------------------------------------
cnoremap bv bel vnew
cnoremap nocc nocursorcolumn
cnoremap vimrc source ~/.vimrc


" ====================================================================
" Command Alias:
" ====================================================================
" VimShowHlGroup: Show highlight group name under a cursor
 command! VimShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

" VimShowHlItem: Show highlight item name under a cursor
 command! VimShowHlItem echo synIDattr(synID(line("."), col("."), 1), "name")


" ====================================================================
" Colorize Settings:
" ====================================================================

""" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter,WinEnter,VimEnter,BufRead * let w:m1 = matchadd("WhitespaceEOL", '\s\+$')
" 可視化やめる
cnoremap nohl highlight WhitespaceEOL none

""" タブ文字を視覚化
highlight TabString ctermbg=red guibg=red
au BufWinEnter,WinEnter,VimEnter,BufRead * let w:m2 = matchadd("TabString", '^\t+')

""" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter,WinEnter,VimEnter,BufRead * let w:m3 = matchadd("ZenkakuSpace", '　')


" ====================================================================
" Other Settings:
" ====================================================================

autocmd BufNewFile,BufRead *.xml setf xml
autocmd BufNewFile,BufRead *.vue set filetype=html

""" 最後に拡張子別設定を読み込む(途中で読み込むと以降の.vimrcが適用されない）
filetype plugin on

""" 保存終了時のカーソル位置を記憶 normal! g'" でうごいたよ
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

""" dotfiles以外にローカライズされた設定が必要な場合は .vimrc_local を設置する
if filereadable(expand('~/.vimrc_local'))
  source ~/.vimrc_local
endif

""" ctagsでジャンプ時に新しいタブで開く
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"

