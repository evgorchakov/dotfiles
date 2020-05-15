### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

##### BEGIN Zinit stuff #####
### needs: zinit, fzf


# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# fzf
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# z
zinit ice wait blockf lucid
zinit light rupa/z

# z tab completion
zinit ice wait lucid
zinit light changyuheng/fz

# z / fzf (ctrl-g)
zinit ice wait lucid
zinit light andrewferrier/fzf-z

# cd
zinit ice wait lucid
zinit light changyuheng/zsh-interactive-cd

# Don't bind these keys until ready
function __bind_history_keys() {
  bindkey '^K' history-substring-search-up
  bindkey '^J' history-substring-search-down
}

# History substring searching
zinit ice wait lucid atload'__bind_history_keys'
zinit light zsh-users/zsh-history-substring-search

# autosuggestions, trigger precmd hook upon load
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10

# Tab completions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# Syntax highlighting
zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
zinit light zdharma/fast-syntax-highlighting

##### END Zinit stuff #####

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
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
HISTFILE=~/.zhistory
HISTSIZE=10000000
SAVEHIST=10000000

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

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
alias ipy='ipython3'
alias vim='nvim'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias bb='bazel build'
alias bt='bazel test'
alias br='bazel run'

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

export SOURCEKIT_TOOLCHAIN_PATH='/Library/Developer/Toolchains/swift-latest.xctoolchain'
export PATH=$PATH:/Users/evgeny/go/bin:/Users/evgeny/Library/Python/3.7/bin

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--reverse --black 
--color fg:242,bg:-1,hl:65,fg+:15,bg+:234,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

