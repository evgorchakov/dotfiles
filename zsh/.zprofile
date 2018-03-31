export XDG_CONFIG_HOME=/home/evg/.config
export EDITOR="nvim"

path = (
    /usr/local/{bin,sbin}
    $path
)

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
