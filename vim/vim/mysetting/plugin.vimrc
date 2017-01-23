"---------------------------
" Neobundle
"---------------------------
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/echodoc', '', 'default'
call neobundle#config('echodoc', {
  \ 'lazy' : 1,
  \ 'autoload' : {
  \ 'insert' : 1,
\ }})
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'JuliaLang/julia-vim'

call neobundle#end()

NeoBundleCheck

"-------------------------
" Unite
"-------------------------
nnoremap <leader>uf :<C-u>Unite file<CR>

let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

call unite#custom#profile('default', 'context', {
  \ 'start_insert': 0,
  \ 'winheight': 10,
  \ 'direction': 'botright',
\})

"-------------------------
" VimFiler
"-------------------------
nnoremap <leader>vf :<C-u>VimFiler -split -simple -winwidth=35 -no-quit <CR>

"-------------------------
" VimShell
"-------------------------
nnoremap <leader>shell :<C-u>VimShell

"-------------------------
" Neocomplete
"-------------------------
let g:neocomplete#enable_at_startup = 1

"-------------------------
" EchoDoc
"-------------------------
let g:echodoc_enable_at_startup = 1

"-------------------------
" NeoSnippet
"-------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"-------------------------
" previm
"-------------------------
au BufRead,BufNewFile *.md set filetype=markdown

"-------------------------
" solarized
"-------------------------
syntax enable
if has('gui_running')
  set background=light
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
else
  set background=dark
  let g:solarized_termtrans=1
  let g:solarized_termcolors=16
endif
colorscheme solarized

"-------------------------
" QuickRun
"-------------------------
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\}

"-------------------------
" Julia
"-------------------------
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_suggestions = 0
