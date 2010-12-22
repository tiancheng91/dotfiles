#!/bin/sh
export LC_ALL=en_US.UTF-8

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

xrdb -merge ~/.Xdefaults &

urxvtd -q -o -f
urxvtc -name newsbeuter -e newsbeuter &
urxvtc -name Weechat -e ssh -t cinchrb.org 'tmux -2 -u attach -t irc' &

~/bin/bottom_panel &
~/bin/battery_monitor &

autocutsel -f &
setxkbmap de
xmodmap ~/.Xmodmap

display -window root ~/wallpaper.png

subtle
