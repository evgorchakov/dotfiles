xrdb -load /home/evg/.Xresources
xbindkeys &
setxkbmap -option grp:win_toggle us,ru
xautolock -time 3 -locker "blurlock" -detectsleep -corners ---- -cornersize 20 &
feh --randomize --bg-scale /home/evg/downloads/wallpapers* 
xset r rate 175 100
exec i3
#exec spectrwm
