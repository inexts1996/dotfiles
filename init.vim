"========================================================
"better settings
"========================================================
  " 修改leader键
   let g:mapleader = ','
  " 开启语法高亮
   syntax on
  " 文件修改之后自动载入
   set autoread
  " 启动的时候不显示那个援助乌干达儿童的提示
   set shortmess=atI
  " 突出显示当前列
   set cursorcolumn
  " 突出显示当前行
   set cursorline
  " 备份,到另一个位置. 防止误删
  "set backup
  "set backupext=.bak
  "set backupdir=/tmp/vimbk/
  " 取消备份
   set nobackup
  " netrw settings
   set nocp
   filetype plugin on
  " grep settings
   set grepprg=rg\ --vimgrep\ --smart-case\ --follow

  " clipboard settings
   set clipboard=unnamed 
"========================================================
"Diplay settings
"========================================================
  " 显示当前的行号列号
   set ruler
  " 在状态栏显示正在输入的命令
   set showcmd
  " 左下角显示当前vim模式
   set showmode

  " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
   set scrolloff=7
  " 括号配对显示
   set showmatch
   set matchtime=2

  " 设置智能搜索提示
   set hlsearch 
  " 打开增量搜索模式，随着键入即时搜索
   set incsearch
  " 搜索时忽略大小写
   set ignorecase
  " 有一个或一个以上大写字母时仍然区分大小写搜索
   set smartcase
  " 编辑时隐藏鼠标
   set mousehide

  if has('gui_running')
	 set guioptions-=m " Hide menu bar.
     set guioptions-=T " Hide toolbar
	 set guioptions-=l " Hide left-hand scrollbar
	 set guioptions-=L " Hide left-hand scrollbar
	 set guioptions-=r " Hide right-hand scrollbar
	 set guioptions-=R " Hide right-hand scrollbar
	 set guioptions-=b " Hide bottom scrollbar
	 set showtabline=0 " Hide tabline
	 set guioptions-=e " Hide tabline
   endif

  " No annoying sound on errors
   set noerrorbells
   set novisualbell
   set t_vb=
   set tm=500

 " 缩进配置 
  " Smart indent
   set smartindent
  " 打开自动缩进
   set autoindent

 " tab相关
  " 设置tab键的宽度
   set tabstop=4
  " 每次缩进对应的空格数
   set shiftwidth=4
  " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
   set smarttab
  " 缩进时，取整
   set shiftround

 " 行号设置
  " 开启绝对行号
   set number
  " 开启相对行号
   set relativenumber number
  " 设置光标聚焦和离开时行号的显示
   au FocusLost * :set norelativenumber number
   au FocusGained * :set relativenumber
  " 插入模式下用绝对行号, 普通模式下用相对
   autocmd InsertEnter * :set norelativenumber number
   autocmd InsertLeave * :set relativenumber

 " Status line
  " format the status line
   set statusline=%<%f\%h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\%-14.(%l,%c%V%)\ %P
  "set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
  " Always show the status line
   set laststatus=2

    
