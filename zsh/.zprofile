export XDG_CONFIG_HOME=/home/evg/.config
export MATLAB_EXECUTABLE=/usr/local/bin/matlab

export EDITOR="vim"

path = (
    /usr/local/{bin,sbin}
    $path
)

eval "$(ssh-agent -s)"
ssh-add /home/evg/.ssh/a1s_id_rsa

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
