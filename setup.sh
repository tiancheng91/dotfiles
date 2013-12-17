#!/bin/sh
set -e

DOTFILES=~/dotfiles

build_cwm() {
    [ -e ~/bin/cwm ] && return

    build_yacc
    cd ${DOTFILES}/tmp
    git clone https://github.com/dominikh/cwm
    cd ./cwm
    make
    cp ./cwm ~/bin
}

build_yacc() {
    command -v yacc >/dev/null && return

    cd ${DOTFILES}/tmp
    wget http://ftp.gnu.org/gnu/bison/bison-3.0.tar.gz
    tar -xzvf bison-3.0.tar.gz
    cd bison-3.0
    ./configure --prefix=${HOME}
    make
    make install
}

build_wmname() {
    [ -e ~/bin/wmname ] && return

    cd ${DOTFILES}/tmp
    wget http://dl.suckless.org/tools/wmname-0.1.tar.gz
    tar -xzvf wmname-0.1.tar.gz
    cd wmname-0.1
    make
    cp ./wmname ~/bin
}

build_golang() {
    [ -d ~/go ] && return

    cd ~
    hg clone -u release https://code.google.com/p/go
    cd ./go/src
    ./make.bash
}

build_xrect() {
    [ -e ~/bin/xrect ] && return

    gcc ${DOTFILES}/src/xrect.c -lX11 -o ~/bin/xrect
}

rm -rf ${DOTFILES}/tmp
mkdir ${DOTFILES}/tmp
mkdir -p ~/.config
mkdir -p ~/.ssh/sockets
chmod -R 600 ~/.ssh

ln -f -s ${DOTFILES}/Xdefaults ~/.Xdefaults
ln -f -s ${DOTFILES}/Xmodmap ~/.Xmodmap
ln -f -s ${DOTFILES}/bin ~/bin
ln -f -s ${DOTFILES}/config/subtle ~/.config/subtle
ln -f -s ${DOTFILES}/conkyrc ~/.conkyrc
ln -f -s ${DOTFILES}/cwmrc ~/.cwmrc
ln -f -s ${DOTFILES}/emacs ~/.emacs
ln -f -s ${DOTFILES}/emacs.d ~/.emacs.d
ln -f -s ${DOTFILES}/gdb ~/.gdb
ln -f -s ${DOTFILES}/gdbinit ~/.gdbinit
ln -f -s ${DOTFILES}/gemrc ~/.gemrc
ln -f -s ${DOTFILES}/gitconfig ~/.gitconfig
ln -f -s ${DOTFILES}/gnus ~/.gnus
ln -f -s ${DOTFILES}/screenrc ~/.screenrc
ln -f -s ${DOTFILES}/terminfo ~/.terminfo
ln -f -s ${DOTFILES}/tmux.conf ~/.tmux.conf
ln -f -s ${DOTFILES}/us-intl-german.xmodmap ~/.us-intl-german.xmodmap
ln -f -s ${DOTFILES}/xinitrc ~/.xinitrc
ln -f -s ${DOTFILES}/zshprompt ~/.zshprompt
ln -f -s ${DOTFILES}/zshrc ~/.zshrc

build_cwm
build_golang
build_wmname
build_xrect

rm -rf ${DOTFILES}/tmp
