if g:osdetected == "Windows"
    :tmenu icon=$HOME/\.vim/bitmaps/reload.bmp 1.475 ToolBar.reload_file reload file. normal-mode <F5> or \dr
elseif g:osdetected != "Windows"
    :tmenu icon=$HOME/.vim/bitmaps/reload.bmp 1.475 ToolBar.reload_file reload file. normal-mode <F5> or \dr
endif

:menu ToolBar.reload_file <Esc>:e!<Esc>

map <silent> <leader>rd <Esc>:e!<Esc>
map <silent> <F5> <Esc>:e!<Esc>
