"
" Remove trailing whitespaces
" 
" Code is modefied from
"  http://qiita.com/katton/items/bc9720826120f5f61fc1
"
function! s:remove_trailing_whitespace()
    let cursor = getpos(".")
    %s/\s\+$//ge
    call setpos(".", cursor)
    unlet cursor
endfunction

autocmd BufWritePre * call <SID>remove_trailing_whitespace()
