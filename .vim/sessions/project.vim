" ~/.vim/sessions/project.vim: Vim session script.
" Created by session.vim 1.5.10 on 27 April 2013 at 21:46:19.
" Open this file in Vim and run :source % to restore your session.

set guioptions=aegimrLtT
silent! set guifont=
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'light'
	set background=light
endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /var/project/myproject
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 yii/framework/base/CApplication.php
silent! argdel *
edit yii/framework/base/CApplication.php
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 25 + 83) / 166)
exe 'vert 2resize ' . ((&columns * 109 + 83) / 166)
exe 'vert 3resize ' . ((&columns * 30 + 83) / 166)
" argglobal
enew
" file NERD_tree_2
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
" argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 70 - ((27 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
70
normal! 020|
lcd /var/project/myproject
wincmd w
" argglobal
enew
file /var/project/myproject/__Tag_List__
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9999
setlocal fml=0
setlocal fdn=20
setlocal fen
lcd /var/project/myproject
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 25 + 83) / 166)
exe 'vert 2resize ' . ((&columns * 109 + 83) / 166)
exe 'vert 3resize ' . ((&columns * 30 + 83) / 166)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
tabnext 1
1wincmd w
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree /var/project/myproject
execute "bwipeout" s:bufnr_save
execute "cd" fnameescape(s:cwd_save)
1resize 40|vert 1resize 25|2resize 40|vert 2resize 109|3resize 40|vert 3resize 30|
tabnext 1
2wincmd w
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
