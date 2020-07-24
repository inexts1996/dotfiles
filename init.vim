"--------------------------------------------------------
"better settings
"--------------------------------------------------------
    set mouse=a             " Enable mouse
    let mapleader=","

"--------------------------------------------------------
"GUI settings
"--------------------------------------------------------
    colorscheme gruvbox
    let g:gruvbox_contrast_dark = 'hard'
    set background=dark    " Setting dark mode
    let g:airline_theme = 'gruvbox'
    set termguicolors

"--------------------------------------------------------
"key mappings
"--------------------------------------------------------
nnoremap <F2> :e ~/AppData/Local/nvim/init.vim<cr>
nnoremap <M-m> :MarkdownPreview<CR>
nmap <silent> <Leader>e :Defx <cr>
   
"--------------------------------------------------------
"path settings
"--------------------------------------------------------    
let g:python_host_prog  = "D:/Program Files/Python/Python27/python.exe"
let g:python3_host_prog = "D:/Program Files/Python/Python38/python.exe"

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
    call dein#add('morhetz/gruvbox')
    call dein#add('wsdjeg/dein-ui.vim')
    "markdown plugins
    call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')
    call dein#add('junegunn/goyo.vim')
    call dein#add('junegunn/limelight.vim')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('godlygeek/tabular')
    call dein#add('elzr/vim-json')
    call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
					\ 'build': 'sh -c "cd app & yarn install"' })

    call dein#add('Shougo/defx.nvim')


  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"--------------------------------------------------------
"Plugins Settings 
"--------------------------------------------------------
	"SirVer/ultisnips
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"
  let g:UltiSnipsEditSplit="vertical"

	"junegunn/goyo.vim && limelight.vim
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!

  	"plasticboy/vim-markdown
  let g:vim_markdown_folding_disabled = 1 " disable header folding
  let g:vim_markdown_conceal = 0 " do not use conceal feature, the implementation is not so good
  let g:tex_conceal = "" " disable math tex conceal feature
  let g:vim_markdown_math = 1
  let g:vim_markdown_fenced_languages = ['csharp=cs']
  " support front matter of various format
  let g:vim_markdown_frontmatter = 1  " for YAML format
  let g:vim_markdown_toml_frontmatter = 1  " for TOML format
  let g:vim_markdown_json_frontmatter = 1  " for JSON format

  	"iamcco/markdown-preview.nvim
  let g:mkdp_auto_close = 0

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
