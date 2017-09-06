BASE16_SHELL="$HOME/.config/base16-shell/base16-bright.dark.sh"
source $BASE16_SHELL

source "$HOME/.zprezto/init.zsh"

source /usr/share/doc/pkgfile/command-not-found.zsh

setopt AUTO_CD
setopt MULTIOS
setopt GLOB_COMPLETE
setopt ZLE
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB
setopt NUMERIC_GLOB_SORT
setopt RC_EXPAND_PARAM

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
export KEYTIMEOUT=1
bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey 'J' history-substring-search-down
bindkey 'K' history-substring-search-up
bindkey 'L' autosuggest-accept

# bind k and j for VI mode

alias pacman='sudo pacman'
alias agenda='gcalcli --calendar="evgorchakov@gmail.com" --calendar="4B" agenda'
alias today='gcalcli --calendar="evgorchakov@gmail.com" --calendar="4B" agenda 12am 11:59pm'
alias week='gcalcli --calendar="evgorchakov@gmail.com" --calendar="4B" calw'
alias gcal='gcalcli --calendar="evgorchakov@gmail.com"'
#alias hn='vim -c "HackerNews" -c "Goyo 100"'
alias ipy='ipython'

export GOPATH=/home/evg/code/go
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$GOPATH/bin:/home/evg/.gem/ruby/2.3.0/bin:/usr/bin/core_perl"
export WORKON_HOME=~/.virtualenvs
export IPYTHONDIR=~/.config/ipython

f(){
    if [ -z "$RANGER_LEVEL" ] 
    then
        ranger
    else
        exit
    fi
}
