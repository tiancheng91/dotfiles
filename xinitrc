#!/bin/sh
export LC_ALL=en_US.UTF-8

export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim
export XIM_PROGRAM="scim -d"
export XMODIFIERS=@im=SCIM
scim -d &
scim-bridge &

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

xrdb -merge ~/.Xdefaults &

urxvtd -q -o -f
urxvtc -name newsbeuter -e ssh -t cinchrb.org 'tmux -2 -u attach -t newsbeuter' &
urxvtc -name Weechat -e ssh -t cinchrb.org 'tmux -2 -u attach -t irc' &

~/bin/bottom_panel &
~/bin/battery_monitor &

autocutsel -f &
setxkbmap de
xmodmap ~/.Xmodmap

display -window root ~/wallpaper.png

subtle
