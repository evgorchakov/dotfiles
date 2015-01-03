export XDG_CONFIG_HOME=/home/evg/.config
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
 
