xrdb -load /home/e/.Xresources
xbindkeys

xinput set-prop "Elan TrackPoint" "libinput Accel Speed" 1.0
xinput set-prop "Elan TouchPad" "libinput Accel Speed" 0.75

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xset r rate 175 100
xset s on
xset s 180
xss-lock -- i3lock -c 00000 &

unclutter &
xbanish &

export SSH_AUTH_SOCK
exec i3
