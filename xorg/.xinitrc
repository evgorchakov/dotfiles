xrdb -load /home/evg/.Xresources
xbindkeys &
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 100
feh --randomize --bg-scale /home/evg/downloads/wallpapers* 
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xset r rate 150 200
urxvtd -q -o -f&
twmnd &
unclutter &
exec i3 
