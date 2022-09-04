if has('win32')
    let $PATH.=";".expand('~/vimfiles/ExtraTools')
endif
if has('nvim')
    let g:python3_host_prog='G:/DeveloperTools/MSYS2/ucrt64/bin/python.exe'
    let g:loaded_python_provider=0
endif
let s:vimrc_path = expand('~/vimfiles/.vimrc')
"""""""""""""""""""""""""""VIM Encoding"""""""""""""""""""""""""""
set encoding=utf-8
"set langmenu=en_US.UTF-8
"language messages en_US.utf-8
set langmenu=zh_CN.UTF-8
language zh_CN.utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if !has('nvim')
    if has("gui_running")
        set guioptions-=m
        set guioptions-=T
        set showtabline=0
        set guioptions-=b
    endif 
    set winaltkeys=no	"Alt does not map to menu
    """""""DirectX
    if has('directx')
        set renderoptions=type:directx,renmode:5,taamode:1
    end
    """""""Maximize windows startup
    if has('gui')
        au GUIEnter * simalt ~x
    else
        au GUIEnter * call MaximizeWindow()
    endif
    function! MaximizeWindow()
        silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    endfunction
endif
"""""""""""""""""""""""""""VIM Encoding"""""""""""""""""""""""""""

set nocompatible
if has('win32') && !has('nvim')
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

set diffexpr=MyDiff()
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"""""""""""""""""""""""""""vim-plug"""""""""""""""""""""""""""
"call plug#begin(expand($VIM).'/vimfiles/bundle')
call plug#begin(expand('~/vimfiles/plugs'))

"""""""""""Common
"Plug 'ycm-core/YouCompleteMe'
"Plug 'SirVer/ultisnips'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
"Plug 'Raimondi/delimitMate'
Plug 'DataWraith/auto_mkdir'
Plug 'Yggdroot/LeaderF', {'do': './install.bat'}
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
"Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
"Plug 'tomasr/molokai'
"Plug 'altercation/vim-colors-solarized'
"Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
"Plug 'richq/cmakecompletion-vim'
Plug 'mhinz/vim-startify' 
Plug 'skywind3000/asyncrun.vim'
"Plug 'Shougo/neosnippet.vim'
"Plug 'dense-analysis/ale'
Plug 'danro/rename.vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
"""""""Markdown
Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown'}

"""""""""""Desktop
"""""""C/C++
Plug 'taxilian/a.vim', {'for': ['c', 'cpp']}
"Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
"""""""D
"Plug 'JesseKPhillips/d.vim', {'for': 'd'}
"""""""Python
"Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
"Plug 'python-mode/python-mode', {'for': 'python'}

"""""""""""Web
"""""""html/js
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'html']}
"""""""PHP
"Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
"Plug '2072/PHP-Indenting-for-VIm'
"Plug 'captbaritone/better-indent-support-for-php-with-html'

"""""""""""HDL
"""""""Verilog
Plug 'vhda/verilog_systemverilog.vim', {'for': 'verilog_systemverilog'}
"""""""HSPICE
Plug 'ftorres16/spice.vim'

call plug#end()
filetype plugin indent on
"""""""""""""""""""""""""""vim-plug"""""""""""""""""""""""""""
"""""""""""""""""""""""""""VIM"""""""""""""""""""""""""""
set number "显示行号
syntax on "语法高亮度显示
filetype on  "检测文件的类型
set autoindent "vim使用自动对齐，也就是把当前行的对齐格式应用到下一行(自动缩进）
set cindent "（cindent是特别针对 C语言语法自动缩进）
set tabstop=4
set softtabstop=4  "缩进相关
set shiftwidth=4
set expandtab "展开Tab
set smartindent "依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写上有用
set showmatch "设置匹配模式，类似当输入一个左括号时会匹配相应的右括号
set incsearch "搜索时自动高亮第一个匹配项
set hlsearch "高亮搜索匹配项
set ignorecase smartcase "智能匹配大小写
set hidden "隐藏未保存缓冲区
let mapleader=',' "leader映射为逗号
set wildmode=full
set wildmenu  "命令行补全菜单
set fileformats=unix,dos "优先选择Unix换行符
set colorcolumn=80
set cursorline  "显示当前行位置
set cursorcolumn   "显示当前列位置
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set noundofile
set noerrorbells
set novisualbell
"set autochdir  "自动切换工作目录

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" show indent for Tab
set list lcs=tab:\|\ 
" TEMP directory of different system
if has('win32')
    set directory=$TEMP
