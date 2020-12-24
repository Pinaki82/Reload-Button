" http://vi.stackexchange.com/questions/2572/detect-os-in-vimscript
" google: detecting os from vimscript
if !exists("g:osdetected")
    if has("win64") || has("win32") || has("win16")
        let g:osdetected = "Windows"
    else
        let g:osdetected = substitute(system('uname'), '\n', '', '')
    endif
endif

if g:osdetected == "Windows"
    :tmenu icon=$HOME/\.vim/bitmaps/reload.bmp 1.475 ToolBar.reload_file reload file. normal-mode <F5> or \dr
elseif g:osdetected != "Windows"
    :tmenu icon=$HOME/.vim/bitmaps/reload.bmp 1.475 ToolBar.reload_file reload file. normal-mode <F5> or \dr
endif

:menu ToolBar.reload_file <Esc>:e!<Esc>

map <silent> <leader>dr <Esc>:e!<Esc>
map <silent> <F5> <Esc>:e!<Esc>
