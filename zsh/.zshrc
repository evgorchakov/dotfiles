### Added by Zinit's installer
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

##### BEGIN Zinit stuff #####
# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# cd
zinit ice wait lucid
zinit light changyuheng/zsh-interactive-cd

# History substring searching
zinit light zsh-users/zsh-history-substring-search

# autosuggestions, trigger precmd hook upon load
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100

# Tab completions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# Syntax highlighting
zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
zinit light zdharma/fast-syntax-highlighting


##### END Zinit stuff #####
#
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

setopt AUTO_CD
setopt MULTIOS
setopt GLOB_COMPLETE
setopt ZLE
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB
setopt NUMERIC_GLOB_SORT
setopt RC_EXPAND_PARAM
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

export KEYTIMEOUT=1

alias pacman='sudo pacman'
alias ipy='ipython3'
alias vim='nvim'
alias ls='exa'

export IPYTHONDIR=~/.config/ipython

p() {
    yay -S --noconfirm "$1"
}

f(){
    if [ -z "$RANGER_LEVEL" ] 
    then
        ranger
    else
        exit
    fi
}

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_DEFAULT_OPTS='--height 30% --reverse --black'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Don't bind these keys until ready
bindkey -v '^K' history-substring-search-up
bindkey -v '^J' history-substring-search-down
bindkey -v '^R' fzf-history-widget
bindkey "" autosuggest-accept

autoload -Uz compinit
compinit
# gopass
source <(gopass completion zsh | head -n -1 | tail -n +2)
compdef _gopass gopass