elseif has('unix')
    set directory=/tmp
endif

"set background=dark
"colorscheme molokai
"let base16colorspace=256
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "medium"
colorscheme gruvbox
set background=dark

set termguicolors
set t_Co=256
"let g:onedark_termcolors = 256
"let g:onedark_terminal_italics = 1
"colorscheme onedark

" change work directory to current file's dir
nnoremap <silent> <leader>cdf :cd %:h<TAB><CR>
exec 'nnoremap <silent> <leader>ev :e '.s:vimrc_path.'<CR>'
exec 'nnoremap <leader>sv :source '.s:vimrc_path.'<CR>'
"nnoremap <silent> <leader>ev :e $MYVIMRC<cr>
"nnoremap <leader>sv :source $MYVIMRC<cr>
" Delete all space lines
nnoremap <silent> <leader>dsl :global /^\n*$/ d
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" 不再高亮搜索结果
nnoremap <silent> <leader>nl :nohl<CR>
"nnoremap <silent> <leader>rp :silent !python %<CR>
inoremap <silent> <A-;> <C-c>A;
inoremap <silent> <A-.> <C-c>A

nnoremap <silent> <A-j> :wincmd j<CR>
nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-l> :wincmd l<CR>
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent><leader>bn :bn<CR>
nnoremap <silent><leader>bp :bp<CR>


"set guifont=Source\ Code\ Pro\ for\ Powerline:h14
if has('nvim')
    "set guifont=SauceCodePro\ NF:h15
    let g:neovide_fullscreen=v:true
    let g:neovide_cursor_antialiasing=v:true
else
    if has("gui_gtk2") || has("gui_gtk3")
        set guifont=SauceCodePro\ Nerd\ Font\ Mono\ Semi-Bold\ 15
    elseif has("gui_photon")
        set guifont=SauceCodePro\ Nerd\ Font\ Mono\ Semi-Bold:s15
    else
        set guifont=SauceCodePro_NF:h15:W600:cANSI
    endif
endif

let g:vim_json_conceal=0
let g:indentLine_concealcursor='inc'
"""""""autocmd
augroup dubjson
    autocmd!
    autocmd BufEnter dub.json setlocal noexpandtab
    autocmd BufLeave dub.json setlocal expandtab
augroup END

"""""""Go lang insert map
augroup golangfen
    autocmd!
    autocmd FileType go inoremap <buffer>; :
    autocmd FileType go inoremap <buffer>: ;
augroup END
"""""""""""""""""""""""""""VIM"""""""""""""""""""""""""""
"""""""""""""""""""""""""""ctags"""""""""""""""""""""""""""
nnoremap <silent> <leader>gtf :!ctags -R --exclude=.git --fields=+li --extra=+q<CR>
set tags=tags
"""""""""""""""""""""""""""ctags"""""""""""""""""""""""""""
"""""""""""""""""""""""""""airline"""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = ''
let airline#extensions#coc#warning_symbol = ''
"""""""""""""""""""""""""""airline"""""""""""""""""""""""""""
"""""""""""""""""""""""""""ultisnips"""""""""""""""""""""""""""
"function! g:UltiSnips_Complete()
    "if pumvisible()
        "return "\<C-n>"
    "else
        "call UltiSnips#ExpandSnippet()
        "if g:ulti_expand_res == 0
            "call UltiSnips#JumpForwards()
            "if g:ulti_jump_forwards_res == 0
                "return "\<TAB>"
            "endif
        "endif
    "endif
    "return ""
"endfunction

"function! g:UltiSnips_Reverse()
    "call UltiSnips#JumpBackwards()
    "if g:ulti_jump_backwards_res == 0
        "return "\<C-P>"
    "endif
    "return ""
"endfunction

"if !exists("g:UltiSnipsJumpForwardTrigger")
    "let g:UltiSnipsJumpForwardTrigger = "<tab>"
