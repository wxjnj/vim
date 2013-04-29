"启动vim时如果存在tags则自动加载  
if exists("tags")  
    set tags=./tags  
endif

"设置cscope
"if filereadable("cscope.out")
 "   :cs add cscope.out
"endif
"if has("cscope")
"    set csto=1
"    set cst
"    set csverb
"endif
set cscopequickfix=s-,c-,d-,i-,t-,e-

"更新ctags和cscope索引
map <F12> :call Do_CsTag()<CR>
function! Do_CsTag()
    if(executable('ctags'))
        silent! execute "!ctags -R *"
	silent! execute ":set tags=./tags"
    endif
    if(executable('cscope') && has("cscope"))
        silent! execute "!find . -name '*.php'  -o -name '*.js' > cscope.files"
        silent! execute "!cscope -Rbq"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    "刷新屏幕
    execute "redr!"
endfunction

"设置superTab
let g:SuperTabDefaultCompletionType="context"

"设置MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0

"设置taglist
let Tlist_Show_One_File=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_Menu=1
let Tlist_Use_Right_Window=1
au VimEnter * TlistToggle

"设置Winmanager
let g:NERDTree_title="NERDTree"
let g:winManagerWindowLayout="NERDTree"
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
au VimEnter * WMToggle
au VimEnter * q

"设置自动补全
"set nocp
filetype plugin indent on
set completeopt=longest,menu
let g:acp_enableAtStartup=0
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1 
let g:neocomplcache_enable_camel_case_completion=1 
let g:neocomplcache_enable_underbar_completion=1 
let g:neocomplcache_min_syntax_length=3 
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'
if !exists('g:neocomplcache_keyword_patterns') 
    let g:neocomplcache_keyword_patterns={} 
endif 
let g:neocomplcache_keyword_patterns['default']='\h\w*'
let g:neocomplcache_dictionary_filetype_lists={
    \ 'default' : '', 
    \ 'php' : '~/.vim/dict/funclist.txt',
    \ 'css' : '~/.vim/dict/csslist.txt' 
    \ }
if !exists('g:neocomplcache_omni_patterns') 
    let g:neocomplcache_omni_patterns={} 
endif 
let g:neocomplcache_omni_patterns.php='[^. \t]->\h\w*\|\h\w*::'
inoremap <expr><C-q> neocomplcache#close_popup()  
"inoremap <C-o> <C-x><C-o>

"设置zencoding
let g:user_zen_settings = {
  \  'indentation' : '  ',
  \  'perl' : {
  \    'aliases' : {
  \      'req' : 'require '
  \    },
  \    'snippets' : {
  \      'use' : "use strict\nuse warnings\n\n",
  \      'warn' : "warn \"|\";",
  \    }
  \  }
  \}
let g:user_zen_imagesize_key = '<c-i>'
let g:user_zen_removetag_key = '<c-d>'
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

"括号匹配
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
	return "\<Right>"
    else
	return a:char
    endif
endfunction

"映射按键：a:全选，v：粘贴，c:复制，x：剪切, s: 保存, z:撤销，b:恢复   
vmap <C-c> "+y   
nmap <C-c> "+y
vmap <C-x> "yd   
nmap <C-v> "+p   
imap <C-v> <ESC>"+gP   
nmap <C-a> ggvG$
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
imap <C-z> <esc>:undo<CR>
nmap <C-z> :undo<CR>
imap <C-b> <esc>:redo<CR>
nmap <C-b> :redo<CR>

"使用空格键进入编辑模式
nmap <space> i

"查找,查找/替换对话框
imap <C-f> <esc>:promptfind<CR>
nmap <C-f> :promptfind<CR>
imap <C-g> <esc>:promptrepl<CR>
nmap <C-g> :promptrepl<CR>

"Ctrl + H将光标移到当前行的行首
imap <c-u> <ESC>I

"Ctrl + J将光标移到下一行的行首
imap <c-j> <ESC>jI

"Ctrl + K将光标移到上一行的末尾
imap <c-k> <ESC>kA

"Ctrl + L将光标移到当前行的行尾
imap <c-l> <ESC>A

"代码折叠
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldlevelstart=99       " 打开文件是默认不折叠代码
let php_folding=2
let b:javascript_fold=1
nmap z za

"开启语法高亮
syntax enable
syntax on
let php_sql_query=1
let php_htmlInStrings=1
let javascript_enable_domhtmlcss=1

"高亮光标所在行
autocmd InsertEnter * set cul

"行号
set nu

"括号匹配
set showmatch

"鼠标模式
set mouse=a

"自动缩进
set autoindent
set shiftwidth=4
set softtabstop=4
set smartindent
set cindent  

"帮助中文支持
set helplang=cn

"关闭旧版兼容性
set nocompatible

"history文件中需要记录的行数
set history=1000

"自动折行
set wrap

"带有如下符号的单词不要被换行分割
set iskeyword=_,$,@,%,#,-

"搜索高亮
set hlsearch
set incsearch
set ignorecase smartcase

"不要备份文件
set nobackup
set noswapfile
set nowritebackup

"当buffer被丢弃的时候隐藏它
set bufhidden=hide

"使退格键（backspace）正常处理indent, eol, start等
set backspace=indent,eol,start

"允许backspace和光标键跨越行边界
set whichwrap=<,>,[,]

"设置状态行
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"设置默认目录
lcd ~/project/myproject

"打开时最大化,linux下安装wmctrl
au GUIEnter * call MaximizeWindow()
function! MaximizeWindow()
silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"grep搜索
nnoremap <silent> <F3> :Rgrep<CR>

"打开上次编辑的文件
let g:session_autosave='no'
let g:session_autoload='no'
nmap <F1> :SaveSession project<CR>
nmap <F2> :OpenSession project<CR>

"在打开文件的时候检查
let g:syntastic_check_on_open=1
"phpcs,tab 4个空格,编码参考使用CodeIgniter风格
let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"
let makeprg = "php -l -d error_reporting=E_ALL -d display_errors=1"
