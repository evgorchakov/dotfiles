# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-summerfruit.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
#
export GOPATH=/home/evg/code/go
export ANDROID_HOME=/opt/android-sdk
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$GOPATH/bin:/home/evg/.gem/ruby/2.2.0/bin:/usr/bin/core_perl"
export EDITOR="vim"
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

setopt AUTO_CD
 
# Now we can pipe to multiple outputs!
setopt MULTIOS
setopt GLOB_COMPLETE
setopt ZLE
setopt NO_CASE_GLOB
 
# Be Reasonable!
setopt NUMERIC_GLOB_SORT
 
# I don't know why I never set this before.
setopt EXTENDED_GLOB
 
# hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

source /usr/share/doc/pkgfile/command-not-found.zsh

alias pacman='sudo pacman'
alias x='sudo systemctl poweroff'
alias r='sudo systemctl reboot'
alias gcc='gcc -fdiagnostics-color=auto'
alias f='ranger'

alias du='ncdu'
alias ht="htop -u $(whoami)"

