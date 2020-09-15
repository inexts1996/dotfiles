"=============================================================================
" ginit.vim --- Entry file for neovim-qt
"=============================================================================

if exists('g:GuiLoaded')
  "exe 'Guifont! Ubuntu Mono:h12'
  exe 'Guifont! Fixedsys Excelsior:h12'
  "set linespace=4

  " Disable gui popupmenu
  if exists(':GuiPopupmenu') == 2
    GuiPopupmenu 0
  endif

  " Disbale gui tabline
  if exists(':GuiTabline') == 2
    GuiTabline 0
  endif
endif
