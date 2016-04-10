#-*- mode: sh; -*-
autoload -Uz compinit
autoload zkbd
autoload -z edit-command-line
zmodload -i zsh/complist

compinit

export EDITOR="emacsclient"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export MANPAGER="less"
export LESS="FRXif"
alias fless="less -+F"

export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000

export RUBYOPT=
export GOPATH=~/prj/
export GOROOT_BOOTSTRAP=$(go env GOROOT)
#export BROWSER=chromium-browser
export BROWSER=firefox
export LEDGER_FILE=~/money/cash.ledger

WORDCHARS="*?_-.[]~&;$%^+"
cdpath=(. /storage/dominikh/ /storage/dominikh/videos/ /home/dominikh/prj /home/dominikh/prj/src/honnef.co/go /home/dominikh/prj/src/github.com/dominikh /home/dominikh/prj/src/ /usr/lib/go/src/)
path=(~/bin ~/.rbenv/bin /usr/local/avr/bin /usr/local/bin /usr/bin /bin /usr/games /sbin /usr/sbin /usr/local/sbin ~/.gem/ruby/1.9.1/bin /usr/games/bin/ /opt/VirtualBox /opt/dropbox ~/go/bin/ /opt/bin/ ~/prj/bin /opt/node/bin ~/node_modules/cordova/bin ~/adt-bundle-linux-x86_64-20140321/sdk/tools ~/adt-bundle-linux-x86_64-20140321/sdk/platform-tools ~/node_modules/.bin)

if [ "$TERM" = "xterm-screen-256color" ]; then
    eval `TERM=screen-256color dircolors`
else
    eval `dircolors`
fi

if which keychain >/dev/null; then
    eval `keychain --eval id_rsa -Q -q`
fi

zstyle ':completion:*' use-ip true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' completer _complete _match
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

# Dont complete backups as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:scp:*' ignore-line yes
zstyle ':completion:*:ls:*' ignore-line yes

# kill completion
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*' insert-ids single
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:processes' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# man
zstyle ':completion:*:man:*' separate-sections true

# options
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
unsetopt multios

# aliases
case "$(uname -s)" in
    Linux)
        alias ls='LC_ALL=C ls --group-directories-first -F --color=auto'
    ;;
    FreeBSD)
        alias ls='LC_ALL=C ls -F -G'
    ;;
esac
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
alias ll="ls -l -h -s"
alias killbg='kill ${${(v)jobstates##*:*:}%=*}'

# no spelling correction
alias mkdir='nocorrect mkdir'
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

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

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

# bindkey -M menuselect '^F' accept-and-infer-next-history
# bindkey -M menuselect '/' accept-and-infer-next-history
# bindkey -M menuselect '^?' undo
# bindkey -M menuselect ' ' accept-and-hold
# bindkey -M menuselect '^S' history-incremental-search-forward

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

export ANDROID_SDK_ROOT=~/adt-bundle-linux-x86_64-20140321/sdk

hash -d cdorg=~/work/climate-data.org
hash -d cdorggo=~/work/climate-data.org/external/go/src/climate-data.org

zman() {
    MANPAGER="less -g -s +/^\s{7}$1" man zshall
}

# imv -- interactive rename, using vared
# 03sep2012  +chris+
# 21jul2014  +chris+
# 09dec2014  +chris+
imv() {
  local src dst
  for src; do
    [[ -e $src ]] || { print -u2 "$src does not exist"; continue }
    dst=$src
    vared dst
    [[ $src != $dst ]] && mkdir -p $dst:h && mv -n $src $dst &&
      print -s mv -n $src:q:q $dst:q:q   # save to history, thus M-. works
  done
}

# autoload -Uz fzf-file-widget
# autoload -Uz fzf-cd-widget
# autoload -Uz fzf-history-widget

# zle -N fzf-file-widget
# zle -N fzf-cd-widget
# zle -N fzf-history-widget

# bindkey '^T' fzf-file-widget
# bindkey '\ec' fzf-cd-widget

compdef cmpv=mpv

mkdir -p ~/.zarchive
zshaddhistory() {
  if [[ -n $1 && $1 != $'\n' && $1 != " "* ]]; then
    print -nrP ": %D{%s}:0;$1" >> ~/.zarchive/"$(print -P %n@%m-%D{%Y-%m-%d})"
  fi
}

eval "$(rbenv init -)"

PATH="/home/dominikh/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/dominikh/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dominikh/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dominikh/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dominikh/perl5"; export PERL_MM_OPT;
relevant_env() {
    export | grep -Ev "^PWD=" | grep -Ev "^OLDPWD="
}

env_diff() {
    #comm -3 <(relevant_env | sort) <(echo "${_dh_orig_env}" | sort)
    diff -U 0 <(echo "${_dh_orig_env}" | sort) <(relevant_env | sort)  | grep -v "^[^-+]" | tail -n +3
}

_dh_orig_env="$(relevant_env)"