"endif

"if !exists("g:UltiSnipsJumpBackwardTrigger")
    "let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"endif
"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
"let g:UltiSnipsUsePythonVersion = 3 
"let g:UltiSnipsRemoveSelectModeMappings = 0
let s:ulti_userinfo = expand('~/vimfiles/userinfo.vim')
if exists(s:ulti_userinfo)    "插入 snippets 所需的个人信息
    exec 'exec '.s:ulti_userinfo
endif
"""""""""""""""""""""""""""ultisnips"""""""""""""""""""""""""""
"""""""""""""""""""""""""""visual-star-search"""""""""""""""""""""""""""
"""Code from:https://github.com/nelstrom/vim-visual-star-search/blob/master/plugin/visual-star-search.vim
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
"""""""""""""""""""""""""""visual-star-search"""""""""""""""""""""""""""
"""""""""""""""""""""""""""rainbow"""""""""""""""""""""""""""
let g:rainbow_active = 1
"""""""""""""""""""""""""""rainbow"""""""""""""""""""""""""""
"""""""""""""""""""""""""""vim-javascript"""""""""""""""""""""""""""
let g:javascript_enable_domhtmlcss = 1
"""""""""""""""""""""""""""vim-javascript"""""""""""""""""""""""""""
"""""""""""""""""""""""""""HTML"""""""""""""""""""""""""""
let g:html_indent_inctags = "body,head,tbody"	" 缩进body head
let g:html_indent_script1 = "inc"	" 缩进<script>标签
let g:html_indent_style1 = "inc"	" 缩进<style>标签
runtime macros/matchit.vim   "支持使用 % 在 XML 标签间跳转
"""""""""""""""""""""""""""HTML"""""""""""""""""""""""""""
"""""""""""""""""""""""""""LeaderF"""""""""""""""""""""""""""
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }
let g:Lf_Gtagsconf = 'G:/DeveloperTools/MSYS2/ucrt64/share/gtags/gtags.conf'
let g:Lf_GtagsSource = 0
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_GtagsAutoGenerate = 1 
"let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'
nnoremap <leader>t :LeaderfBufTag<CR>
nnoremap <leader>g :Leaderf gtags --result ctags-x<CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
nnoremap gw :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
" recall last search. If the result window is closed, reopen it.
noremap go :<C-U>Leaderf! rg --recall<CR>
"""""""""""""""""""""""""""LeaderF"""""""""""""""""""""""""""
"""""""""""""""""""""""""""YouCompleteMe"""""""""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf = 'G:/DeveloperTools/vim/.ycm_extra_conf.py'
"let g:ycm_key_invoke_completion = '<A-/>'
"let g:ycm_python_binary_path = 'python'
"let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
""let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_always_populate_location_list = 1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_show_diagnostics_ui = 1
"let g:ycm_use_clangd = 0
"set completeopt-=preview
"set completeopt+=popup
"set completepopup=height:20,width:60,highlight:Pmenu,border:off
""let g:ycm_language_server = [ 
    ""\ {
    ""\ 'name': 'vim',
    ""\ 'filetypes': ['vim'],
    ""\ 'cmdline': ['G:/DeveloperTools/npm/node_global/bin/vim-language-server.cmd', '--stdio']
    ""\ }
""\ ]
""let g:__rtp = &rtp
""let g:__vimruntime = expand($VIMRUNTIME)
""let g:ycm_extra_conf_vim_data = [
    ""\ 'g:__rtp',
    ""\ 'g:__vimruntime'
    ""\ ]

"let g:ycm_semantic_triggers = {
    "\ 'python' : ['from ', 're!import[\w,\s]+'],
    "\ 'd' : ['import[\w,\s]+'],
    "\ 'php' : ['$'],
    "\ 'c' : ['re!\w*'],
    "\ 'verilog_systemverilog': ['.'],
    "\ 'vim': [':', '#'],
    "\ 'go': ['re!\w*']
    "\ }
"let g:ycm_filetype_blacklist = {
      "\ 'qf' : 1,
      "\ 'notes' : 1,
      "\ 'unite' : 1,
      "\ 'vimwiki' : 1,
      "\ 'pandoc' : 1,
      "\ 'infolog' : 1,
      "\ 'mail' : 1
      "\}

"nnoremap <silent> <leader>gd :YcmCompleter GoToDefinition<CR>
"nnoremap <silent> <leader>gt :YcmCompleter GoTo<CR>
"nnoremap <silent> <leader>gc :YcmCompleter GoToDeclaration<CR>
"let g:ycm_key_list_stop_completion = ['<CR>', '<C-y>']
"""""""""""""""""""""""""""YouCompleteMe"""""""""""""""""""""""""""
"""""""""""""""""""""""""""markdown"""""""""""""""""""""""""""
let g:mkdp_browser = 'C:/Program Files/Mozilla Firefox/firefox.exe'
"""""""""""""""""""""""""""markdown"""""""""""""""""""""""""""
"""""""""""""""""""""""""""Python-mode"""""""""""""""""""""""""""
"let g:pymode_python = 'python3'
"let g:pymode_virtualenv = 0
"let g:pymode_warnings = 0
"let g:pymode_run = 1
"let g:pymode_indent = 1
"let g:pymode_doc = 1
"let g:pymode_doc_bind = 'K'
"let g:pymode_lint = 0
"let g:pymode_lint_on_write = 0
"let g:pymode_breakpoint = 0
"let g:pymode_rope = 0
"let g:pymode_rope_completion = 0
"let g:pymode_rope_regenerate_on_write = 0
"""""""""""""""""""""""""""Python-mode"""""""""""""""""""""""""""
"""""""""""""""""""""""""""AsyncRun"""""""""""""""""""""""""""
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
let g:asyncrun_auto = "make"
let g:asyncrun_status = "stopped"
autocmd VimEnter * let g:airline_section_error = airline#section#create_right([g:airline_section_error, '%{g:asyncrun_status}'])
"""""""""""""""""""""""""""AsyncRun"""""""""""""""""""""""""""
"""""""""""""""""""""""""""Cpp-highlight"""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1
"""""""""""""""""""""""""""Cpp-highlight"""""""""""""""""""""""""""
"""""""""""""""""""""""""""coc.nvim"""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-json', 
            \ 'coc-cmake', 
            \ 'coc-syntax',
            \ 'coc-snippets', 
            \ 'coc-omni',
            \ 'coc-marketplace',
            \ 'coc-highlight',
            \ 'coc-pyright',
            \]
if has('nvim')
    let g:coc_config_home = expand('~/vimfiles')
endif
autocmd FileType json syntax match Comment +\/\/.\+$+

inoremap <silent><expr> <TAB>
      \ coc#expandable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand',''])\<CR>" :
      \ coc#pum#visible() ? coc#pum#next(1):
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) :
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
      \ "\<C-h>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <A-/> coc#refresh()
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : 
                \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
xmap <silent><expr> <tab> 
            \ coc#jumpable() ? "\<tab>" : ">" 
xmap <silent><expr> <s-tab>
            \ coc#jumpable() ? "\<s-tab>" : "<" 
nmap <silent><expr> <tab> 
            \ coc#jumpable() ? "\<tab>" : ">>" 
nmap <silent><expr> <s-tab>
            \ coc#jumpable() ? "\<s-tab>" : "<<" 

nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>ca  :<C-u>CocList<cr>
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" coc-yank
" Clean history: CocCommand yank.clean 
nnoremap <silent> <leader>cay :<C-u>CocList -A --normal yank<CR>
" coc format
nmap <leader>cf <Plug>(coc-format-selected)
xmap <leader>cf <Plug>(coc-format-selected)
" coc code refactor
nmap <leader>rf <Plug>(coc-refactor)
xmap <leader>rf <Plug>(coc-refactor)

command! -nargs=0 Format :call CocAction('format')
augroup coc-format
    autocmd!
    autocmd FileType cpp,go setlocal formatexpr=CocAction('formatSelected')
augroup end
" coc auto fix
nmap <leader>cqf  <Plug>(coc-fix-current)
"""""""""""""""""""""""""""coc.nvim"""""""""""""""""""""""""""
