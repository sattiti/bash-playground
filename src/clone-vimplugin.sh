set -eu

domain=https://github.com/
dist="${HOME}/.vim/plugins/repos/github.com/"

plugins=(
  \ Shougo/deoplete.nvim
  \ roxma/nvim-yarp
  \ roxma/vim-hug-neovim-rpc
  # \ Shougo/neocomplete.vim
  \ Shougo/unite.vim
  \ Shougo/neosnippet.vim
  \ Shougo/neosnippet-snippets
  \ tpope/vim-repeat
  \ tpope/vim-surround
  \ tpope/vim-fugitive
  \ vim-ruby/vim-ruby
  \ tpope/vim-endwise
  \ tpope/vim-rails
  \ tpope/vim-rake
  \ vim-scripts/Align
  \ docunext/closetag.vim
  \ jiangmiao/auto-pairs
  \ nathanaelkane/vim-indent-guides
  \ AndrewRadev/splitjoin.vim
  \ othree/eregex.vim
  \ haya14busa/incsearch.vim
  \ scrooloose/syntastic
  \ vimplugin/project.vim
  \ tomasr/molokai
  \ mhinz/vim-signify
  \ tomtom/tcomment_vim
  \ vim-scripts/taglist.vim
  \ tpope/vim-haml
  \ mattn/emmet-vim
  \ othree/html5.vim
  \ othree/html5-syntax.vim
  \ tpope/vim-markdown
  \ digitaltoad/vim-pug
  \ othree/yajs.vim
  \ mattn/jscomplete-vim
  \ myhere/vim-nodejs-complete
  \ kchmck/vim-coffee-script
  \ pangloss/vim-javascript
  \ mxw/vim-jsx
  \ mtscout6/vim-cjsx
  \ hail2u/vim-css3-syntax
  \ evanmiller/nginx-vim-syntax
  \ toyamarinyon/vim-swift
  \ PProvost/vim-ps1
  \ vim-airline/vim-airline
  \ vim-airline/vim-airline-themes
)

for p in ${plugins[@]}
do
  cmd="${domain}${p} ${dist}${p}"
  `git clone --recursive ${cmd}`
done
