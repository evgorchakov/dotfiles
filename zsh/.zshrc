# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh 

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

setopt AUTO_CD
setopt MULTIOS
setopt GLOB_COMPLETE
setopt ZLE
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB
setopt NUMERIC_GLOB_SORT
setopt RC_EXPAND_PARAM

zmodload zsh/terminfo
export KEYTIMEOUT=1
bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^J' history-substring-search-down
bindkey '^K' history-substring-search-up
bindkey '^L' autosuggest-accept
bindkey '^ ' clear-screen

alias pacman='sudo pacman'
alias ipy='ipython'
alias vim='nvim'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --reverse --black'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
