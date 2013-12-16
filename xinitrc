#!/bin/sh
export LC_ALL=en_US.UTF-8
export SDL_VIDEO_FULLSCREEN_HEAD=0

if [[ "dominikh-laptop" = `hostname` || "dominikh-pc" = `hostname` ]]; then
    export GTK_IM_MODULE=scim
    export QT_IM_MODULE=scim
    export XIM_PROGRAM="scim -d"
    export XMODIFIERS=@im=SCIM
    scim -d &
    scim-bridge &
fi

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi

xrdb -merge ~/.Xdefaults &
xset s off
xset -dpms

if [[ "dominikh-netbook" != `hostname` ]]; then
    urxvt -name Weechat -geometry "273x23+0+751" -e ssh -t cinchrb.org 'tmux -2 -u attach -t irc' &
fi

if [[ "dominikh-laptop" = `hostname` ]]; then
    ~/bin/bottom_panel &
    ~/bin/battery_monitor &
fi


autocutsel -f &
setxkbmap -layout "us(altgr-intl)"
xmodmap ~/.Xmodmap
xmodmap ~/.us-intl-german.xmodmap

dropboxd &

display -window root ~/wallpaper.png
emacs &

exec ck-launch-session dbus-launch ~/bin/cwm
