" >>>=========插件管理器 Pathogen 配置 ============
" Pathogen 是 VIM 的一个插件管理器
" >>>=========这里是 vimrc 最简单的配置============
call pathogen#infect()
execute pathogen#infect()
syntax enable " 开启语法高亮功能
syntax on     " 允许用指定语法高亮配色方案替换默认方案
filetype plugin indent on " 自适应不同语言的智能缩进，插件开启


" >>>=========vim 自身（非插件）快捷键============
" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

vnoremap <Leader>y                " 设置快捷键将选中文本块复制至系统剪贴板
nnoremap <Leader>p                " 设置快捷键将系统剪贴板内容粘贴至vim
nnoremap <Leader>q :q<CR>         " 定义快捷键关闭当前分割窗口
"nnoremap <Leader>w :w<CR>         " 定义快捷键保存当前窗口内容
nnoremap <Leader>WQ :wa<CR>:q<CR> " 定义快捷键保存所有窗口内容并退出 vim
nnoremap <Leader>Q :qa!<CR>       " 不做任何保存，直接退出 vim

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" 默认vim配置，营造专注气氛
set gcr=a:block-blinkon0   " 禁止光标闪烁

set laststatus=2   " 总是显示状态栏
set ruler          " 显示光标当前位置
set number         " 开启行号显示
                   " 显示绝对行号      set number
                   " 取消显示绝对行号   set nonumber
                   " 显示相对行号       set relativenumber
                   " 取消显示相对行号   set norelativenumber

set cursorline    " 高亮显示当前 - 行
set cursorcolumn  " 高亮显示当前 - 列
set hlsearch      " 高亮显示搜索结果

" 在处理未保存或只读文件的时候，弹出确认 
set confirm
set mouse=a    " 设置鼠标滚动
:se so=999          " 总在中间

set mouse=a         " 设置鼠标滚动

" set scrolloff=7   " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
" :se so=7          " 上面配置的简写
:se so=999          " 总在中间

" 缩进
set expandtab       " 将制表符扩展为空格
set tabstop=2       " 设置编辑时制表符占用空格数
set shiftwidth=2    " 设置格式化时制表符占用空格数
set softtabstop=2   " 让 vim 把连续数量的空格视为一个制表符

set incsearch       " 开启实时搜索功能
set ignorecase      " 搜索时大小写不敏感
set nocompatible    " 关闭兼容模式
set wildmenu        " vim 自身命令行模式智能补全
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" >>>=========插件 molokai 主题配置============
" colorscheme molokai
colorscheme gruvbox
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" >>>=========插件 nerdtree 配置============
" 目录浏览器
" 可以使用快捷键 <Ctrl+n> 来调出浏览窗口了
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

" 设置快捷键遍历子窗口
nnoremap nw <C-W><C-W>        " 依次遍历
nnoremap <Leader>lw <C-W>l    " 跳转至右方的窗口
nnoremap <Leader>hw <C-W>h    " 跳转至左方的窗口
nnoremap <Leader>kw <C-W>k    " 跳转至上方的子窗口
nnoremap <Leader>jw <C-W>j    " 跳转至下方的子窗口

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 改变目录菜单图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" >>>=========插件 tagbar 配置============
nmap <Leader>tt :TagbarToggle<CR>
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" >>>=========插件 vim-easymotion 配置============
map <Leader> <Plug>(easymotion-prefix)
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" >>>=========插件 ctrlpvim/ctrlp.vim 配置============
" 在没有显式启动目录的情况下调用时，
" CtrlP 将根据此变量设置其本地工作目录：
" a - 当前文件的目录，除非它是cwd的子目录
" r - 包含以下目录或文件之一的当前文件的最近祖先：.git .hg .svn .bzr _darcs
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" 忽略 .gitignore 中的文件
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" 使用 Vim 的 wildignore 和 CtrlP 自己的g `:ctrlp_custom_ignore` 排除文件和目录。
" 如果正在使用自定义列表命令，则会忽略排除项：
let g:ctrlp_custom_ignore = '\v(node_modules)'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" >>>=========插件 Xuyuanp/nerdtree-git-plugin 配置============
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" vue 配置
au BufNewFile,BufRead *.html,*.js,*.vue set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue set fileformat=unix

" vim-vue 解决滑动过快高亮失效
autocmd FileType vue syntax sync fromstart

" eslint检查器
let g:syntastic_javascript_checkers = ['eslint']

" coc.nvim自动补全配置
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