"========================================================
"Environment Settings
"========================================================
  " Python
   let g:python_host_prog  = "D:/Programs/Python27/python.exe"
   let g:python3_host_prog = "D:/Programs/Python38/python.exe"

  " paths
   set path+=$PWD/**
   "set path+= F:/inexts/**
"========================================================
"key mappings
"========================================================
  " 打开init.vim
   map <leader>e :e! ~/AppData/Local/nvim/init.vim<cr>
   autocmd! bufwritepost $MYVIMRC source $MYVIMRC
   " 打开自己收集的vim一些知识
   nnoremap <leader>h :e ~/AppData/Local/nvim/help.md<cr>
  " 修复Shift + insert的错误
   inoremap <silent>  <S-Insert>  <C-R>+
  " 复制选中区到系统剪切板中
   vnoremap <leader>y "+y
  " fileTree 切换
   nnoremap <silent> <F3> :Defx<Cr>

" markdown map
  " Goyo
	nnoremap <silent> <leader> <m-z> :Goyo<cr>
  " markdown preview
    "nnoremap <silent> <leader> <m-p> :MarkdownPreview<cr>
  
" buffer
  " buffer change
    nnoremap <silent> <leader>bn :bn<cr>
    nnoremap <silent> <leader><b-p> :bp<cr>
  
" highlight
 nnoremap <silent> <esc><esc> :noh<return><esc>
"========================================================
"Other Settings 
"========================================================
  " vimrc文件修改之后自动加载, windows
   autocmd! bufwritepost _vimrc source %
  " " vimrc文件修改之后自动加载, linux
   autocmd! bufwritepost .vimrc source %

"========================================================
"Helper Functions
"========================================================
  " Returns true if paste mode is enabled
   function! HasPaste()
      if &paste
         return 'PASTE MODE  '
      endif
      return ''
   endfunction

"========================================================
"Pluggins Install
"========================================================
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
 set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  "Display Plugins
   call dein#add('morhetz/gruvbox')
   call dein#add('itchyny/landscape.vim')
   call dein#add('wsdjeg/dein-ui.vim')
   "call dein#add('powerline/powerline')
   call dein#add('itchyny/lightline.vim')

  "CSharp Plugins
   call dein#add('OmniSharp/omnisharp-vim', {'on_ft': ['cs']})

  "fileTree Plugins
   call dein#add('Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'})

  " indent Plugins 
   call dein#add('Yggdroot/indentLine')

  " complete Plugins
   call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
   call dein#add('jiangmiao/auto-pairs', {'merged':0, 'rev': 'release'})

  " Recent files
   call dein#add('Shougo/neomru.vim')

  " Start Screen
   call dein#add('mhinz/vim-startify')
   call dein#add('glepnir/dashboard-nvim')

  " markdown
   call dein#add('plasticboy/vim-markdown', {'on_ft':['markdown', 'pandoc.markdown', 'rmd', 'md']})
   call dein#add('iamcco/markdown-preview.nvim', 
			   \ {'on_ft' : ['markdown', 'pandoc.markdown', 'rmd','md'],
			    \ 'build' : 'sh -c "cd app && yarn install" ' })
   call dein#add('junegunn/goyo.vim')
   call dein#add('junegunn/limelight.vim')
   call dein#add('amix/vim-zenroom2')

  " search
   call dein#add('junegunn/fzf', { 'build': './install' }) 
   call dein#add('junegunn/fzf.vim', { 'depends': 'junegunn/fzf' }) 
   call dein#add('BurntSushi/ripgrep')
   call dein#add('liuchengxu/vim-clap')
  
  " others
   call dein#add('takac/vim-hardtime')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"========================================================
"Pluggins settings
"========================================================
  " gruvbox
   colorscheme gruvbox
   let g:gruvbox_contrast_dark = 'hard'
   set background=dark    " Setting dark mode
   let g:airline_theme = 'gruvbox'
   set termguicolors
   let g:gruvbox_termcolors = 256

  " defx
   call defx#custom#option('_', {
	      \ 'winwidth': 30,
	      \ 'split': 'vertical',
	      \ 'direction': 'topleft',
	      \ 'show_ignored_files': 0,
	      \ 'buffer_name': '',
	      \ 'toggle': 1,
	      \ 'resume': 1
	      \ })

   call defx#custom#column('icon', {
	      \ 'directory_icon': '▶',
	      \ 'opened_icon': '▼',
	      \ 'root_icon': ' ',
	      \ })

	call defx#custom#column('filename', {
	      \ 'min_width': 40,
	      \ 'max_width': 40,
	      \ })

	call defx#custom#column('mark', {
	      \ 'readonly_icon': '✗',
	      \ 'selected_icon': '✓',
	      \ })

  " indentLine
   let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
   let g:indentLine_fileTypeExclude = ['dashboard']  


  " limelight
   autocmd! User GoyoEnter Limelight
   autocmd! User GoyoLeave Limelight!
  
  " vim_hardtime
   let g:hardtime_default_on = 1

  " powerline

  set laststatus=2  
  set showtabline=2
  set noshowmode  
  set t_Co=256
  
  " lightline
   let g:lightline = {
         \ 'colorscheme': 'wombat',
         \ }

  " vim-markdown
  "set nofoldenable

  " dashboard
  let g:dashboard_default_executive ='clap'

  " vim-clap
  let g:clap_layout = { 'relative': 'editor'  }
  let g:clap_theme = 'material_design_dark'
