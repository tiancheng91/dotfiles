#!/bin/sh
set -e

DOTFILES=~/dotfiles

build_cwm() {
    cd ${DOTFILES}/tmp
    git clone https://github.com/dominikh/cwm
    cd ./cwm
    make
    cp ./cwm ~/bin
}

build_wmname() {
    cd ${DOTFILES}/tmp
    wget http://dl.suckless.org/tools/wmname-0.1.tar.gz
    CHECKSUM=$(sha1sum wmname-0.1.tar.gz|cut -d" " -f1)
    if [ "$CHECKSUM" != "7bce60306ccc9c9a5fc60d9874e81a013efa8871" ]; then
        echo "Verification of wmname archive failed"
        exit 1
    fi
    tar -xzvf wmname-0.1.tar.gz
    cd wmname-0.1
    make
    cp ./wmname ~/bin
}

build_golang() {
    cd ~
    hg clone -u release https://code.google.com/p/go
    cd ./go/src
    ./make.bash
}

build_xrect() {
    gcc -lX11 ${DOTFILES}/src/xrect.c -o ~/bin/xrect
}

mkdir ${DOTFILES}/tmp
mkdir ~/.config
mkdir -p ~/.ssh/sockets
chmod -R 600 ~/.ssh

ln -s ${DOTFILES}/Xdefaults ~/.Xdefaults
ln -s ${DOTFILES}/Xmodmap ~/.Xmodmap
ln -s ${DOTFILES}/bin ~/bin
ln -s ${DOTFILES}/config/subtle ~/.config/subtle
ln -s ${DOTFILES}/conkyrc ~/.conkyrc
ln -s ${DOTFILES}/cwmrc ~/.cwmrc
ln -s ${DOTFILES}/emacs ~/.emacs
ln -s ${DOTFILES}/emacs.d ~/.emacs.d
ln -s ${DOTFILES}/gdb ~/.gdb
ln -s ${DOTFILES}/gdbinit ~/.gdbinit
ln -s ${DOTFILES}/gemrc ~/.gemrc
ln -s ${DOTFILES}/gitconfig ~/.gitconfig
ln -s ${DOTFILES}/gnus ~/.gnus
ln -s ${DOTFILES}/screenrc ~/.screenrc
ln -s ${DOTFILES}/terminfo ~/.terminfo
ln -s ${DOTFILES}/tmux.conf ~/.tmux.conf
ln -s ${DOTFILES}/us-intl-german.xmodmap ~/.us-intl-german.xmodmap
ln -s ${DOTFILES}/xinitrc ~/.xinitrc
ln -s ${DOTFILES}/zshprompt ~/.zshprompt
ln -s ${DOTFILES}/zshrc ~/.zshrc

build_cwm
build_golang
build_wmname
build_xrect

rm -rf ${DOTFILES}/tmp
