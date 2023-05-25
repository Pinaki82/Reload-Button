" http://vi.stackexchange.com/questions/2572/detect-os-in-vimscript
" google: detecting os from vimscript

function! GetCursorPosition()
  let l:line = line('.')
  let l:col = col('.')
  return [l:line, l:col]
endfunction

function! RestoreCursorPosition(pos)
  let [l:line, l:col] = a:pos
  call cursor(l:line, l:col)
endfunction

" let l:pos = GetCursorPosition()
" :e! <bname>
" call RestoreCursorPosition(l:pos)

"  =====================================================================================

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

function! ReloadButton()
    :let view = winsaveview()
    :let l:pos = GetCursorPosition()
    execute 'edit!'
    :call winrestview(view)
    :call RestoreCursorPosition(l:pos)
    :execute 'normal! \<ESC>\<ESC>'
endfunction

:menu ToolBar.reload_file <Esc>:call ReloadButton()<Esc>

map <silent> <leader>dr <Esc>:call ReloadButton()<Esc>
map <silent> <F5> <Esc>:call ReloadButton()<Esc>
