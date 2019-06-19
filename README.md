# Docker-Vim
コンテナで動作するVim

## Description
カレントディレクトをマウントしてVimを起動する．
引数にファイル名 or ディレクト名を指定できる．

## Build

```
$docker build -t image-name .
```

## Usage

```
dim [カレントディレクト以下のファイル or ディレクト]
```

## Extension

vimrcを自分のものに変更することで自分の環境に変えることができる．

## Plugin

プラグインマネージャには[Vim-plug](https://github.com/junegunn/vim-plug)を使っている．


### Plugin-List

- Shougo/neocomplete.vim
- junegunn/vim-plug
- davidhalter/jedi-vim
- Vimjas/vim-python-pep8-indent
- Shougo/vimproc.vim
- scrooloose/nerdtree
- jistr/vim-nerdtree-tabs
- altercation/vim-colors-solarized
- tpope/vim-surround
- ervandew/supertab
- itchyny/lightline.vim
- scrooloose/syntastic
- Yggdroot/indentLine
- plasticboy/vim-markdown
- junegunn/fzf
- junegunn/fzf.vim
- terryma/vim-expand-region
- ueokande/popupdict.vim
