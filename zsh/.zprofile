export XDG_CONFIG_HOME=/home/evg/.config
export EDITOR="nvim"

path=(
  /usr/local/{bin,sbin}
  $path
  )

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
