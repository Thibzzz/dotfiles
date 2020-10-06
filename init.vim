"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
"    Fonts / GUI / Typing preferences
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimrc Turn off compatibility with vi
set nocompatible

" Turn on syntax highlighting.
syntax on

" Set font
set guifont=JetBrains\ Mono:h15 

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
" set hidden

" This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" TABS MANAGEMENT
" filetype plugin indent on
" On pressing tab, insert 2 spaces
" set smartindent
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

set wildignore+=**/node_modules/**,**/dist/**,**_site/**,*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map
" set listchars=tab:→→,eol:¬,space:.

set noswapfile
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
"     Plugins installation with vim-plug from https://vimawesome.com/plugin/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/.vim/plugged')

" https://vimawesome.com/plugin/nerdtree-red
Plug 'scrooloose/nerdtree'

" Tender color scheme
Plug 'jacoborus/tender.vim'

" Theme
Plug 'tyrannicaltoucan/vim-deep-space'

" Neodark color scheme
Plug 'KeitaNakamura/neodark.vim'

" Theme edge
Plug 'sainnhe/edge'

" Tokyo night theme
Plug 'ghifarit53/tokyonight-vim'

" One dark theme
Plug 'joshdick/onedark.vim'

" ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" lenz et animate
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

" vim-airline
Plug 'vim-airline/vim-airline'

" Synthastic
Plug 'scrooloose/syntastic'

" Vim-go
" Plug 'fatih/vim-go'

" youcompleteme
" Plug 'valloric/youcompleteme'

" indent-levels
Plug 'nathanaelkane/vim-indent-guides'

" airline color
Plug 'vim-airline/vim-airline-themes'

" Polyglot
" Plug 'jelera/vim-javascript-syntax'
" Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'

" Autocompletion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CoC plugins list
" coc-html
" coc-json
" coc-tsserver -> js / tsserver / ts
" coc-scssmodules
" coc-prettier

" autoclose html tags
Plug 'alvan/vim-closetag'

" Autoclose quotes
Plug 'jiangmiao/auto-pairs'

" Comment out stuff in visual mode with gcc for line & gc<motion> for a motion
Plug 'tpope/vim-commentary' 

" Add fuzy search finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Dim inactive splits
Plug 'blueyed/vim-diminactive'

" Graphql highlighter 
Plug 'jparise/vim-graphql'
Plug 'pantharshit00/vim-prisma'

" Git Gutter
Plug 'airblade/vim-gitgutter'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
"     Plugins configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   

" nerdtree
map <C-b> :NERDTreeToggle<CR>
" let NERDTreeShowHidden = 1 
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeWinSize=20

" Typescript

" Emoticons on error / warn
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|scannerwork|svn))$'
let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .vimignore`"'
let g:ctrlp_user_command = ['.git']
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1

" lenz & animate
" let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
let g:lens#disabled_filetypes = ['fzf']
let g:lens#width_resize_max = 30

" Diminactive
let g:diminactive_use_colorcolumn = 0

" Prettier config
let g:prettier#exec_cmd_path = '~/.nvm/versions/node/v14.5.0/bin/prettier'

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '~/.nvm/versions/node/v14.5.0/bin/eslint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Git gutter config
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
" Set color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
if (has("termguicolors"))
   set termguicolors
endif
set background=dark

" Theme edge
let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
colorscheme edge

" Theme deep space
" colorscheme deep-space
" let g:deepspace_italics=1
" let g:airline_theme='deep_space'
" let g:lightline = {
"       \ 'colorscheme': 'deepspace',
"       \ }

" THEME Ome dark
" colorscheme onedark

" THEME => Molokai
" colorscheme molokai

" THEME => Gruvbox
" colorscheme gruvbox

" THEME => Codedark
" colorscheme codedark

" THEME => Tender / guicolors
 " If you have vim >=8.0 or Neovim >= 0.1.5
  
" syntax enable
" let g:lightline = { 'colorscheme': 'tender' }
" let g:airline_theme = 'tender'
" colorscheme tender


" THEME Neodark
" colorscheme neodark
" let g:neodark#background = '#040910'
" let g:neodark#use_256color = 1
" let g:neodark#solid_vertsplit = 1
" let g:lightline = {}
" let g:lightline.colorscheme = 'neodark'
" let g:neodark#use_custom_terminal_theme = 1

" THEME tokyonight
" set termguicolors
" 
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" let g:lightline = {'colorscheme' : 'tokyonight'}
" let g:airline_theme = "tokyonight"
" colorscheme tokyonight

" Theme overrides 
let persianGreen="#17a398"
let darkBlue="#007fff"
let operatorsAndSyntax="#fffff"
let fuschi="#f038ff"

" Persian green for comments
hi Comment guifg=#5aaf94
hi Error guibg=false
hi Error guifg=#ff1b1c
hi Todo guifg=#17a398

" hi typescriptImport guifg=#da95ee
" hi Keyword guifg=#da95ee
" hi typescriptStatementKeyword guifg=#da95ee
" hi typescriptExport guifg=#da95ee
" hi typescriptDefault guifg=#da95ee
" 
" hi typescriptTemplate guifg=#E0AF68
" 
" hi typescriptTemplateSubstitution guifg=#75d4fa
" hi typescriptDestructureVariable guifg=#75d4fa
" hi typescriptObjectLiteral guifg=#75d4fa
" 
" hi typescriptFuncCallArg guifg=#75d4fa
" hi typescriptProp guifg=#85a9ff
" 
" hi typescriptVariableDeclaration guifg=#75d4fa
" hi typescriptVariable guifg=#5c8dff
" 
" hi typescriptArrowFuncArg guifg=#f3b02b
" hi typescriptIdentifierName guifg=#17a398 
" 
" hi typescriptDotNotation guifg=#17a398
" hi typescriptTypeAnnotation guifg=#17a398
let BlueForKey='#75d4fa'
let lightBlueforValue='#13b6f6'
let CornYellowForFuncCall='#fbea9d'
let StringColor='#da5407'

hi jsTemplateExpression guifg=#13b6f6
hi jsModuleKeyword guifg=#75d4fa
hi jsTemplateBraces guifg=#5c8dff
" hi jsDestructuringBlock guifg=#13b6f6
hi jsString guifg=#e4be8b
hi link jsTemplateString jsString
" hi jsVariableDef guifg=#fbea9d
hi jsFuncBlock guifg=#75d4fa
hi link jsIfElseBlock jsFuncBlock
hi jsGlobalObjects guifg=#75d4fa
hi jsFuncCall guifg=#13b6f6
hi jsObjectValue guifg=#13b6f6
hi jsObjectKey guifg=#75d4fa
hi jsFuncArgs guifg=#75d4fa
hi jsObjectProp guifg=#75d4fa
" hi jsNumber guifg=#04f06a
" hi jsParen guifg=#13b6f6
hi jsImport guifg=#da95ee
hi jsFrom guifg=#da95ee
hi jsExport guifg=#da95ee
" hi jsReturn guifg=#da95ee
" hi jsConditional guifg=#da95ee
hi jsForAwait guifg=#da95ee
hi jsArrowFunction guifg=#75d4fa
" hi jsExportDefault guifg=#da95ee
" hi jsAsyncKeyword guifg=#da95ee
hi link jsFuncBraces jsConditional
hi link jsGlobalObjects Normal

autocmd BufNewFile,BufRead *.ts set syntax=javascript

" hi typescriptBlock guifg=#eeeeee

" find a word/char highlight groups
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""   
"     CoC server configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugi before putting this into your config.
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
 if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
 else
   inoremap <silent><expr> <c-@> coc#refresh()
 endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>n

" Coc prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
