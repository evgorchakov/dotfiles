xrdb -load /home/evg/.Xresources
xbindkeys &
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 100
xautolock -time 3 -locker "slock" -detectsleep -corners ---- -cornersize 20 &
feh --randomize --bg-scale /home/evg/downloads/wallpapers* 
xset r rate 150 200
urxvtd -q -o -f&
twmnd &
exec i3 
