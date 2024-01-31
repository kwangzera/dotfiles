" From official nvim setup
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" source ~/.vimrc

" From original .vimrc file (keeping vim factory settings)
set number
set relativenumber

" For small buffers
set wrap

" Show chars, indents, etc.
set list
" set listchars=eol:  " Optional
set listchars=tab:→\ ,trail:·,extends:»,precedes:«

" Tab sizes and such
set textwidth=78
set noexpandtab
set tabstop=4  " To supplement >>
set shiftwidth=4  " To supplement >>

" From https://www.notonlycode.org/neovim-lua-config/
set notimeout
set encoding=utf-8  " Change the output encoding that is shown in the terminal ().
set fileencoding=utf-8  " Change the output encoding of the file that is written.

" This is enabled by default in Neovim by the way
filetype on             " enable filetype detection
filetype plugin on      " load file-specific plugins
filetype indent on      " load file-specific indentation

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" https://github.com/lervag/vimtex
Plug 'lervag/vimtex'
" https://github.com/wakatime/vim-wakatime
Plug 'wakatime/vim-wakatime'
" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'

call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
" Line numbers

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most users diable insert mode mappings
let g:vimtex_imaps_enabled = 0

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
" let maplocalleader = ","

" You might also need to add set t_Co=256 into your .vimrc file, before loading the colorscheme.
set t_Co=256
" Set the colorscheme
colorscheme zenburn

" https://github.com/iamcco/markdown-preview.nvim
" How can I pass CLI options to the browser, like opening in a new window?
function OpenMarkdownPreview (url)
	execute "silent ! firefox --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'

" https://github.com/iamcco/markdown-preview.nvim
" Why is the synchronised scrolling lagging?
set updatetime=50

" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//ge
    call winrestview(l:save)
endfun

" Dont trim whitespace on save to avoid messing with binary files
noremap <Leader>w :call TrimWhitespace()<CR>
