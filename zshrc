#-*- mode: sh; -*-
autoload zsh-mime-setup
autoload -Uz compinit
autoload zkbd
autoload -z edit-command-line
zmodload -i zsh/complist
zmodload -i zsh/zftp

compinit

export EDITOR="emacsclient"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export MANPAGER="less"
export GEM_PRIVATE_KEY='~/.rubyforge/gem-private_key.pem'
export GEM_CERTIFICATE_CHAIN='~/.rubyforge/gem-public_cert.pem'
export WORDCHARS=''
export LESSOPEN="|/usr/bin/lesspipe.sh %s"

# `less` colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000

export RUBYOPT=

export FM_SVNPATH=~/projects/freiesMagazin
export FM_SVNPATH_RED=~/projects/freiesMagazin-redaktion

export GOROOT=~/go/
export GOPATH=~/projects/go_projects

cdpath=(. /storage/dominikh/ /storage/dominikh/videos/ /home/dominikh/projects)
path=(/usr/local/avr/bin /usr/local/bin /usr/bin /bin /usr/games ~/bin /sbin /usr/sbin /usr/local/sbin /var/lib/gems/1.8/bin /usr/kde/3.5/bin ~/.gem/ruby/1.9.1/bin /opt/java/jre/bin /usr/lib/perl5/vendor_perl/bin ~/projects/colfm/ /opt/java/bin/ /usr/local/texlive/2010/bin/i386-linux/ /usr/games/bin/ ~/.cabal/bin /opt/VirtualBox /opt/dropbox ~/go/bin/)

hosts=(`hostname` `grep "Host " ~/.ssh/config | cut -d " " -f2`)
if [ "$TERM" = "xterm-screen-256color" ]; then
    eval `TERM=screen-256color dircolors`
else
    eval `dircolors`
fi
eval `keychain --eval id_dsa -Q -q`

zsh-mime-setup

zstyle '*' hosts $hosts
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:*' menu yes select

zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' \
    max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle :compinstall filename '/home/dominikh/.zshrc'

# Dont complete backups as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:scp:*' ignore-line yes
zstyle ':completion:*:ls:*' ignore-line yes

# kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=36=31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*' insert-ids single
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:processes' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# man
zstyle ':completion:*:man:*' separate-sections true

# apps
zstyle ':completion:*:*:mpg123:*' file-patterns \
    '*.(mp3|MP3):mp3\ files *(-/):directories'

zstyle ':completion:*:*:ogg123:*' file-patterns \
    '*.(ogg|OGG):ogg\ files *(-/):directories'

zstyle ':completion:*:*:mp3blaster:*' file-patterns \
    '*.(mp3|ogg):mp3\ files *(-/):directories'

zstyle ':completion:*:wine:*' file-patterns '*.(exe|EXE):exe'

# mutt
if [[ -f ~/.mutt/alias ]]; then
    zstyle ':completion:*:*:mutt:*' menu yes select
    zstyle ':completion:*:mutt:*' users ${${${(f)"$(<~/.mutt/alias)"}#alias[[:space:]]}%%[[:space:]]*}
fi

# options
setopt auto_cd
setopt auto_continue
setopt auto_pushd
setopt autoresume
setopt complete_in_word
setopt correct
setopt correctall
setopt extended_glob
setopt extended_history
setopt hist_ignore_dups
setopt inc_append_history
setopt no_bg_nice
setopt no_case_glob
setopt nohup
setopt notify
setopt prompt_subst
setopt pushd_ignore_dups
setopt share_history
setopt short_loops
setopt transient_rprompt
setopt list_packed
unsetopt bang_hist # we dont need no inline history

# aliases
alias ls='ls -F --color=auto'
alias d='dirs -v'
alias cp='nocorrect cp -vi'
alias cpr='rsync -vazhP'
alias scpr='rsync -av --progress'
alias rm='rm -v'
alias mv='nocorrect mv -vi'
alias grep='grep --color=auto'
alias psgrep='nocorrect noglob echo \\033[1m"`ps auxw | head -1`" \\033[0m; ps auxw | grep -v grep | grep -i '
alias mirror='wget -m -k -K -E'
alias mirror-nt='wget -r --no-parent'
alias rsget='wget --load-cookies ~/.iwget/cookies/rapidshare'
alias history='history -i'
alias teletext='alevt'
alias fumount='fusermount -u'
alias fbcursor="print $'\e[?96;0;64c'"
alias extract=unp
alias dvd2iso=cd2iso
alias iso2dvd=iso2cd
alias iso2fs=fuseiso
alias files2dvd=files2cd
alias rip-cd=cd2ogg
alias mp32cd=any2audiocd
alias ogg2cd=any2audiocd
alias flac2cd=any2audiocd
alias id3-remove-comment="eyeD3 --remove-comments"
alias id3=eyeD3
alias halt="sudo halt"
alias reboot="sudo reboot"
alias gplize="wget http://www.gnu.org/licenses/gpl.txt -O COPYING"
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias ll="ls -lhs"

# no spelling correction
alias mkdir='nocorrect mkdir -p'
alias apt-cache='nocorrect apt-cache'
alias apt-search="nocorrect apt-search"

typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

case $TERM in
    linux)
        PS1='%n@%m:%~%# '
        . ~/.zshprompt
        ;;
    *)
        . ~/.zshprompt
        ;;
