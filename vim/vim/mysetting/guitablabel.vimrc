"-------------------------
" -tab name-display setting-
" http://doruby.kbmj.com/aisi/20091218/Vim__
"-------------------------
function! GuiTabLabel()
  let l:label = ''

  let l:bufnrlist = tabpagebuflist(v:lnum)

  let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
  let l:label .= l:bufname == '' ? 'No title' : l:bufname

  let l:wincount = tabpagewinnr(v:lnum, '$')
  if l:wincount > 1
    let l:label .= '[' . l:wincount . ']'
  endif

  for bufnr in l:bufnrlist
    if getbufvar(bufnr, "&modified")
      let l:label .= '[+]'
      break
    endif
  endfor

  return l:label
endfunction
set guitablabel=%N:\ %{GuiTabLabel()}
