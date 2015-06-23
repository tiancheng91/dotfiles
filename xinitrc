export LC_ALL=en_US.UTF-8
export SDL_VIDEO_FULLSCREEN_HEAD=0

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi

xrdb -merge ~/.Xdefaults &
xset s off
xset -dpms

urxvt -name Weechat -geometry "273x23+0+751" -e ssh -t cinchrb.org 'tmux -2 -u attach -t irc' &

autocutsel -f &
setxkbmap -layout "us(altgr-intl)"
xmodmap ~/.Xmodmap
xmodmap ~/.us-intl-german.xmodmap

dropboxd &

conky &
emacs &
numlockx

~/prj/go/src/honnef.co/go/gwm/gwm ~/.cwmrc
pause