esac

nfo() {
    iconv -f 437 -t UTF8 $* | less
}

timestamp2date () {
    date -d @$*
}

cd2iso() {
    dd if=/dev/cdrom of=$1
}

iso2cd() {
    cdrecord $1
}

cd2cd() {
    tmp=`tempfile -p iso`
    cd2iso "$tmp"
    echo "Insert empty disk"; read ans
    iso2cd "$tmp"
}

files2cd() {
    isofile=`tempfile -p iso`
    mkisofs -r -R -J -l -L -o "$isofile" "$*"
    cdrecord "$isofile"
    rm "$isofile"
}

cd2ogg() {
    cdrom=/dev/`readlink /dev/cdrom`
    cdrdao read-cd --with-cddb --device ATAPI:$cdrom --datafile cd.bin cd.toc
    oggenc -o cdimage.ogg -r --raw-endianness 1 -q 6 cd.bin
    cueconvert cd.toc cd.cue
    oggsplt -c cd.cue cdimage.ogg
    rm cd.bin cd.cue cd.toc cdimage.ogg
}


any2wav() {
    # $1 - which file
    # $2 - where to
    echo "Converting file '$1'"
    case "${1##*.}" in
        mp3)
            mpg321 -q -w "$2" "$1"
            ;;
        flac)
            flac -d -o "$2" "$1"
            ;;
        ogg)
            oggdec -o "$2" "$1"
            ;;
        *)
            return 1
            ;;
    esac
    return 0
}

any2audiocd() {
    tmpdir=`mktemp -d`
    COUNTER_KNOWN=0
    COUNTER_UNKNOWN=0


    for file in *.*
    do
        new_name="$tmpdir/$file.wav"
        if any2wav "$file" "$new_name"
        then
            COUNTER_KNOWN=$((COUNTER_KNOWN + 1))
        else
            COUNTER_UNKNOWN=$((COUNTER_UNKNOWN + 1))
        fi

    done
    echo ""
    echo "============================="
    echo "Converted files: $COUNTER_KNOWN"
    echo "  Ignored files: $COUNTER_UNKNOWN"
    echo ""

    if [ $COUNTER_KNOWN = 0 ]
    then
        echo "No supported files were found, exiting."
        return 2
    else
        echo "Burn to CD?"; read ans
        case "$ans" in
            y*|Y*|j*|J*)
                cdrecord speed=4 -pad -audio $tmpdir/*.wav
                ;;
        esac
    fi

    rm $tmpdir/*.wav
}

compress() {
    if [ $2 ]; then
        case $2 in
            tgz | tar.gz)   tar -zcvf$1.$2 $1 ;;
            tbz2 | tar.bz2) tar -jcvf$1.$2 $1 ;;
            tar.Z)          tar -Zcvf$1.$2 $1 ;;
            tar)            tar -cvf$1.$2  $1 ;;
            gz | gzip)      gzip           $1 ;;
            bz2 | bzip2)    bzip2          $1 ;;
            *)
                echo "Error: $2 is not a valid compression type"
                ;;
        esac
    else
        compress $1 tar.gz
    fi
}

show-archive() {
    if [[ -f $1 ]]
    then
        case $1 in
            *.tar.gz)      gunzip -c $1 | tar -tf - -- ;;
            *.tar.bz2)     bzip2 -d -c $1 | tar -tf - ;;
            *.tar)         tar -tf $1 ;;
            *.tgz)         tar -ztf $1 ;;
            *.zip)         unzip -l $1 ;;
            *.bz2)         bzless $1 ;;
            *)             echo "'$1' Error. Please go away" ;;
        esac
    else
        echo "'$1' is not a valid archive"
    fi
}

elinks() {
    STY= =elinks $*
    echo -ne \\033]0\;\\007;
}

clyde() {
   case $1 in
       (-Ss | -Si | -Q* | -T | -G)
           /usr/bin/clyde "$@" ;;
       (-S* | -R* | -U | *)
           /usr/bin/sudo /usr/bin/clyde "$@" ;;
   esac
}

# setup keys
source ~/.zkbd/$TERM
bindkey -e
bindkey '\C-w' kill-region


[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
zle -N edit-command-line
bindkey "^X^E" edit-command-line



_tmux_pane_words() {
  local expl
  local -a w
  if [[ -z "$TMUX_PANE" ]]; then
    _message "not running inside tmux!"
    return 1
  fi
  w=( ${(u)=$(tmux capture-pane \; show-buffer \; delete-buffer)} )
  _wanted values expl 'words from current tmux pane' compadd -a w
}

zle -C tmux-pane-words-prefix   complete-word _generic
zle -C tmux-pane-words-anywhere complete-word _generic
bindkey '^Xt' tmux-pane-words-prefix
bindkey '^X^X' tmux-pane-words-anywhere
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' completer _tmux_pane_words
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' ignore-line current
zstyle ':completion:tmux-pane-words-anywhere:*' matcher-list 'b:=* m:{A-Za-z}={a-zA-Z}'



if [ "$TERM" = "dumb" ]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    PS1="`hostname`$ "
fi

if [[ -s /home/dominikh/.rvm/scripts/rvm ]] ; then source /home/dominikh/.rvm/scripts/rvm ; fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
