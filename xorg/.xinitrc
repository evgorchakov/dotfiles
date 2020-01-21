xrdb -load /home/evg/.Xresources
xbindkeys &
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 100
feh --randomize --bg-scale /home/evg/downloads/wallpapers* 
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xset r rate 180 250
urxvtd -q -o -f&
twmnd &
unclutter &
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3 
