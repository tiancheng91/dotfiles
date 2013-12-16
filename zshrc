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
export GOPATH=~/prj/go/

export GTAGSLABEL=exuberant-ctags

WORDCHARS="*?_-.[]~&;$%^+"
cdpath=(. /storage/dominikh/ /storage/dominikh/videos/ /home/dominikh/prj /home/dominikh/prj/go/src/honnef.co/go /home/dominikh/prj/go/src/github.com/dominikh)
path=(~/bin /usr/local/avr/bin /usr/local/bin /usr/bin /bin /usr/games /sbin /usr/sbin /usr/local/sbin ~/.gem/ruby/1.9.1/bin /usr/games/bin/ /opt/VirtualBox /opt/dropbox ~/go/bin/ /opt/bin/ ~/prj/go/bin /opt/node/bin)

hosts=(`hostname` `grep "Host " ~/.ssh/config | cut -d " " -f2`)
if [ "$TERM" = "xterm-screen-256color" ]; then
    eval `TERM=screen-256color dircolors`
else
    eval `dircolors`
fi

if which keychain >/dev/null; then
    eval `keychain --eval id_dsa -Q -q`
fi

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
zstyle ':completion:*:evince::' \
    file-patterns '*.(#i)(dvi|djvu|tiff|pdf|ps|xps)(|.bz2|.gz|.xz|.z) *(-/)' '*'

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

# options
setopt auto_cd
setopt auto_continue
setopt auto_pushd
setopt autoresume
setopt complete_in_word
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
setopt no_flow_control
unsetopt bang_hist # we dont need no inline history

# aliases
alias ls='LC_ALL=C ls --group-directories-first -H -F --color=auto'
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
alias history='history -i'
alias id3-remove-comment="eyeD3 --remove-comments"
alias id3=eyeD3
alias halt="sudo halt"
alias reboot="sudo reboot"
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias ll="ls -lhs"
alias zpool="sudo zpool"
alias zfs="sudo zfs"

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

# up [|N|pat] -- go up 1, N or until basename matches pat many directories
#   just output directory when not used interactively, e.g. in backticks
# 06sep2013  +chris+
up() {
    local op=print
    [[ -t 1 ]] && op=cd
    case "$1" in
        '') up 1;;
        -*|+*) $op ~$1;;
        (<->) $op $(printf '../%.0s' {1..$1});;
        *) local -a seg; seg=(${(s:/:)PWD%/*})
            local n=${(j:/:)seg[1,(I)$1*]}
            if [[ -n $n ]]; then
                $op /$n
            else
                print -u2 up: could not find prefix $1 in $PWD
                return 1
            fi
    esac
}

hl() {
    egrep --color=always -e '' -e${^*}
}

# setup keys
source ~/.zkbd/$TERM
bindkey -e


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

bindkey -M menuselect '^F' accept-and-infer-next-history
bindkey -M menuselect '/' accept-and-infer-next-history
bindkey -M menuselect '^?' undo
bindkey -M menuselect ' ' accept-and-hold
bindkey -M menuselect '^S' history-incremental-search-forward

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

# Move to where the arguments belong.
after-first-word() {
    zle beginning-of-line
    zle forward-word
}
zle -N after-first-word
bindkey "^X1" after-first-word

if [ "$TERM" = "dumb" ]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    PS1="`hostname`$ "
fi

[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

